unit libjquery;

{$IFDEF PAS2JS}
{$modeswitch externalclass}
{$ENDIF}

interface

uses js, web{$IFDEF DCC}, types{$ENDIF};

Type
  TJQueryTopLeft = record
    top,left : integer;
  end;

  TJQuery = class;

  TCallback = Procedure (args : JSValue);
  TCallbackEvent = Procedure (args : JSValue) of object;

  TCallbacks = class {$IFDEF PAS2JS}external name 'Callbacks'{$ENDIF}
  Public
    function add(aCallBack : TCallBack) : TCallbacks; overload;
    function add(aCallBack : Array of TCallBack) : TCallbacks; overload;
    function add(aCallBack : TCallBackEvent) : TCallbacks; overload;
    function add(aCallBack : Array of TCallBackEvent) : TCallbacks; overload;
    function disable : TCallBacks; overload;
    function disabled : Boolean; overload;
    function empty : TCallBacks;
    function fire(arguments : JSValue) : TCallbacks; {$IFDEF PAS2JS}varargs;{$ENDIF}
    function fired : Boolean;
    function fireWith(context : JSValue; arguments : JSValue) : TCallbacks;
    function has(aCallBack : TCallBack) : Boolean; overload;
    function has(aCallBack : TCallBackEvent) : Boolean; overload;
    function lock : TCallBacks;
    function locked : boolean;
    function remove(aCallBack : TCallBack) : TCallbacks; overload;
    function remove(aCallBack : Array of TCallBack) : TCallbacks; overload;
    function remove(aCallBack : TCallBackEvent) : TCallbacks; overload;
    function remove(aCallBack : Array of TCallBackEvent) : TCallbacks; overload;
  end;

  { TJQuery }

  TJQueryAddClassHandler = Reference to Function (aIndex : Integer; AClass : String) : String;
  TJQueryAttrHandler = Reference to Function (aIndex : Integer; aAttr : String) : JSValue;
  TJQueryCSSHandler = Reference to Function (aIndex : Integer; AClass : String) : JSValue ;
  TJQueryEachHandler = Reference to Function (aIndex : Integer; AElement : TJSElement) : Boolean;
  TJQueryFilterHandler = Reference to Function (aIndex : Integer; AElement : TJSElement) : Boolean;
  TJQueryHeightHandler = Reference to Function (aIndex : Integer; AHeight : jsValue) : JSValue ;
  TJQueryHTMLHandler = Reference to Function(aIndex : Integer; aHTML : String) : String;
  TJQueryMapHandler = Reference to Function (aIndex : Integer; AElement : TJSElement) : TJSObject;
  TJQueryOffsetHandler = Reference to Function (aIndex : Integer; aCoords : TJQueryTopLeft) : TJQueryTopLeft;
  TJQueryPropHandler = Reference to Function(aIndex : Integer; oldProp : JSValue) : JSValue;
  TJQueryQueueHandler = Reference to procedure;
  TJQueryTextHandler  = Reference to Function(aIndex : Integer; aString : String) : String;
  TJQueryToggleClassHandler = Reference to Function(aIndex : Integer; aClassName : string; AState : Boolean) : String;
  TJQueryValHandler = Reference to Function(aIndex :integer; aValue : String) : String;
  TJQueryWidthHandler = Reference to Function (aIndex : Integer; AHeight : jsValue) : JSValue ;

  TJQueryDeQueueFunction = Reference to Procedure;
  TJQueryAddQueueHandler = Reference to Procedure (aFunc : TJQueryDeQueueFunction);

  TAjaxEvent = class {$IFDEF PAS2JS}external name 'AjaxEvent' {$ENDIF} (TJSEvent);

  TDeferredDoneHandler = reference to function : Boolean;

  TJQueryDeferred = class {$IFDEF PAS2JS}external name 'Deferred'{$ENDIF} (TJSObject)
  Public
    Function done(aHandler :TDeferredDoneHandler) : TJQueryDeferred; overload;
    Function done(aHandlers : Array of TDeferredDoneHandler) : TJQueryDeferred; overload;
  end;

  TJQXHR = class;

  TJQXHRDoneHandler = reference to function(aData : jsValue; textStatus : String; aJQXHR : TJQXHR) : boolean;
  TJQXHRFailHandler = reference to function(aJQXHR : TJQXHR; textStatus : String; AErrorThrown : jsValue) : boolean;
  TJQXHRAlwaysHandler = reference to function(arg1 : TJSObject; textStatus : String; arg2 : TJSObject) : boolean;

  TJQXHR = class {$IFDEF PAS2JS}external name 'jqXHR'{$ENDIF} (TJQueryDeferred)
  private
    FReadyState: NativeInt; {$IFDEF PAS2JS}external name 'readyState';{$ENDIF}
    //FResponse: JSValue; external name 'response';
    FResponseText: string; {$IFDEF PAS2JS}external name 'responseText';{$ENDIF}
    FresponseXML: TJSDocument; {$IFDEF PAS2JS}external name 'responseXML';{$ENDIF}
    //FUpload: TJSXMLHttpRequestUpload; external name 'upload';
    FStatus : NativeInt; {$IFDEF PAS2JS}external name 'status';{$ENDIF}
    FStatusText : String; {$IFDEF PAS2JS}external name 'statustext';{$ENDIF}
  public
    function getResponseHeader(aName : string) : String;
    function getAllResponseHeaders : String;
    procedure overrideMimeType(aType : String);
    procedure setRequestHeader(aName, AValue : string);
    procedure done(aHandler : TJQXHRDoneHandler); overload;
    procedure always(aHandler : TJQXHRAlwaysHandler); overload;
    procedure fail(aHandler : TJQXHRFailHandler); overload;
    procedure _then(aSuccess : TJQXHRDoneHandler; aFail : TJQXHRFailHandler); overload;
    procedure abort; overload;
    procedure abort(AStatusText : String); overload;
    property readyState : NativeInt read FReadyState;
    property ResponseHeaders[aName : string] : string Read getResponseHeader;
    property responseXML : TJSDocument read FresponseXML;
    property responseText : string read FResponseText;
    property status : NativeInt read FStatus;
    property statusText : string read FStatusText;
  end;

  TJSAjaxSettings = class;

  TJQueryAjaxSettingsHandler = Reference to Function (aHXR : TJQXHR; aOptions : TJSAjaxSettings) : Boolean;
  TJQueryAjaxSettingsDataFilter = Reference to function (aData: String; aType : string) : JSValue;
  TJQueryAjaxSettingsErrorHandler = Reference to Function (aHXR : TJQXHR; aOptions : TJSAjaxSettings; aStatus, aError : String) : Boolean;
  TJQueryAjaxSettingsSuccessHandler = Reference to Function (data : JSValue; aStatus : String; aHXR : TJQXHR) : Boolean;
  TJQueryAjaxSettsingsXHRHandler = reference to function : JSValue;

  TJSAjaxSettings = class {$IFDEF PAS2JS}external name 'Object'{$ENDIF} (TJSObject)
    accepts : TJSObject;
    async : boolean;
    beforeSend : TJQueryAjaxSettingsHandler;
    cache : boolean;
    complete : TJQueryAjaxSettingsHandler;
    contents : TJSObject;
    contentType : String;
    context : TJSObject;
    converters : TJSObject;
    crossDomain : boolean;
    data : JSValue;
    dataFilter : TJQueryAjaxSettingsDataFilter;
    dataType : String;
    error : TJQueryAjaxSettingsErrorHandler;
    global: boolean;
    headers : TJSObject;
    ifModified : Boolean;
    isLocal : Boolean;
    json : String;
    jsonpCallback : String;
    method : string;
    mimeType : string;
    password : string;
    processData : Boolean;
    scriptCharset : String;
    statusCode : TJSObject;
    success : TJQueryAjaxSettingsSuccessHandler;
    timeout : NativeInt;
    traditional : boolean;
    url : string;
    username : string;
    xhr : TJQueryAjaxSettsingsXHRHandler;
    xhrFields : TJSObject;
  end;

  TJQueryAjaxTransportCompleteHandler = function (aStatus : NativeInt; aStatusText : string; responses, Headers : TJSObject) : Boolean;
  TJQueryAjaxTransportSendHandler = reference to function(headers: TJSObject; onComplete : TJQueryAjaxTransportCompleteHandler) : boolean;
  TJQueryAjaxTransportAbortHandler = reference to function () : Boolean;
  TJQueryAjaxTransport = record
    send : TJQueryAjaxTransportSendHandler;
    abort : TJQueryAjaxTransportAbortHandler;
  end;

  TJQueryAjaxTransportHandler = reference to Function (aOptions,aOriginalOptions : TJSObject; aXHR : TJQXHR) : TJQueryAjaxTransport;
  TJQueryAjaxPrefilterHandler = reference to procedure (aOptions,aOriginalOptions : TJSObject; aXHR : TJQXHR);
  TJQueryAjaxEventHandler = Reference to Function (aEvent : TAjaxEvent; aHXR : TJQXHR; aOptions : TJSAjaxSettings) : Boolean;
  TJQueryAjaxErrorHandler = Reference to Function (aEvent : TAjaxEvent; aHXR : TJQXHR; aOptions : TJSAjaxSettings; aError : String) : Boolean;
  TJQueryAjaxSuccessHandler = Reference to function (aData : TJSObject; aStatus : String; aXHR : TJQXHR) : Boolean;
  TJQueryAjaxLoadHandler = Reference to function (aResponseText,aStatus : String; aXHR : TJQXHR) : Boolean;
  TJQueryAjaxScriptHandler = Reference to function (aScript,aStatus : String; aXHR : TJQXHR) : Boolean;
  TJQueryAjaxHandler = Reference to procedure;
  TPrependCallback = reference to Function(elementOfArray : NativeInt; Html : String) : JSValue;

  TJQuery = class {$IFDEF PAS2JS}external name 'jQuery'{$ENDIF} (TJSObject)
  private
    FCSSHooks: TJSObject; {$IFDEF PAS2JS}external name 'cssHooks';{$ENDIF}
    FCSSNumber: TJSObject; {$IFDEF PAS2JS}external name 'cssNumber';{$ENDIF}
    FReady: TJSPromise; {$IFDEF PAS2JS}external name 'ready';{$ENDIF}
    function getEl(aIndex : Integer) : TJSElement; {$IFDEF PAS2JS}external name 'get';{$ENDIF}
  Public
    function add(Const aSelector : String) : TJQuery;overload;
    function add(Const aSelector : String; AContext : TJSElement) : TJQuery;overload;
    function add(Const aElement : TJSElement) : TJQuery;overload;
    function add(Const aElement : Array of TJSElement) : TJQuery;overload;
    function add(Const aQuery : TJQuery) : TJQuery;overload;
    function addBack(Const aSelector : String) : TJQuery;overload;
    function addBack : TJQuery;overload;
    function addClass(Const aClass : String) : TJQuery;overload;
    function addClass(Const aClassFunction : TJQueryAddClassHandler) : TJQuery;  overload;
    function ajaxComplete(aHandler : TJQueryAjaxEventHandler) : TJQuery;
    function ajaxError(aHandler : TJQueryAjaxEventHandler) : TJQuery;
    function ajaxSend(aHandler : TJQueryAjaxEventHandler) : TJQuery;
    function ajaxStart(aHandler : TJQueryAjaxHandler) : TJQuery;
    function ajaxStop(aHandler : TJQueryAjaxHandler) : TJQuery;
    function ajaxSuccess(aHandler : TJQueryAjaxEventHandler) : TJQuery;
    class function ajax(aURL : String; aSettings : TJSObject) : tJQXHR; overload;
    class function ajax(aSettings : TJSObject) : tJQXHR; overload;
    class function ajax(aSettings : TJSAjaxSettings) : tJQXHR; overload;
    class procedure ajaxPrefilter(dataTypes : string; aHandler : TJQueryAjaxPrefilterHandler);overload;
    class procedure ajaxSetup(aSettings : TJSAjaxSettings); overload;
    class procedure ajaxSetup(aSettings : TJSObject); overload;
    class procedure ajaxTransport(aDataType : string; AHandler : TJQueryAjaxTransportHandler);

    function attr(Const attributeName : string) : string;overload;
    function attr(Const attributeName : string; Const Value : String) : TJQuery;overload;
    function attr(Const attributes : TJSObject) : TJQuery;overload;
    function attr(Const attributeName : string; aHandler : TJQueryAttrHandler) : TJQuery;overload;
    class function Callbacks : TCallbacks;overload;
    class function Callbacks(const aFlags : string) : TCallbacks;overload;
    function children(Const aSelector : String) : TJQuery;overload;
    function children : TJQuery;overload;
    function clearQueue : TJQuery;overload;
    function clearQueue(const aQueueName : String) : TJQuery;overload;
    function closest(Const aSelector : String) : TJQuery;overload;
    function closest(Const aSelector : String; AContext : TJSElement) : TJQuery;overload;
    function closest(Const aQuery : TJQuery) : TJQuery;overload;
    function closest(Const aElement : TJSElement) : TJQuery;overload;
    function contents : TJQuery;
    function css(Const aPropertyName : TJSObject) : string; overload;
    function css(Const aPropertyName : String) : string; overload;
    function css(Const aPropertyNames : Array of String) : string;overload;
    function css(Const aPropertyName, Avalue : String) : TJQuery;overload;
    function css(Const aPropertyName : String; Avalue : Integer) : TJQuery;overload;
    function css(Const aPropertyName : String; AHandler : TJQueryCSSHandler) : TJQuery;overload;
    class function data(aElement : TJSElement; const aKey : String; aValue : jsValue) : TJSObject;overload;
    class function data(aElement : TJSElement; const aKey : String) : TJSObject;overload;
    class function data(aElement : TJSElement) : TJSObject;overload;
    function data(aKey : String; aValue : JSValue) : TJQuery;overload;
    function data(aObj : TJSObject) : TJQuery;overload;
    function data(aKey : String) : TJSObject;overload;
    function data : TJSObject;overload;
    function dequeue : TJQuery;overload;
    function dequeue(const aQueueName : String) : TJQuery;overload;
    class function dequeue(aElement : TJSElement) : TJQuery;overload;
    class function dequeue(aElement : TJSElement; const aQueueName : String) : TJQuery;overload;
    function _end : TJQuery; {$IFDEF PAS2JS}external name 'end';{$ENDIF}
    function eq(AIndex : Integer) : TJQuery;
    function each(aHandler : TJQueryEachHandler) : TJQuery;
    class function escapeSelector(const S : String) : String;
    function filter(Const aSelector : String) : TJQuery;overload;
    function filter(aHandler : TJQueryFilterHandler) : TJQuery;overload;
    function filter(Const aQuery : TJQuery) : TJQuery;overload;
    function filter(Const aElement : TJSElement) : TJQuery;overload;
    function filter(Const aElements : Array of TJSElement) : TJQuery;overload;
    function find(Const aSelector : String) : TJQuery;overload;
    function find(Const aQuery : TJQuery) : TJQuery;overload;
    function find(Const aElement : TJSElement) : TJQuery;overload;
    function first : TJQuery;
    function get(aIndex : Integer) : TJSElement;overload;
    class function get : TJQXHR;overload;
    class function get(url : String) : TJQXHR;overload;
    class function get(url,Data : String) : TJQXHR;overload;
    class function get(url : String; Data : TJSObject) : TJQXHR;overload;
    class function get(url : String; Data : TJSObject; success : TJQueryAjaxSuccessHandler) : TJQXHR;overload;
    class function get(url,Data : String; success : TJQueryAjaxSuccessHandler) : TJQXHR;overload;
    class function get(url : String; Data : TJSObject; success : TJQueryAjaxSuccessHandler; aDataType : string) : TJQXHR;overload;
    class function get(url,Data : String; success : TJQueryAjaxSuccessHandler; aDataType : string) : TJQXHR;overload;
    class function get(aSettings : TJSAjaxSettings) : TJQXHR; overload;
    class function get(aSettings : TJSObject) : TJQXHR; overload;

    class function getJSON(url : String) : TJQXHR;overload;
    class function getJSON(url,Data : String) : TJQXHR;overload;
    class function getJSON(url : String; Data : TJSObject) : TJQXHR;overload;
    class function getJSON(url : String; Data : TJSObject; success : TJQueryAjaxSuccessHandler) : TJQXHR;overload;
    class function getJSON(url,Data : String; success : TJQueryAjaxSuccessHandler) : TJQXHR;overload;
    class function getJSON(url : String; Data : TJSObject; success : TJQueryAjaxSuccessHandler; aDataType : string) : TJQXHR;overload;
    class function getJSON(url,Data : String; success : TJQueryAjaxSuccessHandler; aDataType : string) : TJQXHR;overload;

    class function getScript(url : String) : TJQXHR;overload;
    class function getScript(url : String; aSuccess : TJQueryAjaxScriptHandler) : TJQXHR;overload;

    function has(Const aSelector : String) : TJQuery; overload;
    function has(Const aQuery : TJQuery) : TJQuery; overload;
    function hasClass(Const aClassName : String) : Boolean;
    class function hasData(aElement : TJSElement) : Boolean;
    function height: Integer; overload;
    function height(aValue: Integer) : TJQuery; overload;
    function height(aValue: String) : TJQuery; overload;
    function height(aHandler: TJQueryHeightHandler) : TJQuery; overload;
    function html : String; overload;
    function html(Const aHTML : String) : TJQuery; overload;
    function html(Const aHandler : TJQueryHTMLHandler) : TJQuery; overload;
    function innerHeight: Integer; overload;
    function innerHeight(aValue: Integer) : TJQuery; overload;
    function innerHeight(aValue: String) : TJQuery; overload;
    function innerHeight(aHandler: TJQueryHeightHandler) : TJQuery; overload;
    function innerWidth: Integer; overload;
    function innerWidth(aValue: Integer) : TJQuery; overload;
    function innerWidth(aValue: String) : TJQuery; overload;
    function innerWidth(aHandler: TJQueryWidthHandler) : TJQuery; overload;
    function _is(Const aSelector : String) : TJQuery; {$IFDEF PAS2JS}external name 'is';{$ENDIF} overload;
    function _is(Const aQuery : TJQuery) : TJQuery; {$IFDEF PAS2JS}external name 'is';{$ENDIF} overload;
    function _is(aHandler : TJQueryFilterHandler) : TJQuery; {$IFDEF PAS2JS}external name 'is';{$ENDIF} overload;
    function _is(Const aElement : TJSElement) : TJQuery; {$IFDEF PAS2JS}external name 'is';{$ENDIF} overload;
    function _is(Const aElements : Array of TJSElement) : TJQuery; {$IFDEF PAS2JS}external name 'is';{$ENDIF} overload;
    function last : TJQuery;
    class function load(url : String) : TJQXHR;overload;
    class function load(url,Data : String) : TJQXHR;overload;
    class function load(url : String; Data : TJSObject) : TJQXHR;overload;
    class function load(url : String; Data : TJSObject; success : TJQueryAjaxLoadHandler) : TJQXHR;overload;
    class function load(url,Data : String; success : TJQueryAjaxLoadHandler) : TJQXHR;overload;
    function map(aHandler : TJQueryMapHandler) : TJQuery;
    function next : TJQuery;overload;
    function next(const aSelector : String) : TJQuery;overload;
    function nextAll : TJQuery;overload;
    function nextAll(const aSelector : String) : TJQuery;overload;
    function nextUntil : TJQuery;overload;
    function nextUntil(const aSelector : String) : TJQuery;overload;
    function nextUntil(const aSelector,aFilter : String) : TJQuery;overload;
    function nextUntil(const aElement : TJSElement) : TJQuery;overload;
    function nextUntil(const aElement : TJSElement; aFilter : String) : TJQuery;overload;
    function nextUntil(const aQuery : TJQuery) : TJQuery;overload;
    function nextUntil(const aQuery : TJQuery; aFilter : String) : TJQuery;overload;
    function _not(const aSelector : String) : TJQuery; {$IFDEF PAS2JS}external name 'not';{$ENDIF} overload;
    function _not(const aSelector : TJSElement) : TJQuery; {$IFDEF PAS2JS}external name 'not';{$ENDIF} overload;
    function _not(const aSelector : Array of TJSElement) : TJQuery; {$IFDEF PAS2JS}external name 'not';{$ENDIF} overload;
    function _not(const aSelector : TJQuery) : TJQuery; {$IFDEF PAS2JS}external name 'not';{$ENDIF} overload;
    function _not(const aSelector : TJQueryFilterHandler) : TJQuery; {$IFDEF PAS2JS}external name 'not';{$ENDIF} overload;
    function noConflict : TJSObject;overload;
    function noConflict(removeAll: Boolean) : TJSObject;overload;
    function offSet: Integer;overload;
    function offSet(const aOffset : TJQueryTopLeft): TJQuery;overload;
    function offSet(aHandler : TJQueryOffsetHandler): TJQuery;overload;
    Function offsetParent : TJQuery;
    Function On_(events : String; aHandler : TJSEventHandler) : TJQuery; {$IFDEF PAS2JS}external name 'on';{$ENDIF} overload;
    Function On_(events : String; selector : String; aHandler : TJSEventHandler) : TJQuery; {$IFDEF PAS2JS}external name 'on';{$ENDIF} overload;
    Function On_(events : String; selector : String; data : JSValue; aHandler : TJSEventHandler) : TJQuery; {$IFDEF PAS2JS}external name 'on';{$ENDIF} overload;
    Function On_(events : TJSObject; selector : String; data : JSValue) : TJQuery; {$IFDEF PAS2JS}external name 'on';{$ENDIF} overload;
    Function On_(events : TJSObject; data : JSValue) : TJQuery; overload;
    Function On_(events : TJSObject) : TJQuery; overload;
    function outerHeight(IncludeMargin : Boolean): Integer;overload;
    function outerHeight: Integer;overload;
    function outerHeight(aValue: Integer) : TJQuery;overload;
    function outerHeight(aValue: String) : TJQuery;overload;
    function outerHeight(aHandler: TJQueryHeightHandler) : TJQuery;overload;
    function outerWidth(IncludeMargin : Boolean): Integer;overload;
    function outerWidth: Integer;overload;
    function outerWidth(aValue: Integer) : TJQuery;overload;
    function outerWidth(aValue: String) : TJQuery;overload;
    function outerWidth(aHandler: TJQueryWidthHandler) : TJQuery;overload;
    class function param (aObject : String) : String;overload;
    class function param (aObject : TJSObject) : String;overload;
    class function param (aObject : TJQuery) : String;overload;
    class function param (aObject : String; traditional : Boolean) : String;overload;
    class function param (aObject : TJSObject; traditional : Boolean) : String;overload;
    class function param (aObject : TJQuery; traditional : Boolean) : String;overload;

    Function parent : TJQuery; overload;
    Function parent (const ASelector: String) : TJQuery; overload;
    Function parents : TJQuery; overload;
    Function parents (const ASelector: String) : TJQuery; overload;
    function parentsUntil : TJQuery; overload;
    function parentsUntil(const aSelector : String) : TJQuery; overload;
    function parentsUntil(const aSelector,aFilter : String) : TJQuery; overload;
    function parentsUntil(const aElement : TJSElement) : TJQuery; overload;
    function parentsUntil(const aElement : TJSElement; aFilter : String) : TJQuery; overload;
    function parentsUntil(const aQuery : TJQuery) : TJQuery; overload;
    function parentsUntil(const aQuery : TJQuery; aFilter : String) : TJQuery; overload;
    function position : TJQueryTopLeft;
    class function post(url : String) : TJQXHR;overload;
    class function post(url,Data : String) : TJQXHR;overload;
    class function post(url : String; Data : TJSObject) : TJQXHR;overload;
    class function post(url : String; Data : TJSObject; success : TJQueryAjaxSuccessHandler) : TJQXHR;overload;
    class function post(url,Data : String; success : TJQueryAjaxSuccessHandler) : TJQXHR;overload;
    class function post(url : String; Data : TJSObject; success : TJQueryAjaxSuccessHandler; aDataType : string) : TJQXHR;overload;
    class function post(url,Data : String; success : TJQueryAjaxSuccessHandler; aDataType : string) : TJQXHR;overload;
    class function post(aSettings : TJSAjaxSettings) : TJQXHR; overload;
    class function post(aSettings : TJSObject) : TJQXHR; overload;
    function prepend(content : String) : TJQuery; overload;
    function prepend(Content1,Content2 : String) : TJQuery; overload;
    function prepend(aHandler : TPrependCallback) : TJQuery; overload;
    Function prev : TJQuery;overload;
    Function prev(Const aSelector : String) : TJQuery;overload;
    Function prevAll : TJQuery;overload;
    Function prevAll(Const aSelector : String) : TJQuery;overload;
    function prevUntil : TJQuery;overload;
    function prevUntil(const aSelector : String) : TJQuery;overload;
    function prevUntil(const aSelector,aFilter : String) : TJQuery;overload;
    function prevUntil(const aElement : TJSElement) : TJQuery;overload;
    function prevUntil(const aElement : TJSElement; aFilter : String) : TJQuery;overload;
    function prevUntil(const aQuery : TJQuery) : TJQuery;overload;
    function prevUntil(const aQuery : TJQuery; aFilter : String) : TJQuery;overload;
    function prop(const aPropertyName : String) : JSValue;overload;
    function prop(const aPropertyName : String;AValue : JSValue) : TJQuery;overload;
    function prop(const TJSObject) : TJQuery;overload;
    function prop(const aPropertyName : String; aHandler : TJQueryPropHandler) : TJQuery;overload;
    class function queue(element : TJSElement) : TJSarray;overload;
    class function queue(element : TJSElement; const aQueueName : String) : TJSarray;overload;
    class function queue(element : TJSElement; const aQueueName : string; anewQueue : TJSarray) : TJQuery;overload;
    class function queue(element : TJSElement; const aQueueName : String ; aHandler : TJQueryQueueHandler) : TJQuery;overload;
    function queue : TJSarray;overload;
    function queue(aQueueName : string) : TJSarray;overload;
    function queue(anArray : TJSArray) : TJQuery;overload;
    function queue(aQueueName : string; anArray : TJSarray) : TJQuery;overload;
    function queue(aQueueName : string; aHandler : TJQueryAddQueueHandler) : TJQuery;overload;
    function remove(Const Selector : string) : TJQuery; overload;
    function remove() : TJQuery;overload;
    function removeAttr(Const attributeName : string) : TJQuery;
    function removeClass(Const aClass : String) : TJQuery;overload;
    function removeClass(Const aClassFunction : TJQueryAddClassHandler) : TJQuery;overload;
    class function removeData(aElement : TJSElement; Const aName : String) : TJQuery;overload;
    class function removeData(aElement : TJSElement) : TJQuery;overload;
    function removeData(const aName : string) : TJQuery;overload;
    function removeData(const aNames : array of string) : TJQuery;overload;
    function removeData : TJQuery;overload;
    function removeProp(Const aPropertyName : string) : TJQuery;
    function scrollLeft : Integer;overload;
    function scrollLeft(aValue : Integer) : TJQuery;overload;
    function scrollTop : Integer;overload;
    function scrollTop(aValue : Integer) : TJQuery;overload;
    function serialize : string;
    function serializeArray : TJSObjectDynArrayArray;
    Function siblings : TJQuery;overload;
    Function siblings(Const aSelector : String) : TJQuery;overload;
    Function slice(aStart : integer) : TJQuery;overload;
    Function slice(aStart,aEnd : integer) : TJQuery;overload;
    Function sub : TJQuery;
    function text : String;overload;
    function text(Const aText : string): TJQuery;overload;
    function text(Const aText : Integer): TJQuery;overload;
    function text(Const aText : Double): TJQuery;overload;
    function text(Const aText : Boolean): TJQuery;overload;
    function text(aHandler : TJQueryTextHandler) : TJQuery;overload;
    function toggleClass(Const aClass : String) : TJQuery;overload;
    function toggleClass(Const aClass : String; aState : Boolean) : TJQuery;overload;
    function toggleClass(Const aHandler : TJQueryToggleClassHandler) : TJQuery;overload;
    function toggleClass(Const aHandler : TJQueryToggleClassHandler; AState : Boolean) : TJQuery;overload;
    function val : JSValue;overload;
    function val(Const aValue : String) : TJQuery;overload;
    function val(Const aValue : Integer) : TJQuery;overload;
    function val(Const aValue : Array of String) : TJQuery;overload;
    function val(aHandler : TJQueryValHandler) : TJQuery;overload;
    Function when(APromise : TJSPromise) :  TJSPromise;overload;
    Function when :  TJSPromise;overload;
    function Width: Integer;overload;
    function Width(aValue: Integer) : TJQuery;overload;
    function Width(aValue: String) : TJQuery;overload;
    function Width(aHandler: TJQueryWidthHandler) : TJQuery;overload;
    Property ready : TJSPromise Read FReady;
    // These should actually be class properties ?
    property cssHooks : TJSObject Read FCSSHooks;
    property cssNumber : TJSObject read FCSSNumber;
    Property Elements[AIndex : Integer] : TJSElement read getEl; default;
  end;

{$IFDEF PAS2JS}
Function JQuery(Const aSelector :  String) : TJQuery; {$IFDEF PAS2JS}external name 'jQuery';{$ENDIF} overload;
Function JQuery(Const aSelector :  String; Context : TJSElement) : TJQuery; {$IFDEF PAS2JS}external name 'jQuery';{$ENDIF} overload;
Function JQuery(Const aElement : TJSElement) : TJQuery; {$IFDEF PAS2JS}external name 'jQuery';{$ENDIF} overload;
Function JQuery(Const aElement : Array of TJSElement) : TJQuery; {$IFDEF PAS2JS}external name 'jQuery';{$ENDIF} overload;
Function JQuery(Const aElement : TJSObject) : TJQuery; {$IFDEF PAS2JS}external name 'jQuery';{$ENDIF} overload;
Function JQuery(Const aQuery : TJQuery) : TJQuery; {$IFDEF PAS2JS}external name 'jQuery';{$ENDIF} overload;
Function JQuery() : TJQuery; {$IFDEF PAS2JS}external name 'jQuery';{$ENDIF} overload;
{$ENDIF}

Var
  gJQuery : TJQuery; {$IFDEF PAS2JS}external name 'jQuery';{$ENDIF}

Implementation

{ TCallbacks }

function TCallbacks.add(aCallBack: TCallBackEvent): TCallbacks;
begin

end;

function TCallbacks.add(aCallBack: array of TCallBack): TCallbacks;
begin

end;

function TCallbacks.add(aCallBack: TCallBack): TCallbacks;
begin

end;

function TCallbacks.add(aCallBack: array of TCallBackEvent): TCallbacks;
begin

end;

function TCallbacks.disable: TCallBacks;
begin

end;

function TCallbacks.disabled: Boolean;
begin

end;

function TCallbacks.empty: TCallBacks;
begin

end;

function TCallbacks.fire(arguments: JSValue): TCallbacks;
begin

end;

function TCallbacks.fired: Boolean;
begin

end;

function TCallbacks.fireWith(context, arguments: JSValue): TCallbacks;
begin

end;

function TCallbacks.has(aCallBack: TCallBack): Boolean;
begin

end;

function TCallbacks.has(aCallBack: TCallBackEvent): Boolean;
begin

end;

function TCallbacks.lock: TCallBacks;
begin

end;

function TCallbacks.locked: boolean;
begin

end;

function TCallbacks.remove(aCallBack: TCallBack): TCallbacks;
begin

end;

function TCallbacks.remove(aCallBack: array of TCallBackEvent): TCallbacks;
begin

end;

function TCallbacks.remove(aCallBack: TCallBackEvent): TCallbacks;
begin

end;

function TCallbacks.remove(aCallBack: array of TCallBack): TCallbacks;
begin

end;

{ TJQueryDeferred }

function TJQueryDeferred.done(
  aHandlers: array of TDeferredDoneHandler): TJQueryDeferred;
begin

end;

function TJQueryDeferred.done(aHandler: TDeferredDoneHandler): TJQueryDeferred;
begin

end;

{ TJQXHR }

procedure TJQXHR.abort;
begin

end;

procedure TJQXHR.abort(AStatusText: String);
begin

end;

procedure TJQXHR.always(aHandler: TJQXHRAlwaysHandler);
begin

end;

procedure TJQXHR.done(aHandler: TJQXHRDoneHandler);
begin

end;

procedure TJQXHR.fail(aHandler: TJQXHRFailHandler);
begin

end;

function TJQXHR.getAllResponseHeaders: String;
begin

end;

function TJQXHR.getResponseHeader(aName: string): String;
begin

end;

procedure TJQXHR.overrideMimeType(aType: String);
begin

end;

procedure TJQXHR.setRequestHeader(aName, AValue: string);
begin

end;

procedure TJQXHR._then(aSuccess: TJQXHRDoneHandler; aFail: TJQXHRFailHandler);
begin

end;

{ TJQuery }

function TJQuery.add(const aElement: TJSElement): TJQuery;
begin

end;

function TJQuery.add(const aElement: array of TJSElement): TJQuery;
begin

end;

function TJQuery.add(const aQuery: TJQuery): TJQuery;
begin

end;

function TJQuery.add(const aSelector: String; AContext: TJSElement): TJQuery;
begin

end;

function TJQuery.add(const aSelector: String): TJQuery;
begin

end;

function TJQuery.addBack: TJQuery;
begin

end;

function TJQuery.addBack(const aSelector: String): TJQuery;
begin

end;

function TJQuery.addClass(const aClass: String): TJQuery;
begin

end;

function TJQuery.addClass(
  const aClassFunction: TJQueryAddClassHandler): TJQuery;
begin

end;

class function TJQuery.ajax(aSettings: TJSAjaxSettings): tJQXHR;
begin

end;

class function TJQuery.ajax(aSettings: TJSObject): tJQXHR;
begin

end;

class function TJQuery.ajax(aURL: String; aSettings: TJSObject): tJQXHR;
begin

end;

function TJQuery.ajaxComplete(aHandler: TJQueryAjaxEventHandler): TJQuery;
begin

end;

function TJQuery.ajaxError(aHandler: TJQueryAjaxEventHandler): TJQuery;
begin

end;

class procedure TJQuery.ajaxPrefilter(dataTypes: string;
  aHandler: TJQueryAjaxPrefilterHandler);
begin

end;

function TJQuery.ajaxSend(aHandler: TJQueryAjaxEventHandler): TJQuery;
begin

end;

class procedure TJQuery.ajaxSetup(aSettings: TJSObject);
begin

end;

class procedure TJQuery.ajaxSetup(aSettings: TJSAjaxSettings);
begin

end;

function TJQuery.ajaxStart(aHandler: TJQueryAjaxHandler): TJQuery;
begin

end;

function TJQuery.ajaxStop(aHandler: TJQueryAjaxHandler): TJQuery;
begin

end;

function TJQuery.ajaxSuccess(aHandler: TJQueryAjaxEventHandler): TJQuery;
begin

end;

class procedure TJQuery.ajaxTransport(aDataType: string;
  AHandler: TJQueryAjaxTransportHandler);
begin

end;

function TJQuery.attr(const attributes: TJSObject): TJQuery;
begin

end;

function TJQuery.attr(const attributeName, Value: String): TJQuery;
begin

end;

function TJQuery.attr(const attributeName: string): string;
begin

end;

function TJQuery.attr(const attributeName: string;
  aHandler: TJQueryAttrHandler): TJQuery;
begin

end;

class function TJQuery.Callbacks: TCallbacks;
begin

end;

class function TJQuery.Callbacks(const aFlags: string): TCallbacks;
begin

end;

function TJQuery.children: TJQuery;
begin

end;

function TJQuery.children(const aSelector: String): TJQuery;
begin

end;

function TJQuery.clearQueue(const aQueueName: String): TJQuery;
begin

end;

function TJQuery.clearQueue: TJQuery;
begin

end;

function TJQuery.closest(const aSelector: String): TJQuery;
begin

end;

function TJQuery.closest(const aSelector: String;
  AContext: TJSElement): TJQuery;
begin

end;

function TJQuery.closest(const aQuery: TJQuery): TJQuery;
begin

end;

function TJQuery.closest(const aElement: TJSElement): TJQuery;
begin

end;

function TJQuery.contents: TJQuery;
begin

end;

function TJQuery.css(const aPropertyName: String; Avalue: Integer): TJQuery;
begin

end;

function TJQuery.css(const aPropertyName: String;
  AHandler: TJQueryCSSHandler): TJQuery;
begin

end;

function TJQuery.css(const aPropertyName, Avalue: String): TJQuery;
begin

end;

function TJQuery.css(const aPropertyName: TJSObject): string;
begin

end;

function TJQuery.css(const aPropertyName: String): string;
begin

end;

function TJQuery.css(const aPropertyNames: array of String): string;
begin

end;

class function TJQuery.data(aElement: TJSElement;
  const aKey: String): TJSObject;
begin

end;

class function TJQuery.data(aElement: TJSElement): TJSObject;
begin

end;

function TJQuery.data(aKey: String; aValue: JSValue): TJQuery;
begin

end;

function TJQuery.data(aObj: TJSObject): TJQuery;
begin

end;

class function TJQuery.data(aElement: TJSElement; const aKey: String;
  aValue: jsValue): TJSObject;
begin

end;

function TJQuery.data: TJSObject;
begin

end;

function TJQuery.data(aKey: String): TJSObject;
begin

end;

function TJQuery.dequeue: TJQuery;
begin

end;

function TJQuery.dequeue(const aQueueName: String): TJQuery;
begin

end;

class function TJQuery.dequeue(aElement: TJSElement;
  const aQueueName: String): TJQuery;
begin

end;

class function TJQuery.dequeue(aElement: TJSElement): TJQuery;
begin

end;

function TJQuery.each(aHandler: TJQueryEachHandler): TJQuery;
begin

end;

function TJQuery.eq(AIndex: Integer): TJQuery;
begin

end;

class function TJQuery.escapeSelector(const S: String): String;
begin

end;

function TJQuery.filter(const aElements: array of TJSElement): TJQuery;
begin

end;

function TJQuery.filter(const aElement: TJSElement): TJQuery;
begin

end;

function TJQuery.filter(const aQuery: TJQuery): TJQuery;
begin

end;

function TJQuery.filter(const aSelector: String): TJQuery;
begin

end;

function TJQuery.filter(aHandler: TJQueryFilterHandler): TJQuery;
begin

end;

function TJQuery.find(const aQuery: TJQuery): TJQuery;
begin

end;

function TJQuery.find(const aSelector: String): TJQuery;
begin

end;

function TJQuery.find(const aElement: TJSElement): TJQuery;
begin

end;

function TJQuery.first: TJQuery;
begin

end;

function TJQuery.get(aIndex: Integer): TJSElement;
begin

end;

class function TJQuery.get: TJQXHR;
begin

end;

class function TJQuery.get(url: String): TJQXHR;
begin

end;

class function TJQuery.get(url: String; Data: TJSObject): TJQXHR;
begin

end;

class function TJQuery.get(url: String; Data: TJSObject;
  success: TJQueryAjaxSuccessHandler): TJQXHR;
begin

end;

class function TJQuery.get(url, Data: String;
  success: TJQueryAjaxSuccessHandler): TJQXHR;
begin

end;

class function TJQuery.get(url, Data: String): TJQXHR;
begin

end;

class function TJQuery.get(url: String; Data: TJSObject;
  success: TJQueryAjaxSuccessHandler; aDataType: string): TJQXHR;
begin

end;

class function TJQuery.get(aSettings: TJSAjaxSettings): TJQXHR;
begin

end;

class function TJQuery.get(url, Data: String;
  success: TJQueryAjaxSuccessHandler; aDataType: string): TJQXHR;
begin

end;

class function TJQuery.get(aSettings: TJSObject): TJQXHR;
begin

end;

function TJQuery.getEl(aIndex: Integer): TJSElement;
begin

end;

class function TJQuery.getJSON(url, Data: String;
  success: TJQueryAjaxSuccessHandler): TJQXHR;
begin

end;

class function TJQuery.getJSON(url: String; Data: TJSObject;
  success: TJQueryAjaxSuccessHandler; aDataType: string): TJQXHR;
begin

end;

class function TJQuery.getJSON(url, Data: String;
  success: TJQueryAjaxSuccessHandler; aDataType: string): TJQXHR;
begin

end;

class function TJQuery.getJSON(url: String): TJQXHR;
begin

end;

class function TJQuery.getJSON(url: String; Data: TJSObject): TJQXHR;
begin

end;

class function TJQuery.getJSON(url: String; Data: TJSObject;
  success: TJQueryAjaxSuccessHandler): TJQXHR;
begin

end;

class function TJQuery.getJSON(url, Data: String): TJQXHR;
begin

end;

class function TJQuery.getScript(url: String): TJQXHR;
begin

end;

class function TJQuery.getScript(url: String;
  aSuccess: TJQueryAjaxScriptHandler): TJQXHR;
begin

end;

function TJQuery.has(const aQuery: TJQuery): TJQuery;
begin

end;

function TJQuery.has(const aSelector: String): TJQuery;
begin

end;

function TJQuery.hasClass(const aClassName: String): Boolean;
begin

end;

class function TJQuery.hasData(aElement: TJSElement): Boolean;
begin

end;

function TJQuery.height(aHandler: TJQueryHeightHandler): TJQuery;
begin

end;

function TJQuery.height(aValue: Integer): TJQuery;
begin

end;

function TJQuery.height: Integer;
begin

end;

function TJQuery.height(aValue: String): TJQuery;
begin

end;

function TJQuery.html(const aHandler: TJQueryHTMLHandler): TJQuery;
begin

end;

function TJQuery.html: String;
begin

end;

function TJQuery.html(const aHTML: String): TJQuery;
begin

end;

function TJQuery.innerHeight(aHandler: TJQueryHeightHandler): TJQuery;
begin

end;

function TJQuery.innerHeight: Integer;
begin

end;

function TJQuery.innerHeight(aValue: Integer): TJQuery;
begin

end;

function TJQuery.innerHeight(aValue: String): TJQuery;
begin

end;

function TJQuery.innerWidth: Integer;
begin

end;

function TJQuery.innerWidth(aValue: String): TJQuery;
begin

end;

function TJQuery.innerWidth(aHandler: TJQueryWidthHandler): TJQuery;
begin

end;

function TJQuery.innerWidth(aValue: Integer): TJQuery;
begin

end;

function TJQuery.last: TJQuery;
begin

end;

class function TJQuery.load(url: String): TJQXHR;
begin

end;

class function TJQuery.load(url, Data: String): TJQXHR;
begin

end;

class function TJQuery.load(url: String; Data: TJSObject): TJQXHR;
begin

end;

class function TJQuery.load(url: String; Data: TJSObject;
  success: TJQueryAjaxLoadHandler): TJQXHR;
begin

end;

class function TJQuery.load(url, Data: String;
  success: TJQueryAjaxLoadHandler): TJQXHR;
begin

end;

function TJQuery.map(aHandler: TJQueryMapHandler): TJQuery;
begin

end;

function TJQuery.next(const aSelector: String): TJQuery;
begin

end;

function TJQuery.next: TJQuery;
begin

end;

function TJQuery.nextAll(const aSelector: String): TJQuery;
begin

end;

function TJQuery.nextAll: TJQuery;
begin

end;

function TJQuery.nextUntil(const aElement: TJSElement;
  aFilter: String): TJQuery;
begin

end;

function TJQuery.nextUntil(const aQuery: TJQuery): TJQuery;
begin

end;

function TJQuery.nextUntil(const aQuery: TJQuery; aFilter: String): TJQuery;
begin

end;

function TJQuery.nextUntil(const aElement: TJSElement): TJQuery;
begin

end;

function TJQuery.nextUntil: TJQuery;
begin

end;

function TJQuery.nextUntil(const aSelector: String): TJQuery;
begin

end;

function TJQuery.nextUntil(const aSelector, aFilter: String): TJQuery;
begin

end;

function TJQuery.noConflict: TJSObject;
begin

end;

function TJQuery.noConflict(removeAll: Boolean): TJSObject;
begin

end;

function TJQuery.offSet(const aOffset: TJQueryTopLeft): TJQuery;
begin

end;

function TJQuery.offSet(aHandler: TJQueryOffsetHandler): TJQuery;
begin

end;

function TJQuery.offSet: Integer;
begin

end;

function TJQuery.offsetParent: TJQuery;
begin

end;

function TJQuery.On_(events, selector: String; data: JSValue;
  aHandler: TJSEventHandler): TJQuery;
begin

end;

function TJQuery.On_(events, selector: String;
  aHandler: TJSEventHandler): TJQuery;
begin

end;

function TJQuery.On_(events: String; aHandler: TJSEventHandler): TJQuery;
begin

end;

function TJQuery.On_(events: TJSObject): TJQuery;
begin

end;

function TJQuery.On_(events: TJSObject; data: JSValue): TJQuery;
begin

end;

function TJQuery.On_(events: TJSObject; selector: String;
  data: JSValue): TJQuery;
begin

end;

function TJQuery.outerHeight(aValue: String): TJQuery;
begin

end;

function TJQuery.outerHeight(aValue: Integer): TJQuery;
begin

end;

function TJQuery.outerHeight(aHandler: TJQueryHeightHandler): TJQuery;
begin

end;

function TJQuery.outerHeight(IncludeMargin: Boolean): Integer;
begin

end;

function TJQuery.outerHeight: Integer;
begin

end;

function TJQuery.outerWidth(aValue: Integer): TJQuery;
begin

end;

function TJQuery.outerWidth(aValue: String): TJQuery;
begin

end;

function TJQuery.outerWidth(aHandler: TJQueryWidthHandler): TJQuery;
begin

end;

function TJQuery.outerWidth(IncludeMargin: Boolean): Integer;
begin

end;

function TJQuery.outerWidth: Integer;
begin

end;

class function TJQuery.param(aObject: String; traditional: Boolean): String;
begin

end;

class function TJQuery.param(aObject: TJSObject; traditional: Boolean): String;
begin

end;

class function TJQuery.param(aObject: TJQuery; traditional: Boolean): String;
begin

end;

class function TJQuery.param(aObject: TJQuery): String;
begin

end;

class function TJQuery.param(aObject: String): String;
begin

end;

class function TJQuery.param(aObject: TJSObject): String;
begin

end;

function TJQuery.parent(const ASelector: String): TJQuery;
begin

end;

function TJQuery.parent: TJQuery;
begin

end;

function TJQuery.parents(const ASelector: String): TJQuery;
begin

end;

function TJQuery.parents: TJQuery;
begin

end;

function TJQuery.parentsUntil(const aElement: TJSElement;
  aFilter: String): TJQuery;
begin

end;

function TJQuery.parentsUntil(const aQuery: TJQuery): TJQuery;
begin

end;

function TJQuery.parentsUntil(const aQuery: TJQuery; aFilter: String): TJQuery;
begin

end;

function TJQuery.parentsUntil: TJQuery;
begin

end;

function TJQuery.parentsUntil(const aSelector: String): TJQuery;
begin

end;

function TJQuery.parentsUntil(const aElement: TJSElement): TJQuery;
begin

end;

function TJQuery.parentsUntil(const aSelector, aFilter: String): TJQuery;
begin

end;

function TJQuery.position: TJQueryTopLeft;
begin

end;

class function TJQuery.post(url, Data: String): TJQXHR;
begin

end;

class function TJQuery.post(url: String; Data: TJSObject): TJQXHR;
begin

end;

class function TJQuery.post(url: String; Data: TJSObject;
  success: TJQueryAjaxSuccessHandler; aDataType: string): TJQXHR;
begin

end;

class function TJQuery.post(url, Data: String;
  success: TJQueryAjaxSuccessHandler; aDataType: string): TJQXHR;
begin

end;

class function TJQuery.post(aSettings: TJSAjaxSettings): TJQXHR;
begin

end;

class function TJQuery.post(url, Data: String;
  success: TJQueryAjaxSuccessHandler): TJQXHR;
begin

end;

class function TJQuery.post(url: String; Data: TJSObject;
  success: TJQueryAjaxSuccessHandler): TJQXHR;
begin

end;

class function TJQuery.post(url: String): TJQXHR;
begin

end;

class function TJQuery.post(aSettings: TJSObject): TJQXHR;
begin

end;

function TJQuery.prepend(content: String): TJQuery;
begin

end;

function TJQuery.prepend(Content1, Content2: String): TJQuery;
begin

end;

function TJQuery.prepend(aHandler: TPrependCallback): TJQuery;
begin

end;

function TJQuery.prev: TJQuery;
begin

end;

function TJQuery.prev(const aSelector: String): TJQuery;
begin

end;

function TJQuery.prevAll: TJQuery;
begin

end;

function TJQuery.prevAll(const aSelector: String): TJQuery;
begin

end;

function TJQuery.prevUntil(const aSelector, aFilter: String): TJQuery;
begin

end;

function TJQuery.prevUntil(const aSelector: String): TJQuery;
begin

end;

function TJQuery.prevUntil: TJQuery;
begin

end;

function TJQuery.prevUntil(const aElement: TJSElement): TJQuery;
begin

end;

function TJQuery.prevUntil(const aQuery: TJQuery; aFilter: String): TJQuery;
begin

end;

function TJQuery.prevUntil(const aQuery: TJQuery): TJQuery;
begin

end;

function TJQuery.prevUntil(const aElement: TJSElement;
  aFilter: String): TJQuery;
begin

end;

function TJQuery.prop(const aPropertyName: String;
  aHandler: TJQueryPropHandler): TJQuery;
begin

end;

function TJQuery.prop(const TJSObject): TJQuery;
begin

end;

function TJQuery.prop(const aPropertyName: String; AValue: JSValue): TJQuery;
begin

end;

function TJQuery.prop(const aPropertyName: String): JSValue;
begin

end;

class function TJQuery.queue(element: TJSElement): TJSarray;
begin

end;

class function TJQuery.queue(element: TJSElement;
  const aQueueName: String): TJSarray;
begin

end;

function TJQuery.queue(anArray: TJSArray): TJQuery;
begin

end;

function TJQuery.queue(aQueueName: string; anArray: TJSarray): TJQuery;
begin

end;

function TJQuery.queue(aQueueName: string;
  aHandler: TJQueryAddQueueHandler): TJQuery;
begin

end;

function TJQuery.queue(aQueueName: string): TJSarray;
begin

end;

class function TJQuery.queue(element: TJSElement; const aQueueName: string;
  anewQueue: TJSarray): TJQuery;
begin

end;

class function TJQuery.queue(element: TJSElement; const aQueueName: String;
  aHandler: TJQueryQueueHandler): TJQuery;
begin

end;

function TJQuery.queue: TJSarray;
begin

end;

function TJQuery.remove(const Selector: string): TJQuery;
begin

end;

function TJQuery.remove: TJQuery;
begin

end;

function TJQuery.removeAttr(const attributeName: string): TJQuery;
begin

end;

function TJQuery.removeClass(
  const aClassFunction: TJQueryAddClassHandler): TJQuery;
begin

end;

function TJQuery.removeClass(const aClass: String): TJQuery;
begin

end;

class function TJQuery.removeData(aElement: TJSElement): TJQuery;
begin

end;

class function TJQuery.removeData(aElement: TJSElement;
  const aName: String): TJQuery;
begin

end;

function TJQuery.removeData: TJQuery;
begin

end;

function TJQuery.removeData(const aNames: array of string): TJQuery;
begin

end;

function TJQuery.removeData(const aName: string): TJQuery;
begin

end;

function TJQuery.removeProp(const aPropertyName: string): TJQuery;
begin

end;

function TJQuery.scrollLeft(aValue: Integer): TJQuery;
begin

end;

function TJQuery.scrollLeft: Integer;
begin

end;

function TJQuery.scrollTop: Integer;
begin

end;

function TJQuery.scrollTop(aValue: Integer): TJQuery;
begin

end;

function TJQuery.serialize: string;
begin

end;

function TJQuery.serializeArray: TJSObjectDynArrayArray;
begin

end;

function TJQuery.siblings: TJQuery;
begin

end;

function TJQuery.siblings(const aSelector: String): TJQuery;
begin

end;

function TJQuery.slice(aStart, aEnd: integer): TJQuery;
begin

end;

function TJQuery.slice(aStart: integer): TJQuery;
begin

end;

function TJQuery.sub: TJQuery;
begin

end;

function TJQuery.text(const aText: string): TJQuery;
begin

end;

function TJQuery.text: String;
begin

end;

function TJQuery.text(aHandler: TJQueryTextHandler): TJQuery;
begin

end;

function TJQuery.text(const aText: Boolean): TJQuery;
begin

end;

function TJQuery.text(const aText: Double): TJQuery;
begin

end;

function TJQuery.text(const aText: Integer): TJQuery;
begin

end;

function TJQuery.toggleClass(const aHandler: TJQueryToggleClassHandler;
  AState: Boolean): TJQuery;
begin

end;

function TJQuery.toggleClass(
  const aHandler: TJQueryToggleClassHandler): TJQuery;
begin

end;

function TJQuery.toggleClass(const aClass: String): TJQuery;
begin

end;

function TJQuery.toggleClass(const aClass: String; aState: Boolean): TJQuery;
begin

end;

function TJQuery.val(const aValue: String): TJQuery;
begin

end;

function TJQuery.val: JSValue;
begin

end;

function TJQuery.val(const aValue: Integer): TJQuery;
begin

end;

function TJQuery.val(const aValue: array of String): TJQuery;
begin

end;

function TJQuery.val(aHandler: TJQueryValHandler): TJQuery;
begin

end;

function TJQuery.when(APromise: TJSPromise): TJSPromise;
begin

end;

function TJQuery.when: TJSPromise;
begin

end;

function TJQuery.Width: Integer;
begin

end;

function TJQuery.Width(aHandler: TJQueryWidthHandler): TJQuery;
begin

end;

function TJQuery.Width(aValue: Integer): TJQuery;
begin

end;

function TJQuery.Width(aValue: String): TJQuery;
begin

end;

function TJQuery._end: TJQuery;
begin

end;

function TJQuery._is(aHandler: TJQueryFilterHandler): TJQuery;
begin

end;

function TJQuery._is(const aElement: TJSElement): TJQuery;
begin

end;

function TJQuery._is(const aQuery: TJQuery): TJQuery;
begin

end;

function TJQuery._is(const aElements: array of TJSElement): TJQuery;
begin

end;

function TJQuery._is(const aSelector: String): TJQuery;
begin

end;

function TJQuery._not(const aSelector: String): TJQuery;
begin

end;

function TJQuery._not(const aSelector: TJSElement): TJQuery;
begin

end;

function TJQuery._not(const aSelector: TJQueryFilterHandler): TJQuery;
begin

end;

function TJQuery._not(const aSelector: TJQuery): TJQuery;
begin

end;

function TJQuery._not(const aSelector: array of TJSElement): TJQuery;
begin

end;

end.

