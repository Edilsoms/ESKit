{
 *****************************************************************************
  ESKit - esfxanimations.pas
  Animações no estilo FireMonkey:
    TEsFxFloatAnimation  - anima qualquer propriedade numérica publicada
                         (ex.: 'Opacity', 'Width', 'Fill.Color' não; use cor)
    TEsFxColorAnimation  - anima propriedades TAlphaColor ou TColor
                         (ex.: 'Fill.Color', 'Stroke.Color', 'Color')
    TEsFxAnimator        - API de uma linha, igual ao TAnimator do FMX:
                         TEsFxAnimator.AnimateFloat(Botao, 'Opacity', 0.3, 0.4);
  Suporta caminho com pontos ("Fill.Color"), interpolações de Penner,
  AutoReverse, Loop, Delay e Trigger (ex.: ftMouseOver).

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit EsFxAnimations;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math, TypInfo, Controls, Graphics, EsGraphics, EsFxBase;

type
  TEsFxInterpolationType = (itLinear, itQuadratic, itCubic, itQuartic,
    itQuintic, itSinusoidal, itExponential, itCircular, itElastic, itBack,
    itBounce);
  TEsFxAnimationType = (atIn, atOut, atInOut);

  { TEsFxAnimation }

  TEsFxAnimation = class(TComponent)
  private
    FEnabled: Boolean;
    FDuration: Single;
    FDelay: Single;
    FInterpolation: TEsFxInterpolationType;
    FAnimationType: TEsFxAnimationType;
    FAutoReverse: Boolean;
    FLoop: Boolean;
    FInverse: Boolean;
    FTrigger: TEsFxTrigger;
    FTarget: TComponent;
    FRunning: Boolean;
    FPaused: Boolean;
    FTime: Double;
    FDelayLeft: Double;
    FDir: Integer;
    FReversedOnce: Boolean;
    FFreeOnFinish: Boolean;
    FOnProcess: TNotifyEvent;
    FOnFinish: TNotifyEvent;
    procedure SetEnabled(AValue: Boolean);
    procedure SetTarget(AValue: TComponent);
    procedure Tick(DeltaSec: Double);
    function GetNormalizedTime: Single;
  protected
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function ActualTarget: TComponent;
    { aplica o progresso 0..1 (já interpolado) ao alvo }
    procedure ProcessAnimation(Progress: Single); virtual; abstract;
    procedure FirstFrame; virtual;
    procedure DoFinish; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;          // vai para o valor final
    procedure StopAtCurrent; // congela onde está
    procedure Pause;
    procedure Resume;
    { usado pelos triggers: anda para frente (True) ou volta (False)
      a partir do ponto atual, de forma contínua }
    procedure PlayTowards(Forward: Boolean);
    property Running: Boolean read FRunning;
    property Paused: Boolean read FPaused;
    property NormalizedTime: Single read GetNormalizedTime;
    property FreeOnFinish: Boolean read FFreeOnFinish write FFreeOnFinish;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property Duration: Single read FDuration write FDuration;
    property Delay: Single read FDelay write FDelay;
    property Interpolation: TEsFxInterpolationType read FInterpolation write FInterpolation default itLinear;
    property AnimationType: TEsFxAnimationType read FAnimationType write FAnimationType default atIn;
    property AutoReverse: Boolean read FAutoReverse write FAutoReverse default False;
    property Loop: Boolean read FLoop write FLoop default False;
    property Inverse: Boolean read FInverse write FInverse default False;
    property Trigger: TEsFxTrigger read FTrigger write FTrigger default ftNone;
    { componente animado; se vazio usa o Owner }
    property Target: TComponent read FTarget write SetTarget;
    property OnProcess: TNotifyEvent read FOnProcess write FOnProcess;
    property OnFinish: TNotifyEvent read FOnFinish write FOnFinish;
  end;

  { TEsFxFloatAnimation }

  TEsFxFloatAnimation = class(TEsFxAnimation)
  private
    FPropertyName: string;
    FStartValue: Single;
    FStopValue: Single;
    FStartFromCurrent: Boolean;
    FCurrentStart: Single;
  protected
    procedure FirstFrame; override;
    procedure ProcessAnimation(Progress: Single); override;
  published
    property PropertyName: string read FPropertyName write FPropertyName;
    property StartValue: Single read FStartValue write FStartValue;
    property StopValue: Single read FStopValue write FStopValue;
    property StartFromCurrent: Boolean read FStartFromCurrent write FStartFromCurrent default False;
  end;

  { TEsFxColorAnimation }

  TEsFxColorAnimation = class(TEsFxAnimation)
  private
    FPropertyName: string;
    FStartValue: TAlphaColor;
    FStopValue: TAlphaColor;
    FStartFromCurrent: Boolean;
    FCurrentStart: TAlphaColor;
  protected
    procedure FirstFrame; override;
    procedure ProcessAnimation(Progress: Single); override;
  published
    property PropertyName: string read FPropertyName write FPropertyName;
    property StartValue: TAlphaColor read FStartValue write FStartValue;
    property StopValue: TAlphaColor read FStopValue write FStopValue;
    property StartFromCurrent: Boolean read FStartFromCurrent write FStartFromCurrent default False;
  end;

  { TEsFxAnimator - equivalente ao FMX.Ani.TAnimator }

  TEsFxAnimator = class
  public
    class function AnimateFloat(Target: TComponent; const APropertyName: string;
      NewValue: Single; Duration: Single = 0.2;
      AType: TEsFxAnimationType = atIn;
      AInterpolation: TEsFxInterpolationType = itLinear): TEsFxFloatAnimation;
    class function AnimateFloatDelay(Target: TComponent; const APropertyName: string;
      NewValue: Single; Duration, Delay: Single;
      AType: TEsFxAnimationType = atIn;
      AInterpolation: TEsFxInterpolationType = itLinear): TEsFxFloatAnimation;
    class function AnimateColor(Target: TComponent; const APropertyName: string;
      NewValue: TAlphaColor; Duration: Single = 0.2;
      AType: TEsFxAnimationType = atIn;
      AInterpolation: TEsFxInterpolationType = itLinear): TEsFxColorAnimation;
    class procedure StopPropertyAnimation(Target: TComponent; const APropertyName: string);
  end;

function EsFxInterpolate(T: Single; AInterpolation: TEsFxInterpolationType;
  AType: TEsFxAnimationType): Single;
{ resolve "A.B.C" -> objeto dono da propriedade final + PPropInfo }
function EsFxFindProperty(Root: TObject; const APath: string; out AObject: TObject;
  out AProp: PPropInfo): Boolean;

implementation

var
  GAnimations: TFPList = nil;

function BounceOut(T: Single): Single;
begin
  if T < 1 / 2.75 then
    Result := 7.5625 * T * T
  else if T < 2 / 2.75 then
  begin
    T := T - 1.5 / 2.75;
    Result := 7.5625 * T * T + 0.75;
  end
  else if T < 2.5 / 2.75 then
  begin
    T := T - 2.25 / 2.75;
    Result := 7.5625 * T * T + 0.9375;
  end
  else
  begin
    T := T - 2.625 / 2.75;
    Result := 7.5625 * T * T + 0.984375;
  end;
end;

function EaseIn(T: Single; I: TEsFxInterpolationType): Single;
const
  S = 1.70158;
begin
  case I of
    itLinear: Result := T;
    itQuadratic: Result := T * T;
    itCubic: Result := T * T * T;
    itQuartic: Result := T * T * T * T;
    itQuintic: Result := T * T * T * T * T;
    itSinusoidal: Result := 1 - Cos(T * Pi / 2);
    itExponential:
      if T <= 0 then Result := 0 else Result := Power(2, 10 * (T - 1));
    itCircular: Result := 1 - Sqrt(Max(0, 1 - T * T));
    itElastic:
      if (T <= 0) or (T >= 1) then
        Result := T
      else
        Result := -(Power(2, 10 * (T - 1)) * Sin((T - 1.075) * (2 * Pi) / 0.3));
    itBack: Result := T * T * ((S + 1) * T - S);
    itBounce: Result := 1 - BounceOut(1 - T);
  else
    Result := T;
  end;
end;

function EsFxInterpolate(T: Single; AInterpolation: TEsFxInterpolationType;
  AType: TEsFxAnimationType): Single;
begin
  T := EnsureRange(T, 0, 1);
  case AType of
    atIn: Result := EaseIn(T, AInterpolation);
    atOut: Result := 1 - EaseIn(1 - T, AInterpolation);
    atInOut:
      if T < 0.5 then
        Result := EaseIn(2 * T, AInterpolation) / 2
      else
        Result := 1 - EaseIn(2 * (1 - T), AInterpolation) / 2;
  else
    Result := T;
  end;
end;

function EsFxFindProperty(Root: TObject; const APath: string; out AObject: TObject;
  out AProp: PPropInfo): Boolean;
var
  Parts: TStringArray;
  I: Integer;
  Obj: TObject;
  PI: PPropInfo;
begin
  Result := False;
  AObject := nil;
  AProp := nil;
  if (Root = nil) or (Trim(APath) = '') then Exit;
  Parts := Trim(APath).Split(['.']);
  Obj := Root;
  for I := 0 to High(Parts) do
  begin
    PI := GetPropInfo(Obj, Parts[I]);
    if PI = nil then Exit;
    if I = High(Parts) then
    begin
      AObject := Obj;
      AProp := PI;
      Exit(True);
    end;
    if PI^.PropType^.Kind <> tkClass then Exit;
    Obj := GetObjectProp(Obj, PI);
    if Obj = nil then Exit;
  end;
end;

function IsTColorProp(P: PPropInfo): Boolean;
var
  N: string;
begin
  N := LowerCase(P^.PropType^.Name);
  Result := (N = 'tcolor') or (N = 'tgraphicscolor');
end;

{ hook global dos triggers }

procedure AnimationTriggerHook(Sender: TControl; Trigger: TEsFxTrigger; Value: Boolean);
var
  I: Integer;
  A: TEsFxAnimation;
begin
  if GAnimations = nil then Exit;
  for I := GAnimations.Count - 1 downto 0 do
  begin
    if I >= GAnimations.Count then Continue;
    A := TEsFxAnimation(GAnimations[I]);
    if (A.FTrigger = Trigger) and (A.ActualTarget = Sender) and
       not (csDesigning in A.ComponentState) then
      A.PlayTowards(Value);
  end;
end;

{ TEsFxAnimation }

constructor TEsFxAnimation.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDuration := 0.2;
  FDir := 1;
  if GAnimations = nil then
    GAnimations := TFPList.Create;
  GAnimations.Add(Self);
end;

destructor TEsFxAnimation.Destroy;
begin
  EsFxTicker.Remove(@Tick);
  if GAnimations <> nil then
    GAnimations.Remove(Self);
  inherited Destroy;
end;

procedure TEsFxAnimation.SetEnabled(AValue: Boolean);
begin
  if FEnabled = AValue then Exit;
  FEnabled := AValue;
  if [csLoading, csDesigning] * ComponentState <> [] then Exit;
  if FEnabled then Start else StopAtCurrent;
end;

procedure TEsFxAnimation.SetTarget(AValue: TComponent);
begin
  if FTarget = AValue then Exit;
  if FTarget <> nil then FTarget.RemoveFreeNotification(Self);
  FTarget := AValue;
  if FTarget <> nil then FTarget.FreeNotification(Self);
end;

procedure TEsFxAnimation.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FTarget) then
  begin
    FTarget := nil;
    EsFxTicker.Remove(@Tick);
    FRunning := False;
  end;
end;

procedure TEsFxAnimation.Loaded;
begin
  inherited Loaded;
  if FEnabled and not (csDesigning in ComponentState) and (FTrigger = ftNone) then
    Start;
end;

function TEsFxAnimation.ActualTarget: TComponent;
begin
  Result := FTarget;
  if Result = nil then
    Result := Owner;
end;

function TEsFxAnimation.GetNormalizedTime: Single;
begin
  if FDuration <= 0 then
    Result := 1
  else
    Result := EnsureRange(FTime / FDuration, 0, 1);
end;

procedure TEsFxAnimation.FirstFrame;
begin
end;

procedure TEsFxAnimation.DoFinish;
begin
  if Assigned(FOnFinish) then FOnFinish(Self);
end;

procedure TEsFxAnimation.Start;
begin
  if csDesigning in ComponentState then Exit;
  FirstFrame;
  FDelayLeft := FDelay;
  FReversedOnce := False;
  if FInverse then
  begin
    FTime := FDuration;
    FDir := -1;
  end
  else
  begin
    FTime := 0;
    FDir := 1;
  end;
  FRunning := True;
  FPaused := False;
  ProcessAnimation(EsFxInterpolate(GetNormalizedTime, FInterpolation, FAnimationType));
  EsFxTicker.Add(@Tick);
end;

procedure TEsFxAnimation.PlayTowards(Forward: Boolean);
begin
  if csDesigning in ComponentState then Exit;
  if FInverse then Forward := not Forward;
  if not FRunning and (FTime = 0) and Forward then
    FirstFrame;
  if Forward then FDir := 1 else FDir := -1;
  FDelayLeft := 0;
  FReversedOnce := True; // trigger não faz auto-reverse
  FRunning := True;
  FPaused := False;
  EsFxTicker.Add(@Tick);
end;

procedure TEsFxAnimation.Stop;
begin
  if not FRunning then Exit;
  if FDir > 0 then FTime := FDuration else FTime := 0;
  if FAutoReverse then FTime := 0;
  ProcessAnimation(EsFxInterpolate(GetNormalizedTime, FInterpolation, FAnimationType));
  StopAtCurrent;
  DoFinish;
end;

procedure TEsFxAnimation.StopAtCurrent;
begin
  FRunning := False;
  FPaused := False;
  EsFxTicker.Remove(@Tick);
end;

procedure TEsFxAnimation.Pause;
begin
  if not FRunning then Exit;
  FPaused := True;
  EsFxTicker.Remove(@Tick);
end;

procedure TEsFxAnimation.Resume;
begin
  if not (FRunning and FPaused) then Exit;
  FPaused := False;
  EsFxTicker.Add(@Tick);
end;

procedure TEsFxAnimation.Tick(DeltaSec: Double);
var
  Finished: Boolean;
begin
  if FDelayLeft > 0 then
  begin
    FDelayLeft := FDelayLeft - DeltaSec;
    if FDelayLeft > 0 then Exit;
    DeltaSec := -FDelayLeft;
    FDelayLeft := 0;
  end;
  Finished := False;
  FTime := FTime + DeltaSec * FDir;
  if FTime >= FDuration then
  begin
    FTime := FDuration;
    if FAutoReverse and not FReversedOnce then
    begin
      FDir := -1;
      FReversedOnce := True;
    end
    else if FLoop and (FTrigger = ftNone) then
    begin
      FTime := 0;
      FReversedOnce := False;
    end
    else
      Finished := True;
  end
  else if FTime <= 0 then
  begin
    FTime := 0;
    if FAutoReverse and FLoop and (FTrigger = ftNone) then
    begin
      FDir := 1;
      FReversedOnce := False;
    end
    else if FLoop and FInverse and (FTrigger = ftNone) then
      FTime := FDuration
    else
      Finished := True;
  end;

  ProcessAnimation(EsFxInterpolate(GetNormalizedTime, FInterpolation, FAnimationType));
  if Assigned(FOnProcess) then FOnProcess(Self);

  if Finished then
  begin
    StopAtCurrent;
    DoFinish;
    if FFreeOnFinish then
      Free;
  end;
end;

{ TEsFxFloatAnimation }

procedure TEsFxFloatAnimation.FirstFrame;
var
  Obj: TObject;
  P: PPropInfo;
begin
  FCurrentStart := FStartValue;
  if FStartFromCurrent and EsFxFindProperty(ActualTarget, FPropertyName, Obj, P) then
    case P^.PropType^.Kind of
      tkFloat: FCurrentStart := GetFloatProp(Obj, P);
      tkInteger, tkInt64: FCurrentStart := GetOrdProp(Obj, P);
    end;
end;

procedure TEsFxFloatAnimation.ProcessAnimation(Progress: Single);
var
  Obj: TObject;
  P: PPropInfo;
  V: Single;
begin
  if not EsFxFindProperty(ActualTarget, FPropertyName, Obj, P) then Exit;
  V := FCurrentStart + (FStopValue - FCurrentStart) * Progress;
  case P^.PropType^.Kind of
    tkFloat: SetFloatProp(Obj, P, V);
    tkInteger, tkInt64: SetOrdProp(Obj, P, Round(V));
  end;
end;

{ TEsFxColorAnimation }

procedure TEsFxColorAnimation.FirstFrame;
var
  Obj: TObject;
  P: PPropInfo;
begin
  FCurrentStart := FStartValue;
  if FStartFromCurrent and EsFxFindProperty(ActualTarget, FPropertyName, Obj, P) and
     (P^.PropType^.Kind in [tkInteger, tkInt64]) then
  begin
    if IsTColorProp(P) then
      FCurrentStart := ColorToAlphaColor(TColor(GetOrdProp(Obj, P)))
    else
      FCurrentStart := TAlphaColor(GetOrdProp(Obj, P));
  end;
end;

procedure TEsFxColorAnimation.ProcessAnimation(Progress: Single);
var
  Obj: TObject;
  P: PPropInfo;
  C: TAlphaColor;
begin
  if not EsFxFindProperty(ActualTarget, FPropertyName, Obj, P) then Exit;
  if not (P^.PropType^.Kind in [tkInteger, tkInt64]) then Exit;
  C := InterpolateColor(FCurrentStart, FStopValue, Progress);
  if IsTColorProp(P) then
    SetOrdProp(Obj, P, AlphaColorToColor(C))
  else
    SetOrdProp(Obj, P, Int64(C));
end;

{ TEsFxAnimator }

class function TEsFxAnimator.AnimateFloat(Target: TComponent;
  const APropertyName: string; NewValue: Single; Duration: Single;
  AType: TEsFxAnimationType; AInterpolation: TEsFxInterpolationType): TEsFxFloatAnimation;
begin
  Result := AnimateFloatDelay(Target, APropertyName, NewValue, Duration, 0,
    AType, AInterpolation);
end;

class function TEsFxAnimator.AnimateFloatDelay(Target: TComponent;
  const APropertyName: string; NewValue: Single; Duration, Delay: Single;
  AType: TEsFxAnimationType; AInterpolation: TEsFxInterpolationType): TEsFxFloatAnimation;
begin
  StopPropertyAnimation(Target, APropertyName);
  Result := TEsFxFloatAnimation.Create(nil);
  Result.Target := Target;
  Result.PropertyName := APropertyName;
  Result.StopValue := NewValue;
  Result.StartFromCurrent := True;
  Result.Duration := Duration;
  Result.Delay := Delay;
  Result.AnimationType := AType;
  Result.Interpolation := AInterpolation;
  Result.FreeOnFinish := True;
  Result.Start;
end;

class function TEsFxAnimator.AnimateColor(Target: TComponent;
  const APropertyName: string; NewValue: TAlphaColor; Duration: Single;
  AType: TEsFxAnimationType; AInterpolation: TEsFxInterpolationType): TEsFxColorAnimation;
begin
  StopPropertyAnimation(Target, APropertyName);
  Result := TEsFxColorAnimation.Create(nil);
  Result.Target := Target;
  Result.PropertyName := APropertyName;
  Result.StopValue := NewValue;
  Result.StartFromCurrent := True;
  Result.Duration := Duration;
  Result.AnimationType := AType;
  Result.Interpolation := AInterpolation;
  Result.FreeOnFinish := True;
  Result.Start;
end;

class procedure TEsFxAnimator.StopPropertyAnimation(Target: TComponent;
  const APropertyName: string);
var
  I: Integer;
  A: TEsFxAnimation;
  N: string;
begin
  if GAnimations = nil then Exit;
  for I := GAnimations.Count - 1 downto 0 do
  begin
    if I >= GAnimations.Count then Continue;
    A := TEsFxAnimation(GAnimations[I]);
    if A.ActualTarget <> Target then Continue;
    if A is TEsFxFloatAnimation then N := TEsFxFloatAnimation(A).PropertyName
    else if A is TEsFxColorAnimation then N := TEsFxColorAnimation(A).PropertyName
    else N := '';
    if SameText(N, APropertyName) and A.FFreeOnFinish then
    begin
      A.StopAtCurrent;
      A.Free;
    end;
  end;
end;

initialization
  EsFxTriggerHook := @AnimationTriggerHook;

finalization
  EsFxTriggerHook := nil;
  FreeAndNil(GAnimations);

end.
