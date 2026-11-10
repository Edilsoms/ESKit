unit EsTrueType;

{ Leitura mínima de fontes TrueType (.ttf) para embutir em PDF:
  - mapa caractere -> glifo (cmap formatos 4 e 12);
  - larguras (hmtx), métricas (head/hhea/OS/2);
  - subconjunto: gera uma fonte com os mesmos índices de glifo, mas só com
    os contornos dos glifos usados (glifos compostos incluem as partes).
  Coleções .ttc: usa a primeira fonte (ou FontIndex). Fontes com contornos
  CFF (.otf/.otc "PostScript") não são suportadas.

  Parte do ESKit. Licença: LGPL modificada (a mesma da LCL). }

interface

uses
  System.Classes, System.SysUtils;

type
  TEsCodePoints = array of Cardinal;

  { TEsTrueTypeFont }

  TEsTrueTypeFont = class
  private
    FData: TBytes;
    FFileName: string;
    FTableTags: array of string;
    FTableOfs: array of Cardinal;
    FTableLen: array of Cardinal;
    FUnitsPerEm: Integer;
    FNumGlyphs: Integer;
    FNumHMetrics: Integer;
    FLongLoca: Boolean;
    FAscent, FDescent, FCapHeight: Integer;
    FBBox: array[0..3] of Integer;
    FCmapOfs: Cardinal;
    FCmapFormat: Integer;
    FPostScriptName: string;
    function U8(AOfs: Cardinal): Byte; inline;
    function U16(AOfs: Cardinal): Word;
    function S16(AOfs: Cardinal): SmallInt;
    function U32(AOfs: Cardinal): Cardinal;
    function TableIndex(const ATag: string): Integer;
    function GlyphOffset(AGlyph: Integer; out ALen: Cardinal): Cardinal;
    procedure Parse(AFontIndex: Integer);
    procedure ReadName;
  public
    procedure LoadFromFile(const AFileName: string; AFontIndex: Integer = 0);
    procedure LoadFromStream(AStream: TStream; AFontIndex: Integer = 0);
    { tenta carregar; devolve False (sem exceção) se o arquivo não servir }
    function TryLoadFromFile(const AFileName: string): Boolean;
    function HasTable(const ATag: string): Boolean;
    { índice do glifo do caractere (0 = .notdef / ausente) }
    function GlyphOf(ACodePoint: Cardinal): Integer;
    { avanço do glifo em unidades de 1/1000 do corpo }
    function Advance(AGlyph: Integer): Integer;
    { largura do texto em pontos }
    function TextWidth(const S: string; ASize: Single): Single;
    { fonte reduzida aos glifos indicados (mesmos índices de glifo) }
    function Subset(const AGlyphs: array of Integer): TBytes;
    property FileName: string read FFileName;
    property UnitsPerEm: Integer read FUnitsPerEm;
    property NumGlyphs: Integer read FNumGlyphs;
    { métricas em 1/1000 do corpo }
    function Ascent: Integer;
    function Descent: Integer;
    function CapHeight: Integer;
    function BBox(AIndex: Integer): Integer;
    property PostScriptName: string read FPostScriptName;
  end;

{ pontos de código Unicode de uma string (UTF-8 no Lazarus, UTF-16 no Delphi) }
function EsCodePoints(const S: string): TEsCodePoints;
{ procura uma fonte TrueType do sistema (Arial, Liberation Sans, DejaVu Sans...);
  devolve '' se não encontrar }
function EsFindSystemFont(ABold: Boolean): string;
{ fontes do sistema com boa cobertura Unicode (símbolos, CJK, árabe, hebraico,
  indiano...), na ordem em que devem ser tentadas quando falta um glifo }
function EsFallbackFontFiles: TStringList;

implementation

function EsCodePoints(const S: string): TEsCodePoints;
var
  I, N, L: Integer;
  C: Cardinal;
begin
  Result := nil;
  SetLength(Result, Length(S));
  N := 0;
  I := 1;
  L := Length(S);
  while I <= L do
  begin
    C := Ord(S[I]);
    if (C >= $D800) and (C <= $DBFF) and (I < L) and (Ord(S[I + 1]) >= $DC00) and
       (Ord(S[I + 1]) <= $DFFF) then
    begin
      C := $10000 + ((C - $D800) shl 10) + (Ord(S[I + 1]) - $DC00);
      Inc(I, 2);
    end
    else
      Inc(I);
    Result[N] := C;
    Inc(N);
  end;
  SetLength(Result, N);
end;

procedure EsFontDirs(Dirs: TStrings);

  procedure AddTree(const ARoot: string; ADepth: Integer);
  var
    SR: TSearchRec;
  begin
    if not DirectoryExists(ARoot) then Exit;
    Dirs.Add(IncludeTrailingPathDelimiter(ARoot));
    if ADepth = 0 then Exit;
    if FindFirst(IncludeTrailingPathDelimiter(ARoot) + '*', faDirectory, SR) = 0 then
    try
      repeat
        if (SR.Attr and faDirectory <> 0) and (SR.Name <> '.') and (SR.Name <> '..') then
          AddTree(IncludeTrailingPathDelimiter(ARoot) + SR.Name, ADepth - 1);
      until FindNext(SR) <> 0;
    finally
      FindClose(SR);
    end;
  end;

var
  D: string;
begin
  D := GetEnvironmentVariable('WINDIR');
  if D <> '' then AddTree(IncludeTrailingPathDelimiter(D) + 'Fonts', 0);
  D := GetEnvironmentVariable('LOCALAPPDATA');
  if D <> '' then AddTree(IncludeTrailingPathDelimiter(D) + 'Microsoft' + PathDelim +
    'Windows' + PathDelim + 'Fonts', 0);
  AddTree('/Library/Fonts', 0);
  AddTree('/System/Library/Fonts', 1);
  AddTree('/usr/share/fonts', 3);
  AddTree('/usr/local/share/fonts', 3);
  D := GetEnvironmentVariable('HOME');
  if D <> '' then
  begin
    AddTree(IncludeTrailingPathDelimiter(D) + '.fonts', 2);
    AddTree(IncludeTrailingPathDelimiter(D) + '.local' + PathDelim + 'share' + PathDelim + 'fonts', 2);
  end;
end;

var
  GFontDirs: TStringList = nil;

function FontDirs: TStringList;
begin
  if GFontDirs = nil then
  begin
    GFontDirs := TStringList.Create;
    EsFontDirs(GFontDirs);
  end;
  Result := GFontDirs;
end;

function EsFallbackFontFiles: TStringList;
const
  Names: array[0..21] of string = (
    'DejaVuSans.ttf', 'seguisym.ttf', 'segoeui.ttf', 'arialuni.ttf', 'Arial Unicode.ttf',
    'FreeSans.ttf', 'NotoSans-Regular.ttf', 'NotoSansSymbols-Regular.ttf',
    'NotoSansSymbols2-Regular.ttf', 'NotoSansHebrew-Regular.ttf', 'NotoSansArabic-Regular.ttf',
    'NotoSansDevanagari-Regular.ttf', 'NotoSansThai-Regular.ttf', 'msyh.ttc', 'msyh.ttf',
    'simsun.ttc', 'msgothic.ttc', 'malgun.ttf', 'wqy-microhei.ttc', 'wqy-zenhei.ttc',
    'DroidSansFallbackFull.ttf', 'NotoSansCJK-Regular.ttc');
var
  I, J: Integer;
begin
  Result := TStringList.Create;
  for J := 0 to High(Names) do
    for I := 0 to FontDirs.Count - 1 do
      if FileExists(FontDirs[I] + Names[J]) then
      begin
        Result.Add(FontDirs[I] + Names[J]);
        Break;
      end;
end;

function EsFindSystemFont(ABold: Boolean): string;
const
  Regular: array[0..7] of string = ('arial.ttf', 'Arial.ttf', 'LiberationSans-Regular.ttf',
    'DejaVuSans.ttf', 'NotoSans-Regular.ttf', 'FreeSans.ttf', 'Carlito-Regular.ttf', 'segoeui.ttf');
  Bold: array[0..7] of string = ('arialbd.ttf', 'Arial Bold.ttf', 'LiberationSans-Bold.ttf',
    'DejaVuSans-Bold.ttf', 'NotoSans-Bold.ttf', 'FreeSansBold.ttf', 'Carlito-Bold.ttf', 'segoeuib.ttf');
var
  I, J: Integer;
  F: string;
begin
  Result := '';
  with FontDirs do
  begin
    for J := 0 to High(Regular) do
      for I := 0 to Count - 1 do
      begin
        if ABold then F := Strings[I] + Bold[J] else F := Strings[I] + Regular[J];
        if FileExists(F) then
          Exit(F);
      end;
  end;
end;

{ TEsTrueTypeFont }

function TEsTrueTypeFont.U8(AOfs: Cardinal): Byte;
begin
  if AOfs < Cardinal(Length(FData)) then Result := FData[AOfs] else Result := 0;
end;

function TEsTrueTypeFont.U16(AOfs: Cardinal): Word;
begin
  Result := (Word(U8(AOfs)) shl 8) or U8(AOfs + 1);
end;

function TEsTrueTypeFont.S16(AOfs: Cardinal): SmallInt;
begin
  Result := SmallInt(U16(AOfs));
end;

function TEsTrueTypeFont.U32(AOfs: Cardinal): Cardinal;
begin
  Result := (Cardinal(U16(AOfs)) shl 16) or U16(AOfs + 2);
end;

function TEsTrueTypeFont.TableIndex(const ATag: string): Integer;
var
  I: Integer;
begin
  for I := 0 to High(FTableTags) do
    if FTableTags[I] = ATag then
      Exit(I);
  Result := -1;
end;

function TEsTrueTypeFont.HasTable(const ATag: string): Boolean;
begin
  Result := TableIndex(ATag) >= 0;
end;

procedure TEsTrueTypeFont.LoadFromFile(const AFileName: string; AFontIndex: Integer);
var
  F: TFileStream;
begin
  F := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    FFileName := AFileName;
    LoadFromStream(F, AFontIndex);
  finally
    F.Free;
  end;
end;

function TEsTrueTypeFont.TryLoadFromFile(const AFileName: string): Boolean;
begin
  try
    LoadFromFile(AFileName);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TEsTrueTypeFont.LoadFromStream(AStream: TStream; AFontIndex: Integer);
begin
  SetLength(FData, AStream.Size - AStream.Position);
  if Length(FData) > 0 then
    AStream.ReadBuffer(FData[0], Length(FData));
  Parse(AFontIndex);
end;

procedure TEsTrueTypeFont.Parse(AFontIndex: Integer);
var
  N, I, T: Integer;
  Ofs, Sub, Best, Base, V: Cardinal;
  Plat, Enc, Fmt: Word;
begin
  Base := 0;
  if U32(0) = $74746366 {'ttcf'} then
  begin
    if (AFontIndex < 0) or (Cardinal(AFontIndex) >= U32(8)) then AFontIndex := 0;
    Base := U32(12 + Cardinal(AFontIndex) * 4);
  end;
  V := U32(Base);
  if (V <> $00010000) and (V <> $74727565 {'true'}) then
    raise Exception.Create('EsTrueType: o arquivo não é uma fonte TrueType (.ttf/.ttc)');
  N := U16(Base + 4);
  SetLength(FTableTags, N);
  SetLength(FTableOfs, N);
  SetLength(FTableLen, N);
  for I := 0 to N - 1 do
  begin
    Ofs := Base + 12 + Cardinal(I) * 16;
    FTableTags[I] := Chr(U8(Ofs)) + Chr(U8(Ofs + 1)) + Chr(U8(Ofs + 2)) + Chr(U8(Ofs + 3));
    FTableOfs[I] := U32(Ofs + 8);
    FTableLen[I] := U32(Ofs + 12);
  end;
  if not (HasTable('head') and HasTable('hhea') and HasTable('hmtx') and HasTable('maxp') and
          HasTable('loca') and HasTable('glyf') and HasTable('cmap')) then
    raise Exception.Create('EsTrueType: fonte sem as tabelas TrueType obrigatórias');
  // head
  Ofs := FTableOfs[TableIndex('head')];
  FUnitsPerEm := U16(Ofs + 18);
  if FUnitsPerEm = 0 then FUnitsPerEm := 1000;
  for I := 0 to 3 do
    FBBox[I] := S16(Ofs + 36 + Cardinal(I) * 2);
  FLongLoca := S16(Ofs + 50) = 1;
  // maxp
  FNumGlyphs := U16(FTableOfs[TableIndex('maxp')] + 4);
  // hhea
  Ofs := FTableOfs[TableIndex('hhea')];
  FAscent := S16(Ofs + 4);
  FDescent := S16(Ofs + 6);
  FNumHMetrics := U16(Ofs + 34);
  FCapHeight := FAscent;
  T := TableIndex('OS/2');
  if T >= 0 then
  begin
    Ofs := FTableOfs[T];
    if (U16(Ofs) >= 2) and (FTableLen[T] >= 90) then
      FCapHeight := S16(Ofs + 88);
  end;
  // cmap: prefere Unicode completo (3,10 / 0,4+) e depois BMP (3,1 / 0,x)
  Ofs := FTableOfs[TableIndex('cmap')];
  N := U16(Ofs + 2);
  Best := 0;
  FCmapFormat := 0;
  for I := 0 to N - 1 do
  begin
    Plat := U16(Ofs + 4 + Cardinal(I) * 8);
    Enc := U16(Ofs + 6 + Cardinal(I) * 8);
    Sub := Ofs + U32(Ofs + 8 + Cardinal(I) * 8);
    Fmt := U16(Sub);
    if (Fmt = 12) and (((Plat = 3) and (Enc = 10)) or (Plat = 0)) then
    begin
      Best := Sub;
      FCmapFormat := 12;
      Break;
    end;
    if (Fmt = 4) and (((Plat = 3) and (Enc in [0, 1])) or (Plat = 0)) and (FCmapFormat = 0) then
    begin
      Best := Sub;
      FCmapFormat := 4;
    end;
  end;
  FCmapOfs := Best;
  ReadName;
end;

procedure TEsTrueTypeFont.ReadName;
var
  T, N, I, J: Integer;
  Ofs, Str, P: Cardinal;
  Plat, NameID, Len: Word;
  S: string;
  C: Char;
begin
  FPostScriptName := '';
  T := TableIndex('name');
  if T >= 0 then
  begin
    Ofs := FTableOfs[T];
    N := U16(Ofs + 2);
    Str := Ofs + U16(Ofs + 4);
    for I := 0 to N - 1 do
    begin
      P := Ofs + 6 + Cardinal(I) * 12;
      Plat := U16(P);
      NameID := U16(P + 6);
      Len := U16(P + 8);
      if NameID <> 6 then Continue;
      S := '';
      if Plat = 1 then
        for J := 0 to Len - 1 do
          S := S + Chr(U8(Str + U16(P + 10) + Cardinal(J)))
      else
        for J := 0 to Len div 2 - 1 do
          S := S + Chr(U16(Str + U16(P + 10) + Cardinal(J) * 2) and $7F);
      if S <> '' then
      begin
        FPostScriptName := S;
        Break;
      end;
    end;
  end;
  if FPostScriptName = '' then
    FPostScriptName := ChangeFileExt(ExtractFileName(FFileName), '');
  // só caracteres válidos em nomes PDF
  S := '';
  for I := 1 to Length(FPostScriptName) do
  begin
    C := FPostScriptName[I];
    if CharInSet(C, ['A'..'Z', 'a'..'z', '0'..'9', '-', '_']) then S := S + C;
  end;
  if S = '' then S := 'Font';
  FPostScriptName := S;
end;

function TEsTrueTypeFont.GlyphOf(ACodePoint: Cardinal): Integer;
var
  SegX2, I, Lo, Hi, Mid: Integer;
  EndC, StartC, Delta, RangeOfs, P: Cardinal;
  NGroups, G0, G1: Cardinal;
begin
  Result := 0;
  if FCmapOfs = 0 then Exit;
  if FCmapFormat = 12 then
  begin
    NGroups := U32(FCmapOfs + 12);
    Lo := 0;
    Hi := Integer(NGroups) - 1;
    while Lo <= Hi do
    begin
      Mid := (Lo + Hi) div 2;
      P := FCmapOfs + 16 + Cardinal(Mid) * 12;
      G0 := U32(P);
      G1 := U32(P + 4);
      if ACodePoint < G0 then Hi := Mid - 1
      else if ACodePoint > G1 then Lo := Mid + 1
      else
        Exit(Integer(U32(P + 8) + ACodePoint - G0));
    end;
    Exit;
  end;
  if ACodePoint > $FFFF then Exit;
  SegX2 := U16(FCmapOfs + 6);
  for I := 0 to SegX2 div 2 - 1 do
  begin
    EndC := U16(FCmapOfs + 14 + Cardinal(I) * 2);
    if ACodePoint > EndC then Continue;
    StartC := U16(FCmapOfs + 16 + Cardinal(SegX2) + Cardinal(I) * 2);
    if ACodePoint < StartC then Exit;
    Delta := U16(FCmapOfs + 16 + Cardinal(SegX2) * 2 + Cardinal(I) * 2);
    P := FCmapOfs + 16 + Cardinal(SegX2) * 3 + Cardinal(I) * 2;
    RangeOfs := U16(P);
    if RangeOfs = 0 then
      Result := (ACodePoint + Delta) and $FFFF
    else
    begin
      Result := U16(P + RangeOfs + (ACodePoint - StartC) * 2);
      if Result <> 0 then Result := (Cardinal(Result) + Delta) and $FFFF;
    end;
    Exit;
  end;
end;

function TEsTrueTypeFont.Advance(AGlyph: Integer): Integer;
var
  Ofs: Cardinal;
  G: Integer;
begin
  G := AGlyph;
  if G >= FNumHMetrics then G := FNumHMetrics - 1;
  if G < 0 then G := 0;
  Ofs := FTableOfs[TableIndex('hmtx')] + Cardinal(G) * 4;
  Result := Round(U16(Ofs) * 1000 / FUnitsPerEm);
end;

function TEsTrueTypeFont.TextWidth(const S: string; ASize: Single): Single;
var
  CP: TEsCodePoints;
  I, Sum: Integer;
begin
  CP := EsCodePoints(S);
  Sum := 0;
  for I := 0 to High(CP) do
    Inc(Sum, Advance(GlyphOf(CP[I])));
  Result := Sum * ASize / 1000;
end;

function TEsTrueTypeFont.Ascent: Integer;
begin
  Result := Round(FAscent * 1000 / FUnitsPerEm);
end;

function TEsTrueTypeFont.Descent: Integer;
begin
  Result := Round(FDescent * 1000 / FUnitsPerEm);
end;

function TEsTrueTypeFont.CapHeight: Integer;
begin
  Result := Round(FCapHeight * 1000 / FUnitsPerEm);
end;

function TEsTrueTypeFont.BBox(AIndex: Integer): Integer;
begin
  Result := Round(FBBox[AIndex] * 1000 / FUnitsPerEm);
end;

function TEsTrueTypeFont.GlyphOffset(AGlyph: Integer; out ALen: Cardinal): Cardinal;
var
  Loca, A, B: Cardinal;
begin
  Loca := FTableOfs[TableIndex('loca')];
  if FLongLoca then
  begin
    A := U32(Loca + Cardinal(AGlyph) * 4);
    B := U32(Loca + Cardinal(AGlyph + 1) * 4);
  end
  else
  begin
    A := Cardinal(U16(Loca + Cardinal(AGlyph) * 2)) * 2;
    B := Cardinal(U16(Loca + Cardinal(AGlyph + 1) * 2)) * 2;
  end;
  if B < A then B := A;
  ALen := B - A;
  Result := FTableOfs[TableIndex('glyf')] + A;
end;

function TEsTrueTypeFont.Subset(const AGlyphs: array of Integer): TBytes;
const
  Keep: array[0..9] of string = ('head', 'hhea', 'maxp', 'hmtx', 'loca', 'glyf',
    'cvt ', 'fpgm', 'prep', 'OS/2');
  ARG_1_AND_2_ARE_WORDS = $0001;
  WE_HAVE_A_SCALE = $0008;
  MORE_COMPONENTS = $0020;
  WE_HAVE_AN_X_AND_Y_SCALE = $0040;
  WE_HAVE_A_TWO_BY_TWO = $0080;
var
  Used: array of Boolean;
  Stack: array of Integer;
  SP, I, G, NT, T, K: Integer;
  Ofs, Len, P, Flags, Pos, GlyfLen, Sum: Cardinal;
  Glyf, Loca: TBytes;
  Tabs: array of TBytes;
  Tags: array of string;
  Res: TBytes;
  ResPos, DirPos: Cardinal;

  procedure Put16(var A: TBytes; AOfs: Cardinal; V: Cardinal);
  begin
    A[AOfs] := (V shr 8) and $FF;
    A[AOfs + 1] := V and $FF;
  end;

  procedure Put32(var A: TBytes; AOfs: Cardinal; V: Cardinal);
  begin
    Put16(A, AOfs, V shr 16);
    Put16(A, AOfs + 2, V and $FFFF);
  end;

  function CheckSum(const A: TBytes): Cardinal;
  var
    J: Integer;
    W: Cardinal;
  begin
    Result := 0;
    J := 0;
    while J < Length(A) do
    begin
      W := Cardinal(A[J]) shl 24;
      if J + 1 < Length(A) then W := W or (Cardinal(A[J + 1]) shl 16);
      if J + 2 < Length(A) then W := W or (Cardinal(A[J + 2]) shl 8);
      if J + 3 < Length(A) then W := W or A[J + 3];
      Result := Cardinal((UInt64(Result) + W) and $FFFFFFFF);
      Inc(J, 4);
    end;
  end;

  function TableBytes(const ATag: string): TBytes;
  var
    Ix: Integer;
  begin
    Ix := TableIndex(ATag);
    Result := nil;
    SetLength(Result, FTableLen[Ix]);
    if FTableLen[Ix] > 0 then
      Move(FData[FTableOfs[Ix]], Result[0], FTableLen[Ix]);
  end;

begin
  // glifos usados (+ partes dos compostos; o glifo 0 sempre)
  SetLength(Used, FNumGlyphs);
  SetLength(Stack, 0);
  SP := 0;
  for I := 0 to High(AGlyphs) do
    if (AGlyphs[I] >= 0) and (AGlyphs[I] < FNumGlyphs) then
    begin
      SetLength(Stack, SP + 1);
      Stack[SP] := AGlyphs[I];
      Inc(SP);
    end;
  SetLength(Stack, SP + 1);
  Stack[SP] := 0;
  Inc(SP);
  while SP > 0 do
  begin
    Dec(SP);
    G := Stack[SP];
    if Used[G] then Continue;
    Used[G] := True;
    Ofs := GlyphOffset(G, Len);
    if (Len < 10) or (S16(Ofs) >= 0) then Continue;
    P := Ofs + 10;
    repeat
      Flags := U16(P);
      K := U16(P + 2);
      if (K < FNumGlyphs) and not Used[K] then
      begin
        if SP >= Length(Stack) then SetLength(Stack, SP + 16);
        Stack[SP] := K;
        Inc(SP);
      end;
      Inc(P, 4);
      if Flags and ARG_1_AND_2_ARE_WORDS <> 0 then Inc(P, 4) else Inc(P, 2);
      if Flags and WE_HAVE_A_SCALE <> 0 then Inc(P, 2)
      else if Flags and WE_HAVE_AN_X_AND_Y_SCALE <> 0 then Inc(P, 4)
      else if Flags and WE_HAVE_A_TWO_BY_TWO <> 0 then Inc(P, 8);
    until (Flags and MORE_COMPONENTS = 0) or (P >= Ofs + Len);
  end;
  // novas tabelas glyf + loca (formato longo)
  GlyfLen := 0;
  for G := 0 to FNumGlyphs - 1 do
    if Used[G] then
    begin
      GlyphOffset(G, Len);
      Inc(GlyfLen, (Len + 3) and not 3);
    end;
  SetLength(Glyf, GlyfLen);
  SetLength(Loca, (FNumGlyphs + 1) * 4);
  Pos := 0;
  for G := 0 to FNumGlyphs - 1 do
  begin
    Put32(Loca, Cardinal(G) * 4, Pos);
    if not Used[G] then Continue;
    Ofs := GlyphOffset(G, Len);
    if Len > 0 then
      Move(FData[Ofs], Glyf[Pos], Len);
    Inc(Pos, (Len + 3) and not 3);
  end;
  Put32(Loca, Cardinal(FNumGlyphs) * 4, Pos);
  // monta a fonte
  NT := 0;
  for I := 0 to High(Keep) do
    if HasTable(Keep[I]) then
    begin
      SetLength(Tags, NT + 1);
      SetLength(Tabs, NT + 1);
      Tags[NT] := Keep[I];
      if Keep[I] = 'glyf' then Tabs[NT] := Glyf
      else if Keep[I] = 'loca' then Tabs[NT] := Loca
      else Tabs[NT] := TableBytes(Keep[I]);
      if Keep[I] = 'head' then
      begin
        Put32(Tabs[NT], 8, 0);   // checkSumAdjustment
        Put16(Tabs[NT], 50, 1);  // indexToLocFormat = longo
      end;
      Inc(NT);
    end;
  Sum := 12 + Cardinal(NT) * 16;
  for I := 0 to NT - 1 do
    Inc(Sum, (Cardinal(Length(Tabs[I])) + 3) and not 3);
  SetLength(Res, Sum);
  FillChar(Res[0], Sum, 0);
  Put32(Res, 0, $00010000);
  Put16(Res, 4, NT);
  K := 1;
  T := 0;
  while K * 2 <= NT do
  begin
    K := K * 2;
    Inc(T);
  end;
  Put16(Res, 6, K * 16);
  Put16(Res, 8, T);
  Put16(Res, 10, NT * 16 - K * 16);
  ResPos := 12 + Cardinal(NT) * 16;
  for I := 0 to NT - 1 do
  begin
    DirPos := 12 + Cardinal(I) * 16;
    Res[DirPos] := Ord(Tags[I][1]);
    Res[DirPos + 1] := Ord(Tags[I][2]);
    Res[DirPos + 2] := Ord(Tags[I][3]);
    Res[DirPos + 3] := Ord(Tags[I][4]);
    Put32(Res, DirPos + 4, CheckSum(Tabs[I]));
    Put32(Res, DirPos + 8, ResPos);
    Put32(Res, DirPos + 12, Length(Tabs[I]));
    if Length(Tabs[I]) > 0 then
      Move(Tabs[I][0], Res[ResPos], Length(Tabs[I]));
    Inc(ResPos, (Cardinal(Length(Tabs[I])) + 3) and not 3);
  end;
  Result := Res;
end;

initialization

finalization
  GFontDirs.Free;
end.
