{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: Vcl.ImgList
  Gerado por tools/genvclcompat.py a partir de ImgList.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit Vcl.ImgList;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Graphics, ImgList;
type
{$if declared(TImageIndex)}
  TImageIndex = ImgList.TImageIndex;
{$endif}
{$if declared(TCustomImageList)}
  TCustomImageList = ImgList.TCustomImageList;
{$endif}
{$if declared(TDestroyResolutionHandleEvent)}
  TDestroyResolutionHandleEvent = ImgList.TDestroyResolutionHandleEvent;
{$endif}
{$if declared(TChangeLink)}
  TChangeLink = ImgList.TChangeLink;
{$endif}
{$if declared(TDrawingStyle)}
  TDrawingStyle = ImgList.TDrawingStyle;
{$endif}
{$if declared(TImageType)}
  TImageType = ImgList.TImageType;
{$endif}
{$if declared(TOverlay)}
  TOverlay = ImgList.TOverlay;
{$endif}
{$if declared(TOverlayArray)}
  TOverlayArray = ImgList.TOverlayArray;
{$endif}
{$if declared(TCustomImageListResolution)}
  TCustomImageListResolution = ImgList.TCustomImageListResolution;
{$endif}
{$if declared(TScaledImageListResolution)}
  TScaledImageListResolution = ImgList.TScaledImageListResolution;
{$endif}
{$if declared(TCustomImageListResolutionClass)}
  TCustomImageListResolutionClass = ImgList.TCustomImageListResolutionClass;
{$endif}
{$if declared(TCustomImageListResolutions)}
  TCustomImageListResolutions = ImgList.TCustomImageListResolutions;
{$endif}
{$if declared(TCustomImageListResolutionEnumerator)}
  TCustomImageListResolutionEnumerator = ImgList.TCustomImageListResolutionEnumerator;
{$endif}
{$if declared(TCustomImageListGetWidthForPPI)}
  TCustomImageListGetWidthForPPI = ImgList.TCustomImageListGetWidthForPPI;
{$endif}
{$if declared(TLCLGlyphsMissingResources)}
  TLCLGlyphsMissingResources = ImgList.TLCLGlyphsMissingResources;
{$endif}
{$if declared(TLCLGlyphs)}
  TLCLGlyphs = ImgList.TLCLGlyphs;
{$endif}
const
{$if declared(dsFocus)}
  dsFocus = ImgList.dsFocus;
{$endif}
{$if declared(dsSelected)}
  dsSelected = ImgList.dsSelected;
{$endif}
{$if declared(dsNormal)}
  dsNormal = ImgList.dsNormal;
{$endif}
{$if declared(dsTransparent)}
  dsTransparent = ImgList.dsTransparent;
{$endif}
{$if declared(itImage)}
  itImage = ImgList.itImage;
{$endif}
{$if declared(itMask)}
  itMask = ImgList.itMask;
{$endif}
{$if declared(gmrAllMustExist)}
  gmrAllMustExist = ImgList.gmrAllMustExist;
{$endif}
{$if declared(gmrOneMustExist)}
  gmrOneMustExist = ImgList.gmrOneMustExist;
{$endif}
{$if declared(gmrIgnoreAll)}
  gmrIgnoreAll = ImgList.gmrIgnoreAll;
{$endif}
{$if declared(LCLGlyphs)}
function LCLGlyphs: TLCLGlyphs; inline;
{$endif}
{$if declared(GetDefaultGlyph)}
function GetDefaultGlyph(ResourceName: string; ScalePercent: Integer = 100; IgnoreMissingResource: Boolean = False): TCustomBitmap; inline;
{$endif}

implementation

{$if declared(LCLGlyphs)}
function LCLGlyphs: TLCLGlyphs;
begin
  Result := ImgList.LCLGlyphs;
end;

{$endif}
{$if declared(GetDefaultGlyph)}
function GetDefaultGlyph(ResourceName: string; ScalePercent: Integer = 100; IgnoreMissingResource: Boolean = False): TCustomBitmap;
begin
  Result := ImgList.GetDefaultGlyph(ResourceName, ScalePercent, IgnoreMissingResource);
end;

{$endif}
end.
