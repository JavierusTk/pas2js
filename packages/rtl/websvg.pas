unit websvg;

{$H+}
{$IFDEF PAS2JS}
{$MODESWITCH externalclass}
{$ENDIF}

interface

uses SysUtils, web, JS;

type
  // Forward class
  TJSSVGSVGElement = class;
  TJSSVGNumberList = class;
  TJSSVGAngle = class;
  TJSSVGAnimatedAngle = class;
  TJSSVGAnimatedBoolean = class;
  TJSSVGAnimatedEnumeration = class;
  TJSSVGAnimatedInteger = class;
  TJSSVGAnimatedLength = class;
  TJSSVGAnimatedLengthList = class;
  TJSSVGAnimatedNumber = class;
  TJSSVGAnimatedNumberList = class;
  TJSSVGAnimatedPreserveAspectRatio = class;
  TJSSVGAnimatedRect = class;
  TJSSVGAnimatedString = class;
  TJSSVGAnimatedTransformList = class;
  TJSSVGAnimateElement = class;
  TJSSVGAnimateMotionElement = class;
  TJSSVGAnimateTransformElement = class;
  TJSSVGAnimationElement = class;
  TJSSVGCircleElement = class;
  TJSSVGClipPathElement = class;
  TJSSVGComponentTransferFunctionElement = class;
  TJSSVGDefsElement = class;
  TJSSVGDescElement = class;
  TJSSVGDiscardElement = class;
  TJSSVGDocument = class;
  TJSSVGElement = class;
  TJSSVGEllipseElement = class;
  TJSSVGFEBlendElement = class;
  TJSSVGFEColorMatrixElement = class;
  TJSSVGFEComponentTransferElement = class;
  TJSSVGFECompositeElement = class;
  TJSSVGFEConvolveMatrixElement = class;
  TJSSVGFEDiffuseLightingElement = class;
  TJSSVGFEDisplacementMapElement = class;
  TJSSVGFEDistantLightElement = class;
  TJSSVGFEDropShadowElement = class;
  TJSSVGFEFloodElement = class;
  TJSSVGFEFuncAElement = class;
  TJSSVGFEFuncBElement = class;
  TJSSVGFEFuncGElement = class;
  TJSSVGFEFuncRElement = class;
  TJSSVGFEGaussianBlurElement = class;
  TJSSVGFEImageElement = class;
  TJSSVGFEMergeElement = class;
  TJSSVGFEMergeNodeElement = class;
  TJSSVGFEMorphologyElement = class;
  TJSSVGFEOffsetElement = class;
  TJSSVGFEPointLightElement = class;
  TJSSVGFESpecularLightingElement = class;
  TJSSVGFESpotLightElement = class;
  TJSSVGFETileElement = class;
  TJSSVGFETurbulenceElement = class;
  TJSSVGFilterElement = class;
  TJSSVGFilterPrimitiveStandardAttributes = class;
  TJSSVGFitToViewBox = class;
  TJSSVGForeignObjectElement = class;
  TJSSVGGElement = class;
  TJSSVGGeometryElement = class;
  TJSSVGGradientElement = class;
  TJSSVGGraphicsElement = class;
  TJSSVGImageElement = class;
  TJSSVGLength = class;
  TJSSVGLinearGradientElement = class;
  TJSSVGLineElement = class;
  TJSSVGMarkerElement = class;
  TJSSVGMaskElement = class;
  TJSSVGMatrix = class;
  TJSSVGMetadataElement = class;
  TJSSVGMPathElement = class;
  TJSSVGNumber = class;
  TJSSVGPathElement = class;
  TJSSVGPatternElement = class;
  TJSSVGPoint = class;
  TJSSVGPolygonElement = class;
  TJSSVGPolylineElement = class;
  TJSSVGPreserveAspectRatio = class;
  TJSSVGRadialGradientElement = class;
  TJSSVGRect = class;
  TJSSVGRectElement = class;
  TJSSVGScriptElement = class;
  TJSSVGSetElement = class;
  TJSSVGStopElement = class;
  TJSSVGStyleElement = class;
  TJSSVGSwitchElement = class;
  TJSSVGSymbolElement = class;
  TJSSVGTests = class;
  TJSSVGTextContentElement = class;
  TJSSVGTextElement = class;
  TJSSVGTextPathElement = class;
  TJSSVGTextPositioningElement = class;
  TJSSVGTitleElement = class;
  TJSSVGTransform = class;
  TJSSVGTSpanElement = class;
  TJSSVGUnitTypes = class;
  TJSSVGURIReference = class;
  TJSSVGUseElement = class;
  TJSSVGViewElement = class;
  TJSSVGZoomAndPan = class;

  DOMStringMap = class {$IFDEF PAS2JS}external name 'DOMStringMap'{$ENDIF}
  private
    function GetItem(name: String): String; {$IFDEF PAS2JS}external name '[]';{$ENDIF}
    procedure SetItem(name: String; value: String); {$IFDEF PAS2JS}external name '[]';{$ENDIF}
  public
    //procedure (name: String);
    property Items[name: String]: String read GetItem write SetItem; default;
  end;

  { --------------------------------------------------------------------
    TJSSVGElement
    --------------------------------------------------------------------}
  TJSSVGElement = class {$IFDEF PAS2JS}external name 'SVGElement'{$ENDIF} (TJSElement)
  private
    FclassName: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'className';{$ENDIF}
    Fdataset: DOMStringMap; {$IFDEF PAS2JS}external name 'dataset';{$ENDIF}
    Fstyle: TJSCSSStyleDeclaration; {$IFDEF PAS2JS}external name 'style';{$ENDIF}
    FownerSVGElement: TJSSVGSVGElement; {$IFDEF PAS2JS}external name 'ownerSVGElement';{$ENDIF}
    FviewportElement: TJSSVGElement; {$IFDEF PAS2JS}external name 'viewportElement';{$ENDIF}
  public
    tabIndex: Integer;
    procedure focus;
    procedure blur;
    property className: TJSSVGAnimatedString read FclassName;
    property dataset: DOMStringMap read Fdataset;
    property style: TJSCSSStyleDeclaration read Fstyle;
    property ownerSVGElement: TJSSVGSVGElement read FownerSVGElement;
    property viewportElement: TJSSVGElement read FviewportElement;
  end;

  { --------------------------------------------------------------------
    TJSSVGGraphicsElement
    --------------------------------------------------------------------}
  TJSSVGGraphicsElement = class {$IFDEF PAS2JS}external name 'SVGGraphicsElement'{$ENDIF} (TJSSVGElement)
  private
    Ftransform: TJSSVGAnimatedTransformList; {$IFDEF PAS2JS}external name 'transform';{$ENDIF}
    FnearestViewportElement: TJSSVGElement; {$IFDEF PAS2JS}external name 'nearestViewportElement';{$ENDIF}
    FfarthestViewportElement: TJSSVGElement; {$IFDEF PAS2JS}external name 'farthestViewportElement';{$ENDIF}
  public
    function getBBox: TJSSVGRect;
    function getCTM: TJSSVGMatrix;
    function getScreenCTM: TJSSVGMatrix;
    property transform: TJSSVGAnimatedTransformList read Ftransform;
    property nearestViewportElement: TJSSVGElement read FnearestViewportElement;
    property farthestViewportElement: TJSSVGElement read FfarthestViewportElement;
  end;

  { --------------------------------------------------------------------
    TJSSVGSVGElement
    --------------------------------------------------------------------}
  TJSSVGSVGElement = class {$IFDEF PAS2JS}external name 'SVGSVGElement'{$ENDIF} (TJSSVGGraphicsElement)
  private
    Fx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fwidth: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'width';{$ENDIF}
    Fheight: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'height';{$ENDIF}
    FcurrentTranslate: TJSSVGPoint; {$IFDEF PAS2JS}external name 'currentTranslate';{$ENDIF}
  public
    currentScale: Double;
    function getIntersectionList(rect: TJSSVGRect; referenceElement: TJSSVGElement):
      TJSNodeList;
    function getEnclosureList(rect: TJSSVGRect; referenceElement: TJSSVGElement):
      TJSNodeList;
    function checkIntersection(element: TJSSVGElement; rect: TJSSVGRect): boolean;
    function checkEnclosure(element: TJSSVGElement; rect: TJSSVGRect): boolean;
    procedure deselectAll;
    function createSVGNumber: TJSSVGNumber;
    function createSVGLength: TJSSVGLength;
    function createSVGAngle: TJSSVGAngle;
    function createSVGPoint: TJSSVGPoint;
    function createSVGMatrix: TJSSVGMatrix;
    function createSVGRect: TJSSVGRect;
    function createSVGTransform: TJSSVGTransform;
    function createSVGTransformFromMatrix(matrix: TJSSVGMatrix): TJSSVGTransform;
    function getElementById(elementId: string): TJSElement;
    function suspendRedraw(maxWaitMilliseconds: NativeInt): NativeInt;
    procedure unsuspendRedraw(suspendHandleId: NativeInt);
    procedure unsuspendRedrawAll;
    procedure forceRedraw;
    procedure pauseAnimations;
    procedure unpauseAnimations;
    function animationsPaused: boolean;
    function getCurrentTime: Double;
    procedure setCurrentTime(seconds: Double);
    property x: TJSSVGAnimatedLength read Fx;
    property y: TJSSVGAnimatedLength read Fy;
    property width: TJSSVGAnimatedLength read Fwidth;
    property height: TJSSVGAnimatedLength read Fheight;
    property currentTranslate: TJSSVGPoint read FcurrentTranslate;
  end;

  { --------------------------------------------------------------------
    TJSSVGAElement
    --------------------------------------------------------------------}
  TJSSVGAElement = class {$IFDEF PAS2JS}external name 'SVGAElement'{$ENDIF} (TJSSVGGraphicsElement)
  private
    Ftarget: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'target';{$ENDIF}
  public
    property target: TJSSVGAnimatedString read Ftarget;
  end;

  { --------------------------------------------------------------------
  TJSSVGAngle
  --------------------------------------------------------------------}
  TJSSVGAngle = class {$IFDEF PAS2JS}external name 'SVGAngle'{$ENDIF}
  private
    FunitType: Cardinal; {$IFDEF PAS2JS}external name 'unitType';{$ENDIF}
  public
  const
    SVG_ANGLETYPE_UNKNOWN = 0;
    SVG_ANGLETYPE_UNSPECIFIED = 1;
    SVG_ANGLETYPE_DEG = 2;
    SVG_ANGLETYPE_RAD = 3;
    SVG_ANGLETYPE_GRAD = 4;
    Public
      value: Double;
    valueInSpecifiedUnits: Double;
    valueAsString: string;
    procedure newValueSpecifiedUnits(unitType: Cardinal; valueInSpecifiedUnits: Double);
    procedure convertToSpecifiedUnits(unitType: Cardinal);
    property unitType: Cardinal read FunitType;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedAngle
    --------------------------------------------------------------------}
  TJSSVGAnimatedAngle = class {$IFDEF PAS2JS}external name 'SVGAnimatedAngle'{$ENDIF}
  private
    FbaseVal: TJSSVGAngle; {$IFDEF PAS2JS}external name 'baseVal';{$ENDIF}
    FanimVal: TJSSVGAngle; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    property baseVal: TJSSVGAngle read FbaseVal;
    property animVal: TJSSVGAngle read FanimVal;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedBoolean
    --------------------------------------------------------------------}
  TJSSVGAnimatedBoolean = class {$IFDEF PAS2JS}external name 'SVGAnimatedBoolean'{$ENDIF}
  private
    FanimVal: boolean; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    baseVal: boolean;
    property animVal: boolean read FanimVal;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedEnumeration
    --------------------------------------------------------------------}
  TJSSVGAnimatedEnumeration = class {$IFDEF PAS2JS}external name 'SVGAnimatedEnumeration'{$ENDIF}
  private
    FanimVal: Cardinal; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    baseVal: Cardinal;
    property animVal: Cardinal read FanimVal;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedInteger
    --------------------------------------------------------------------}
  TJSSVGAnimatedInteger = class {$IFDEF PAS2JS}external name 'SVGAnimatedInteger'{$ENDIF}
  private
    FanimVal: Integer; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    baseVal: Integer;
    property animVal: Integer read FanimVal;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedLength
    --------------------------------------------------------------------}
  TJSSVGAnimatedLength = class {$IFDEF PAS2JS}external name 'SVGAnimatedLength'{$ENDIF}
  private
    FbaseVal: TJSSVGLength; {$IFDEF PAS2JS}external name 'baseVal';{$ENDIF}
    FanimVal: TJSSVGLength; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    property baseVal: TJSSVGLength read FbaseVal;
    property animVal: TJSSVGLength read FanimVal;
  end;

{ --------------------------------------------------------------------
  TJSSVGLengthList
  --------------------------------------------------------------------}
  TJSSVGLengthList = class {$IFDEF PAS2JS}external name 'SVGLengthList'{$ENDIF}
  public
    numberOfItems: Integer;
    procedure clear;
    function initialize(newItem: TJSSVGLength): TJSSVGLength;
    function getItem(&index: Integer): TJSSVGLength;
    function insertItemBefore(newItem: TJSSVGLength; &index: Integer): TJSSVGLength;
    function replaceItem(newItem: TJSSVGLength; &index: Integer): TJSSVGLength;
    function removeItem(&index: Integer): TJSSVGLength;
    function appendItem(newItem: TJSSVGLength): TJSSVGLength;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedLengthList
    --------------------------------------------------------------------}
  TJSSVGAnimatedLengthList = class {$IFDEF PAS2JS}external name 'SVGAnimatedLengthList'{$ENDIF}
  private
    FbaseVal: TJSSVGLengthList; {$IFDEF PAS2JS}external name 'baseVal';{$ENDIF}
    FanimVal: TJSSVGLengthList; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    property baseVal: TJSSVGLengthList read FbaseVal;
    property animVal: TJSSVGLengthList read FanimVal;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedNumber
    --------------------------------------------------------------------}
  TJSSVGAnimatedNumber = class {$IFDEF PAS2JS}external name 'SVGAnimatedNumber'{$ENDIF}
  private
    FanimVal: Double; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    baseVal: Double;
    property animVal: Double read FanimVal;
  end;

  { --------------------------------------------------------------------
    TJSSVGNumberList
  --------------------------------------------------------------------}
  TJSSVGNumberList = class {$IFDEF PAS2JS}external name 'SVGNumberList'{$ENDIF}
  public
    numberOfItems: Integer;
    procedure clear;
    function initialize(newItem: TJSSVGNumber): TJSSVGNumber;
    function getItem(&index: Integer): TJSSVGNumber;
    function insertItemBefore(newItem: TJSSVGNumber; &index: Integer): TJSSVGNumber;
    function replaceItem(newItem: TJSSVGNumber; &index: Integer): TJSSVGNumber;
    function removeItem(&index: Integer): TJSSVGNumber;
    function appendItem(newItem: TJSSVGNumber): TJSSVGNumber;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedNumberList
    --------------------------------------------------------------------}
  TJSSVGAnimatedNumberList = class {$IFDEF PAS2JS}external name 'SVGAnimatedNumberList'{$ENDIF}
  private
    FbaseVal: TJSSVGNumberList; {$IFDEF PAS2JS}external name 'baseVal';{$ENDIF}
    FanimVal: TJSSVGNumberList; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    property baseVal: TJSSVGNumberList read FbaseVal;
    property animVal: TJSSVGNumberList read FanimVal;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedPreserveAspectRatio
    --------------------------------------------------------------------}
  TJSSVGAnimatedPreserveAspectRatio = class {$IFDEF PAS2JS}external name 'SVGAnimatedPreserveAspectRatio'{$ENDIF}
    private
    FbaseVal: TJSSVGPreserveAspectRatio; {$IFDEF PAS2JS}external name 'baseVal';{$ENDIF}
    FanimVal: TJSSVGPreserveAspectRatio; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    property baseVal: TJSSVGPreserveAspectRatio read FbaseVal;
    property animVal: TJSSVGPreserveAspectRatio read FanimVal;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedRect
    --------------------------------------------------------------------}
  TJSSVGAnimatedRect = class {$IFDEF PAS2JS}external name 'SVGAnimatedRect'{$ENDIF}
  private
    FbaseVal: TJSSVGRect; {$IFDEF PAS2JS}external name 'baseVal';{$ENDIF}
    FanimVal: TJSSVGRect; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    property baseVal: TJSSVGRect read FbaseVal;
    property animVal: TJSSVGRect read FanimVal;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedString
    --------------------------------------------------------------------}
  TJSSVGAnimatedString = class {$IFDEF PAS2JS}external name 'SVGAnimatedString'{$ENDIF}
  private
    FanimVal: string; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    baseVal: string;
    property animVal: string read FanimVal;
  end;

 { --------------------------------------------------------------------
  TJSSVGTransformList
  --------------------------------------------------------------------}
  TJSSVGTransformList = class {$IFDEF PAS2JS}external name 'SVGTransformList'{$ENDIF}
  public
    numberOfItems: Integer;
    procedure clear;
    function initialize(newItem: TJSSVGTransform): TJSSVGTransform;
    function getItem(&index: Integer): TJSSVGTransform;
    function insertItemBefore(newItem: TJSSVGTransform; &index: Integer): TJSSVGTransform;
    function replaceItem(newItem: TJSSVGTransform; &index: Integer): TJSSVGTransform;
    function removeItem(&index: Integer): TJSSVGTransform;
    function appendItem(newItem: TJSSVGTransform): TJSSVGTransform;
    function createSVGTransformFromMatrix(matrix: TJSSVGMatrix): TJSSVGTransform;
    function consolidate: TJSSVGTransform;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimatedTransformList
    --------------------------------------------------------------------}
  TJSSVGAnimatedTransformList = class {$IFDEF PAS2JS}external name 'SVGAnimatedTransformList'{$ENDIF}
  private
    FbaseVal: TJSSVGTransformList; {$IFDEF PAS2JS}external name 'baseVal';{$ENDIF}
    FanimVal: TJSSVGTransformList; {$IFDEF PAS2JS}external name 'animVal';{$ENDIF}
  public
    property baseVal: TJSSVGTransformList read FbaseVal;
    property animVal: TJSSVGTransformList read FanimVal;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimationElement
    --------------------------------------------------------------------}
  TJSSVGAnimationElement = class {$IFDEF PAS2JS}external name 'SVGAnimationElement'{$ENDIF} (TJSSVGElement)
  private
    FtargetElement: TJSSVGElement; {$IFDEF PAS2JS}external name 'targetElement';{$ENDIF}
  public
    onbegin: TJSEventHandler;
    onend: TJSEventHandler;
    onrepeat: TJSEventHandler;
    function getStartTime: Double;
    function getCurrentTime: Double;
    function getSimpleDuration: Double;
    procedure beginElement;
    procedure beginElementAt(offset: Double);
    procedure endElement;
    procedure endElementAt(offset: Double);
    property targetElement: TJSSVGElement read FtargetElement;
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimateElement
    --------------------------------------------------------------------}
  TJSSVGAnimateElement = class {$IFDEF PAS2JS}external name 'SVGAnimateElement'{$ENDIF} (TJSSVGAnimationElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimateMotionElement
    --------------------------------------------------------------------}
  TJSSVGAnimateMotionElement = class {$IFDEF PAS2JS}external name 'SVGAnimateMotionElement'{$ENDIF} (TJSSVGAnimationElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGAnimateTransformElement
    --------------------------------------------------------------------}
  TJSSVGAnimateTransformElement = class {$IFDEF PAS2JS}external name 'SVGAnimateTransformElement'{$ENDIF} (TJSSVGAnimationElement)
    private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGGeometryElement
    --------------------------------------------------------------------}
  TJSSVGGeometryElement = class {$IFDEF PAS2JS}external name 'SVGGeometryElement'{$ENDIF} (TJSSVGGraphicsElement)
  private
    FpathLength: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'pathLength';{$ENDIF}
  public
    function isPointInFill(point: TJSSVGPoint): boolean;
    function isPointInStroke(point: TJSSVGPoint): boolean;
    function getTotalLength: Double;
    function getPointAtLength(distance: Double): TJSSVGPoint;
    property pathLength: TJSSVGAnimatedNumber read FpathLength;
  end;

  { --------------------------------------------------------------------
    TJSSVGCircleElement
    --------------------------------------------------------------------}
  TJSSVGCircleElement = class {$IFDEF PAS2JS}external name 'SVGCircleElement'{$ENDIF} (TJSSVGGeometryElement)
  private
    Fcx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'cx';{$ENDIF}
    Fcy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'cy';{$ENDIF}
    Fr: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'r';{$ENDIF}
  public
    property cx: TJSSVGAnimatedLength read Fcx;
    property cy: TJSSVGAnimatedLength read Fcy;
    property r: TJSSVGAnimatedLength read Fr;
  end;

  { --------------------------------------------------------------------
    TJSSVGClipPathElement
    --------------------------------------------------------------------}
  TJSSVGClipPathElement = class {$IFDEF PAS2JS}external name 'SVGClipPathElement'{$ENDIF} (TJSSVGGraphicsElement)
  private
    FclipPathUnits: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'clipPathUnits';{$ENDIF}
  public
    property clipPathUnits: TJSSVGAnimatedEnumeration read FclipPathUnits;
  end;

  { --------------------------------------------------------------------
    TJSSVGComponentTransferFunctionElement
    --------------------------------------------------------------------}
  TJSSVGComponentTransferFunctionElement = class {$IFDEF PAS2JS}external name 'SVGComponentTransferFunctionElement'{$ENDIF} (TJSSVGElement)
  private
    Ftype_: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    FtableValues: TJSSVGAnimatedNumberList; {$IFDEF PAS2JS}external name 'tableValues';{$ENDIF}
    Fslope: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'slope';{$ENDIF}
    Fintercept: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'intercept';{$ENDIF}
    Famplitude: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'amplitude';{$ENDIF}
    Fexponent: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'exponent';{$ENDIF}
    Foffset: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'offset';{$ENDIF}
  public
  const
    SVG_FECOMPONENTTRANSFER_TYPE_UNKNOWN = 0;
    SVG_FECOMPONENTTRANSFER_TYPE_IDENTITY = 1;
    SVG_FECOMPONENTTRANSFER_TYPE_TABLE = 2;
    SVG_FECOMPONENTTRANSFER_TYPE_DISCRETE = 3;
    SVG_FECOMPONENTTRANSFER_TYPE_LINEAR = 4;
    SVG_FECOMPONENTTRANSFER_TYPE_GAMMA = 5;
  Public
    property type_: TJSSVGAnimatedEnumeration read Ftype_;
    property tableValues: TJSSVGAnimatedNumberList read FtableValues;
    property slope: TJSSVGAnimatedNumber read Fslope;
    property intercept: TJSSVGAnimatedNumber read Fintercept;
    property amplitude: TJSSVGAnimatedNumber read Famplitude;
    property exponent: TJSSVGAnimatedNumber read Fexponent;
    property offset: TJSSVGAnimatedNumber read Foffset;
  end;

  { --------------------------------------------------------------------
    TJSSVGDefsElement
    --------------------------------------------------------------------}
  TJSSVGDefsElement = class {$IFDEF PAS2JS}external name 'SVGDefsElement'{$ENDIF} (TJSSVGGraphicsElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGDescElement
    --------------------------------------------------------------------}
  TJSSVGDescElement = class {$IFDEF PAS2JS}external name 'SVGDescElement'{$ENDIF} (TJSSVGElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGDocument
    --------------------------------------------------------------------}
  TJSSVGDocument = class {$IFDEF PAS2JS}external name 'SVGDocument'{$ENDIF} (TJSDocument)
  public
    Ftitle: String; {$IFDEF PAS2JS}external name 'tile';{$ENDIF}
    Freferrer: String; {$IFDEF PAS2JS}external name 'referrer';{$ENDIF}
    Fdomain: String; {$IFDEF PAS2JS}external name 'domain';{$ENDIF}
    fURL: String; {$IFDEF PAS2JS}external name 'URL';{$ENDIF}
    rootElement: TJSSVGSVGElement;
  end;

  { --------------------------------------------------------------------
    TJSSVGDiscardElement
    --------------------------------------------------------------------}
  TJSSVGDiscardElement = class {$IFDEF PAS2JS}external name 'SVGDiscardElement'{$ENDIF} (TJSSVGElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSDocument
    --------------------------------------------------------------------}
  TJSDocument = class {$IFDEF PAS2JS}external name 'Document'{$ENDIF}
  private
    FrootElement: TJSSVGSVGElement; {$IFDEF PAS2JS}external name 'rootElement';{$ENDIF}
  public
    property rootElement: TJSSVGSVGElement read FrootElement;
  end;

  { --------------------------------------------------------------------
    TJSSVGEllipseElement
    --------------------------------------------------------------------}
  TJSSVGEllipseElement = class {$IFDEF PAS2JS}external name 'SVGEllipseElement'{$ENDIF} (TJSSVGGeometryElement)
  private
    Fcx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'cx';{$ENDIF}
    Fcy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'cy';{$ENDIF}
    Frx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'rx';{$ENDIF}
    Fry: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'ry';{$ENDIF}
  public
    property cx: TJSSVGAnimatedLength read Fcx;
    property cy: TJSSVGAnimatedLength read Fcy;
    property rx: TJSSVGAnimatedLength read Frx;
    property ry: TJSSVGAnimatedLength read Fry;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEBlendElement
    --------------------------------------------------------------------}
  TJSSVGFEBlendElement = class {$IFDEF PAS2JS}external name 'SVGFEBlendElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    Fin2: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in2';{$ENDIF}
    Fmode: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'mode';{$ENDIF}
  public
  const
    SVG_FEBLEND_MODE_UNKNOWN = 0;
    SVG_FEBLEND_MODE_NORMAL = 1;
    SVG_FEBLEND_MODE_MULTIPLY = 2;
    SVG_FEBLEND_MODE_SCREEN = 3;
    SVG_FEBLEND_MODE_DARKEN = 4;
    SVG_FEBLEND_MODE_LIGHTEN = 5;
  Public
    property in1: TJSSVGAnimatedString read Fin1;
    property in2: TJSSVGAnimatedString read Fin2;
    property mode: TJSSVGAnimatedEnumeration read Fmode;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEColorMatrixElement
    --------------------------------------------------------------------}
  TJSSVGFEColorMatrixElement = class {$IFDEF PAS2JS}external name 'SVGFEColorMatrixElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    Ftype_: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    Fvalues: TJSSVGAnimatedNumberList; {$IFDEF PAS2JS}external name 'values';{$ENDIF}
  public
  const
    SVG_FECOLORMATRIX_TYPE_UNKNOWN = 0;
    SVG_FECOLORMATRIX_TYPE_MATRIX = 1;
    SVG_FECOLORMATRIX_TYPE_SATURATE = 2;
    SVG_FECOLORMATRIX_TYPE_HUEROTATE = 3;
    SVG_FECOLORMATRIX_TYPE_LUMINANCETOALPHA = 4;
  Public
    property in1: TJSSVGAnimatedString read Fin1;
    property type_: TJSSVGAnimatedEnumeration read Ftype_;
    property values: TJSSVGAnimatedNumberList read Fvalues;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEComponentTransferElement
    --------------------------------------------------------------------}
  TJSSVGFEComponentTransferElement = class {$IFDEF PAS2JS}external name 'SVGFEComponentTransferElement'{$ENDIF} (TJSSVGElement)
    private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
  public
    property in1: TJSSVGAnimatedString read Fin1;
  end;

  { --------------------------------------------------------------------
    TJSSVGFECompositeElement
    --------------------------------------------------------------------}
  TJSSVGFECompositeElement = class {$IFDEF PAS2JS}external name 'SVGFECompositeElement'{$ENDIF} (TJSSVGElement)
  private
    Fin2: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in2';{$ENDIF}
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    Foperator_: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'operator';{$ENDIF}
    Fk1: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'k1';{$ENDIF}
    Fk2: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'k2';{$ENDIF}
    Fk3: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'k3';{$ENDIF}
    Fk4: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'k4';{$ENDIF}
  public
  const
    SVG_FECOMPOSITE_OPERATOR_UNKNOWN = 0;
    SVG_FECOMPOSITE_OPERATOR_OVER = 1;
    SVG_FECOMPOSITE_OPERATOR_IN = 2;
    SVG_FECOMPOSITE_OPERATOR_OUT = 3;
    SVG_FECOMPOSITE_OPERATOR_ATOP = 4;
    SVG_FECOMPOSITE_OPERATOR_XOR = 5;
    SVG_FECOMPOSITE_OPERATOR_ARITHMETIC = 6;
  Public
    property in2: TJSSVGAnimatedString read Fin2;
    property in1: TJSSVGAnimatedString read Fin1;
    property operator_: TJSSVGAnimatedEnumeration read Foperator_;
    property k1: TJSSVGAnimatedNumber read Fk1;
    property k2: TJSSVGAnimatedNumber read Fk2;
    property k3: TJSSVGAnimatedNumber read Fk3;
    property k4: TJSSVGAnimatedNumber read Fk4;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEConvolveMatrixElement
    --------------------------------------------------------------------}
  TJSSVGFEConvolveMatrixElement = class {$IFDEF PAS2JS}external name 'SVGFEConvolveMatrixElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    ForderX: TJSSVGAnimatedInteger; {$IFDEF PAS2JS}external name 'orderX';{$ENDIF}
    ForderY: TJSSVGAnimatedInteger; {$IFDEF PAS2JS}external name 'orderY';{$ENDIF}
    FkernelMatrix: TJSSVGAnimatedNumberList; {$IFDEF PAS2JS}external name 'kernelMatrix';{$ENDIF}
    Fdivisor: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'divisor';{$ENDIF}
    Fbias: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'bias';{$ENDIF}
    FtargetX: TJSSVGAnimatedInteger; {$IFDEF PAS2JS}external name 'targetX';{$ENDIF}
    FtargetY: TJSSVGAnimatedInteger; {$IFDEF PAS2JS}external name 'targetY';{$ENDIF}
    FedgeMode: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'edgeMode';{$ENDIF}
    FkernelUnitLengthX: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'kernelUnitLengthX';{$ENDIF}
    FkernelUnitLengthY: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'kernelUnitLengthY';{$ENDIF}
    FpreserveAlpha: TJSSVGAnimatedBoolean; {$IFDEF PAS2JS}external name 'preserveAlpha';{$ENDIF}
  public
  const
    SVG_EDGEMODE_UNKNOWN = 0;
    SVG_EDGEMODE_DUPLICATE = 1;
    SVG_EDGEMODE_WRAP = 2;
    SVG_EDGEMODE_NONE = 3;
  Public
    property in1: TJSSVGAnimatedString read Fin1;
    property orderX: TJSSVGAnimatedInteger read ForderX;
    property orderY: TJSSVGAnimatedInteger read ForderY;
    property kernelMatrix: TJSSVGAnimatedNumberList read FkernelMatrix;
    property divisor: TJSSVGAnimatedNumber read Fdivisor;
    property bias: TJSSVGAnimatedNumber read Fbias;
    property targetX: TJSSVGAnimatedInteger read FtargetX;
    property targetY: TJSSVGAnimatedInteger read FtargetY;
    property edgeMode: TJSSVGAnimatedEnumeration read FedgeMode;
    property kernelUnitLengthX: TJSSVGAnimatedNumber read FkernelUnitLengthX;
    property kernelUnitLengthY: TJSSVGAnimatedNumber read FkernelUnitLengthY;
    property preserveAlpha: TJSSVGAnimatedBoolean read FpreserveAlpha;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEDiffuseLightingElement
    --------------------------------------------------------------------}
  TJSSVGFEDiffuseLightingElement = class {$IFDEF PAS2JS}external name 'SVGFEDiffuseLightingElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    FsurfaceScale: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'surfaceScale';{$ENDIF}
    FdiffuseConstant: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'diffuseConstant';{$ENDIF}
    FkernelUnitLengthX: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'kernelUnitLengthX';{$ENDIF}
    FkernelUnitLengthY: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'kernelUnitLengthY';{$ENDIF}
  public
    property in1: TJSSVGAnimatedString read Fin1;
    property surfaceScale: TJSSVGAnimatedNumber read FsurfaceScale;
    property diffuseConstant: TJSSVGAnimatedNumber read FdiffuseConstant;
    property kernelUnitLengthX: TJSSVGAnimatedNumber read FkernelUnitLengthX;
    property kernelUnitLengthY: TJSSVGAnimatedNumber read FkernelUnitLengthY;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEDisplacementMapElement
    --------------------------------------------------------------------}
  TJSSVGFEDisplacementMapElement = class {$IFDEF PAS2JS}external name 'SVGFEDisplacementMapElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    Fin2: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in2';{$ENDIF}
    Fscale: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'scale';{$ENDIF}
    FxChannelSelector: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'xChannelSelector';{$ENDIF}
    FyChannelSelector: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'yChannelSelector';{$ENDIF}
  public
  const
    SVG_CHANNEL_UNKNOWN = 0;
    SVG_CHANNEL_R = 1;
    SVG_CHANNEL_G = 2;
    SVG_CHANNEL_B = 3;
    SVG_CHANNEL_A = 4;
  Public
    property in1: TJSSVGAnimatedString read Fin1;
    property in2: TJSSVGAnimatedString read Fin2;
    property scale: TJSSVGAnimatedNumber read Fscale;
    property xChannelSelector: TJSSVGAnimatedEnumeration read FxChannelSelector;
    property yChannelSelector: TJSSVGAnimatedEnumeration read FyChannelSelector;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEDistantLightElement
    --------------------------------------------------------------------}
  TJSSVGFEDistantLightElement = class {$IFDEF PAS2JS}external name 'SVGFEDistantLightElement'{$ENDIF} (TJSSVGElement)
  private
    Fazimuth: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'azimuth';{$ENDIF}
    Felevation: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'elevation';{$ENDIF}
  public
    property azimuth: TJSSVGAnimatedNumber read Fazimuth;
    property elevation: TJSSVGAnimatedNumber read Felevation;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEDropShadowElement
    --------------------------------------------------------------------}
  TJSSVGFEDropShadowElement = class {$IFDEF PAS2JS}external name 'SVGFEDropShadowElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    Fdx: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'dx';{$ENDIF}
    Fdy: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'dy';{$ENDIF}
    FstdDeviationX: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'stdDeviationX';{$ENDIF}
    FstdDeviationY: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'stdDeviationY';{$ENDIF}
  public
    procedure setStdDeviation(stdDeviationX: Double; stdDeviationY: Double);
    property in1: TJSSVGAnimatedString read Fin1;
    property dx: TJSSVGAnimatedNumber read Fdx;
    property dy: TJSSVGAnimatedNumber read Fdy;
    property stdDeviationX: TJSSVGAnimatedNumber read FstdDeviationX;
    property stdDeviationY: TJSSVGAnimatedNumber read FstdDeviationY;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEFloodElement
    --------------------------------------------------------------------}
  TJSSVGFEFloodElement = class {$IFDEF PAS2JS}external name 'SVGFEFloodElement'{$ENDIF} (TJSSVGElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGFEFuncAElement
    --------------------------------------------------------------------}
  TJSSVGFEFuncAElement = class {$IFDEF PAS2JS}external name 'SVGFEFuncAElement'{$ENDIF} (TJSSVGComponentTransferFunctionElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGFEFuncBElement
    --------------------------------------------------------------------}
  TJSSVGFEFuncBElement = class {$IFDEF PAS2JS}external name 'SVGFEFuncBElement'{$ENDIF} (TJSSVGComponentTransferFunctionElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGFEFuncGElement
    --------------------------------------------------------------------}
  TJSSVGFEFuncGElement = class {$IFDEF PAS2JS}external name 'SVGFEFuncGElement'{$ENDIF} (TJSSVGComponentTransferFunctionElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGFEFuncRElement
    --------------------------------------------------------------------}
  TJSSVGFEFuncRElement = class {$IFDEF PAS2JS}external name 'SVGFEFuncRElement'{$ENDIF} (TJSSVGComponentTransferFunctionElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGFEGaussianBlurElement
    --------------------------------------------------------------------}
  TJSSVGFEGaussianBlurElement = class {$IFDEF PAS2JS}external name 'SVGFEGaussianBlurElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    FstdDeviationX: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'stdDeviationX';{$ENDIF}
    FstdDeviationY: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'stdDeviationY';{$ENDIF}
  public
    procedure setStdDeviation(stdDeviationX: Double; stdDeviationY: Double);
    property in1: TJSSVGAnimatedString read Fin1;
    property stdDeviationX: TJSSVGAnimatedNumber read FstdDeviationX;
    property stdDeviationY: TJSSVGAnimatedNumber read FstdDeviationY;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEImageElement
    --------------------------------------------------------------------}
  TJSSVGFEImageElement = class {$IFDEF PAS2JS}external name 'SVGFEImageElement'{$ENDIF} (TJSSVGElement)
  private
    FpreserveAspectRatio: TJSSVGAnimatedPreserveAspectRatio; {$IFDEF PAS2JS}external name 'preserveAspectRatio';{$ENDIF}
  public
    property preserveAspectRatio: TJSSVGAnimatedPreserveAspectRatio read
      FpreserveAspectRatio;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEMergeElement
    --------------------------------------------------------------------}
  TJSSVGFEMergeElement = class {$IFDEF PAS2JS}external name 'SVGFEMergeElement'{$ENDIF} (TJSSVGElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGFEMergeNodeElement
    --------------------------------------------------------------------}
  TJSSVGFEMergeNodeElement = class {$IFDEF PAS2JS}external name 'SVGFEMergeNodeElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
  public
    property in1: TJSSVGAnimatedString read Fin1;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEMorphologyElement
    --------------------------------------------------------------------}
  TJSSVGFEMorphologyElement = class {$IFDEF PAS2JS}external name 'SVGFEMorphologyElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    Foperator_: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'operator';{$ENDIF}
    FradiusX: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'radiusX';{$ENDIF}
    FradiusY: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'radiusY';{$ENDIF}
  public
  const
    SVG_MORPHOLOGY_OPERATOR_UNKNOWN = 0;
    SVG_MORPHOLOGY_OPERATOR_ERODE = 1;
    SVG_MORPHOLOGY_OPERATOR_DILATE = 2;
  Public
    property in1: TJSSVGAnimatedString read Fin1;
    property operator_: TJSSVGAnimatedEnumeration read Foperator_;
    property radiusX: TJSSVGAnimatedNumber read FradiusX;
    property radiusY: TJSSVGAnimatedNumber read FradiusY;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEOffsetElement
    --------------------------------------------------------------------}
  TJSSVGFEOffsetElement = class {$IFDEF PAS2JS}external name 'SVGFEOffsetElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    Fdx: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'dx';{$ENDIF}
    Fdy: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'dy';{$ENDIF}
  public
    property in1: TJSSVGAnimatedString read Fin1;
    property dx: TJSSVGAnimatedNumber read Fdx;
    property dy: TJSSVGAnimatedNumber read Fdy;
  end;

  { --------------------------------------------------------------------
    TJSSVGFEPointLightElement
    --------------------------------------------------------------------}
  TJSSVGFEPointLightElement = class {$IFDEF PAS2JS}external name 'SVGFEPointLightElement'{$ENDIF} (TJSSVGElement)
    private
    Fx: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fz: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'z';{$ENDIF}
  public
    property x: TJSSVGAnimatedNumber read Fx;
    property y: TJSSVGAnimatedNumber read Fy;
    property z: TJSSVGAnimatedNumber read Fz;
  end;

  { --------------------------------------------------------------------
    TJSSVGFESpecularLightingElement
    --------------------------------------------------------------------}
  TJSSVGFESpecularLightingElement = class {$IFDEF PAS2JS}external name 'SVGFESpecularLightingElement'{$ENDIF} (TJSSVGElement)
    private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
    FsurfaceScale: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'surfaceScale';{$ENDIF}
    FspecularConstant: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'specularConstant';{$ENDIF}
    FspecularExponent: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'specularExponent';{$ENDIF}
    FkernelUnitLengthX: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'kernelUnitLengthX';{$ENDIF}
    FkernelUnitLengthY: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'kernelUnitLengthY';{$ENDIF}
  public
    property in1: TJSSVGAnimatedString read Fin1;
    property surfaceScale: TJSSVGAnimatedNumber read FsurfaceScale;
    property specularConstant: TJSSVGAnimatedNumber read FspecularConstant;
    property specularExponent: TJSSVGAnimatedNumber read FspecularExponent;
    property kernelUnitLengthX: TJSSVGAnimatedNumber read FkernelUnitLengthX;
    property kernelUnitLengthY: TJSSVGAnimatedNumber read FkernelUnitLengthY;
  end;

  { --------------------------------------------------------------------
    TJSSVGFESpotLightElement
    --------------------------------------------------------------------}
  TJSSVGFESpotLightElement = class {$IFDEF PAS2JS}external name 'SVGFESpotLightElement'{$ENDIF} (TJSSVGElement)
    private
    Fx: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fz: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'z';{$ENDIF}
    FpointsAtX: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'pointsAtX';{$ENDIF}
    FpointsAtY: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'pointsAtY';{$ENDIF}
    FpointsAtZ: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'pointsAtZ';{$ENDIF}
    FspecularExponent: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'specularExponent';{$ENDIF}
    FlimitingConeAngle: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'limitingConeAngle';{$ENDIF}
  public
    property x: TJSSVGAnimatedNumber read Fx;
    property y: TJSSVGAnimatedNumber read Fy;
    property z: TJSSVGAnimatedNumber read Fz;
    property pointsAtX: TJSSVGAnimatedNumber read FpointsAtX;
    property pointsAtY: TJSSVGAnimatedNumber read FpointsAtY;
    property pointsAtZ: TJSSVGAnimatedNumber read FpointsAtZ;
    property specularExponent: TJSSVGAnimatedNumber read FspecularExponent;
    property limitingConeAngle: TJSSVGAnimatedNumber read FlimitingConeAngle;
  end;

  { --------------------------------------------------------------------
    TJSSVGFETileElement
    --------------------------------------------------------------------}
  TJSSVGFETileElement = class {$IFDEF PAS2JS}external name 'SVGFETileElement'{$ENDIF} (TJSSVGElement)
  private
    Fin1: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'in1';{$ENDIF}
  public
    property in1: TJSSVGAnimatedString read Fin1;
  end;

  { --------------------------------------------------------------------
    TJSSVGFETurbulenceElement
    --------------------------------------------------------------------}
  TJSSVGFETurbulenceElement = class {$IFDEF PAS2JS}external name 'SVGFETurbulenceElement'{$ENDIF} (TJSSVGElement)
    private
    FbaseFrequencyX: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'baseFrequencyX';{$ENDIF}
    FbaseFrequencyY: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'baseFrequencyY';{$ENDIF}
    FnumOctaves: TJSSVGAnimatedInteger; {$IFDEF PAS2JS}external name 'numOctaves';{$ENDIF}
    Fseed: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'seed';{$ENDIF}
    FstitchTiles: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'stitchTiles';{$ENDIF}
    Ftype_: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
  public
  const
    SVG_TURBULENCE_TYPE_UNKNOWN = 0;
    SVG_TURBULENCE_TYPE_FRACTALNOISE = 1;
    SVG_TURBULENCE_TYPE_TURBULENCE = 2;
    SVG_STITCHTYPE_UNKNOWN = 0;
    SVG_STITCHTYPE_STITCH = 1;
    SVG_STITCHTYPE_NOSTITCH = 2;
  Public
    property baseFrequencyX: TJSSVGAnimatedNumber read FbaseFrequencyX;
    property baseFrequencyY: TJSSVGAnimatedNumber read FbaseFrequencyY;
    property numOctaves: TJSSVGAnimatedInteger read FnumOctaves;
    property seed: TJSSVGAnimatedNumber read Fseed;
    property stitchTiles: TJSSVGAnimatedEnumeration read FstitchTiles;
    property type_: TJSSVGAnimatedEnumeration read Ftype_;
  end;

  { --------------------------------------------------------------------
    TJSSVGFilterElement
    --------------------------------------------------------------------}
  TJSSVGFilterElement = class {$IFDEF PAS2JS}external name 'SVGFilterElement'{$ENDIF} (TJSSVGElement)
  private
    FfilterUnits: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'filterUnits';{$ENDIF}
    FprimitiveUnits: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'primitiveUnits';{$ENDIF}
    Fx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fwidth: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'width';{$ENDIF}
    Fheight: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'height';{$ENDIF}
  public
    property filterUnits: TJSSVGAnimatedEnumeration read FfilterUnits;
    property primitiveUnits: TJSSVGAnimatedEnumeration read FprimitiveUnits;
    property x: TJSSVGAnimatedLength read Fx;
    property y: TJSSVGAnimatedLength read Fy;
    property width: TJSSVGAnimatedLength read Fwidth;
    property height: TJSSVGAnimatedLength read Fheight;
  end;

  { --------------------------------------------------------------------
    TJSSVGFilterPrimitiveStandardAttributes
    --------------------------------------------------------------------}
  TJSSVGFilterPrimitiveStandardAttributes = class {$IFDEF PAS2JS}external name 'SVGFilterPrimitiveStandardAttributes'{$ENDIF}
    private
    Fx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fwidth: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'width';{$ENDIF}
    Fheight: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'height';{$ENDIF}
    Fresult: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'result';{$ENDIF}
  public
    property x: TJSSVGAnimatedLength read Fx;
    property y: TJSSVGAnimatedLength read Fy;
    property width: TJSSVGAnimatedLength read Fwidth;
    property height: TJSSVGAnimatedLength read Fheight;
    property result: TJSSVGAnimatedString read Fresult;
  end;

  { --------------------------------------------------------------------
    TJSSVGFitToViewBox
    --------------------------------------------------------------------}
  TJSSVGFitToViewBox = class {$IFDEF PAS2JS}external name 'SVGFitToViewBox'{$ENDIF}
  private
    FviewBox: TJSSVGAnimatedRect; {$IFDEF PAS2JS}external name 'viewBox';{$ENDIF}
    FpreserveAspectRatio: TJSSVGAnimatedPreserveAspectRatio; {$IFDEF PAS2JS}external name 'preserveAspectRatio';{$ENDIF}
  public
    property viewBox: TJSSVGAnimatedRect read FviewBox;
    property preserveAspectRatio: TJSSVGAnimatedPreserveAspectRatio read
      FpreserveAspectRatio;
  end;

  { --------------------------------------------------------------------
    TJSSVGForeignObjectElement
    --------------------------------------------------------------------}
  TJSSVGForeignObjectElement = class {$IFDEF PAS2JS}external name 'SVGForeignObjectElement' (TJSSVGGraphicsElement){$ENDIF}
    private
    Fx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fwidth: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'width';{$ENDIF}
    Fheight: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'height';{$ENDIF}
  public
    property x: TJSSVGAnimatedLength read Fx;
    property y: TJSSVGAnimatedLength read Fy;
    property width: TJSSVGAnimatedLength read Fwidth;
    property height: TJSSVGAnimatedLength read Fheight;
  end;

  { --------------------------------------------------------------------
    TJSSVGGElement
    --------------------------------------------------------------------}
  TJSSVGGElement = class {$IFDEF PAS2JS}external name 'SVGGElement'{$ENDIF} (TJSSVGGraphicsElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGGradientElement
    --------------------------------------------------------------------}
  TJSSVGGradientElement = class {$IFDEF PAS2JS}external name 'SVGGradientElement'{$ENDIF} (TJSSVGElement)
  private
    FgradientUnits: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'gradientUnits';{$ENDIF}
    FgradientTransform: TJSSVGAnimatedTransformList; {$IFDEF PAS2JS}external name 'gradientTransform';{$ENDIF}
    FspreadMethod: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'spreadMethod';{$ENDIF}
  public
  const
    SVG_SPREADMETHOD_UNKNOWN = 0;
    SVG_SPREADMETHOD_PAD = 1;
    SVG_SPREADMETHOD_REFLECT = 2;
    SVG_SPREADMETHOD_REPEAT = 3;
  Public
    property gradientUnits: TJSSVGAnimatedEnumeration read FgradientUnits;
    property gradientTransform: TJSSVGAnimatedTransformList read FgradientTransform;
    property spreadMethod: TJSSVGAnimatedEnumeration read FspreadMethod;
  end;

  { --------------------------------------------------------------------
    TJSSVGImageElement
    --------------------------------------------------------------------}
  TJSSVGImageElement = class {$IFDEF PAS2JS}external name 'SVGImageElement'{$ENDIF} (TJSSVGGraphicsElement)
  private
    Fx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fwidth: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'width';{$ENDIF}
    Fheight: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'height';{$ENDIF}
    FpreserveAspectRatio: TJSSVGAnimatedPreserveAspectRatio; {$IFDEF PAS2JS}external name 'preserveAspectRatio';{$ENDIF}
  public
    property x: TJSSVGAnimatedLength read Fx;
    property y: TJSSVGAnimatedLength read Fy;
    property width: TJSSVGAnimatedLength read Fwidth;
    property height: TJSSVGAnimatedLength read Fheight;
    property preserveAspectRatio: TJSSVGAnimatedPreserveAspectRatio read
      FpreserveAspectRatio;
  end;

  { --------------------------------------------------------------------
    TJSSVGLength
    --------------------------------------------------------------------}
  TJSSVGLength = class {$IFDEF PAS2JS}external name 'SVGLength'{$ENDIF}
  private
    FunitType: Cardinal; {$IFDEF PAS2JS}external name 'unitType';{$ENDIF}
  public
  const
    SVG_LENGTHTYPE_UNKNOWN = 0;
    SVG_LENGTHTYPE_NUMBER = 1;
    SVG_LENGTHTYPE_PERCENTAGE = 2;
    SVG_LENGTHTYPE_EMS = 3;
    SVG_LENGTHTYPE_EXS = 4;
    SVG_LENGTHTYPE_PX = 5;
    SVG_LENGTHTYPE_CM = 6;
    SVG_LENGTHTYPE_MM = 7;
    SVG_LENGTHTYPE_IN = 8;
    SVG_LENGTHTYPE_PT = 9;
    SVG_LENGTHTYPE_PC = 10;
  Public
    value: Double;
    valueInSpecifiedUnits: Double;
    valueAsString: string;
    procedure newValueSpecifiedUnits(unitType: Cardinal; valueInSpecifiedUnits: Double);
    procedure convertToSpecifiedUnits(unitType: Cardinal);
    property unitType: Cardinal read FunitType;
  end;

  { --------------------------------------------------------------------
    TJSSVGLinearGradientElement
    --------------------------------------------------------------------}
  TJSSVGLinearGradientElement = class {$IFDEF PAS2JS}external name 'SVGLinearGradientElement'{$ENDIF} (TJSSVGGradientElement)
    private
    Fx1: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x1';{$ENDIF}
    Fy1: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y1';{$ENDIF}
    Fx2: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x2';{$ENDIF}
    Fy2: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y2';{$ENDIF}
  public
    property x1: TJSSVGAnimatedLength read Fx1;
    property y1: TJSSVGAnimatedLength read Fy1;
    property x2: TJSSVGAnimatedLength read Fx2;
    property y2: TJSSVGAnimatedLength read Fy2;
  end;

  { --------------------------------------------------------------------
    TJSSVGLineElement
    --------------------------------------------------------------------}
  TJSSVGLineElement = class {$IFDEF PAS2JS}external name 'SVGLineElement'{$ENDIF} (TJSSVGGeometryElement)
  private
    Fx1: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x1';{$ENDIF}
    Fy1: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y1';{$ENDIF}
    Fx2: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x2';{$ENDIF}
    Fy2: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y2';{$ENDIF}
  public
    property x1: TJSSVGAnimatedLength read Fx1;
    property y1: TJSSVGAnimatedLength read Fy1;
    property x2: TJSSVGAnimatedLength read Fx2;
    property y2: TJSSVGAnimatedLength read Fy2;
  end;

  { --------------------------------------------------------------------
    TJSSVGMarkerElement
    --------------------------------------------------------------------}
  TJSSVGMarkerElement = class {$IFDEF PAS2JS}external name 'SVGMarkerElement'{$ENDIF} (TJSSVGElement)
  private
    FrefX: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'refX';{$ENDIF}
    FrefY: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'refY';{$ENDIF}
    FmarkerUnits: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'markerUnits';{$ENDIF}
    FmarkerWidth: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'markerWidth';{$ENDIF}
    FmarkerHeight: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'markerHeight';{$ENDIF}
    ForientType: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'orientType';{$ENDIF}
    ForientAngle: TJSSVGAnimatedAngle; {$IFDEF PAS2JS}external name 'orientAngle';{$ENDIF}
  public
  const
    SVG_MARKERUNITS_UNKNOWN = 0;
    SVG_MARKERUNITS_USERSPACEONUSE = 1;
    SVG_MARKERUNITS_STROKEWIDTH = 2;
    SVG_MARKER_ORIENT_UNKNOWN = 0;
    SVG_MARKER_ORIENT_AUTO = 1;
    SVG_MARKER_ORIENT_ANGLE = 2;
  Public
    procedure setOrientToAuto;
    procedure setOrientToAngle(angle: TJSSVGAngle);
    property refX: TJSSVGAnimatedLength read FrefX;
    property refY: TJSSVGAnimatedLength read FrefY;
    property markerUnits: TJSSVGAnimatedEnumeration read FmarkerUnits;
    property markerWidth: TJSSVGAnimatedLength read FmarkerWidth;
    property markerHeight: TJSSVGAnimatedLength read FmarkerHeight;
    property orientType: TJSSVGAnimatedEnumeration read ForientType;
    property orientAngle: TJSSVGAnimatedAngle read ForientAngle;
  end;

  { --------------------------------------------------------------------
    TJSSVGMaskElement
    --------------------------------------------------------------------}
  TJSSVGMaskElement = class {$IFDEF PAS2JS}external name 'SVGMaskElement'{$ENDIF} (TJSSVGElement)
  private
    FmaskUnits: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'maskUnits';{$ENDIF}
    FmaskContentUnits: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'maskContentUnits';{$ENDIF}
    Fx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fwidth: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'width';{$ENDIF}
    Fheight: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'height';{$ENDIF}
  public
    property maskUnits: TJSSVGAnimatedEnumeration read FmaskUnits;
    property maskContentUnits: TJSSVGAnimatedEnumeration read FmaskContentUnits;
    property x: TJSSVGAnimatedLength read Fx;
    property y: TJSSVGAnimatedLength read Fy;
    property width: TJSSVGAnimatedLength read Fwidth;
    property height: TJSSVGAnimatedLength read Fheight;
  end;

  { --------------------------------------------------------------------
    TJSSVGMatrix
    --------------------------------------------------------------------}
  TJSSVGMatrix = class {$IFDEF PAS2JS}external name 'SVGMatrix'{$ENDIF}
  private
  public
    a: double;
    b: double;
    c: double;
    d: double;
    e: double;
    f: double;
    function multiply(secondMatrix: TJSSVGMatrix): TJSSVGMatrix;
    function inverse: TJSSVGMatrix;
    function translate(x: Double; y: Double): TJSSVGMatrix;
    function scale(scaleFactor: Double): TJSSVGMatrix;
    function scaleNonUniform(scaleFactorX: Double; scaleFactorY: Double):
      TJSSVGMatrix;
    function rotate(angle: Double): TJSSVGMatrix;
    function rotateFromVector(x: Double; y: Double): TJSSVGMatrix;
    function flipX: TJSSVGMatrix;
    function flipY: TJSSVGMatrix;
    function skewX(angle: Double): TJSSVGMatrix;
    function skewY(angle: Double): TJSSVGMatrix;
  end;

  { --------------------------------------------------------------------
    TJSSVGMetadataElement
    --------------------------------------------------------------------}
  TJSSVGMetadataElement = class {$IFDEF PAS2JS}external name 'SVGMetadataElement'{$ENDIF} (TJSSVGElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGMPathElement
    --------------------------------------------------------------------}
  TJSSVGMPathElement = class {$IFDEF PAS2JS}external name 'SVGMPathElement'{$ENDIF} (TJSSVGElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGNumber
    --------------------------------------------------------------------}
  TJSSVGNumber = class {$IFDEF PAS2JS}external name 'SVGNumber'{$ENDIF}
  private
  public
    value: Double;
  end;

  { --------------------------------------------------------------------
    TJSSVGPathElement
    --------------------------------------------------------------------}
  TJSSVGPathElement = class {$IFDEF PAS2JS}external name 'SVGPathElement'{$ENDIF} (TJSSVGGeometryElement)
  private
  public
    function getPathSegAtLength(distance: Double): NativeInt;
  end;

  { --------------------------------------------------------------------
    TJSSVGPatternElement
    --------------------------------------------------------------------}
  TJSSVGPatternElement = class {$IFDEF PAS2JS}external name 'SVGPatternElement'{$ENDIF} (TJSSVGElement)
  private
    FpatternUnits: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'patternUnits';{$ENDIF}
    FpatternContentUnits: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'patternContentUnits';{$ENDIF}
    FpatternTransform: TJSSVGAnimatedTransformList; {$IFDEF PAS2JS}external name 'patternTransform';{$ENDIF}
    Fx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fwidth: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'width';{$ENDIF}
    Fheight: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'height';{$ENDIF}
  public
    property patternUnits: TJSSVGAnimatedEnumeration read FpatternUnits;
    property patternContentUnits: TJSSVGAnimatedEnumeration read
      FpatternContentUnits;
    property patternTransform: TJSSVGAnimatedTransformList read FpatternTransform;
    property x: TJSSVGAnimatedLength read Fx;
    property y: TJSSVGAnimatedLength read Fy;
    property width: TJSSVGAnimatedLength read Fwidth;
    property height: TJSSVGAnimatedLength read Fheight;
  end;

  { --------------------------------------------------------------------
    TJSSVGPoint
    --------------------------------------------------------------------}
  TJSSVGPoint = class {$IFDEF PAS2JS}external name 'SVGPoint'{$ENDIF}
  private
  public
    x: Double;
    y: Double;
    function matrixTransform(matrix: TJSSVGMatrix): TJSSVGPoint;
  end;

  { --------------------------------------------------------------------
    TJSSVGPointList
    --------------------------------------------------------------------}
  TJSSVGPointList = class {$IFDEF PAS2JS}external name 'SVGPointList'{$ENDIF}
  public
    numberOfItems: Integer;
    procedure clear;
    function initialize(newItem: TJSSVGPoint): TJSSVGPoint;
    function getItem(&index: Integer): TJSSVGPoint;
    function insertItemBefore(newItem: TJSSVGPoint; &index: Integer): TJSSVGPoint;
    function replaceItem(newItem: TJSSVGPoint; &index: Integer): TJSSVGPoint;
    function removeItem(&index: Integer): TJSSVGPoint;
    function appendItem(newItem: TJSSVGPoint): TJSSVGPoint;
  end;

  { --------------------------------------------------------------------
    TJSSVGPolygonElement
    --------------------------------------------------------------------}
  TJSSVGPolygonElement = class {$IFDEF PAS2JS}external name 'SVGPolygonElement'{$ENDIF} (TJSSVGGeometryElement)
    private
    Fpoints: TJSSVGPointList; {$IFDEF PAS2JS}external name 'points';{$ENDIF}
    FanimatedPoints: TJSSVGPointList; {$IFDEF PAS2JS}external name 'animatedPoints';{$ENDIF}
  public
    property points: TJSSVGPointList read Fpoints;
    property animatedPoints: TJSSVGPointList read FanimatedPoints;
  end;

  { --------------------------------------------------------------------
    TJSSVGPolylineElement
    --------------------------------------------------------------------}
  TJSSVGPolylineElement = class {$IFDEF PAS2JS}external name 'SVGPolylineElement'{$ENDIF} (TJSSVGGeometryElement)
    private
    Fpoints: TJSSVGPointList; {$IFDEF PAS2JS}external name 'points';{$ENDIF}
    FanimatedPoints: TJSSVGPointList; {$IFDEF PAS2JS}external name 'animatedPoints';{$ENDIF}
  public
    property points: TJSSVGPointList read Fpoints;
    property animatedPoints: TJSSVGPointList read FanimatedPoints;
  end;

  { --------------------------------------------------------------------
    TJSSVGPreserveAspectRatio
    --------------------------------------------------------------------}
  TJSSVGPreserveAspectRatio = class {$IFDEF PAS2JS}external name 'SVGPreserveAspectRatio'{$ENDIF}
  private
  public
  const
    SVG_PRESERVEASPECTRATIO_UNKNOWN = 0;
    SVG_PRESERVEASPECTRATIO_NONE = 1;
    SVG_PRESERVEASPECTRATIO_XMINYMIN = 2;
    SVG_PRESERVEASPECTRATIO_XMIDYMIN = 3;
    SVG_PRESERVEASPECTRATIO_XMAXYMIN = 4;
    SVG_PRESERVEASPECTRATIO_XMINYMID = 5;
    SVG_PRESERVEASPECTRATIO_XMIDYMID = 6;
    SVG_PRESERVEASPECTRATIO_XMAXYMID = 7;
    SVG_PRESERVEASPECTRATIO_XMINYMAX = 8;
    SVG_PRESERVEASPECTRATIO_XMIDYMAX = 9;
    SVG_PRESERVEASPECTRATIO_XMAXYMAX = 10;
    SVG_MEETORSLICE_UNKNOWN = 0;
    SVG_MEETORSLICE_MEET = 1;
    SVG_MEETORSLICE_SLICE = 2;
  Public
    align: Cardinal;
    meetOrSlice: Cardinal;
  end;

  { --------------------------------------------------------------------
    TJSSVGRadialGradientElement
    --------------------------------------------------------------------}
  TJSSVGRadialGradientElement = class {$IFDEF PAS2JS}external name 'SVGRadialGradientElement'{$ENDIF} (TJSSVGGradientElement)
    private
    Fcx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'cx';{$ENDIF}
    Fcy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'cy';{$ENDIF}
    rFr: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'r';{$ENDIF}
    Ffx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'fx';{$ENDIF}
    Ffy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'fy';{$ENDIF}
    Ffr: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'fr';{$ENDIF}
  public
    property cx: TJSSVGAnimatedLength read Fcx;
    property cy: TJSSVGAnimatedLength read Fcy;
    property r: TJSSVGAnimatedLength read rFr;
    property fx: TJSSVGAnimatedLength read Ffx;
    property fy: TJSSVGAnimatedLength read Ffy;
    property fr: TJSSVGAnimatedLength read Ffr;
  end;

  { --------------------------------------------------------------------
    TJSSVGRect
    --------------------------------------------------------------------}
  TJSSVGRect = class {$IFDEF PAS2JS}external name 'SVGRect'{$ENDIF}
  private
  public
    x: Double;
    y: Double;
    width: Double;
    height: Double;
  end;

  { --------------------------------------------------------------------
    TJSSVGRectElement
    --------------------------------------------------------------------}
  TJSSVGRectElement = class {$IFDEF PAS2JS}external name 'SVGRectElement'{$ENDIF} (TJSSVGGeometryElement)
  private
    Fx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fwidth: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'width';{$ENDIF}
    Fheight: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'height';{$ENDIF}
    Frx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'rx';{$ENDIF}
    Fry: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'ry';{$ENDIF}
  public
    property x: TJSSVGAnimatedLength read Fx;
    property y: TJSSVGAnimatedLength read Fy;
    property width: TJSSVGAnimatedLength read Fwidth;
    property height: TJSSVGAnimatedLength read Fheight;
    property rx: TJSSVGAnimatedLength read Frx;
    property ry: TJSSVGAnimatedLength read Fry;
  end;

  { --------------------------------------------------------------------
    TJSSVGScriptElement
    --------------------------------------------------------------------}
  TJSSVGScriptElement = class {$IFDEF PAS2JS}external name 'SVGScriptElement'{$ENDIF} (TJSSVGElement)
  private
  public
    type_: string; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
  end;

  { --------------------------------------------------------------------
    TJSSVGSetElement
    --------------------------------------------------------------------}
  TJSSVGSetElement = class {$IFDEF PAS2JS}external name 'SVGSetElement'{$ENDIF} (TJSSVGAnimationElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGStopElement
    --------------------------------------------------------------------}
  TJSSVGStopElement = class {$IFDEF PAS2JS}external name 'SVGStopElement'{$ENDIF} (TJSSVGElement)
  private
    Foffset: TJSSVGAnimatedNumber; {$IFDEF PAS2JS}external name 'offset';{$ENDIF}
  public
    property offset: TJSSVGAnimatedNumber read Foffset;
  end;

  { --------------------------------------------------------------------
    TJSSVGStyleElement
    --------------------------------------------------------------------}
  TJSSVGStyleElement = class {$IFDEF PAS2JS}external name 'SVGStyleElement'{$ENDIF} (TJSSVGElement)
  private
    Fsheet: TJSStyleSheet; {$IFDEF PAS2JS}external name 'sheet';{$ENDIF}
  public
    type_: string; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    media: string;
    title: string;
    disabled: boolean;
    property sheet: TJSStyleSheet read Fsheet;
  end;

  { --------------------------------------------------------------------
    TJSSVGSwitchElement
    --------------------------------------------------------------------}
  TJSSVGSwitchElement = class {$IFDEF PAS2JS}external name 'SVGSwitchElement'{$ENDIF} (TJSSVGGraphicsElement)
    private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGSymbolElement
    --------------------------------------------------------------------}
  TJSSVGSymbolElement = class {$IFDEF PAS2JS}external name 'SVGSymbolElement'{$ENDIF} (TJSSVGElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGStringList
    --------------------------------------------------------------------}
  TJSSVGStringList = class {$IFDEF PAS2JS}external name 'SVGStringList'{$ENDIF}
  public
    numberOfItems: Integer;
    procedure clear;
    function initialize(newItem: String): String;
    function getItem(&index: Integer): String;
    function insertItemBefore(newItem: String; &index: Integer): String;
    function replaceItem(newItem: String; &index: Integer): String;
    function removeItem(&index: Integer): String;
    function appendItem(newItem: String): String;
  end;

  { --------------------------------------------------------------------
    TJSSVGTests
    --------------------------------------------------------------------}
  TJSSVGTests = class {$IFDEF PAS2JS}external name 'SVGTests'{$ENDIF}
  private
    FrequiredExtensions: TJSSVGStringList; {$IFDEF PAS2JS}external name 'requiredExtensions';{$ENDIF}
    FsystemLanguage: TJSSVGStringList; {$IFDEF PAS2JS}external name 'systemLanguage';{$ENDIF}
  public
    property requiredExtensions: TJSSVGStringList read FrequiredExtensions;
    property systemLanguage: TJSSVGStringList read FsystemLanguage;
  end;

  { --------------------------------------------------------------------
    TJSSVGTextContentElement
    --------------------------------------------------------------------}
  TJSSVGTextContentElement = class {$IFDEF PAS2JS}external name 'SVGTextContentElement'{$ENDIF} (TJSSVGGraphicsElement)
    private
    FtextLength: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'textLength';{$ENDIF}
    FlengthAdjust: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'lengthAdjust';{$ENDIF}
  public
  const
    LENGTHADJUST_UNKNOWN = 0;
    LENGTHADJUST_SPACING = 1;
    LENGTHADJUST_SPACINGANDGLYPHS = 2;
  Public
    function getNumberOfChars: Integer;
    function getComputedTextLength: Double;
    function getSubStringLength(charnum: NativeInt; nchars: NativeInt): Double;
    function getStartPositionOfChar(charnum: NativeInt): TJSSVGPoint;
    function getEndPositionOfChar(charnum: NativeInt): TJSSVGPoint;
    function getExtentOfChar(charnum: NativeInt): TJSSVGRect;
    function getRotationOfChar(charnum: NativeInt): Double;
    function getCharNumAtPosition(point: TJSSVGPoint): Integer;
    procedure selectSubString(charnum: NativeInt; nchars: NativeInt);
    property textLength: TJSSVGAnimatedLength read FtextLength;
    property lengthAdjust: TJSSVGAnimatedEnumeration read FlengthAdjust;
  end;

  { --------------------------------------------------------------------
    TJSSVGTextPositioningElement
    --------------------------------------------------------------------}
  TJSSVGTextPositioningElement = class {$IFDEF PAS2JS}external name 'SVGTextPositioningElement'{$ENDIF} (TJSSVGTextContentElement)
    private
    Fx: TJSSVGAnimatedLengthList; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedLengthList; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fdx: TJSSVGAnimatedLengthList; {$IFDEF PAS2JS}external name 'dx';{$ENDIF}
    Fdy: TJSSVGAnimatedLengthList; {$IFDEF PAS2JS}external name 'dy';{$ENDIF}
    Frotate: TJSSVGAnimatedNumberList; {$IFDEF PAS2JS}external name 'rotate';{$ENDIF}
  public
    property x: TJSSVGAnimatedLengthList read Fx;
    property y: TJSSVGAnimatedLengthList read Fy;
    property dx: TJSSVGAnimatedLengthList read Fdx;
    property dy: TJSSVGAnimatedLengthList read Fdy;
    property rotate: TJSSVGAnimatedNumberList read Frotate;
  end;

  { --------------------------------------------------------------------
    TJSSVGTextElement
    --------------------------------------------------------------------}
  TJSSVGTextElement = class {$IFDEF PAS2JS}external name 'SVGTextElement'{$ENDIF} (TJSSVGTextPositioningElement)
    private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGTextPathElement
    --------------------------------------------------------------------}
  TJSSVGTextPathElement = class {$IFDEF PAS2JS}external name 'SVGTextPathElement'{$ENDIF} (TJSSVGTextContentElement)
    private
    FstartOffset: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'startOffset';{$ENDIF}
    Fmethod: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'method';{$ENDIF}
    Fspacing: TJSSVGAnimatedEnumeration; {$IFDEF PAS2JS}external name 'spacing';{$ENDIF}
  public
  const
    TEXTPATH_METHODTYPE_UNKNOWN = 0;
    TEXTPATH_METHODTYPE_ALIGN = 1;
    TEXTPATH_METHODTYPE_STRETCH = 2;
    TEXTPATH_SPACINGTYPE_UNKNOWN = 0;
    TEXTPATH_SPACINGTYPE_AUTO = 1;
    TEXTPATH_SPACINGTYPE_EXACT = 2;
  Public
    property startOffset: TJSSVGAnimatedLength read FstartOffset;
    property method: TJSSVGAnimatedEnumeration read Fmethod;
    property spacing: TJSSVGAnimatedEnumeration read Fspacing;
  end;

  { --------------------------------------------------------------------
    TJSSVGTitleElement
    --------------------------------------------------------------------}
  TJSSVGTitleElement = class {$IFDEF PAS2JS}external name 'SVGTitleElement'{$ENDIF} (TJSSVGElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGTransform
    --------------------------------------------------------------------}
  TJSSVGTransform = class {$IFDEF PAS2JS}external name 'SVGTransform'{$ENDIF}
  private
    Ftype_: Cardinal; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    Fmatrix: TJSSVGMatrix; {$IFDEF PAS2JS}external name 'matrix';{$ENDIF}
    Fangle: Double; {$IFDEF PAS2JS}external name 'angle';{$ENDIF}
  public
  const
    SVG_TRANSFORM_UNKNOWN = 0;
    SVG_TRANSFORM_MATRIX = 1;
    SVG_TRANSFORM_TRANSLATE = 2;
    SVG_TRANSFORM_SCALE = 3;
    SVG_TRANSFORM_ROTATE = 4;
    SVG_TRANSFORM_SKEWX = 5;
    SVG_TRANSFORM_SKEWY = 6;
  Public
    procedure setMatrix(matrix: TJSSVGMatrix);
    procedure setTranslate(tx: Double; ty: Double);
    procedure setScale(sx: Double; sy: Double);
    procedure setRotate(angle: Double; cx: Double; cy: Double);
    procedure setSkewX(angle: Double);
    procedure setSkewY(angle: Double);
    property type_: Cardinal read Ftype_;
    property matrix: TJSSVGMatrix read Fmatrix;
    property angle: Double read Fangle;
  end;

  { --------------------------------------------------------------------
    TJSSVGTSpanElement
    --------------------------------------------------------------------}
  TJSSVGTSpanElement = class {$IFDEF PAS2JS}external name 'SVGTSpanElement'{$ENDIF} (TJSSVGTextPositioningElement)
    private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGUnitTypes
    --------------------------------------------------------------------}
  TJSSVGUnitTypes = class {$IFDEF PAS2JS}external name 'SVGUnitTypes'{$ENDIF}
  private
  public
    const
      SVG_UNIT_TYPE_UNKNOWN = 0;
      SVG_UNIT_TYPE_USERSPACEONUSE = 1;
      SVG_UNIT_TYPE_OBJECTBOUNDINGBOX = 2;
  Public
  end;

  { --------------------------------------------------------------------
    TJSSVGURIReference
    --------------------------------------------------------------------}
  TJSSVGURIReference = class {$IFDEF PAS2JS}external name 'SVGURIReference'{$ENDIF}
  private
    Fhref: TJSSVGAnimatedString; {$IFDEF PAS2JS}external name 'href';{$ENDIF}
  public
    property href: TJSSVGAnimatedString read Fhref;
  end;

  { --------------------------------------------------------------------
    TJSSVGUseElement
    --------------------------------------------------------------------}
  TJSSVGUseElement = class {$IFDEF PAS2JS}external name 'SVGUseElement'{$ENDIF} (TJSSVGGraphicsElement)
  private
    Fx: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'x';{$ENDIF}
    Fy: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'y';{$ENDIF}
    Fwidth: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'width';{$ENDIF}
    Fheight: TJSSVGAnimatedLength; {$IFDEF PAS2JS}external name 'height';{$ENDIF}
  public
    property x: TJSSVGAnimatedLength read Fx;
    property y: TJSSVGAnimatedLength read Fy;
    property width: TJSSVGAnimatedLength read Fwidth;
    property height: TJSSVGAnimatedLength read Fheight;
  end;

  { --------------------------------------------------------------------
    TJSSVGViewElement
    --------------------------------------------------------------------}
  TJSSVGViewElement = class {$IFDEF PAS2JS}external name 'SVGViewElement'{$ENDIF} (TJSSVGElement)
  private
  public
  end;

  { --------------------------------------------------------------------
    TJSSVGZoomAndPan
    --------------------------------------------------------------------}
  TJSSVGZoomAndPan = class {$IFDEF PAS2JS}external name 'SVGZoomAndPan'{$ENDIF}
  private
  public
  const
    SVG_ZOOMANDPAN_UNKNOWN = 0;
    SVG_ZOOMANDPAN_DISABLE = 1;
    SVG_ZOOMANDPAN_MAGNIFY = 2;
  Public
    zoomAndPan: Cardinal;
  end;

implementation

{$IFDEF DCC}
{ DOMStringMap }

function DOMStringMap.GetItem(name: String): String;
begin

end;

procedure DOMStringMap.SetItem(name, value: String);
begin

end;

{ TJSSVGElement }

procedure TJSSVGElement.blur;
begin

end;

procedure TJSSVGElement.focus;
begin

end;

{ TJSSVGGraphicsElement }

function TJSSVGGraphicsElement.getBBox: TJSSVGRect;
begin

end;

function TJSSVGGraphicsElement.getCTM: TJSSVGMatrix;
begin

end;

function TJSSVGGraphicsElement.getScreenCTM: TJSSVGMatrix;
begin

end;

{ TJSSVGSVGElement }

function TJSSVGSVGElement.animationsPaused: boolean;
begin

end;

function TJSSVGSVGElement.checkEnclosure(element: TJSSVGElement;
  rect: TJSSVGRect): boolean;
begin

end;

function TJSSVGSVGElement.checkIntersection(element: TJSSVGElement;
  rect: TJSSVGRect): boolean;
begin

end;

function TJSSVGSVGElement.createSVGAngle: TJSSVGAngle;
begin

end;

function TJSSVGSVGElement.createSVGLength: TJSSVGLength;
begin

end;

function TJSSVGSVGElement.createSVGMatrix: TJSSVGMatrix;
begin

end;

function TJSSVGSVGElement.createSVGNumber: TJSSVGNumber;
begin

end;

function TJSSVGSVGElement.createSVGPoint: TJSSVGPoint;
begin

end;

function TJSSVGSVGElement.createSVGRect: TJSSVGRect;
begin

end;

function TJSSVGSVGElement.createSVGTransform: TJSSVGTransform;
begin

end;

function TJSSVGSVGElement.createSVGTransformFromMatrix(
  matrix: TJSSVGMatrix): TJSSVGTransform;
begin

end;

procedure TJSSVGSVGElement.deselectAll;
begin

end;

procedure TJSSVGSVGElement.forceRedraw;
begin

end;

function TJSSVGSVGElement.getCurrentTime: Double;
begin

end;

function TJSSVGSVGElement.getElementById(elementId: string): TJSElement;
begin

end;

function TJSSVGSVGElement.getEnclosureList(rect: TJSSVGRect;
  referenceElement: TJSSVGElement): TJSNodeList;
begin

end;

function TJSSVGSVGElement.getIntersectionList(rect: TJSSVGRect;
  referenceElement: TJSSVGElement): TJSNodeList;
begin

end;

procedure TJSSVGSVGElement.pauseAnimations;
begin

end;

procedure TJSSVGSVGElement.setCurrentTime(seconds: Double);
begin

end;

function TJSSVGSVGElement.suspendRedraw(
  maxWaitMilliseconds: NativeInt): NativeInt;
begin

end;

procedure TJSSVGSVGElement.unpauseAnimations;
begin

end;

procedure TJSSVGSVGElement.unsuspendRedraw(suspendHandleId: NativeInt);
begin

end;

procedure TJSSVGSVGElement.unsuspendRedrawAll;
begin

end;

{ TJSSVGAngle }

procedure TJSSVGAngle.convertToSpecifiedUnits(unitType: Cardinal);
begin

end;

procedure TJSSVGAngle.newValueSpecifiedUnits(unitType: Cardinal;
  valueInSpecifiedUnits: Double);
begin

end;

{ TJSSVGLengthList }

function TJSSVGLengthList.appendItem(newItem: TJSSVGLength): TJSSVGLength;
begin

end;

procedure TJSSVGLengthList.clear;
begin

end;

function TJSSVGLengthList.getItem(index: Integer): TJSSVGLength;
begin

end;

function TJSSVGLengthList.initialize(newItem: TJSSVGLength): TJSSVGLength;
begin

end;

function TJSSVGLengthList.insertItemBefore(newItem: TJSSVGLength;
  index: Integer): TJSSVGLength;
begin

end;

function TJSSVGLengthList.removeItem(index: Integer): TJSSVGLength;
begin

end;

function TJSSVGLengthList.replaceItem(newItem: TJSSVGLength;
  index: Integer): TJSSVGLength;
begin

end;

{ TJSSVGNumberList }

function TJSSVGNumberList.appendItem(newItem: TJSSVGNumber): TJSSVGNumber;
begin

end;

procedure TJSSVGNumberList.clear;
begin

end;

function TJSSVGNumberList.getItem(index: Integer): TJSSVGNumber;
begin

end;

function TJSSVGNumberList.initialize(newItem: TJSSVGNumber): TJSSVGNumber;
begin

end;

function TJSSVGNumberList.insertItemBefore(newItem: TJSSVGNumber;
  index: Integer): TJSSVGNumber;
begin

end;

function TJSSVGNumberList.removeItem(index: Integer): TJSSVGNumber;
begin

end;

function TJSSVGNumberList.replaceItem(newItem: TJSSVGNumber;
  index: Integer): TJSSVGNumber;
begin

end;

{ TJSSVGTransformList }

function TJSSVGTransformList.appendItem(
  newItem: TJSSVGTransform): TJSSVGTransform;
begin

end;

procedure TJSSVGTransformList.clear;
begin

end;

function TJSSVGTransformList.consolidate: TJSSVGTransform;
begin

end;

function TJSSVGTransformList.createSVGTransformFromMatrix(
  matrix: TJSSVGMatrix): TJSSVGTransform;
begin

end;

function TJSSVGTransformList.getItem(index: Integer): TJSSVGTransform;
begin

end;

function TJSSVGTransformList.initialize(
  newItem: TJSSVGTransform): TJSSVGTransform;
begin

end;

function TJSSVGTransformList.insertItemBefore(newItem: TJSSVGTransform;
  index: Integer): TJSSVGTransform;
begin

end;

function TJSSVGTransformList.removeItem(index: Integer): TJSSVGTransform;
begin

end;

function TJSSVGTransformList.replaceItem(newItem: TJSSVGTransform;
  index: Integer): TJSSVGTransform;
begin

end;

{ TJSSVGAnimationElement }

procedure TJSSVGAnimationElement.beginElement;
begin

end;

procedure TJSSVGAnimationElement.beginElementAt(offset: Double);
begin

end;

procedure TJSSVGAnimationElement.endElement;
begin

end;

procedure TJSSVGAnimationElement.endElementAt(offset: Double);
begin

end;

function TJSSVGAnimationElement.getCurrentTime: Double;
begin

end;

function TJSSVGAnimationElement.getSimpleDuration: Double;
begin

end;

function TJSSVGAnimationElement.getStartTime: Double;
begin

end;

{ TJSSVGGeometryElement }

function TJSSVGGeometryElement.getPointAtLength(distance: Double): TJSSVGPoint;
begin

end;

function TJSSVGGeometryElement.getTotalLength: Double;
begin

end;

function TJSSVGGeometryElement.isPointInFill(point: TJSSVGPoint): boolean;
begin

end;

function TJSSVGGeometryElement.isPointInStroke(point: TJSSVGPoint): boolean;
begin

end;

{ TJSSVGFEDropShadowElement }

procedure TJSSVGFEDropShadowElement.setStdDeviation(stdDeviationX,
  stdDeviationY: Double);
begin

end;

{ TJSSVGFEGaussianBlurElement }

procedure TJSSVGFEGaussianBlurElement.setStdDeviation(stdDeviationX,
  stdDeviationY: Double);
begin

end;

{ TJSSVGLength }

procedure TJSSVGLength.convertToSpecifiedUnits(unitType: Cardinal);
begin

end;

procedure TJSSVGLength.newValueSpecifiedUnits(unitType: Cardinal;
  valueInSpecifiedUnits: Double);
begin

end;

{ TJSSVGMarkerElement }

procedure TJSSVGMarkerElement.setOrientToAngle(angle: TJSSVGAngle);
begin

end;

procedure TJSSVGMarkerElement.setOrientToAuto;
begin

end;

{ TJSSVGMatrix }

function TJSSVGMatrix.flipX: TJSSVGMatrix;
begin

end;

function TJSSVGMatrix.flipY: TJSSVGMatrix;
begin

end;

function TJSSVGMatrix.inverse: TJSSVGMatrix;
begin

end;

function TJSSVGMatrix.multiply(secondMatrix: TJSSVGMatrix): TJSSVGMatrix;
begin

end;

function TJSSVGMatrix.rotate(angle: Double): TJSSVGMatrix;
begin

end;

function TJSSVGMatrix.rotateFromVector(x, y: Double): TJSSVGMatrix;
begin

end;

function TJSSVGMatrix.scale(scaleFactor: Double): TJSSVGMatrix;
begin

end;

function TJSSVGMatrix.scaleNonUniform(scaleFactorX,
  scaleFactorY: Double): TJSSVGMatrix;
begin

end;

function TJSSVGMatrix.skewX(angle: Double): TJSSVGMatrix;
begin

end;

function TJSSVGMatrix.skewY(angle: Double): TJSSVGMatrix;
begin

end;

function TJSSVGMatrix.translate(x, y: Double): TJSSVGMatrix;
begin

end;

{ TJSSVGPathElement }

function TJSSVGPathElement.getPathSegAtLength(distance: Double): NativeInt;
begin

end;

{ TJSSVGPoint }

function TJSSVGPoint.matrixTransform(matrix: TJSSVGMatrix): TJSSVGPoint;
begin

end;

{ TJSSVGPointList }

function TJSSVGPointList.appendItem(newItem: TJSSVGPoint): TJSSVGPoint;
begin

end;

procedure TJSSVGPointList.clear;
begin

end;

function TJSSVGPointList.getItem(index: Integer): TJSSVGPoint;
begin

end;

function TJSSVGPointList.initialize(newItem: TJSSVGPoint): TJSSVGPoint;
begin

end;

function TJSSVGPointList.insertItemBefore(newItem: TJSSVGPoint;
  index: Integer): TJSSVGPoint;
begin

end;

function TJSSVGPointList.removeItem(index: Integer): TJSSVGPoint;
begin

end;

function TJSSVGPointList.replaceItem(newItem: TJSSVGPoint;
  index: Integer): TJSSVGPoint;
begin

end;

{ TJSSVGStringList }

function TJSSVGStringList.appendItem(newItem: String): String;
begin

end;

procedure TJSSVGStringList.clear;
begin

end;

function TJSSVGStringList.getItem(index: Integer): String;
begin

end;

function TJSSVGStringList.initialize(newItem: String): String;
begin

end;

function TJSSVGStringList.insertItemBefore(newItem: String;
  index: Integer): String;
begin

end;

function TJSSVGStringList.removeItem(index: Integer): String;
begin

end;

function TJSSVGStringList.replaceItem(newItem: String; index: Integer): String;
begin

end;

{ TJSSVGTextContentElement }

function TJSSVGTextContentElement.getCharNumAtPosition(
  point: TJSSVGPoint): Integer;
begin

end;

function TJSSVGTextContentElement.getComputedTextLength: Double;
begin

end;

function TJSSVGTextContentElement.getEndPositionOfChar(
  charnum: NativeInt): TJSSVGPoint;
begin

end;

function TJSSVGTextContentElement.getExtentOfChar(
  charnum: NativeInt): TJSSVGRect;
begin

end;

function TJSSVGTextContentElement.getNumberOfChars: Integer;
begin

end;

function TJSSVGTextContentElement.getRotationOfChar(charnum: NativeInt): Double;
begin

end;

function TJSSVGTextContentElement.getStartPositionOfChar(
  charnum: NativeInt): TJSSVGPoint;
begin

end;

function TJSSVGTextContentElement.getSubStringLength(charnum,
  nchars: NativeInt): Double;
begin

end;

procedure TJSSVGTextContentElement.selectSubString(charnum, nchars: NativeInt);
begin

end;

{ TJSSVGTransform }

procedure TJSSVGTransform.setMatrix(matrix: TJSSVGMatrix);
begin

end;

procedure TJSSVGTransform.setRotate(angle, cx, cy: Double);
begin

end;

procedure TJSSVGTransform.setScale(sx, sy: Double);
begin

end;

procedure TJSSVGTransform.setSkewX(angle: Double);
begin

end;

procedure TJSSVGTransform.setSkewY(angle: Double);
begin

end;

procedure TJSSVGTransform.setTranslate(tx, ty: Double);
begin

end;
{$ENDIF}
end.
