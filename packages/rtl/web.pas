{
    This file is part of the Pas2JS run time library.
    Copyright (c) 2017-2020 by the Pas2JS development team.

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}
{$IFDEF PAS2JS}
{$modeswitch externalclass}
{$ENDIF}

unit Web;

interface

uses Types, JS;

Type
  TJSEvent = Class;
  // Forward definitions
  TJSWindow = class;
  TJSDOMTokenList = class;
  TJSXPathResult = CLass;
  TJSNodeList = class;
  TJSDocument = class;
  TJSElement = class;
  TJSCSSStyleSheet = Class;
  TJSNodeFilter = Class;
  TJSIDBObjectStore = Class;
  TIDBDatabase = class;
  TJSIDBRequest = class;
  TJSEventTarget = class;
  TJSMouseEvent = Class;
  TJSWheelEvent = Class;
  TJSKeyBoardEvent = class;
  TJSPointerEvent = Class;
  TJSUIEvent = class;
  TJSTouchEvent = Class;

  { TEventListenerEvent }

  TEventListenerEvent = TJSEvent;

  TJSEventHandler = reference to function(Event: TEventListenerEvent): boolean; {$IFDEF PAS2JS}{$IFDEF PAS2JS}safecall;{$ENDIF}{$ENDIF}
  TJSRawEventHandler = reference to Procedure(Event: TJSEvent);{$IFDEF PAS2JS}{$IFDEF PAS2JS}safecall;{$ENDIF}{$ENDIF}

  TJSEventTarget = class {$IFDEF PAS2JS}external name 'EventTarget' (TJSObject) {$ENDIF}
  public
    procedure addEventListener(aname : string; aListener : TJSEventHandler); overload;
    procedure addEventListener(aname : string; aListener : TJSRawEventHandler); overload;
    procedure addEventListener(aname : string; aListener : JSValue); overload;
    function dispatchEvent(event : JSValue) : Boolean;
    procedure removeEventListener(aname : string; aListener : TJSEventHandler); overload;
    procedure removeEventListener(aname : string; aListener : TJSRawEventHandler); overload;
    procedure removeEventListener(aname : string; aListener : JSValue); overload;
  end;

  TJSNode = class {$IFDEF PAS2JS}external name 'Node' (TJSEventTarget){$ENDIF}
  Private
    FBaseURI : String; {$IFDEF PAS2JS} external name 'baseURI';{$ENDIF}
    FChildNodes: TJSNodeList; {$IFDEF PAS2JS} external name 'childNodes';{$ENDIF}
    FFirstChild : TJSNode; {$IFDEF PAS2JS} external name 'firstChild';{$ENDIF}
    FNextSibling : TJSNode; {$IFDEF PAS2JS} external name 'nextSibling';{$ENDIF}
    FNodeName : String; {$IFDEF PAS2JS} external name 'nodeName';{$ENDIF}
    FNodeType : NativeInt; {$IFDEF PAS2JS} external name 'nodeType';{$ENDIF}
    FOwnerDocument : TJSDocument; {$IFDEF PAS2JS} external name 'ownerDocument';{$ENDIF}
    FParentElement : TJSElement; {$IFDEF PAS2JS} external name 'parentElement';{$ENDIF}
    FParentNode : TJSNode; {$IFDEF PAS2JS} external name 'parentNode';{$ENDIF}
    FPreviousSibling : TJSNode; {$IFDEF PAS2JS} external name 'previousSibling';{$ENDIF}
  Public 
    Const
      ELEMENT_NODE 	=1;
      TEXT_NODE 	=3;
      PROCESSING_INSTRUCTION_NODE = 	7;
      COMMENT_NODE 	=8;
      DOCUMENT_NODE 	=9;
      DOCUMENT_TYPE_NODE 	= 10;
      DOCUMENT_FRAGMENT_NODE  = 11;

      DOCUMENT_POSITION_DISCONNECTED 	= 1;
      DOCUMENT_POSITION_PRECEDING 	= 2;
      DOCUMENT_POSITION_FOLLOWING 	= 4;
      DOCUMENT_POSITION_CONTAINS 	= 8;
      DOCUMENT_POSITION_CONTAINED_BY 	= 16;
      DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC = 32;
  Public  
    nodeValue: string;
    innerText : string;
    textContent : string;
    function appendChild(aChild : TJSNode) : TJSNode;
    function cloneNode(deep:  boolean): TJSNode;
    function compareDocumentPosition(aNode : TJSNode) : NativeInt;
    function contains(aNode : TJSNode) : boolean;
    function hasChildNodes : boolean;
    function insertBefore(newNode, referenceNode : TJSNode) : TJSNode;
    function isDefaultNameSpace(aNameSpaceURI : String) : Boolean;
    function isEqualNode(aNode : TJSNode) : boolean;
    function isSameNode(aNode : TJSNode) : boolean;
    function lookupNamespaceURI(aPrefix : string) : string;
    function lookupPrefix(aPrefix : string) : string;
    procedure normalize;
    function removeChild(aChild: TJSNode) : TJSNode;
    function replaceChild(aNewChild, aOldChild : TJSNode) : TJSNode;
    property baseURI : string read FBaseURI;
    property childNodes : TJSNodeList read FChildNodes;
    property firstChild : TJSNode Read FFirstChild;
    property nextSibling : TJSNode Read FNextSibling;
    property nodeName : String Read FNodeName;
    property nodeType : NativeInt Read FNodeType;
    property ownerDocument : TJSDocument read FOwnerDocument;    
    property parentElement : TJSElement read FParentElement;
    property parentNode : TJSNode read FParentNode;
    property previousSibling : TJSNode Read FPreviousSibling;
  end;


  TJSNodeListCallBack = procedure (currentValue : TJSNode; currentIndex: NativeInt; list : TJSNodeList);
  TJSNodeListEvent = procedure (currentValue : TJSNode; currentIndex: NativeInt; list : TJSNodeList) of object;
  
  TJSNodeList = class {$IFDEF PAS2JS}external name 'NodeList' (TJSObject){$ENDIF}
  Private
    FLength : NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
  Public
    procedure forEach(const aCallBack : TJSNodeListCallBack); overload;
    procedure forEach(const aCallBack : TJSNodeListEvent); overload;
    function item(aIndex : NativeInt) : TJSNode;
    Property length : NativeInt Read FLength;
    Property Nodes [aIndex : NativeInt] : TJSNode Read item; default;
  end;

  TJSAttr = class {$IFDEF PAS2JS}external name 'Attr' (TJSNode){$ENDIF}
  Private
    fLocalName : String; {$IFDEF PAS2JS} external name 'localName';{$ENDIF}
    fNameSpaceURI : String; {$IFDEF PAS2JS} external name 'namespaceURI';{$ENDIF}
    fPrefix : string; {$IFDEF PAS2JS} external name 'prefix';{$ENDIF}
    fName : string; {$IFDEF PAS2JS} external name 'name';{$ENDIF}
    fSpecified : Boolean; {$IFDEF PAS2JS} external name 'specified';{$ENDIF}
  public
    value : JSValue;
    property localName : String Read fLocalName;
    property namespaceURI : string Read fNameSpaceURI;
    property prefix : string read fPrefix;
    property name : string Read fName;
    property specified : boolean Read fSpecified; // Useless, always true
  end;


  TJSNamedNodeMap = class {$IFDEF PAS2JS}external name 'NamedNodeMap'  (TJSObject){$ENDIF}
  Public
    function getNamedItem(aName : string) : TJSAttr;
    Property Attrs[aIndex : String] : TJSattr Read getNamedItem; default;
  end;

  TJSHTMLCollection = class {$IFDEF PAS2JS}external name 'HTMLCollection'  (TJSObject){$ENDIF}
  Private
    FLength : NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
  public
    Function item(aIndex : Integer) : TJSNode;
    Function namedItem(aName : string) : TJSNode;
    property Items[aIndex : Integer] : TJSNode Read item; default;
    property NamedItems[aName : String] : TJSNode Read namedItem; 
    Property length : NativeInt Read FLength;
  end;  
  
  TJSDOMString = String;

  TDOMTokenlistCallBack = Procedure (Current : JSValue; currentIndex : NativeInt; list : TJSDOMTokenList);
  
  // Interface
  TJSDOMTokenList = class {$IFDEF PAS2JS}external name 'DOMTokenList'  (TJSObject){$ENDIF}
  Private
    FLength : NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
  public
    Procedure add(aToken : TJSDOMString); {$IFDEF PAS2JS}{$IFDEF PAS2JS}varargs;{$ENDIF}{$ENDIF} overload;
    Procedure remove(aToken : TJSDOMString); {$IFDEF PAS2JS}{$IFDEF PAS2JS}varargs;{$ENDIF}{$ENDIF}
    function item(aIndex : NativeInt) : String;
    function contains(aToken : TJSDOMString) : Boolean;
    Procedure replace(aOldToken, ANewToken : TJSDOMString);
    function supports(aToken : TJSDOMString) : Boolean;
    function toggle(aToken : TJSDOMString) : Boolean;
    // entries,keys, values
    procedure forEach(const callback: TDOMTokenlistCallBack);
    property length : NativeInt read FLength;
  end;

  TJSDOMRect = class {$IFDEF PAS2JS}external name 'DOMRect'  (TJSObject){$ENDIF}
  public
    left,top,right,bottom,x,y,width,height : double;
    {$IFDEF FIREFOX}
    constructor New;
    {$ENDIF}
  end;
  TJSClientRect = record
    left,top,right,bottom : double;
    {$IFDEF FIREFOX}
    width, height: double;
    {$ENDIF}
  end;
  
  TJSClientRectArray = array of TJSClientRect;
  
  TJSElement = class {$IFDEF PAS2JS}external name 'Element' (TJSNode){$ENDIF}
  Private
    FAttributes : TJSNamedNodeMap; {$IFDEF PAS2JS} external name 'attributes';{$ENDIF}
    FChildElementCount : NativeInt; {$IFDEF PAS2JS} external name 'childElementCount';{$ENDIF}
    FChildren : TJSHTMLCollection; {$IFDEF PAS2JS} external name 'children';{$ENDIF}
    FClassList : TJSDOMTokenList; {$IFDEF PAS2JS} external name 'classList';{$ENDIF}
    FCLientHeight : NativeInt; {$IFDEF PAS2JS} external name 'clientHeight';{$ENDIF}
    FCLientLeft : NativeInt; {$IFDEF PAS2JS} external name 'clientLeft';{$ENDIF}
    FCLientTop : NativeInt; {$IFDEF PAS2JS} external name 'clientTop';{$ENDIF}
    FCLientWidth : NativeInt; {$IFDEF PAS2JS} external name 'clientWidth';{$ENDIF}
    FFirstElementChild : TJSElement; {$IFDEF PAS2JS} external name 'firstElementChild';{$ENDIF}
    FLastElementChild : TJSElement; {$IFDEF PAS2JS} external name 'lastElementChild';{$ENDIF}
    FLocalName : string; {$IFDEF PAS2JS} external name 'localName';{$ENDIF}
    FNameSpaceURI : String; {$IFDEF PAS2JS} external name 'namespaceURI';{$ENDIF}
    FNextElementSibling : TJSElement; {$IFDEF PAS2JS} external name 'nextElementSibling';{$ENDIF}
    FPreviousElementSibling : TJSElement; {$IFDEF PAS2JS} external name 'previousElementSibling';{$ENDIF}
    FPrefix : String; {$IFDEF PAS2JS} external name 'prefix';{$ENDIF}
    FScrollHeight : NativeInt; {$IFDEF PAS2JS} external name 'scrollHeight';{$ENDIF}
{$IFDEF FIREFOX}
    FScrollLeftMax : NativeInt; {$IFDEF PAS2JS} external name 'scrollLeftMax';{$ENDIF}
    FScrollTopMax : NativeInt; {$IFDEF PAS2JS} external name 'scrollTopMax';{$ENDIF}
{$endif}
    FScrollWidth : NativeInt; {$IFDEF PAS2JS} external name 'scrollWidth';{$ENDIF}
    FTagName : string; {$IFDEF PAS2JS} external name 'tagName';{$ENDIF}
  Public
    name : string;
    className : string;
    id : string;
    innerHTML : String;
    outerHTML : string;
    scrollLeft : NativeInt;
    scrollTop : NativeInt;
    procedure append(aText : String); overload;
    procedure append(aNode : TJSElement); overload;
    procedure append(aText : String; aNode : TJSElement); {$IFDEF PAS2JS}varargs;{$ENDIF} overload;
    procedure append(aNode1,aNode2: TJSElement); {$IFDEF PAS2JS}varargs;{$ENDIF} overload;
    function getAttribute(aName : string) : string;
    function getAttributeNode(aName : string) : TJSAttr;
    function getAttributeNodeNS(aNameSpace, aName : string) : TJSAttr;
    function getAttributeNS(aNameSpace, aName : string) : string;
    function getBoundingClientRect : TJSDOMRect;
    function getClientRects : TJSClientRectArray;
    function getElementsByClassName(aClassName: string) : TJSHTMLCollection;
    function getElementsByTagNameNS(aNameSpace, aTagName : String): TJSHTMLCollection;
    function getElementsByTagName(aTagName : String): TJSHTMLCollection;
    function hasAttribute(aName : String) : Boolean;
    function hasAttributeNS(aNameSpace,aName : String) : Boolean;
    function hasAttributes : Boolean;
    function insertAdjacentElement(aPosition : string; aElement : TJSElement) : TJSElement;
    procedure insertAdjacentHTML(aPosition,aHTML : string);
    procedure insertAdjacentText(aPosition,aText : string);
    function matches(aSelectorString : String) : Boolean;
    function querySelector(aSelectors : String) : TJSElement;
    function querySelectorAll(aSelectors : String) : TJSNodeList;
    procedure releasePointerCapture(evID : JSValue);
    procedure removeAttribute(aName: string);
    procedure removeAttributeNS(aNameSpace,aName: string);
    function removeAttributeNode(aAttr : TJSAttr) : TJSAttr;
    procedure setAttribute(aName : string; AValue : String);
    function setAttributeNode(aNode: TJSAttr) : TJSAttr;
    function setAttributeNodeNS(aNode: TJSAttr) : TJSAttr;
    procedure setAttributeNS(aNameSpace,aName : string; AValue : String);
    procedure setCapture(retargetToElement : Boolean);
    procedure setPointerCapture(pointerID : JSValue);
    procedure requestFullScreen;    
    Property attributes : TJSNamedNodeMap read FAttributes;
    Property childElementCount : NativeInt Read FChildElementCount;
    Property children : TJSHTMLCollection Read FChildren;
    Property classList : TJSDOMTokenList read FClassList;
    property clientHeight : NativeInt read FClientHeight;
    property clientLeft : NativeInt read FClientLeft;
    property clientTop : NativeInt read FClientTop;
    property clientWidth : NativeInt read FClientWidth;
    property firstElementChild : TJSElement Read FFirstElementChild;
    property lastElementChild : TJSElement Read FLastElementChild;
    property localName : string Read FLocalName;
    property namespaceURI : String read FNameSpaceURI;
    property nextElementSibling : TJSElement Read FNextElementSibling;
    property previousElementSibling : TJSElement Read FPreviousElementSibling;
    property prefix : String read FPrefix;
    property scrollHeight : NativeInt Read FScrollHeight;
{$IFDEF FIREFOX}
    property scrollLeftMax  : NativeInt Read FScrollLeftMax;
    property scrollTopMax  : NativeInt Read FScrollTopMax;
{$ENDIF}
    property scrollWidth : NativeInt Read FScrollWidth;
    property tagName : String read FTagName;
    Property Attrs[aName : string] : String read getAttribute write setAttribute; default;
  end;
  TJSElementCreationOptions = record
    named : string;
  end;
 
  TJSDocumentType = class {$IFDEF PAS2JS}external name 'DocumentType' (TJSNode){$ENDIF}
  private
    FName : String; {$IFDEF PAS2JS} external name 'name';{$ENDIF}
    FPublicID : String; {$IFDEF PAS2JS} external name 'publicId';{$ENDIF}
    FSystemID : String; {$IFDEF PAS2JS} external name 'systemId';{$ENDIF}
  public
    property name : String read FName;
    property publicId : String Read FPublicID;
    property systemId : String read FSystemID;
  end;

  TJSDOMImplementation  = class {$IFDEF PAS2JS}external name 'DocumentImplementation'  (TJSObject){$ENDIF}
  Public  
    function createDocument(aNamespaceURI, aQualifiedNameStr : String; aDocumentType : TJSDocumentType) : TJSDocument;
    function createDocumentType(aQualifiedNameStr,aPublicId,aSystemId : String) : TJSDocumentType;
    function createHTMLDocument(aTitle : String) : TJSDocument;
  end;

  TJSLocation = class {$IFDEF PAS2JS}external name 'Location'  (TJSObject){$ENDIF}
  Private
    FOrigin : string; {$IFDEF PAS2JS} external name 'origin';{$ENDIF}
  Public
    hash : string;
    host : string;
    hostname : string;
    href : string;
    password : string;
    pathname : string;
    port : string;
    protocol : string;
    search : string;
    username : string;
    procedure assign(aURL : String); overload;
    procedure reload(aForce : Boolean);
    procedure replace(aURL : String);
    property origin : string read FOrigin;
  end;
  
  TJSStyleSheet = class {$IFDEF PAS2JS}external name 'StyleSheet' (TJSEventTarget){$ENDIF}
  Private
    FHRef : String; {$IFDEF PAS2JS} external name 'href';{$ENDIF}
    FOwnerNode : TJSNode; {$IFDEF PAS2JS} external name 'ownerNode';{$ENDIF}
    FParentStyleSheet : TJSStyleSheet; {$IFDEF PAS2JS} external name 'parentStyleSheet';{$ENDIF}
    FTitle : String; {$IFDEF PAS2JS} external name 'title';{$ENDIF}
    FType : String; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
  Public
    disabled : String;
    Property href : String read FHRef;
    property ownerNode : TJSNode Read FOwnerNode;
    property parentStyleSheet : TJSStyleSheet read FParentStyleSheet;
    property title : string Read FTitle;
    property _type : String read FType;
  end;


  TJSCSSRule = class {$IFDEF PAS2JS}external name 'CSSRule'  (TJSObject){$ENDIF}
  Private
    FCSSText : String; {$IFDEF PAS2JS} external name 'cssText';{$ENDIF}
    FParentStyleSheet : TJSCSSStyleSheet; {$IFDEF PAS2JS} external name 'parentStyleSheet';{$ENDIF}
    FparentRule : TJSCSSRule; {$IFDEF PAS2JS} external name 'parentRule';{$ENDIF}
  Public
    property cssText : String Read FCSSText;
    property parentRule : TJSCSSRule read FparentRule;
    property parentStyleSheet : TJSCSSStyleSheet Read FParentStyleSheet;
  end;
  
  TJSCSSRuleList = class {$IFDEF PAS2JS}external name 'CSSRuleList'  (TJSObject){$ENDIF}
  Private
    FLength : NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
  Public
    function item(index : NativeInt) : TJSCSSRule;
    property length : NativeInt Read FLength;
    Property items[aIndex : NativeInt] : TJSCSSRule read item; default;
  end;
  
  
  TJSCSSStyleSheet = class {$IFDEF PAS2JS}external name 'CSSStyleSheet' (TJSStyleSheet){$ENDIF}
  Private
    FCSSRules : TJSCSSRuleList; {$IFDEF PAS2JS} external name 'cssRules';{$ENDIF}
  Public
    procedure deleteRule(aIndex : NativeInt);
    function insertRule(aRule : String; aIndex : NativeInt) : NativeInt;
    Property cssRules : TJSCSSRuleList read FCSSRules;
  end;

  TJSStyleSheetList = class {$IFDEF PAS2JS}external name 'StyleSheetList'  (TJSObject){$ENDIF}
  Private
    FLength : NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
  Public
    function item(index : NativeInt) : TJSStyleSheet;
    property length : NativeInt Read FLength;
    Property items[aIndex : NativeInt] : TJSStyleSheet read item; default;
  end;

  { TJSDocumentFragment }

  TJSDocumentFragment = class {$IFDEF PAS2JS}external name 'DocumentFragment' (TJSNode){$ENDIF}
  private
    FchildElementCount: Integer; {$IFDEF PAS2JS} external name 'childElementCount';{$ENDIF}
    Fchildren: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'children';{$ENDIF}
    FfirstElementChild: TJSElement; {$IFDEF PAS2JS} external name 'firstElementChild';{$ENDIF}
    FlastElementChild: TJSElement; {$IFDEF PAS2JS} external name 'lastElementChild';{$ENDIF}
  public
    constructor new;
    function querySelector(aSelector : String) : TJSElement;
    function querySelectorAll(aSelector : String) : TJSNodeList;
    property childElementCount : Integer read FchildElementCount;
    property children : TJSHTMLCollection read Fchildren;
    property firstElementChild : TJSElement read FfirstElementChild;
    property lastElementChild : TJSElement read FlastElementChild;
  end;

  TJSEventInit = record
    bubbles : boolean;
    cancelable : boolean;
    scoped : boolean;
    composed : boolean;
  end;

  TJSEvent = class {$IFDEF PAS2JS}external name 'Event'  (TJSObject){$ENDIF}
  Private
    FBubbles : Boolean; {$IFDEF PAS2JS} external name 'bubbles';{$ENDIF}
    FCancelable : Boolean; {$IFDEF PAS2JS} external name 'cancelable';{$ENDIF}
    FComposed : Boolean; {$IFDEF PAS2JS} external name 'composed';{$ENDIF}
    FCurrentTarget : TJSEventTarget; {$IFDEF PAS2JS} external name 'currentTarget';{$ENDIF}
    FCurrentTargetElement : TJSElement; {$IFDEF PAS2JS} external name 'currentTarget';{$ENDIF}
    FdefaultPrevented : Boolean; {$IFDEF PAS2JS} external name 'defaultPrevented';{$ENDIF}
    FEventPhase : NativeInt; {$IFDEF PAS2JS} external name 'eventPhase';{$ENDIF}
    FTarget : TJSEventTarget; {$IFDEF PAS2JS} external name 'target';{$ENDIF}
    FTargetElement : TJSElement; {$IFDEF PAS2JS} external name 'target';{$ENDIF}
    FTimeStamp : NativeInt; {$IFDEF PAS2JS} external name 'timestamp';{$ENDIF}
    FType : String; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    FIsTrusted : Boolean; {$IFDEF PAS2JS} external name 'isTrusted';{$ENDIF}
  Public
    Const
      NONE = 0;
      CAPTURING_PHASE = 1;
      AT_TARGET  = 2;
      BUBBLING_PHASE = 3;
  public    
    cancelBubble : Boolean;
    constructor new (aType : String; const aInit : TJSEventInit); overload;
    constructor new (aType : String); overload;
    procedure preventDefault;
    procedure stopImmediatePropagation;
    procedure stopPropagation;
    Property bubbles : Boolean Read FBubbles;
    Property cancelable : Boolean Read FCancelable;
    Property composed : Boolean Read FComposed;
    property currentTarget : TJSEventTarget Read FCurrentTarget;
    property currentTargetElement : TJSElement Read FCurrentTargetElement;
    property defaultPrevented : Boolean Read FdefaultPrevented;
    property eventPhase : NativeInt Read FEventPhase;
    property target : TJSEventTarget Read FTarget;
    property targetElement : TJSElement Read FTargetElement;
    Property timestamp : NativeInt Read FTimeStamp;
    property _type : string read FType;
    property isTrusted : Boolean Read FIsTrusted;
  end;


  TJSXPathExpression = class {$IFDEF PAS2JS}external name 'XPathExpression'  (TJSObject){$ENDIF}
  Public
    function evaluate(contextNode : TJSNode; aType : NativeInt; aResult : TJSXPathResult) : TJSXPathResult;
    function evaluateWithContext(contextNode : TJSNode; aPosition, aSize, aType : NativeInt; aResult : TJSXPathResult) : TJSXPathResult;
  end;

  TJSXPathNSResolver = class {$IFDEF PAS2JS}external name 'XPathNSResolver'  (TJSObject){$ENDIF}
  Public
    function lookupNamespaceURI(prefix : string) : string;
  end;

  { TJSCharacterData }

  TJSCharacterData = class {$IFDEF PAS2JS}external name 'CharacterData' (TJSNode){$ENDIF}
  private
    FnextElementSibling: TJSElement; {$IFDEF PAS2JS} external name 'nextElementSibling';{$ENDIF}
    FpreviousElementSibling: TJSElement; {$IFDEF PAS2JS} external name 'previousElementSibling';{$ENDIF}
  public
    property nextElementSibling : TJSElement read FnextElementSibling;
    property previousElementSibling : TJSElement read FpreviousElementSibling;
  end;

  TJSProcessingInstruction = class {$IFDEF PAS2JS}external name 'ProcessingInstruction' (TJSCharacterData);{$ENDIF}
  end;

  { TJSRange }

  TJSRange = class {$IFDEF PAS2JS}external name 'Range'  (TJSObject){$ENDIF}
  private
    FCollapsed: boolean; {$IFDEF PAS2JS} external name 'collapsed';{$ENDIF}
    FcommonAncestorContainer: TJSNode; {$IFDEF PAS2JS} external name 'commonAncestorContainer';{$ENDIF}
    FendContainer: TJSNode; {$IFDEF PAS2JS} external name 'endContainer';{$ENDIF}
    FEndOffset: NativeInt; {$IFDEF PAS2JS} external name 'endOffset';{$ENDIF}
    FstartContainer: TJSNode; {$IFDEF PAS2JS} external name 'startContainer';{$ENDIF}
    FstartOffset: NativeInt; {$IFDEF PAS2JS} external name 'startOffset';{$ENDIF}
  Public
    const
      END_TO_END     = 0;
      END_TO_START   = 1;
      START_TO_END   = 2;
      START_TO_START = 3;
  Public
    constructor new;
    function cloneContents : TJSDocumentFragment;
    function cloneRange : TJSRange;
    procedure collapse;
    function compareBoundaryPoints(aHow : NativeInt) : NativeInt;
    function createContextualFragment(aTagstring : String) : TJSDocumentFragment;
    procedure deleteContents;
    procedure detach;
    function extractContents : TJSDocumentFragment;
    procedure insertNode(aNode : TJSNode);
    procedure selectNode(aNode : TJSNode);
    procedure selectNodeContents(aNode : TJSNode);
    procedure setEnd(aEndNode : TJSNode; aEndOffset : NativeInt); 
    procedure setEndAfter(aEndNode : TJSNode);
    procedure setEndBefore(aEndNode : TJSNode);
    procedure setStart(aStartNode : TJSNode; aStartOffset : NativeInt); 
    procedure setStartAfter(aStartNode : TJSNode);
    procedure setStartBefore(aStartNode : TJSNode);
    procedure surroundContents(aNode : TJSNode);
    property collapsed : boolean read FCollapsed;
    property commonAncestorContainer : TJSNode read FcommonAncestorContainer ;
    property endContainer : TJSNode read FendContainer;
    property endOffset : NativeInt Read FEndOffset;
    property startContainer : TJSNode read FstartContainer;
    property startOffset : NativeInt Read FstartOffset;
  end;


  { TJSTreeWalker }

  TJSTreeWalker = class {$IFDEF PAS2JS}external name 'TreeWalker' (TJSObject){$ENDIF}
  private
    FCurrentNode: TJSNode; {$IFDEF PAS2JS} external name 'currentNode';{$ENDIF}
    FexpandEntityReference: Boolean; {$IFDEF PAS2JS} external name 'expandEntityReference';{$ENDIF}
    FFilter: TJSNodeFilter; {$IFDEF PAS2JS} external name 'filter';{$ENDIF}
    FRoot: TJSNode; {$IFDEF PAS2JS} external name 'root';{$ENDIF}
    FWhatToShow: NativeInt; {$IFDEF PAS2JS} external name 'whatToShow';{$ENDIF}
  Public
    function firstChild : TJSNode;
    function lastChild : TJSNode;
    function nextNode : TJSNode;
    function nextSibling : TJSNode;
    function parentNode : TJSNode;
    function previousNode : TJSNode;
    function previousSibling : TJSNode;

    property root : TJSNode read FRoot;
    property whatToShow : NativeInt read FWhatToShow;
    property filter : TJSNodeFilter Read FFilter;
    property expandEntityReference : Boolean Read FexpandEntityReference;
    property currentNode : TJSNode Read FCurrentNode;
  end;

  TJSNodeFilter = class {$IFDEF PAS2JS}external name 'NodeFilter'  (TJSObject){$ENDIF}
    const
      SHOW_ALL                    = -1;
      SHOW_ATTRIBUTE              = 2;
      SHOW_CDATA_SECTION          = 8;
      SHOW_COMMENT                = 128;
      SHOW_DOCUMENT               = 256;
      SHOW_DOCUMENT_FRAGMENT      = 1024;
      SHOW_DOCUMENT_TYPE          = 512;
      SHOW_ELEMENT                = 1;
      SHOW_ENTITY                 = 32;
      SHOW_ENTITY_REFERENCE       = 16;
      SHOW_NOTATION               = 2048;
      SHOW_PROCESSING_INSTRUCTION = 64;
      SHOW_TEXT                   = 4;
    function acceptNode (aNode : TJSNode) : NativeInt;
  end;

  TJSXPathResult = class {$IFDEF PAS2JS}external name 'XPathResult'  (TJSObject){$ENDIF}
  private
    FBooleanValue : Boolean; {$IFDEF PAS2JS} external name 'booleanValue';{$ENDIF}
    FNumberValue : Double; {$IFDEF PAS2JS} external name 'numberValue';{$ENDIF}
    FResultType : NativeInt; {$IFDEF PAS2JS} external name 'resultType';{$ENDIF}
    FSingleNodeValue : TJSNode; {$IFDEF PAS2JS} external name 'singleNodeValue';{$ENDIF}
    FSnaphotLength : NativeInt; {$IFDEF PAS2JS} external name 'snapshotLength';{$ENDIF}
    FStringValue : String; {$IFDEF PAS2JS} external name 'stringValue';{$ENDIF}
  public  
    Function iterateNext : TJSNode;
    Function snapshotItem(Index: NativeInt) : TJSNode;
    Property booleanValue : Boolean Read FBooleanValue;
    Property numberValue : Double Read FNumberValue;
    property resultType : NativeInt Read FResultType;
    Property singleNodeValue : TJSNode Read FSingleNodeValue;
    property snapshotLength : NativeInt read FSnaphotLength;
    property stringValue : String Read FStringValue;
  end;

  TJSSelection = class {$IFDEF PAS2JS}external name 'Selection'  (TJSObject){$ENDIF}
  Private
    FanchorNode : TJSNode ; {$IFDEF PAS2JS} external name 'anchorNode';{$ENDIF}
    FanchorOffset : NativeInt ; {$IFDEF PAS2JS} external name 'anchorOffset';{$ENDIF}
    FfocusNode : TJSNode ; {$IFDEF PAS2JS} external name 'focusNode';{$ENDIF}
    FfocusOffset : NativeInt ; {$IFDEF PAS2JS} external name 'focusOffset';{$ENDIF}
    FisCollapsed : Boolean ; {$IFDEF PAS2JS} external name 'isCollapsed';{$ENDIF}
    FrangeCount : NativeInt ; {$IFDEF PAS2JS} external name 'rangeCount';{$ENDIF}
    Ftype : String ; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
  Public
    function getRangeAt(aIndex : NativeInt) : TJSRange;
    procedure collapse(aParentNode : TJSNode; Offset : NativeInt);
    procedure extend(aParentNode : TJSNode; Offset : NativeInt);
    procedure collapseToStart;
    procedure collapseToEnd;
    procedure selectAllChildren(aParentNode : TJSNode);
    procedure addRange(aRange : TJSRange);
    procedure removeRange(aRange : TJSRange);
    procedure removeAllRanges;
    procedure deleteFromDocument;
    function containsNode(aNode : TJSNode; aPartlyContained : Boolean) : Boolean;
    procedure setBaseAndExtent(aAnchorNode : TJSNode; aAnchorOffset : NativeInt; aFocusNode : TJSNode; aFocusOffset : NativeInt);
    property anchorNode : TJSNode read FAnchorNode;
    property anchorOffset : NativeInt read FAnchorOffset;
    property focusNode : TJSNode read FFocusNode;
    property focusOffset : NativeInt read FFocusOffset;
    property isCollapsed : Boolean read FIsCollapsed;
    property rangeCount : NativeInt read FRangeCount;
    property _type : String Read FType;
  end;
  TJSNameSpaceMapperCallback = function (aNameSpace : string ) : String;

  TJSHTMLFile = class;
  TJSHTMLFileList = Class;

  { TJSDataTransferItem }

  TJSDataTransferItemCallBack = reference to Procedure(aData : String); {$IFDEF PAS2JS}{$IFDEF PAS2JS}safecall;{$ENDIF}{$ENDIF}

  TJSDataTransferItem = class {$IFDEF PAS2JS}external name 'DataTransferItem'  (TJSObject){$ENDIF}
  private
    FKind: String; {$IFDEF PAS2JS} external name 'kind';{$ENDIF}
    FType: string; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
  Public
    function getAsFile : TJSHTMLFile;
    Procedure getAsString(aCallBack : TJSDataTransferItemCallBack);
    property Kind : String read FKind;
    property _Type : string read FType;
  end;

  TJSDataTransferItemList = class {$IFDEF PAS2JS}external name 'DataTransferItemList'  (TJSObject){$ENDIF}
  private
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
    function getitem(aIndex : nativeInt) : TJSDataTransferItem ; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  Public
    Function add(aData : string; AType: string) : TJSDataTransferItem; overload;
    Function add(aFile : TJSHTMLFile) : TJSDataTransferItem; overload;
    Procedure clear;
    procedure remove(aIndex : integer);
    property length : NativeInt read FLength;
    property Items[aIndex : NativeInt] : TJSDataTransferItem Read getitem; default;
  end;

  { TJSDataTransfer }

  TJSDataTransfer = class {$IFDEF PAS2JS}external name 'DataTransfer'  (TJSObject){$ENDIF}
  private
    FFiles: TJSHTMLFileList; {$IFDEF PAS2JS} external name 'files';{$ENDIF}
    FItems: TJSDataTransferItemList; {$IFDEF PAS2JS} external name 'items';{$ENDIF}
    FTypes: TJSStringDynArray; {$IFDEF PAS2JS} external name 'types';{$ENDIF}
  Public
    dropEffect : string;
    effectAllowed : string;
    Procedure clearData; overload;
    Procedure clearData(aFormat : string); overload;
    function getData(aFormat : string) : String;
    procedure setData(aFormat : String; aData : String);
    procedure setDragImage(aImage: TJSElement; xOffset,yOffset : integer);
    property files : TJSHTMLFileList Read FFiles;
    property items : TJSDataTransferItemList read FItems;
    property types : TJSStringDynArray read FTypes;
  end;

  { TJSDragEvent }

  TJSDragEvent = class {$IFDEF PAS2JS}external name 'DragEvent' (TJSEvent){$ENDIF}
  Private
    FDataTransfer: TJSDataTransfer; {$IFDEF PAS2JS} external name 'dataTransfer';{$ENDIF}
    FrelatedTarget : TJSEventTarget; {$IFDEF PAS2JS}external name 'relatedTarget';{$ENDIF}
    FscreenX : NativeInt; {$IFDEF PAS2JS}external name 'screenX';{$ENDIF}
    FscreenY : NativeInt; {$IFDEF PAS2JS}external name 'screenY';{$ENDIF}
    FclientX : NativeInt; {$IFDEF PAS2JS}external name 'clientX';{$ENDIF}
    FclientY : NativeInt; {$IFDEF PAS2JS}external name 'clientY';{$ENDIF}
    Fbutton : NativeInt; {$IFDEF PAS2JS}external name 'button';{$ENDIF}
    Fbuttons : NativeInt; {$IFDEF PAS2JS}external name 'buttons';{$ENDIF}
    FctrlKey : Boolean; {$IFDEF PAS2JS}external name 'ctrlKey';{$ENDIF}
    FshiftKey : Boolean; {$IFDEF PAS2JS}external name 'shiftKey';{$ENDIF}
    FaltKey  : Boolean; {$IFDEF PAS2JS}external name 'altKey';{$ENDIF}
    FmetaKey  : Boolean; {$IFDEF PAS2JS}external name 'metaKey';{$ENDIF}
  Public
    Property relatedTarget : TJSEventTarget Read FRelatedTarget;
    Property screenX : NativeInt Read FScreenX;
    Property screenY : NativeInt Read FScreenY;
    Property clientX : NativeInt Read FClientX;
    Property clientY : NativeInt Read FClientY;
    Property button : NativeInt Read FButton;
    Property buttons : NativeInt Read FButtons;
    Property ctrlKey : Boolean Read FctrlKey;
    Property shiftKey : Boolean Read FshiftKey;
    Property altKey  : Boolean Read FaltKey;
    Property metaKey  : Boolean Read FmetaKey;
    property dataTransfer : TJSDataTransfer Read FDataTransfer;
  end;
  TJSDragDropEventHandler = reference to function(aEvent: TJSDragEvent) : Boolean; {$IFDEF PAS2JS}{$IFDEF PAS2JS}safecall;{$ENDIF}{$ENDIF}
  THTMLClickEventHandler = reference to function(aEvent : TJSMouseEvent) : boolean; {$IFDEF PAS2JS}{$IFDEF PAS2JS}safecall;{$ENDIF}{$ENDIF}
  { Various events }

{$IFNDEF FIREFOX}
  TJSFocusEvent = TJSEvent;
{$ELSE}
  TJSFocusEvent = Class(TJSEvent)
  private
    FrelatedTarget : TJSElement external name 'relatedTarget';
  public
    property relatedTarget : TJSElement Read FrelatedTarget;
  end;
{$ENDIF}
  TJSAnimationEvent = Class(TJSEvent);
  TJSLoadEvent = Class(TJSEvent);

  TJSErrorEvent = class {$IFDEF PAS2JS}external name 'ErrorEvent' (TJSEvent){$ENDIF}
  Private
    Fmessage : String; {$IFDEF PAS2JS}external name 'message';{$ENDIF}
    Ffilename : string; {$IFDEF PAS2JS}external name 'filename';{$ENDIF}
    Flineno : integer; {$IFDEF PAS2JS}external name 'lineno';{$ENDIF}
    Fcolno : integer; {$IFDEF PAS2JS}external name 'colno';{$ENDIF}
    Ferror : TJSObject; {$IFDEF PAS2JS}external name 'error';{$ENDIF}
  Public
    Property message : String read FMessage;
    property filename : string Read FFileName;
    property lineno : integer read FLineNo;
    Property colno : integer read FColNo;
    Property error : TJSObject read FError;
  end;

  TJSPageTransitionEvent = class(TJSEvent)
  end;

  TJSHashChangeEvent = class {$IFDEF PAS2JS}external name 'HashChangeEvent' (TJSEvent){$ENDIF}
  Private
    FnewURL : String; {$IFDEF PAS2JS}external name 'newURL';{$ENDIF}
    FoldURL : String; {$IFDEF PAS2JS}external name 'oldURL';{$ENDIF}
  public
    property newURL : String Read FNewURL;
    property oldURL : String Read FOldURL;
  end;

  TJSPopStateEvent = class {$IFDEF PAS2JS}external name 'PopStateEvent'  (TJSEvent){$ENDIF}
  Private
    FState : JSValue; {$IFDEF PAS2JS} external name 'state';{$ENDIF}
  Public
    property state : JSValue read FState;
  end;

  TJSStorageEvent = class {$IFDEF PAS2JS}external name 'StorageEvent' (TJSEvent){$ENDIF}
  private
    Fkey : String; {$IFDEF PAS2JS}external name 'key';{$ENDIF}
    FoldValue : String; {$IFDEF PAS2JS}external name 'oldValue';{$ENDIF}
    FnewValue : String; {$IFDEF PAS2JS}external name 'newValue';{$ENDIF}
    Furl : String; {$IFDEF PAS2JS}external name 'url';{$ENDIF}
    FstorageArea : String; {$IFDEF PAS2JS}external name 'storageArea';{$ENDIF}
  public
    Property key : String Read FKey;
    Property oldValue : String Read FOldValue;
    Property newValue : String Read FNewValue;
    Property url : String Read FURL;
    Property storageArea : String Read FstorageArea;
  end;

  { TJSProgressEvent }

  TJSProgressEvent = class {$IFDEF PAS2JS}external name 'ProgressEvent' (TJSEvent){$ENDIF}
  Private
    FlengthComputable : Boolean; {$IFDEF PAS2JS}external name 'lengthComputable';{$ENDIF}
    Floaded : NativeUINT; {$IFDEF PAS2JS}external name 'loaded';{$ENDIF}
    FTotal : NativeUINT; {$IFDEF PAS2JS}external name'Total';{$ENDIF}
  Public
    property lengthComputable : Boolean Read FlengthComputable;
    property loaded : NativeUINT Read FLoaded;
    property Total : NativeUINT Read FTotal;
  end;

  TJSPageTransitionEventHandler = reference to function(aEvent : TJsPageTransitionEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSHashChangeEventhandler = reference to function(aEvent : TJSHashChangeEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSMouseWheelEventHandler = reference to function(aEvent : TJSWheelEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSMouseEventHandler = reference to function(aEvent : TJSMouseEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  THTMLAnimationEventHandler = reference to function(aEvent : TJSAnimationEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSErrorEventHandler = reference to function(aEvent : TJSErrorEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSFocusEventHandler = reference to function(aEvent : TJSFocusEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSKeyEventhandler = reference to function (aEvent : TJSKeyBoardEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSLoadEventhandler = reference to function (aEvent : TJSLoadEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSPointerEventHandler = reference to function(aEvent : TJSPointerEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSUIEventHandler = reference to function(aEvent : TJSUIEvent) : Boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSPopStateEventHandler = reference to function(aEvent : TJSPopStateEvent) : Boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSStorageEventHandler = reference to function(aEvent : TJSStorageEvent) : Boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSProgressEventhandler =  reference to function(aEvent : TJSProgressEvent) : Boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}
  TJSTouchEventHandler = reference to function(aEvent : TJSTouchEvent) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}

  TJSDocument = class {$IFDEF PAS2JS}external name 'Document' (TJSNode){$ENDIF}
  Private
    fActiveElement : TJSElement; {$IFDEF PAS2JS} external name 'activeElement';{$ENDIF}
    FCharacterSet: String; {$IFDEF PAS2JS} external name 'characterSet';{$ENDIF}
    FChildElementCount: NativeInt; {$IFDEF PAS2JS} external name 'childElementCount';{$ENDIF}
    FCompatMode: String; {$IFDEF PAS2JS} external name 'compatMode';{$ENDIF}
    FCurrentScript: TJSElement; {$IFDEF PAS2JS} external name 'currentScript';{$ENDIF}
    FDefaultView: TJSWindow; {$IFDEF PAS2JS} external name 'defaultView';{$ENDIF}
    FDocType: TJSDocumentType; {$IFDEF PAS2JS} external name 'docrype';{$ENDIF}
    FDocumentElement: TJSElement; {$IFDEF PAS2JS} external name 'documentElement';{$ENDIF}
    FDocumentURI: String; {$IFDEF PAS2JS} external name 'documentURI';{$ENDIF}
    FEmbeds: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'embeds';{$ENDIF}
    FFirstElementChild : TJSElement; {$IFDEF PAS2JS} external name 'firstElementChild';{$ENDIF}
    FForms: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'forms';{$ENDIF}
    FFullScreenElement: TJSElement; {$IFDEF PAS2JS} external name 'fullscreenElement';{$ENDIF}
    FFullscreenEnabled: Boolean; {$IFDEF PAS2JS} external name 'fullscreenEnabled';{$ENDIF}
    FHead: TJSElement; {$IFDEF PAS2JS} external name 'head';{$ENDIF}
    FHidden: Boolean; {$IFDEF PAS2JS} external name 'hidden';{$ENDIF}
    FImages: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'images';{$ENDIF}
    FImplementation: TJSDOMImplementation; {$IFDEF PAS2JS} external name 'implementation';{$ENDIF}
    FLastElementChild : TJSElement; {$IFDEF PAS2JS} external name 'lastElementChild';{$ENDIF}
    FLastModified: String; {$IFDEF PAS2JS} external name 'lastModified';{$ENDIF}
    FLastStyleSheetSet: String; {$IFDEF PAS2JS} external name 'lastStyleSheetSet';{$ENDIF}
    FLinks: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'links';{$ENDIF}
    FLocation: TJSLocation; {$IFDEF PAS2JS} external name 'location';{$ENDIF}
    FLocationString: String; {$IFDEF PAS2JS} external name 'location';{$ENDIF}
    FPlugins: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'plugins';{$ENDIF}
    FPointerLockElement: TJSElement; {$IFDEF PAS2JS} external name 'pointerLockElement';{$ENDIF}
    FPreferredStyleSheetSet: String; {$IFDEF PAS2JS} external name 'preferredStyleSheetSet';{$ENDIF}
    FReadyState: String; {$IFDEF PAS2JS} external name 'readyState';{$ENDIF}
    FReferrer: String; {$IFDEF PAS2JS} external name 'referrer';{$ENDIF}
    FScripts: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'scripts';{$ENDIF}
    FStyleSheets: TJSStyleSheetList; {$IFDEF PAS2JS} external name 'styleSheets';{$ENDIF}
    FStyleSheetSets: TJSValueDynArray; {$IFDEF PAS2JS} external name 'styleSheetSets';{$ENDIF}
    FURL: String; {$IFDEF PAS2JS} external name 'URL';{$ENDIF}
    FVisibilityState: string; {$IFDEF PAS2JS} external name 'visibilityState';{$ENDIF}
  Public
    function adoptNode(aExternalNode : TJSNode) : TJSNode;
    procedure close;
    function createAttribute(aName : string) : TJSAttr;
    function createCDATASection(S : String) : TJSNode;
    function createComment(S : String) : TJSNode;
    function createDocumentFragment : TJSDocumentFragment;
    function createElement(tagName : string) : TJSElement; overload;
    function createElement(tagName : string; const options : TJSElementCreationOptions) : TJSElement; overload;
    function createElementNS(aNameSpace,tagName : string) : TJSElement; overload;
    function createElementNS(aNameSpace,tagName : string; const options : TJSElementCreationOptions) : TJSElement; overload;
    function createEvent(aType : string) : TJSEvent;
    function createExpression(xPathText : String; aNameSpaceMapper: TJSNameSpaceMapperCallback) : TJSXPathExpression;
    function createNSResolver(aNode : TJSNode) : TJSXPathNSResolver;
    function createProcessingInstruction(target, data : String) : TJSProcessingInstruction;
    function createRange : TJSRange;
    function createTextNode(S : String) : TJSNode;
    function createTreeWalker(root : TJSNode; whatToShow : NativeInt; filter : TJSNodeFilter) : TJSTreeWalker;
    function elementFromPoint(x,y : integer) : TJSElement;
    procedure enableStyleSheetsForSet(aSet : String);
    function evaluate(xpathExpression : String; ContextNode : TJSNode; NameSpaceResolver : TJSNamespaceMapperCallBack; resultType : NativeInt; aResult : TJSXPathResult) : TJSXPathResult;
    function execCommand(aCommandName : String; aShowDefaultUI : Boolean; AValueArgument : String) : boolean; overload;
    function execCommand(aCommandName : String; aShowDefaultUI : Boolean) : boolean; overload;
    Procedure exitFullScreen;
    function getElementById(aID : String) : TJSElement;
    function getElementsByClassName(aNames : string) : TJSHTMLCollection;
    function getElementsByName(aName : String) : TJSNodeList;
    function getElementsByTagName(aName : String) : TJSHTMLCollection;
    function getElementsByTagNameNS(aNameSpace,aName : String) : TJSHTMLCollection;
    function getSelection : TJSSelection;
    function hasFocus : boolean;
    function importNode(aExternalNode : TJSNode; Deep: boolean) : TJSNode;
    function querySelector(aSelectors : String) : TJSElement;
    function querySelectorAll(aSelectors : String) : TJSNodeList;
    procedure open;
    procedure releaseCapture;
    procedure write(aLine : string);
    procedure writeln(aLine : String);
  Public
    body : TJSElement;
    cookie: TJSString;
    designMode : string;
    dir : string;
    domain : string;
    selectedStyleSheetSet : string;
    title : string;
    onabort : TJSEventHandler;
    onblur : TJSEventHandler;
    oncancel : TJSEventHandler;
    oncanplay : TJSEventHandler;
    oncanplaythrough : TJSEventHandler;
    onchange : TJSEventHandler;
    onclick: THTMLClickEventHandler;
    onclose : TJSEventHandler;
    oncontextmenu : TJSEventHandler;
    oncuechange : TJSEventHandler;
    ondblclick : THTMLClickEventHandler;
    ondrag : TJSDragDropEventHandler;
    ondragend : TJSDragDropEventHandler;
    ondragenter : TJSDragDropEventHandler;
    ondragexit : TJSDragDropEventHandler;
    ondragover : TJSDragDropEventHandler;
    ondragleave : TJSDragDropEventHandler;
    ondragstart: TJSDragDropEventHandler;
    ondrop : TJSDragDropEventHandler;
    ondurationchange : TJSEventHandler;
    onemptied : TJSEventHandler;
    onended : TJSEventHandler;
    onerror : TJSErrorEventHandler;
    onfocus : TJSFocusEventhandler;
    ongotpointercapture : TJSPointerEventHandler;
    oninput : TJSEventhandler;
    oninvalid : TJSEventhandler;
    onkeydown : TJSKeyEventhandler;
    onkeypress : TJSKeyEventhandler;
    onkeyup : TJSKeyEventhandler;
    onload : TJSEventhandler;
    onloadeddata : TJSEventhandler;
    onloadedmetadata : TJSEventhandler;
    onloadend : TJSProgressEventhandler;
    onloadstart : TJSProgressEventhandler;
    onlostpointercapture : TJSPointerEventHandler;
    onmessage : TJSEventHandler;
    onmousedown : TJSMouseEventHandler;
    onmouseenter : TJSMouseEventHandler;
    onmouseleave : TJSMouseEventHandler;
    onmousemove : TJSMouseEventHandler;
    onmouseout : TJSMouseEventHandler;
    onmouseover : TJSMouseEventHandler;
    onmouseup : TJSMouseEventHandler;
    onmousewheel : TJSMouseEventHandler;
    onpause : TJSEventHandler;
    onplay : TJSEventHandler;
    onplaying : TJSEventHandler;
    onpointercancel : TJSPointerEventHandler;
    onpointerdown : TJSPointerEventHandler;
    onpointerenter : TJSPointerEventHandler;
    onpointerleave : TJSPointerEventHandler;
    onpointermove : TJSPointerEventHandler;
    onpointerout : TJSPointerEventHandler;
    onpointerover : TJSPointerEventHandler;
    onpointerup : TJSPointerEventHandler;
    onpointerlockchange : TJSPointerEventHandler;
    onprogress : TJSProgressEventhandler;
    onreset : TJSUIEventHandler;
    onratechange : TJSEventHandler;
    onscroll : TJSUIEventHandler;
    onseekend : TJSEventHandler;
    onseeking : TJSEventHandler;
    onselect : TJSEventHandler;
    onselectionchange : TJSEventHandler;
    onsshow : TJSEventHandler;
    onsubmit : TJSEventHandler;
    onunload : TJSUIEventHandler;
    onwaiting : TJSEventHandler;
    touchstart : TJSTouchEventHandler;
    touchend : TJSTouchEventHandler;
    touchmove : TJSTouchEventHandler;
    touchcancel : TJSTouchEventHandler;
    Property activeElement : TJSElement Read FActiveElement;
    Property characterSet : String Read FCharacterSet;
    property childElementCount : NativeInt Read FChildElementCount;
    property compatMode : String Read FCompatMode;
    property currentScript : TJSElement Read FCurrentScript;
    property defaultView : TJSWindow Read FDefaultView;
    property doctype : TJSDocumentType read FDocType;
    property documentElement : TJSElement read FDocumentElement;
    property documentURI : String Read FDocumentURI;
    property embeds : TJSHTMLCollection Read FEmbeds;
    property firstElementChild : TJSElement Read FFirstElementChild;
    property lastElementChild : TJSElement Read FLastElementChild;
    property Forms : TJSHTMLCollection Read FForms;
    property fullscreenElement : TJSElement Read FFullScreenElement;
    property fullscreenEnabled : Boolean Read FFullscreenEnabled;
    property head : TJSElement read FHead;
    Property hidden : Boolean read FHidden;
    property images : TJSHTMLCollection Read FImages;
    property _implementation : TJSDOMImplementation Read FImplementation;
    property lastModified : String Read FLastModified;
    property lastStyleSheetSet : String read FLastStyleSheetSet;
    property links : TJSHTMLCollection Read FLinks;
    property location : TJSLocation read FLocation;
    Property LocationString : String Read FURL Write FLocationString; // On purpose
    property plugins : TJSHTMLCollection Read FPlugins;
    property pointerLockElement : TJSElement Read FPointerLockElement;
    property preferredStyleSheetSet : String Read FPreferredStyleSheetSet;
    Property readyState : String Read FReadyState;
    Property referrer : String Read FReferrer;
    property scripts : TJSHTMLCollection Read FScripts;
    property styleSheets : TJSStyleSheetList Read FStyleSheets;
    property styleSheetSets : TJSValueDynArray Read FStyleSheetSets; // No type documented ?
    Property URL : String Read FURL;
    property visibilityState : string read FVisibilityState;
  end;

  TJSConsole = class {$IFDEF PAS2JS}external name 'Console'  (TJSObject){$ENDIF}
  Public
    procedure assert(anAssertion : string; Obj1 : JSValue); {$IFDEF PAS2JS}varargs;{$ENDIF}
    Procedure clear;  
    procedure count; overload;
    procedure count(aCounter : String); overload;
    procedure debug(Obj1 : JSValue); {$IFDEF PAS2JS}varargs of JSValue;{$ENDIF}
    procedure error(Obj1 : JSValue); {$IFDEF PAS2JS}varargs of JSValue;{$ENDIF}
    procedure group; overload;
    procedure group(aLabel : String); overload;
    procedure groupCollapsed; overload;
    procedure groupCollapsed(aLabel : String);overload;
    procedure groupEnd;
    procedure info(Obj1 : JSValue); {$IFDEF PAS2JS}varargs of JSValue;{$ENDIF}
    procedure log(Obj1 : JSValue); {$IFDEF PAS2JS}varargs of JSValue;{$ENDIF}
    procedure table(args: array of JSValue); overload;
    procedure table(args: array of JSValue; Columns : Array of string); overload;
    procedure table(args: TJSObject); overload;
    procedure table(args: TJSObject; Columns : Array of string); overload;
    procedure time(aName : string);
    procedure timeEnd(aName : string);
    procedure trace;
    procedure warn(Obj1 : JSValue); {$IFDEF PAS2JS}varargs of JSValue;{$ENDIF}
  end;

//  TJSBufferSource = class {$IFDEF PAS2JS}external name 'BufferSource' end;{$ENDIF}
//  TJSTypedArray = class {$IFDEF PAS2JS}external name 'TypedArray' end;{$ENDIF}

  // Forward class definitions
  TJSCryptoKey = Class;
  TJSSubtleCrypto = Class;
  KeyType = String;
  KeyUsage = String;
  NamedCurve = String;
  BigInteger = TJSUint8Array;
  KeyFormat = String;
  // Union of object, DOMString
  AlgorithmIdentifier = JSValue; 
  
  { --------------------------------------------------------------------
    Algorithm
    --------------------------------------------------------------------}
  
  Algorithm = record
    name : String;
  end;
  
  { --------------------------------------------------------------------
    AesCbcParams
    --------------------------------------------------------------------}
  
  AesCbcParams = record
    iv : TJSBufferSource;
  end;
  
  { --------------------------------------------------------------------
    AesCtrParams
    --------------------------------------------------------------------}
  
  AesCtrParams = record
    counter : TJSBufferSource;
    length_ : Byte;{$IFDEF PAS2JS}external name  'length';{$ENDIF}
  end;

  { --------------------------------------------------------------------
    AesGcmParams
    --------------------------------------------------------------------}
  
  AesGcmParams = record
    iv : TJSBufferSource;
    additionalData : TJSBufferSource;
    tagLength : Byte;
  end;
  
  { --------------------------------------------------------------------
    HmacImportParams
    --------------------------------------------------------------------}
  
  HmacImportParams = record
    hash : AlgorithmIdentifier;
  end;
  
  { --------------------------------------------------------------------
    Pbkdf2Params
    --------------------------------------------------------------------}
  
  Pbkdf2Params = record
    salt : TJSBufferSource;
    iterations : NativeInt;
    hash : AlgorithmIdentifier;
  end;
  
  { --------------------------------------------------------------------
    RsaHashedImportParams
    --------------------------------------------------------------------}
  
  RsaHashedImportParams = record
    hash : AlgorithmIdentifier;
  end;
  
  { --------------------------------------------------------------------
    AesKeyGenParams
    --------------------------------------------------------------------}
  
  AesKeyGenParams = record
    length_ : Integer;{$IFDEF PAS2JS}external name 'length';{$ENDIF}
  end;
  
  { --------------------------------------------------------------------
    HmacKeyGenParams
    --------------------------------------------------------------------}
  
  HmacKeyGenParams = record
    hash : AlgorithmIdentifier;
    length_ : Integer;{$IFDEF PAS2JS}external name 'length';{$ENDIF}
  end;
  
  { --------------------------------------------------------------------
    RsaHashedKeyGenParams
    --------------------------------------------------------------------}
  
  RsaHashedKeyGenParams = record
    modulusLength : Integer;
    publicExponent : BigInteger;
    hash : AlgorithmIdentifier;
  end;
  
  { --------------------------------------------------------------------
    RsaOaepParams
    --------------------------------------------------------------------}
  
  RsaOaepParams = record
    label_ : TJSBufferSource;{$IFDEF PAS2JS}external name 'label';{$ENDIF}
  end;
  
  { --------------------------------------------------------------------
    RsaPssParams
    --------------------------------------------------------------------}
  
  RsaPssParams = record
    saltLength : Integer;
  end;
  
  { --------------------------------------------------------------------
    DhKeyGenParams
    --------------------------------------------------------------------}
  
  DhKeyGenParams = record
    prime : BigInteger;
    generator : BigInteger;
  end;
  
  { --------------------------------------------------------------------
    EcKeyGenParams
    --------------------------------------------------------------------}
  
  EcKeyGenParams = record
    _namedCurve : NamedCurve;{$IFDEF PAS2JS}external name 'namedCurve';{$ENDIF}
  end;
  
  { --------------------------------------------------------------------
    AesDerivedKeyParams
    --------------------------------------------------------------------}
  
  AesDerivedKeyParams = record
    length_ : Integer;{$IFDEF PAS2JS}external name 'length';{$ENDIF}
  end;
  
  { --------------------------------------------------------------------
    HmacDerivedKeyParams
    --------------------------------------------------------------------}
  
  HmacDerivedKeyParams = record
    length_ : Integer;{$IFDEF PAS2JS}external name 'length';{$ENDIF}
  end;
  
  { --------------------------------------------------------------------
    EcdhKeyDeriveParams
    --------------------------------------------------------------------}
  
  EcdhKeyDeriveParams = record
    public_ : TJSCryptoKey; {$IFDEF PAS2JS} external name 'public';{$ENDIF}
  end;
  
  { --------------------------------------------------------------------
    DhKeyDeriveParams
    --------------------------------------------------------------------}
  
  DhKeyDeriveParams = record
    public_ : TJSCryptoKey;{$IFDEF PAS2JS}external name 'public';{$ENDIF}
  end;
  
  { --------------------------------------------------------------------
    DhImportKeyParams
    --------------------------------------------------------------------}
  
  DhImportKeyParams = record
    prime : BigInteger;
    generator : BigInteger;
  end;
  
  { --------------------------------------------------------------------
    EcdsaParams
    --------------------------------------------------------------------}
  
  EcdsaParams = record
    hash : AlgorithmIdentifier;
  end;
  
  { --------------------------------------------------------------------
    EcKeyImportParams
    --------------------------------------------------------------------}
  
  EcKeyImportParams = record
    _namedCurve : NamedCurve;{$IFDEF PAS2JS}external name 'namedCurve';{$ENDIF}
  end;
  
  { --------------------------------------------------------------------
    HkdfParams
    --------------------------------------------------------------------}
  
  HkdfParams = record
    hash : AlgorithmIdentifier;
    salt : TJSBufferSource;
    info : TJSBufferSource;
  end;
  
  { --------------------------------------------------------------------
    RsaOtherPrimesInfo
    --------------------------------------------------------------------}
  
  RsaOtherPrimesInfo = record
    r : String;
    d : String;
    t : String;
  end;
  
  { --------------------------------------------------------------------
    JsonWebKey
    --------------------------------------------------------------------}
  
  TStringDynArray = Array of String;
  TRsaOtherPrimesInfoDynArray = Array of RsaOtherPrimesInfo;
  JsonWebKey = record
    kty : String;
    use : String;
    key_ops : TStringDynArray;
    alg : String;
    ext : boolean;
    crv : String;
    x : String;
    y : String;
    d : String;
    n : String;
    e : String;
    p : String;
    q : String;
    dp : String;
    dq : String;
    qi : String;
    oth : TRsaOtherPrimesInfoDynArray;
    k : String;
  end;
  
  { --------------------------------------------------------------------
    CryptoKeyPair
    --------------------------------------------------------------------}
  
  CryptoKeyPair = record
    publicKey : TJSCryptoKey;
    privateKey : TJSCryptoKey;
  end;
  
  { --------------------------------------------------------------------
    TJSCryptoKey
    --------------------------------------------------------------------}
  
  TKeyUsageDynArray = Array of KeyUsage;
  TJSCryptoKey = class {$IFDEF PAS2JS}external name 'CryptoKey'{$ENDIF}
  Private
    Ftype_ : KeyType; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    Fextractable : boolean; {$IFDEF PAS2JS} external name 'extractable';{$ENDIF}
    Falgorithm : TJSObject; {$IFDEF PAS2JS} external name 'algorithm';{$ENDIF}
    Fusages : TKeyUsageDynArray; {$IFDEF PAS2JS} external name 'usages';{$ENDIF}
  Public
    
    Property type_ : KeyType Read Ftype_; 
    Property extractable : boolean Read Fextractable; 
    Property algorithm : TJSObject Read Falgorithm; 
    Property usages : TKeyUsageDynArray Read Fusages; 
  end;
  
  { --------------------------------------------------------------------
    TJSSubtleCrypto
    --------------------------------------------------------------------}
  
  TJSSubtleCrypto = class {$IFDEF PAS2JS}external name 'SubtleCrypto'{$ENDIF}
  Private
  Public
    function encrypt(algorithm : AlgorithmIdentifier; key : TJSCryptoKey; data : TJSBufferSource): TJSPromise;
    function decrypt(algorithm : AlgorithmIdentifier; key : TJSCryptoKey; data : TJSBufferSource): TJSPromise;
    function sign(algorithm : AlgorithmIdentifier; key : TJSCryptoKey; data : TJSBufferSource): TJSPromise;
    function verify(algorithm : AlgorithmIdentifier; key : TJSCryptoKey; signature : TJSBufferSource; data : TJSBufferSource): TJSPromise;
    function digest(algorithm : AlgorithmIdentifier; data : TJSBufferSource): TJSPromise;
    function generateKey(algorithm : AlgorithmIdentifier; extractable : boolean; keyUsages : TKeyUsageDynArray): TJSPromise;
    function deriveKey(algorithm : AlgorithmIdentifier; baseKey : TJSCryptoKey; derivedKeyType : AlgorithmIdentifier; extractable : boolean; keyUsages : TKeyUsageDynArray): TJSPromise;
    function deriveBits(algorithm : AlgorithmIdentifier; baseKey : TJSCryptoKey; length_ : NativeInt): TJSPromise;
    function importKey(format : KeyFormat; keyData : TJSObject; algorithm : AlgorithmIdentifier; extractable : boolean; keyUsages : TKeyUsageDynArray): TJSPromise;
    function exportKey(format : KeyFormat; key : TJSCryptoKey): TJSPromise;
    function wrapKey(format : KeyFormat; key : TJSCryptoKey; wrappingKey : TJSCryptoKey; wrapAlgorithm : AlgorithmIdentifier): TJSPromise;
    function unwrapKey(format : KeyFormat; wrappedKey : TJSBufferSource; unwrappingKey : TJSCryptoKey; unwrapAlgorithm : AlgorithmIdentifier; unwrappedKeyAlgorithm : AlgorithmIdentifier; extractable : boolean; keyUsages : TKeyUsageDynArray): TJSPromise;
  end;
  { TJSCrypto }

  TJSCrypto = class {$IFDEF PAS2JS}external name 'Crypto'  (TJSObject){$ENDIF}
  private
    Fsubtle: TJSSubtleCrypto; {$IFDEF PAS2JS} external name 'subtle';{$ENDIF}
  Public
    procedure getRandomValues (anArray : TJSTypedArray);
    property subtle : TJSSubtleCrypto Read Fsubtle;
  end;
  
  { TJSHistory }

  TJSHistory = class {$IFDEF PAS2JS}external name 'History'  (TJSObject){$ENDIF}
  private
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
{$IFDEF FIREFOX}
    FState : JSValue; {$IFDEF PAS2JS} external name 'state';{$ENDIF}
{$ENDIF}
  Public
    procedure back;
    procedure forward;
    procedure go(aIndex : NativeInt); overload;
    procedure go; overload;
    procedure pushState(aState : jsValue; aTitle : String; AURL : String); overload;
    procedure pushState(aState : jsValue; aTitle : String); overload;
    procedure replaceState(aState : jsValue; aTitle : String; AURL : String); overload;
    procedure replaceState(aState : jsValue; aTitle : String); overload;
    procedure replaceState(aState : jsValue); overload;
{$IFDEF FIREFOX}
    property state : JSValue read FState;
{$ENDIF}
    property length: NativeInt read FLength;
  end;

  TJSIDBTransactionMode = class
  const
    readonly = 'readonly';
    readwrite = 'readwrite';
    versionchange = 'versionchange';
  end;


  { TJSIDBTransaction }

  TJSIDBTransaction = class {$IFDEF PAS2JS}external name 'IDBTransaction'  (TJSEventTarget){$ENDIF}
  private
    FDB : TIDBDatabase; {$IFDEF PAS2JS} external name 'db';{$ENDIF}
    FError: JSValue; {$IFDEF PAS2JS} external name 'error';{$ENDIF}
    FMode: String; {$IFDEF PAS2JS} external name 'mode';{$ENDIF}
    FObjectStoreNames: TStringDynArray; {$IFDEF PAS2JS} external name 'objectStoreNames';{$ENDIF}
  public
    procedure abort;
    function objectStore(aName : String) : TJSIDBObjectStore;
    property db : TIDBDatabase read FDB;
    property mode : String read FMode;
    property objectStoreNames : TStringDynArray read FObjectStoreNames;
    property error : JSValue read FError;
  end;


  { TJSIDBKeyRange }

  TJSIDBKeyRange = class {$IFDEF PAS2JS}external name 'IDBKeyRange'  (TJSObject){$ENDIF}
  private
    FLower: JSValue;
    FLowerOpen: Boolean;
    FUpper: JSValue;
    FUpperOpen: Boolean;
  Public
    Class Function bound(aLower,aUpper : JSValue) : TJSIDBKeyRange; overload;
    Class Function bound(aLower,aUpper : JSValue; aLowerOpen : Boolean) : TJSIDBKeyRange; overload;
    Class Function bound(aLower,aUpper : JSValue; aLowerOpen,aUpperOpen : Boolean) : TJSIDBKeyRange; overload;
    Class Function lowerBound(aLower : JSValue) : TJSIDBKeyRange; overload;
    Class Function lowerBound(aLower : JSValue; aOpen: Boolean) : TJSIDBKeyRange; overload;
    Class Function only(aValue : JSValue) : TJSIDBKeyRange;
    Class Function upperBound(aUpper : JSValue) : TJSIDBKeyRange; overload;
    Class Function upperBound(aUpper : JSValue; aOpen: Boolean) : TJSIDBKeyRange; overload;
    function includes (aValue : JSValue) : Boolean;
    property lower : JSValue read FLower;
    property lowerOpen : Boolean read FLowerOpen;
    property upper : JSValue read FUpper;
    property upperOpen : Boolean read FUpperOpen;
  end;

  TJSIDBIndexParameters = record
    unique : boolean;
    multiEntry : boolean;
    locale : string;
  end;


  { TJSIDBIndex }

  TJSIDBIndex = class {$IFDEF PAS2JS}external name 'IDBIndex'  (TJSObject){$ENDIF}
  private
    FKeyPath: JSValue; {$IFDEF PAS2JS} external name 'keyPath';{$ENDIF}
    FMultiEntry: Boolean; {$IFDEF PAS2JS} external name 'multiEntry';{$ENDIF}
    FObjectStore: TJSIDBObjectStore; {$IFDEF PAS2JS} external name 'objectStore';{$ENDIF}
    FUnique: boolean; {$IFDEF PAS2JS} external name 'unique';{$ENDIF}
  public
    name : string;
    function count : TJSIDBRequest;
    function get(aKey : jsValue) : TJSIDBRequest; overload;
    function get(aKey : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function getAll(aKey : jsValue) : TJSIDBRequest; overload;
    function getAll(aKey : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function getAll(aKey : jsValue; ACount : NativeInt) : TJSIDBRequest; overload;
    function getAll(aKey : TJSIDBKeyRange; ACount : NativeInt) : TJSIDBRequest; overload;
    function getAllKeys(aKey : jsValue) : TJSIDBRequest; overload;
    function getAllKeys(aKey : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function getAllKeys(aKey : jsValue; ACount : NativeInt) : TJSIDBRequest; overload;
    function getAllKeys(aKey : TJSIDBKeyRange; ACount : NativeInt) : TJSIDBRequest; overload;
    function getKey(aKey : jsValue) : TJSIDBRequest;
    function openCursor : TJSIDBRequest; overload;
    function openCursor(aKeyRange : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function openCursor(aKeyRange : TJSIDBKeyRange; ADirection : String) : TJSIDBRequest;overload;
    function openKeyCursor : TJSIDBRequest;overload;
    function openKeyCursor(aKeyRange : TJSIDBKeyRange) : TJSIDBRequest;overload;
    function openKeyCursor(aKeyRange : TJSIDBKeyRange; ADirection : String) : TJSIDBRequest;overload;
    Property keyPath : JSValue Read FKeyPath;
    property multiEntry : Boolean read FMultiEntry;
    property objectStore : TJSIDBObjectStore read FObjectStore;
    property unique : boolean read FUnique;
  end;

  TJSIDBCursorDirection = class {$IFDEF PAS2JS}external name 'IDBCursorDirection'  (TJSObject){$ENDIF}
  Const
    next = 'next';
    nextUnique = 'nextUnique';
    prev = 'prev';
    prevUnique = 'prevUnique';
  end;


  { TJSIDBCursor }

  TJSIDBCursor = class {$IFDEF PAS2JS}external name 'IDBCursor'  (TJSObject){$ENDIF}
  private
    FDirection: string; {$IFDEF PAS2JS} external name 'direction';{$ENDIF}
    FKey: JSValue; {$IFDEF PAS2JS} external name 'key';{$ENDIF}
    FValue : JSValue; {$IFDEF PAS2JS} external name 'value';{$ENDIF}
    FPrimaryKey: JSValue; {$IFDEF PAS2JS} external name 'primaryKey';{$ENDIF}
    FSource: JSValue; {$IFDEF PAS2JS} external name 'source';{$ENDIF}
    FSourceAsIndex: TJSIDBIndex; {$IFDEF PAS2JS} external name 'source';{$ENDIF}
    FSourceAsStore: TJSIDBObjectStore; {$IFDEF PAS2JS} external name 'source';{$ENDIF}
  Public
    procedure advance(aCount : NativeInt); overload;
    procedure advance(aKey : JSValue); overload;
    procedure continue(aKey : JSValue); overload;
    procedure continue; overload;
    procedure continuePrimaryKey(aKey : JSValue); overload;
    procedure continuePrimaryKey(aKey,aPrimaryKey : JSValue); overload;
    procedure delete;
    procedure update(aValue : JSValue);
    property source : JSValue read FSource;
    property sourceAsStore : TJSIDBObjectStore read FSourceAsStore;
    property sourceAsIndex : TJSIDBIndex read FSourceAsIndex;
    property key : JSValue read FKey;
    Property Value : JSValue Read FValue;
    property primaryKey : JSValue read FPrimaryKey;
    property direction : string read FDirection;
  end;

  TJSIDBObjectStore = class {$IFDEF PAS2JS}external name 'IDBObjectStore'  (TJSEventTarget){$ENDIF}
  public
    function add(aValue : JSValue; aKey : String) : TJSIDBRequest; overload;
    function add(aValue : JSValue) : TJSIDBRequest; overload;
    function clear : TJSIDBRequest;
    function delete(aKey : string) : TJSIDBRequest; overload;
    function delete(aKeyRange : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function get(aKey : string) : TJSIDBRequest; overload;
    function get(aKeyRange : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function getKey(aKey : string) : TJSIDBRequest; overload;
    function getKey(aKeyRange : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function getAll : TJSIDBRequest; overload;
    function getAll(aKey : String) : TJSIDBRequest; overload;
    function getAll(aKeyRange : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function getAll(aKey : String; aCount: NativeInt) : TJSIDBRequest; overload;
    function getAll(aKeyRange : TJSIDBKeyRange; aCount: NativeInt) : TJSIDBRequest; overload;
    function getAllKeys(aKey : String) : TJSIDBRequest; overload;
    function getAllKeys(aKeyRange : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function getAllKeys(aKey : String; aCount: NativeInt) : TJSIDBRequest; overload;
    function getAllKeys(aKeyRange : TJSIDBKeyRange; aCount: NativeInt) : TJSIDBRequest; overload;
    function createIndex (aIndexName : String; KeyPath : String)  : TJSIDBIndex; overload;
    function createIndex (aIndexName : String; KeyPath : String; Options : TJSIDBIndexParameters)  : TJSIDBIndex; overload;
    function createIndex (aIndexName : String; KeyPath : Array of String)  : TJSIDBIndex; overload;
    function createIndex (aIndexName : String; KeyPath : Array of String; Options : TJSIDBIndexParameters)  : TJSIDBIndex; overload;
    Procedure deleteIndex (aIndexName : String);
    function index (aIndexName : String)  : TJSIDBIndex;
    function put(aValue : JSValue; aKey : String) : TJSIDBRequest; overload;
    function put(aValue : JSValue) : TJSIDBRequest; overload;
    function openCursor : TJSIDBRequest; overload;
    function openCursor(aKey : String) : TJSIDBRequest; overload;
    function openCursor(aKeyRange : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function openCursor(aKey : String; aDirection : string) : TJSIDBRequest; overload;
    function openCursor(aKeyRange : TJSIDBKeyRange; aDirection : string) : TJSIDBRequest; overload;
    function openKeyCursor : TJSIDBRequest; overload;
    function openKeyCursor(aKey : String) : TJSIDBRequest; overload;
    function openKeyCursor(aKeyRange : TJSIDBKeyRange) : TJSIDBRequest; overload;
    function openKeyCursor(aKey : String; aDirection : string) : TJSIDBRequest; overload;
    function openKeyCursor(aKeyRange : TJSIDBKeyRange; aDirection : string) : TJSIDBRequest; overload;
    function count : TJSIDBRequest; overload;
    function count(aKey : String) : TJSIDBRequest; overload;
    function count(aKeyRange : TJSIDBKeyRange) : TJSIDBRequest; overload;
    property Indexes [aIndexName : String] : TJSIDBIndex read index;
  end;

  { TJSIDBRequest }

  TJSIDBRequest = class {$IFDEF PAS2JS}external name 'IDBRequest'  (TJSEventTarget){$ENDIF}
  private
    Ferror : JSValue; {$IFDEF PAS2JS} external name 'error';{$ENDIF}
    FReadyState: string; {$IFDEF PAS2JS} external name 'readyState';{$ENDIF}
    FResult: JSValue; {$IFDEF PAS2JS} external name 'result';{$ENDIF}
    FResultDatabase: TIDBDatabase; {$IFDEF PAS2JS} external name 'result';{$ENDIF}
    FResultIndex: TJSIDBIndex; {$IFDEF PAS2JS} external name 'result';{$ENDIF}
    FResultObjectStore : TJSIDBObjectStore; {$IFDEF PAS2JS} external name 'result';{$ENDIF}
    FResultCursor : TJSIDBCursor; {$IFDEF PAS2JS} external name 'result';{$ENDIF}
    FSourceDatabase: TIDBDatabase; {$IFDEF PAS2JS} external name 'source';{$ENDIF}
    FSourceIndex: TJSIDBIndex; {$IFDEF PAS2JS} external name 'source';{$ENDIF}
    FSourceObjectStore : TJSIDBObjectStore; {$IFDEF PAS2JS} external name 'source';{$ENDIF}
    FSourceCursor : TJSIDBCursor; {$IFDEF PAS2JS} external name 'source';{$ENDIF}
    FSource: JSValue; {$IFDEF PAS2JS} external name 'source';{$ENDIF}
    FTransaction: TJSIDBTransaction; {$IFDEF PAS2JS} external name 'transaction';{$ENDIF}
  Public
    onerror : TJSEventHandler;
    onsuccess : TJSEventHandler;
    Property error : JSValue read FError;
    property readyState : string read FReadyState;

    property result : JSValue read FResult;
    property resultAsObjectStore : TJSIDBObjectStore read FResultObjectStore;
    property resultAsCursor : TJSIDBCursor read FResultCursor;
    property resultAsIndex : TJSIDBIndex read FResultIndex;
    property resultAsDatabase : TIDBDatabase read FResultDatabase;

    property source : JSValue read FSource;
    property sourceAsObjectStore : TJSIDBObjectStore read FSourceObjectStore;
    property sourceAsCursor : TJSIDBCursor read FSourceCursor;
    property sourceAsIndex : TJSIDBIndex read FSourceIndex;
    property sourceAsDatabase : TIDBDatabase read FSourceDatabase;

    property transaction : TJSIDBTransaction read FTransaction;
  end;

  TJSIDBOpenDBRequest = class {$IFDEF PAS2JS}external name 'IDBOpenDBRequest' (TJSIDBRequest){$ENDIF}
  Public
    onblocked : TJSEventHandler;
    onupgradeneeded : TJSEventHandler;
  end;

  TJSCreateObjectStoreOptions = record
    keyPath : jsValue;
    autoIncrement : boolean;
  end;

  { TIDBDatabase }

  TIDBDatabase = class {$IFDEF PAS2JS}external name 'IDBDatabase' (TJSEventTarget){$ENDIF}
  private
    FName: string; {$IFDEF PAS2JS} external name 'name';{$ENDIF}
    FobjectStoreNames: TStringDynArray; {$IFDEF PAS2JS} external name 'objectStoreNames';{$ENDIF}
    FVersion: integer; {$IFDEF PAS2JS} external name 'version';{$ENDIF}
  public
    procedure close;
    function createObjectStore(aName : string) : TJSIDBObjectStore; overload;
    function createObjectStore(aName : string; Options: TJSCreateObjectStoreOptions) : TJSIDBObjectStore; overload;
    procedure deleteObjectStore(aName : string);
    function transaction(aStoreNames : array of string) : TJSIDBTransaction; overload;
    function transaction(aStoreNames : array of string; aMode : string) : TJSIDBTransaction; overload;
    property name : string read FName;
    property version : integer read FVersion;
    property objectStoreNames : TStringDynArray read FobjectStoreNames;
  end;

  TJSIDBFactory = class {$IFDEF PAS2JS}external name 'IDBFactory' (TJSEventTarget){$ENDIF}
  public
    function open(aName : string) : TJSIDBOpenDBRequest; overload;
    function open(aName : string; aVersion : Integer) : TJSIDBOpenDBRequest; overload;
    function deleteDatabase(aName : string) : TJSIDBOpenDBRequest;
    function cmp (a,b : jsValue) : NativeInt;
  end;
  
  { TJSStorage }

  TJSStorage = class {$IFDEF PAS2JS}external name 'Storage' (TJSEventTarget){$ENDIF}
  private
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
  public
    function key(aIndex : Integer) : String;
    function getItem(aKeyName : string) : string;
    procedure setItem(aKeyName : string; aValue : string);
    procedure removeItem(aKeyName : string);
    procedure clear;
    property Keys[AIndex : Integer] : String read key;
    property Items[aKeyName: String] : String read getItem write setItem; default;
    property length : NativeInt Read FLength;
  end;

  // Fake object, used for objects whose visible can be checked
  TJSVisibleItem = class {$IFDEF PAS2JS}external name 'IVisible'  (TJSObject){$ENDIF}
  Private
    FVisible : boolean; {$IFDEF PAS2JS} external name 'visible';{$ENDIF}
  Public
    Property visible : boolean read FVisible;
  end;
  
  TJSLocationBar = class {$IFDEF PAS2JS}external name 'LocationBar' (TJSVisibleItem);{$ENDIF}
  end;
  TJSMenuBar = class {$IFDEF PAS2JS}external name 'MenuBar' (TJSVisibleItem);{$ENDIF}
  end;
  TJSToolBar = class {$IFDEF PAS2JS}external name 'ToolBar' (TJSVisibleItem);{$ENDIF}
  end;
  TJSPersonalBar = class {$IFDEF PAS2JS}external name 'PersonalBar' (TJSVisibleItem);{$ENDIF}
  end;
  TJSScrollBars = class {$IFDEF PAS2JS}external name 'ScrollBars' (TJSVisibleItem);{$ENDIF}
  end;

  TJSPositionError = record
    code : integer;
    message : string;
  end;

  TJSPositionOptions = record
    enableHighAccuracy : boolean;
    timeout : integer;
    maximumAge : integer;
  end;

  TJSCoordinates = record
    latitude : double;
    longitude : double;
    altitude : double;
    accuracy : double;
    altitudeAccuracy : double;
    heading : double;
    speed : double;
  end;

  TJSPosition = record
    coords : TJSCoordinates;
    timestamp : String;
  end;

  TJSGeoLocationCallback = procedure (aPosition : TJSPosition);
  TJSGeoLocationEvent = procedure (aPosition : TJSPosition) of object;
  TJSGeoLocationErrorCallback = procedure (aValue : TJSPositionError);
  TJSGeoLocationErrorEvent = procedure (aValue : TJSPositionError) of object;

  TJSGeoLocation  = class {$IFDEF PAS2JS}external name 'GeoLocation'  (TJSObject){$ENDIF}
  Public
    Procedure getCurrentPosition(ASuccess : TJSGeoLocationCallback); overload;
    Procedure getCurrentPosition(ASuccess : TJSGeoLocationCallback;aError : TJSGeoLocationErrorCallback); overload;
    Procedure getCurrentPosition(ASuccess : TJSGeoLocationCallback;aError : TJSGeoLocationErrorCallback; AOptions : TJSPositionOptions); overload;
    Function watchPosition(ASuccess : TJSGeoLocationCallback) : NativeInt; overload;
    Function watchPosition(ASuccess : TJSGeoLocationCallback;aError : TJSGeoLocationErrorCallback) : NativeInt; overload;
    Function watchPosition(ASuccess : TJSGeoLocationCallback;aError : TJSGeoLocationErrorCallback; AOptions : TJSPositionOptions) : NativeInt; overload;
    procedure clearWatch(AID : NativeInt);
  end;

  TJSMediaStreamTrack = class {$IFDEF PAS2JS}external name 'MediaStreamTrack' (TJSEventTarget){$ENDIF}
  end;

  TJSMediaDevices = class {$IFDEF PAS2JS}external name 'MediaDevices' (TJSEventTarget){$ENDIF}
  end;

  TJSWorker = class {$IFDEF PAS2JS}external name 'Worker' (TJSEventTarget){$ENDIF}
  public
    constructor new(aURL : string);
    procedure postMessage(aValue : JSValue); overload;
    procedure postMessage(aValue : JSValue; aList : TJSValueDynArray); overload;
  end;

  TJSMessagePort = class {$IFDEF PAS2JS}external name 'MessagePort' (TJSEventTarget){$ENDIF}
  Public
    procedure close;
    procedure postMessage(aValue : JSValue); overload;
    procedure postMessage(aValue : JSValue; aList : TJSValueDynArray); overload;
    procedure start;
  end;

  { TJSSharedWorker }

  TJSSharedWorker = class {$IFDEF PAS2JS}external name 'SharedWorker' (TJSEventTarget){$ENDIF}
  private
    FPort: TJSMessagePort; {$IFDEF PAS2JS} external name 'port';{$ENDIF}
  Public
    constructor new(aURL : String); overload;
    constructor new(aURL : String; aName : string); overload;
    property port : TJSMessagePort Read FPort;
  end;

  { TJSServiceWorker }

  TJSServiceWorker = class {$IFDEF PAS2JS}external name 'ServiceWorker' (TJSWorker){$ENDIF}
  private
    FscriptURL: String;{$IFDEF PAS2JS}external name 'scriptURL';{$ENDIF}
    FState: string;{$IFDEF PAS2JS}external name 'state';{$ENDIF}
  Public
    property state : string read FState;
    property scriptURL : String Read FscriptURL;
  end;

  { TJSServiceWorkerRegistration }

  TJSServiceWorkerRegistration = class {$IFDEF PAS2JS}external name 'ServiceWorkerRegistration'  (TJSObject){$ENDIF}
  private
    FActive: TJSServiceWorker; {$IFDEF PAS2JS} external name 'active';{$ENDIF}
    FInstalling: TJSServiceWorker; {$IFDEF PAS2JS} external name 'installing';{$ENDIF}
    FScope: string; {$IFDEF PAS2JS} external name 'scope';{$ENDIF}
    FWaiting: TJSServiceWorker; {$IFDEF PAS2JS} external name 'waiting';{$ENDIF}
  public
    function unregister : TJSPromise;
    procedure update;
    property active : TJSServiceWorker read FActive;
    property scope : string read FScope;
    property waiting : TJSServiceWorker read FWaiting;
    property installing : TJSServiceWorker read FInstalling;
  end;

  TJSServiceWorkerContainerOptions = record
    scope : string;
  end;

  { TJSServiceWorkerContainer }

  TJSServiceWorkerContainer = class {$IFDEF PAS2JS}external name 'ServiceWorkerContainer'  (TJSObject){$ENDIF}
  private
    FController: TJSServiceWorker; {$IFDEF PAS2JS} external name 'controller';{$ENDIF}
    FReady: TJSPromise; {$IFDEF PAS2JS} external name 'ready';{$ENDIF}
  Public
    function register(aURL : String) : TJSPromise; overload;
    function register(aURL : String; aOptions : TJSServiceWorkerContainerOptions) : TJSPromise; overload;
    function getRegistration(aURL : String) : TJSPromise; overload;
    function getRegistration : TJSPromise; overload;
    function getRegistrations : TJSPromise;
    property controller : TJSServiceWorker read FController;
    property ready : TJSPromise read FReady;
  end;


  { TJSNavigator }

  TJSNavigator = class {$IFDEF PAS2JS}external name 'Navigator'  (TJSObject){$ENDIF}
{$IFDEF FIREFOX}
    FbuildID : String ; {$IFDEF PAS2JS} external name 'buildID';{$ENDIF}
    FOSCPU : String ; {$IFDEF PAS2JS} external name 'oscpu';{$ENDIF}
    FproductSub : string; {$IFDEF PAS2JS} external name 'productSub';{$ENDIF}
    FVendor : string; {$IFDEF PAS2JS} external name 'vendor';{$ENDIF}
{$ENDIF}
  private
    FCookieEnabled: Boolean; {$IFDEF PAS2JS} external name 'cookieEnabled';{$ENDIF}
    FGeoLocation: TJSGeoLocation; {$IFDEF PAS2JS} external name 'geolocation';{$ENDIF}
    FLanguage: String; {$IFDEF PAS2JS} external name 'language';{$ENDIF}
    FMaxTouchPoints: NativeInt; {$IFDEF PAS2JS} external name 'maxTouchPoints';{$ENDIF}
    FMediaDevices: TJSMediaDevices; {$IFDEF PAS2JS} external name 'mediaDevices';{$ENDIF}
    FOnline: boolean; {$IFDEF PAS2JS} external name 'onLine';{$ENDIF}
    FPlatform: string; {$IFDEF PAS2JS} external name 'platform';{$ENDIF}
    FServiceWorker: TJSServiceWorkerContainer; {$IFDEF PAS2JS} external name 'serviceWorker';{$ENDIF}
    FUserAgent: string; {$IFDEF PAS2JS} external name 'userAgent';{$ENDIF}
  public
    function getBattery : TJSPromise;
    function requestMediaKeySystemAccess(aKeySystem : String; supportedConfigurations : TJSValueDynArray) : TJSPromise;
    Procedure registerContentHandler(aMimeType,aURI,aTitle : string);
    Procedure registerProtocolHandler(aProtocol,aURI,aTitle : string);
    Procedure vibrate(aPattern : NativeInt); overload;
    Procedure vibrate(aPattern : Array of NativeInt); overload;
{$IFDEF FIREFOX}
    property buildID : String read FBuildID;
    property oscpu : string read FOSCPU;
    property productSub: string read FproductSub;
    property vendor : string read Fvendor;
{$ENDIF}
    property cookieEnabled : Boolean read FCookieEnabled;
    property geoLocation : TJSGeoLocation Read FGeoLocation;
    property language : String read FLanguage;
    property maxTouchPoints : NativeInt read FMaxTouchPoints;
    property mediaDevices : TJSMediaDevices read FMediaDevices;
    property onLine : boolean read FOnline;
    property platform : string read FPlatform;
    property userAgent : string read FUserAgent;
    property serviceWorker : TJSServiceWorkerContainer read FServiceWorker;
  end;

  { TJSTouchEvent }
  TTouchCoord = longint;

  TJSTouch = class {$IFDEF PAS2JS}external name 'Touch'  (TJSObject){$ENDIF}
  private
    FClientX: TTouchCoord; {$IFDEF PAS2JS} external name 'clientX';{$ENDIF}
    FClientY: TTouchCoord; {$IFDEF PAS2JS} external name 'clientY';{$ENDIF}
    FIDentifier: longint; {$IFDEF PAS2JS} external name 'identifier';{$ENDIF}
    FPageX: TTouchCoord; {$IFDEF PAS2JS} external name 'pageX';{$ENDIF}
    FPageY: TTouchCoord; {$IFDEF PAS2JS} external name 'pageY';{$ENDIF}
    FScreenX: TTouchCoord; {$IFDEF PAS2JS} external name 'screenX';{$ENDIF}
    FScreenY: TTouchCoord; {$IFDEF PAS2JS} external name 'screenY';{$ENDIF}
    FTarget: TJSElement; {$IFDEF PAS2JS} external name 'target';{$ENDIF}
  Public
    Property identifier : longint read FIDentifier;
    Property ScreenX : TTouchCoord Read FScreenX;
    Property ScreenY : TTouchCoord Read FScreenY;
    Property ClientX : TTouchCoord Read FClientX;
    Property ClientY : TTouchCoord Read FClientY;
    Property PageX : TTouchCoord Read FPageX;
    Property PageY : TTouchCoord Read FPageY;
    Property Target : TJSElement Read FTarget;
  end;

  { TJSTouchList }

  TJSTouchList = class {$IFDEF PAS2JS}external name 'TouchList' (TJSObject){$ENDIF}
  private
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
  Public
    function item (aIndex : Integer) : TJSTouch;
    property length : NativeInt Read FLength;
    Property Touches[AIndex : Integer] : TJSTouch Read item; default;
  end;


  TJSPerformance = class {$IFDEF PAS2JS}external name 'Performance' (TJSObject);{$ENDIF}
  end;

  TJSScreen = class {$IFDEF PAS2JS}external name 'Screen' (TJSObject){$ENDIF}
  private
    FavailHeight: Integer; {$IFDEF PAS2JS} external name 'availHeight';{$ENDIF}
    FavailWidth: Integer; {$IFDEF PAS2JS} external name 'availWidth';{$ENDIF}
    FcolorDepth: Integer; {$IFDEF PAS2JS} external name 'colorDepth';{$ENDIF}
    FPixelDepth: Integer; {$IFDEF PAS2JS} external name 'pixelDepth';{$ENDIF}
    Fheight: Integer; {$IFDEF PAS2JS} external name 'height';{$ENDIF}
    Fwidth: Integer; {$IFDEF PAS2JS} external name 'width';{$ENDIF}
  public
  { Properties declarations }
    property availHeight: Integer read FavailHeight;
    property availWidth: Integer read FavailWidth;
    property colorDepth: Integer read FcolorDepth;
    property pixelDepth: Integer read FPixelDepth;
    property height: Integer read Fheight;
    property width: Integer read Fwidth;
  end;

  TJSBlob = class;

  TJSParamEnumCallBack = reference to procedure (const aKey,aValue : string);
  TJSURLSearchParams = class {$IFDEF PAS2JS}external name 'URLSearchParams' (TJSObject){$ENDIF}
  Public
    Procedure append(const aName,aValue : string);
    Procedure delete(const aName : string);
    Function entries : TJSIterator;
    Procedure foreach(aEnumCallBack : TJSParamEnumCallBack);
    function get(const aName : string) : JSValue;
    // If you're sure the value exists...
    function getString(const aName : string) : string; {$IFDEF PAS2JS} external name 'get';{$ENDIF}
    function getAll(const aName : string) : TStringDynArray;
    function has(const aName : string) : Boolean;
    Function keys : TJSIterator; reintroduce;
    Procedure set_(const aName,aValue : string); {$IFDEF PAS2JS} external name 'set';{$ENDIF}
    Procedure sort;
    Function values : TJSIterator; reintroduce;
  end;

  TJSURL = class {$IFDEF PAS2JS}external name 'URL' (TJSObject){$ENDIF}
  Private
    FOrigin : String; {$IFDEF PAS2JS} external name 'origin';{$ENDIF}
    FSearchParams : TJSURLSearchParams; {$IFDEF PAS2JS} external name 'searchParams';{$ENDIF}
  public
    hash : string;
    host : string;
    hostname : string;
    href : string;
    password : string;
    pathname : string;
    port : string;
    protocol : string;
    search : string;
    username : string;
    constructor new(aURL : String); overload;
    constructor new(aURL,aBase : String); overload;
    class function createObjectURL(const v: JSValue): string;
    class function revokeObjectURL(const S : String): string;
    function toJSON : String;
    Property Origin : String Read FOrigin;
    property SearchParams : TJSURLSearchParams read FSearchParams;
  end;

  TJSCSSStyleDeclaration = class; // forward

  TJSTimerCallBack = reference to procedure; {$IFDEF PAS2JS}safecall;{$ENDIF}
  Theader = Array [0..1] of String;
  THeaderArray = Array of Theader;

  TJSHTMLHeaders = class {$IFDEF PAS2JS}external name 'Headers' (TJSObject){$ENDIF}
  Public
    constructor new(values : THeaderArray); overload;
    procedure append(aName, aValue : String);
    procedure delete(aName : String);
    function entries : TJSIterator;
    Function get(aName: String): string;
    Function has(aName: String): Boolean;
    function keys : TJSIterator; reintroduce;
    function values : TJSIterator; reintroduce;
    procedure set_(aName, aValue : String);
    Property Headers[aName : string] : string Read Get Write Set_;
  end;


  { TJSMediaQueryList }

  TJSMediaQueryList = class {$IFDEF PAS2JS}external name 'MediaQueryList' (TJSObject){$ENDIF}
  private
    FMatches: Boolean; {$IFDEF PAS2JS} external name 'matches';{$ENDIF}
    FMedia: String; {$IFDEF PAS2JS} external name 'media';{$ENDIF}
  Public
    Property matches : Boolean Read FMatches;
    Property media : String Read FMedia;
  end;

  TJSReadableStream = class {$IFDEF PAS2JS}external name 'ReadableStream' (TJSObject){$ENDIF}
  private
    flocked: Boolean; {$IFDEF PAS2JS} external name 'locked';{$ENDIF}
  public
    property locked: Boolean read flocked;
    constructor new(underlyingSource: TJSObject); overload;
    constructor new(underlyingSource, queueingStrategy: TJSObject); overload;
    function cancel(reason: TJSDOMString): TJSPromise;
    function getReader(): TJSObject; overload;
    function getReader(mode: TJSObject): TJSObject; overload;
    function pipeThrough(transformStream: TJSObject): TJSReadableStream; overload;
    function pipeThrough(transformStream, options: TJSObject): TJSReadableStream; overload;
    function pipeTo(destination: TJSObject): TJSPromise; overload;
    function pipeTo(destination, options: TJSObject): TJSPromise; overload;
    function tee(): TJSArray; // array containing two TJSReadableStream instances
  end;

  TJSBody = class {$IFDEF PAS2JS}external name 'Body' (TJSObject){$ENDIF}
  private
    fbody: TJSReadableStream; {$IFDEF PAS2JS} external name 'body';{$ENDIF}
    fbodyUsed: Boolean; {$IFDEF PAS2JS} external name 'bodyUsed';{$ENDIF}
  public
    property body: TJSReadableStream read fbody;
    property bodyUsed: Boolean read fbodyUsed;
    function arrayBuffer(): TJSPromise; // resolves to TJSArrayBuffer
    //function blob(): TJSPromise; // resolves to TJSBlob
    function blob: TJSBlob; {$IFDEF PAS2JS}{$IFDEF PAS2JS}{$IFNDEF SkipAsync}async;{$ENDIF}{$ENDIF}{$ENDIF}
    function json(): TJSPromise; // resolves to JSON / TJSValue
    //function text(): TJSPromise; // resolves to USVString, always decoded using UTF-8
    function text(): string; {$IFDEF PAS2JS}{$IFNDEF SkipAsync}async;{$ENDIF}{$ENDIF}
  end;

  TJSResponse = class {$IFDEF PAS2JS}external name 'Response' (TJSBody){$ENDIF}
  private
    fheaders: TJSObject;{$IFDEF PAS2JS}external name 'headers';{$ENDIF}
    fok: Boolean; {$IFDEF PAS2JS} external name 'ok';{$ENDIF}
    fredirected: Boolean; {$IFDEF PAS2JS} external name 'redirected';{$ENDIF}
    fstatus: NativeInt; {$IFDEF PAS2JS} external name 'status';{$ENDIF}
    fstatusText: String; {$IFDEF PAS2JS} external name 'statusText';{$ENDIF}
    ftype: String; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    furl: String; {$IFDEF PAS2JS} external name 'url';{$ENDIF}
    fuseFinalUrl: Boolean; {$IFDEF PAS2JS} external name 'useFinalUrl';{$ENDIF}
  public
    property headers: TJSObject read fheaders; //
    property ok: Boolean read fok;
    property redirected: Boolean read fredirected;
    property status: NativeInt read fstatus;
    property statusText: String read fstatusText; //
    property type_: String read ftype; //
    property url: String read furl; //
    property useFinalUrl: Boolean read fuseFinalUrl write fuseFinalUrl;
    constructor new(body: TJSObject; init: TJSObject); {$IFDEF PAS2JS}varargs;{$ENDIF} {$IFDEF PAS2JS} external name 'new';{$ENDIF}
    function clone(): TJSResponse;
    function error(): TJSResponse;
    function redirect(url: String; Status: NativeInt): TJSResponse;
  end;

  { TJSWindow }
  TJSDOMHighResTimeStamp = Double;
  TFrameRequestCallback = procedure (aTime: TJSDOMHighResTimeStamp);

  TJSPostMessageOptions = class {$IFDEF PAS2JS}external name 'Object' (TJSObject){$ENDIF}
    targetOrigin : string;
    transfer : TJSValueDynArray;
  end;

  TJSWindowArray = Array of TJSWindow;
  TJSWindow = class {$IFDEF PAS2JS}external name 'Window' (TJSObject){$ENDIF}
  Private
    FClosed: boolean; {$IFDEF PAS2JS} external name 'closed';{$ENDIF}
    FConsole : TJSConsole;{$IFDEF PAS2JS}external name 'console';{$ENDIF}
    FCrypto: TJSCrypto; {$IFDEF PAS2JS} external name 'crypto';{$ENDIF}
    FDevicePixelRatio: Double; {$IFDEF PAS2JS} external name 'devicePixelRatio';{$ENDIF}
    FDocument: TJSDocument; {$IFDEF PAS2JS} external name 'document';{$ENDIF}
    FFrameElement: TJSElement; {$IFDEF PAS2JS} external name 'frameElement';{$ENDIF}
    FFrames: TJSWindowArray; {$IFDEF PAS2JS} external name 'frames';{$ENDIF}
    FHistory: TJSHistory; {$IFDEF PAS2JS} external name 'history';{$ENDIF}
    FIndexedDB: TJSIDBFactory; {$IFDEF PAS2JS} external name 'indexedDB';{$ENDIF}
    FInnerheight: NativeInt; {$IFDEF PAS2JS} external name 'innerHeight';{$ENDIF}
    FInnerWidth: NativeInt; {$IFDEF PAS2JS} external name 'innerWidth';{$ENDIF}
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
    FLocalStorage: TJSStorage; {$IFDEF PAS2JS} external name 'localStorage';{$ENDIF}
    FLocation: TJSLocation; {$IFDEF PAS2JS} external name 'location';{$ENDIF}
    FLocationBar: TJSLocationBar; {$IFDEF PAS2JS} external name 'locationbar';{$ENDIF}
    FLocationString: string; {$IFDEF PAS2JS} external name 'location';{$ENDIF}
    FMenuBar: TJSMenuBar; {$IFDEF PAS2JS} external name 'menubar';{$ENDIF}
    FNavigator: TJSNavigator; {$IFDEF PAS2JS} external name 'navigator';{$ENDIF}
    FOpener: TJSWindow; {$IFDEF PAS2JS} external name 'opener';{$ENDIF}
    FOuterheight: NativeInt; {$IFDEF PAS2JS} external name 'outerHeight';{$ENDIF}
    FOuterWidth: NativeInt; {$IFDEF PAS2JS} external name 'outerWidth';{$ENDIF}
    FParent: TJSWindow; {$IFDEF PAS2JS} external name 'parent';{$ENDIF}
    FPerformance: TJSPerformance; {$IFDEF PAS2JS} external name 'Performance';{$ENDIF}
    FPersonalBar: TJSPersonalBar; {$IFDEF PAS2JS} external name 'personalbar';{$ENDIF}
    FScreen: TJSScreen; {$IFDEF PAS2JS} external name 'screen';{$ENDIF}
    FScreenX: NativeInt; {$IFDEF PAS2JS} external name 'screenX';{$ENDIF}
    FScreenY: NativeInt; {$IFDEF PAS2JS} external name 'screenY';{$ENDIF}
    FScrollbar: TJSScrollBars; {$IFDEF PAS2JS} external name 'scrollbar';{$ENDIF}
    FScrollX: NativeInt; {$IFDEF PAS2JS} external name 'scrollX';{$ENDIF}
    FScrollY: NativeInt; {$IFDEF PAS2JS} external name 'scrollY';{$ENDIF}
    FSelf: TJSWindow; {$IFDEF PAS2JS} external name 'self';{$ENDIF}
    FSessionStorage: TJSStorage; {$IFDEF PAS2JS} external name 'sessionStorage';{$ENDIF}
    FToolBar: TJSToolBar; {$IFDEF PAS2JS} external name 'toolbar';{$ENDIF}
    FTop: TJSWindow; {$IFDEF PAS2JS} external name 'top';{$ENDIF}
    FURL: TJSURL; {$IFDEF PAS2JS} external name 'URL';{$ENDIF}
  Public
    fullSreen : Boolean;   
    name : string;
    status : string;
    onabort : TJSEventHandler;
    onafterprint : TJSEventHandler;
    onbeforeprint : TJSEventHandler;
    onbeforeinstallprompt : TJSEventHandler;
    onbeforeunloadprompt : TJSEventHandler;
    onblur : TJSEventHandler;
    onchange : TJSEventHandler;
    onclick: THTMLClickEventHandler;
    onclose : TJSEventHandler;
    oncontextmenu : TJSEventHandler;
    ondblclick : THTMLClickEventHandler;
    onerror : TJSErrorEventHandler;
    onfocus : TJSFocusEventhandler;
    onhashchange : TJSHashChangeEventhandler;
    oninput : TJSEventhandler;
    onkeydown : TJSKeyEventhandler;
    onkeypress : TJSKeyEventhandler;
    onkeyup : TJSKeyEventhandler;
    onlanguagechange : TJSEventhandler;
    onload : TJSEventhandler;
    onloadend : TJSLoadEventhandler;
    onloadstart : TJSLoadEventhandler;
    onmessage : TJSEventHandler;
    onmousedown : TJSMouseEventHandler;
    onmouseenter : TJSMouseEventHandler;
    onmouseleave : TJSMouseEventHandler;
    onmousemove : TJSMouseEventHandler;
    onmouseout : TJSMouseEventHandler;
    onmouseover : TJSMouseEventHandler;
    onmouseup : TJSMouseEventHandler;
    onmousewheel : TJSMouseEventHandler;
    onoffline : TJSEventHandler;
    ononline : TJSEventHandler;
    onpagehide : TJSPageTransitionEventHandler;
    onpageshow : TJSPageTransitionEventHandler;
    onpaint : TJSEventHandler;
    onpointercancel : TJSPointerEventHandler;
    onpointerdown : TJSPointerEventHandler;
    onpointerenter : TJSPointerEventHandler;
    onpointerleave : TJSPointerEventHandler;
    onpointermove : TJSPointerEventHandler;
    onpointerout : TJSPointerEventHandler;
    onpointerover : TJSPointerEventHandler;
    onpointerup : TJSPointerEventHandler;
    onpointerlockchange : TJSPointerEventHandler;
    onprogress : TJSProgressEventhandler;
    onpopstate : TJSPopStateEventHandler;
    onreset : TJSUIEventHandler;
    onresize : TJSUIEventHandler;
    onscroll : TJSUIEventHandler;
    onselect : TJSEventHandler;
    onselectionchange : TJSEventHandler;
    onstorage : TJSStorageEventHandler;
    onsubmit : TJSEventHandler;
    onunload : TJSUIEventHandler;
    touchstart : TJSTouchEventHandler;
    touchend : TJSTouchEventHandler;
    touchmove : TJSTouchEventHandler;
    touchcancel : TJSTouchEventHandler;
    procedure addEventListener(aname : string; aListener : TJSEventHandler); overload;
    procedure addEventListener(aname : string; aListener : JSValue); overload;
    Procedure alert(Const Msg : String);
    Function atob(Const aValue : string) : string;
    procedure blur;
    Procedure clearInterval(aID: NativeInt);
    Procedure clearTimeout(aID: NativeInt);
    Function btoa(Const aValue : string) : string;
    procedure cancelAnimationFrame(aHandle: Integer);
    Procedure close;
    Function confirm(Const aMsg : String) :  boolean;
    function fetch(resource: String; init: TJSObject): TJSPromise; overload; {$IFDEF PAS2JS} external name 'fetch';{$ENDIF}
    //function fetch(resource: String): TJSPromise; overload; {$IFDEF PAS2JS} external name 'fetch';{$ENDIF}
    function fetch(resource: String): TJSResponse; {$IFDEF PAS2JS}{$IFNDEF SkipAsync}async;{$ENDIF}{$ENDIF} overload; {$IFDEF PAS2JS} external name 'fetch';{$ENDIF}
    function fetch(resource: TJSObject; init: TJSObject): TJSPromise; overload; {$IFDEF PAS2JS} external name 'fetch';{$ENDIF}
    function fetch(resource: TJSObject): TJSPromise; overload; {$IFDEF PAS2JS} external name 'fetch';{$ENDIF}
    procedure focus;
    Function getComputedStyle(aElement : TJSElement) : TJSCSSStyleDeclaration; overload;
    Function getComputedStyle(aElement,aPseudoElement : TJSElement) : TJSCSSStyleDeclaration; overload;
    function matchMedia(aQuery : String) : TJSMediaQueryList;
    procedure moveBy(x,y : NativeInt);
    procedure moveTo(x,y : NativeInt);
    function open : TJSWindow; overload;
    function open(Const aURL : String) : TJSWindow; overload;
    function open(Const aURL,aTarget : String) : TJSWindow; overload;
    function open(Const aURL,aTarget : String; AOptions : TJSObject) : TJSWindow; overload;
    procedure postMessage(aMessage : JSValue); overload;
    procedure postMessage(aMessage : JSValue; aOptions : TJSPostMessageOptions); overload;
    procedure postMessage(aMessage : JSValue; aTransfer : TJSValueDynArray); overload;
    procedure postMessage(aMessage : JSValue; aTarget : string); overload;
    procedure postMessage(aMessage : JSValue; aTarget : string; aTransfer : TJSValueDynArray); overload;
    procedure print;
    function prompt(const aMessage : String) : String; overload;
    function prompt(const aMessage,aDefault : String) : String; overload;
    procedure removeEventListener(aname : string; aListener : TJSEventHandler); overload;
    procedure removeEventListener(aname : string; aListener : JSValue); overload;
    function requestAnimationFrame(aCallback: TFrameRequestCallback): Integer;
    procedure resizeBy(aWidth,aHeight : NativeInt);
    procedure resizeTo(aWidth,aHeight : NativeInt);
    procedure scrollBy(x,y : NativeInt);
    procedure scrollTo(x,y : NativeInt);
    Function setInterval(ahandler : TJSTimerCallBack; aInterval : NativeUInt) : NativeInt; {$IFDEF PAS2JS}varargs;{$ENDIF}
    Function setTimeout(ahandler : TJSTimerCallBack; aTimeout : NativeUInt) : NativeInt; {$IFDEF PAS2JS}varargs;{$ENDIF} overload;
    Function setTimeout(ahandler : TJSTimerCallBack) : NativeInt; overload;
    procedure stop;
    { public properties }
    property console : TJSConsole Read FConsole;
    property closed : boolean read FClosed;
    property crypto : TJSCrypto Read FCrypto;
    property devicePixelRatio : Double read FDevicePixelRatio;
    property document : TJSDocument read FDocument;
    property frameElement : TJSElement Read FFrameElement;
    Property frames  : TJSWindowArray read FFrames;
    Property history : TJSHistory read FHistory;
    Property indexedDB : TJSIDBFactory read FIndexedDB;
    Property innerHeight : NativeInt Read FInnerheight;
    Property innerWidth : NativeInt Read FInnerWidth;
    Property length : NativeInt Read FLength;
    Property localStorage : TJSStorage Read FLocalStorage; 
    property location : TJSLocation Read FLocation;
    Property locationString : String read FLocationString write FLocationString;
    property locationbar : TJSLocationBar Read FLocationBar;
    property menubar : TJSMenuBar Read FMenuBar;
    property navigator : TJSNavigator Read FNavigator;
    property opener : TJSWindow read FOpener;
    Property outerHeight : NativeInt Read FOuterheight;
    Property outerWidth : NativeInt Read FOuterWidth;
    Property parent : TJSWindow Read FParent;
    Property Performance : TJSPerformance Read FPerformance;
    property personalbar : TJSPersonalBar Read FPersonalBar;
    property screen : TJSScreen read FScreen;
    property screenX : NativeInt read FScreenX;
    Property screenY : NativeInt read FScreenY;
    Property scrollbar : TJSScrollBars Read FScrollbar;
    property scrollX : NativeInt read FScrollX;
    Property scrollY : NativeInt read FScrollY;
    Property _Self : TJSWindow read FSelf;
    Property sessionStorage : TJSStorage Read FSessionStorage; 
    property toolbar : TJSToolBar Read FToolBar;
    property top : TJSWindow Read FTop;
    property URL : TJSURL Read FURL; 
  end;

  { TJSCSSStyleDeclaration }

  TJSCSSStyleDeclaration = class {$IFDEF PAS2JS}external name 'CSSStyleDeclaration'  (TJSObject){$ENDIF}
  private
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
    FParentRule: TJSCSSRule; {$IFDEF PAS2JS} external name 'parentRule';{$ENDIF}
  public
    cssText : string;
    function item(aIndex : Integer) : string;
    function removeProperty(const aProperty : String) : string;
    function getPropertyPriority(const aProperty : String) : string;
    function getPropertyValue(const aProperty : String) : string;
    procedure setProperty(const aProperty,aValue : String);overload;
    procedure setProperty(const aProperty,aValue,aPriority : string); overload;
    property length : NativeInt read FLength;
    property parentRule : TJSCSSRule read FParentRule;
  end;





  { TJSHTMLElement }
  TJSHTMLElement = class {$IFDEF PAS2JS}external name 'HTMLElement' (TJSElement){$ENDIF}
  private
    FDataset: TJSObject ; {$IFDEF PAS2JS} external name 'dataset';{$ENDIF}
    FIsContentEditable: Boolean ; {$IFDEF PAS2JS} external name 'isContentEditable';{$ENDIF}
    FOffsetHeight: Double; {$IFDEF PAS2JS} external name 'offsetHeight';{$ENDIF}
    FOffsetLeft: Double; {$IFDEF PAS2JS} external name 'offsetLeft';{$ENDIF}
    FOffsetParent: TJSElement; {$IFDEF PAS2JS} external name 'offsetParent';{$ENDIF}
    FOffsetTop: Double; {$IFDEF PAS2JS} external name 'offsetTop';{$ENDIF}
    FOffsetWidth: Double; {$IFDEF PAS2JS} external name 'offsetWidth';{$ENDIF}
  Public
    accessKey : string;
    contentEditable : string;
    dir : string;
    draggable : boolean;
    hidden : boolean;
    lang : string;
    spellcheck : boolean;
    style : TJSCSSStyleDeclaration;
    tabIndex : Integer;
    title: string;
    onabort : TJSEventHandler;
    onanimationcancel: THTMLAnimationEventHandler;
    onanimationend: THTMLAnimationEventHandler;
    onblur : TJSEventHandler;
    oncancel : TJSEventHandler;
    oncanplay : TJSEventHandler;
    oncanplaythrough : TJSEventHandler;
    onchange : TJSEventHandler;
    onclick: THTMLClickEventHandler;
    onclose : TJSEventHandler;
    oncontextmenu : TJSEventHandler;
    ondblclick : THTMLClickEventHandler;
    ondrag : TJSDragDropEventHandler;
    ondragend : TJSDragDropEventHandler;
    ondragenter : TJSDragDropEventHandler;
    ondragexit : TJSDragDropEventHandler;
    ondragover : TJSDragDropEventHandler;
    ondragleave : TJSDragDropEventHandler;
    ondragstart: TJSDragDropEventHandler;
    ondrop : TJSDragDropEventHandler;
    onerror : TJSErrorEventHandler;
    onfocus : TJSFocusEventhandler;
    ondurationchange : TJSEventHandler;
    onemptied : TJSEventHandler;
    onended : TJSEventHandler;
    ongotpointercapture : TJSPointerEventHandler;
    oninput : TJSEventhandler;
    oninvalid : TJSEventhandler;
    onkeydown : TJSKeyEventhandler;
    onkeypress : TJSKeyEventhandler;
    onkeyup : TJSKeyEventhandler;
    onload : TJSEventhandler;
    onloadeddata : TJSEventhandler;
    onloadedmetadata : TJSEventhandler;
    onloadend : TJSLoadEventhandler;
    onloadstart : TJSLoadEventhandler;
    onlostpointercapture : TJSPointerEventHandler;
    onmousedown : TJSMouseEventHandler;
    onmouseenter : TJSMouseEventHandler;
    onmouseleave : TJSMouseEventHandler;
    onmousemove : TJSMouseEventHandler;
    onmouseout : TJSMouseEventHandler;
    onmouseover : TJSMouseEventHandler;
    onmouseup : TJSMouseEventHandler;
    onmousewheel : TJSMouseEventHandler;
    onpause : TJSPointerEventHandler;
    onplay : TJSPointerEventHandler;
    onplaying : TJSPointerEventHandler;
    onpointercancel : TJSPointerEventHandler;
    onpointerdown : TJSPointerEventHandler;
    onpointerenter : TJSPointerEventHandler;
    onpointerleave : TJSPointerEventHandler;
    onpointermove : TJSPointerEventHandler;
    onpointerout : TJSPointerEventHandler;
    onpointerover : TJSPointerEventHandler;
    onpointerup : TJSPointerEventHandler;
    onpointerlockchange : TJSPointerEventHandler;
    onprogress : TJSProgressEventhandler;
    onseeked : TJSEventHandler;
    onseeking : TJSEventHandler;
    onreset : TJSUIEventHandler;
    onscroll : TJSUIEventHandler;
    onselect : TJSEventHandler;
    onselectstart : TJSEventHandler;
    onselectionchange : TJSEventHandler;
    onshow : TJSEventHandler;
    onstalled : TJSEventHandler;
    ontimeupdate : TJSEventHandler;
    ontransitioncancel : TJSEventHandler;
    ontransitionend : TJSEventHandler;
    onvolumechange : TJSEventHandler;
    onsubmit : TJSEventHandler;
    onwheel : TJSMouseWheelEventHandler;
    onwaiting : TJSEventHandler;
    touchstart : TJSTouchEventHandler;
    touchend : TJSTouchEventHandler;
    touchmove : TJSTouchEventHandler;
    touchcancel : TJSTouchEventHandler;
    Procedure blur;
    Procedure focus;
    Procedure click;
    property dataset : TJSObject read FDataset;
    property isContentEditable : Boolean read FIsContentEditable;
    property offsetHeight : Double Read FOffsetHeight;
    property offsetLeft : Double Read FOffsetLeft;
    property offsetTop : Double Read FOffsetTop;
    property offsetWidth : Double Read FOffsetWidth;
    property offsetParent : TJSElement Read FOffsetParent;
  end;

  TJSHTMLFormControlsCollection = class {$IFDEF PAS2JS}external name 'HTMLFormControlsCollection' (TJSHTMLCollection){$ENDIF}
  Public
    function namedItem(S : String) : TJSElement; reintroduce; {$IFDEF PAS2JS} external name 'namedItem';{$ENDIF}
    property Items[S : String] : TJSElement read namedItem; default;
  end;

  { TJSHTMLFormElement }

  TJSHTMLFormElement = class {$IFDEF PAS2JS}external name 'HTMLFormElement' (TJSHTMLElement){$ENDIF}
  private
    FElements: TJSHTMLFormControlsCollection; {$IFDEF PAS2JS} external name 'elements';{$ENDIF}
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
  Public
    method : string;
    target : string;
    action : string;
    encoding : string;
    enctype : string;
    acceptCharset :  string;
    autocomplete : string;
    noValidate : boolean;
    Procedure reset;
    function reportValidity : Boolean;
    function checkValidity : Boolean;
    procedure submit;
    property elements : TJSHTMLFormControlsCollection read FElements;
    Property length : NativeInt Read FLength;
  end;

  { TJSValidityState }

  TJSValidityState = class {$IFDEF PAS2JS}external name 'ValidityState'  (TJSObject){$ENDIF}
  private
    FBadInput: Boolean; {$IFDEF PAS2JS} external name 'badInput';{$ENDIF}
    FCustomError: Boolean; {$IFDEF PAS2JS} external name 'customError';{$ENDIF}
    FPatternMismatch: Boolean; {$IFDEF PAS2JS} external name 'patternMisMatch';{$ENDIF}
    FRangeOverflow: Boolean; {$IFDEF PAS2JS} external name 'rangeOverflow';{$ENDIF}
    FRangeUnderflow: Boolean; {$IFDEF PAS2JS} external name 'rangeUnderflow';{$ENDIF}
    FStepMismatch: Boolean; {$IFDEF PAS2JS} external name 'stepMismatch';{$ENDIF}
    FTooLong: Boolean; {$IFDEF PAS2JS} external name 'tooLong';{$ENDIF}
    FTooShort: Boolean; {$IFDEF PAS2JS} external name 'tooShort';{$ENDIF}
    FTypeMismatch: Boolean; {$IFDEF PAS2JS} external name 'typeMisMatch';{$ENDIF}
    FValid: Boolean; {$IFDEF PAS2JS} external name 'valid';{$ENDIF}
    FValueMissing: Boolean; {$IFDEF PAS2JS} external name 'valueMissing';{$ENDIF}
  public
    property badInput : Boolean read FBadInput;
    property customError : Boolean read FCustomError;
    property patternMisMatch : Boolean read FPatternMismatch;
    property rangeOverflow : Boolean read FRangeOverflow;
    property rangeUnderflow : Boolean read FRangeUnderflow;
    property stepMismatch : Boolean read FStepMismatch;
    property tooLong : Boolean read FTooLong;
    property tooShort : Boolean read FTooShort;
    property typeMisMatch : Boolean read FTypeMismatch;
    property valid : Boolean Read FValid;
    property valueMissing : Boolean read FValueMissing;
  end;

  { TJSBlob }

  TJSBlob = class {$IFDEF PAS2JS}external name 'Blob' (TJSEventTarget){$ENDIF}
  private
    FSize: NativeInt; {$IFDEF PAS2JS} external name 'size';{$ENDIF}
    FType: string; {$IFDEF PAS2JS} external name  'type';{$ENDIF}
  Public
    procedure close;
    function slice : TJSBlob; overload;
    function slice(aStart : NativeInt) : TJSBlob; overload;
    function slice(aStart,aEnd : NativeInt) : TJSBlob; overload;
    function slice(aStart,aEnd : NativeInt; AContentType : String) : TJSBlob; overload;
    property size : NativeInt read FSize;
    property _type : string read FType;
  end;


  { TJSHTMLFile }

  TJSHTMLFile = class {$IFDEF PAS2JS}external name 'File' (TJSBlob){$ENDIF}
  private
    FLastModified: NativeInt; {$IFDEF PAS2JS} external name 'lastModified';{$ENDIF}
    FLastModifiedDate: TJSDate; {$IFDEF PAS2JS} external name 'lastModifiedDate';{$ENDIF}
    FName: string; {$IFDEF PAS2JS} external name 'name';{$ENDIF}
  Public
    property name : string read FName;
    property lastModified : NativeInt read FLastModified;
    property lastModifiedDate : TJSDate read FLastModifiedDate;
  end;

  { TJSHTMLFileList }

  TJSHTMLFileList = class {$IFDEF PAS2JS}external name 'FileList' (TJSEventTarget){$ENDIF}
  private
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
  Public
    function item(aIndex : NativeInt) : TJSHTMLFile;
    property length : NativeInt read FLength;
    property Files[aIndex : NativeInt] : TJSHTMLFile Read item; default;
  end;

   { TJSHTMLInputElement }
  // https://html.spec.whatwg.org/multipage/forms.html#the-input-element

  TJSHTMLInputElement = class {$IFDEF PAS2JS}external name 'HTMLInputElement' (TJSHTMLElement){$ENDIF}
  private
    FFiles: TJSHTMLFileList; {$IFDEF PAS2JS} external name 'files';{$ENDIF}
    FForm: TJSHTMLFormElement; {$IFDEF PAS2JS} external name 'form';{$ENDIF}
    FLabels: TJSNodeList; {$IFDEF PAS2JS} external name 'labels';{$ENDIF}
    FList: TJSHTMLElement; {$IFDEF PAS2JS} external name 'list';{$ENDIF}
    FValidationmMessage: string; {$IFDEF PAS2JS} external name 'validationMessage';{$ENDIF}
    FValidity: TJSValidityState; {$IFDEF PAS2JS} external name 'validity';{$ENDIF}
    FWillValidate: boolean; {$IFDEF PAS2JS} external name 'willValidate';{$ENDIF}
  Public
    procedure select;
    procedure setCustomValidity(aText : string);
    procedure stepUp; overload;
    procedure stepUp(n : Integer); overload;
    function checkValidity : Boolean;
    function reportValidity : Boolean;
    procedure setSelectionRange(selectionStart, selectionEnd: NativeInt) ; overload;
    procedure setSelectionRange(selectionStart, selectionEnd: NativeInt; Direction : string) ; overload;
    procedure setRangeText(aText : string; selectionStart, selectionEnd: NativeInt) ; overload;
    procedure setRangeText(aText : string; selectionStart, selectionEnd: NativeInt; Direction : string) ; overload;
  Public
    accept : string;
    allowDirs : boolean;
    align : string;
    alt : string;
    autofocus : boolean;
    autocapitalize : string;
    autocomplete : string;
    defaultValue : string;
    defaultChecked : string;
    checked : boolean;
    dirName : string;
    disabled : boolean;
    formAction : string;
    formEncType : string;
    formMethod : string;
    formNoValidate : Boolean;
    formTarget : string;
    height : string;
    indeterminate : boolean;
    inputMode : string;
    max : string;
    maxLength : NativeInt;
    min : string;
    minLength : NativeInt;
    multiple : boolean;
    pattern : string;
    placeholder : string;
    readOnly : boolean;
    required : boolean;
    size : NativeInt;
    src : string;
    step : string;
    _type : string; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    selectionStart : NativeInt;
    selectionEnd : NativeInt;
    selectionDirection : string;
    useMap : string;
    value : string;
    width : string;
    property files : TJSHTMLFileList Read FFiles;
    property form : TJSHTMLFormElement read FForm;
    property labels : TJSNodeList read FLabels;
    property list : TJSHTMLElement Read FList;
    property validationMessage : string read FValidationmMessage;
    property willValidate : boolean read FWillValidate;
    property validity : TJSValidityState read FValidity;
  end;

  TJSDOMSettableTokenList = class {$IFDEF PAS2JS}external name 'DOMSettableTokenList' (TJSDOMTokenList){$ENDIF}
  private
    fvalue: TJSDOMString; {$IFDEF PAS2JS} external name 'value';{$ENDIF}
  public
    property value: TJSDOMString read fvalue; // readonly
  end;

  TJSHTMLOutputElement = class {$IFDEF PAS2JS}external name 'HTMLOutputElement' (TJSHTMLElement){$ENDIF}
  private
    flabels: TJSNodeList; {$IFDEF PAS2JS} external name 'labels';{$ENDIF}
    fform: TJSHTMLFormElement; {$IFDEF PAS2JS} external name 'form';{$ENDIF}
    ftype: TJSDOMString; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    fdefaultValue: TJSDOMString; {$IFDEF PAS2JS} external name 'defaultValue';{$ENDIF}
    fvalue: TJSDOMString; {$IFDEF PAS2JS} external name 'value';{$ENDIF}
    fwillValidate: Boolean; {$IFDEF PAS2JS} external name 'willValidate';{$ENDIF}
    fvalidity: TJSValidityState; {$IFDEF PAS2JS} external name 'validity';{$ENDIF}
    fvalidationMessage: TJSDOMString; {$IFDEF PAS2JS} external name 'validationMessage';{$ENDIF}
  public
    htmlFor: TJSDOMSettableTokenList;
    function checkValidity: Boolean;
    function reportValidity: Boolean;
    procedure setCustomValidity(error: TJSDOMString);
  public
    property labels: TJSNodeList read flabels;
    property form: TJSHTMLFormElement read fform;
    property type_: TJSDOMString read ftype;
    property defaultValue: TJSDOMString read fdefaultValue;
    property value: TJSDOMString read fvalue write fvalue;
    property willValidate: Boolean read fwillValidate;
    property validity: TJSValidityState read fvalidity;
    property validationMessage: TJSDOMString read fvalidationMessage;
  end;

  { TJSHTMLImageElement }

  TJSHTMLImageElement = class {$IFDEF PAS2JS}external name 'Image' (TJSHTMLElement){$ENDIF}
  Private
    FComplete: boolean; {$IFDEF PAS2JS} external name 'complete';{$ENDIF}
    FCurrentSrc: String; {$IFDEF PAS2JS} external name 'currentSrc';{$ENDIF}
    FNaturalHeight: NativeUInt; {$IFDEF PAS2JS} external name 'naturalHeight';{$ENDIF}
    FNaturalWidth: NativeUInt; {$IFDEF PAS2JS} external name 'naturalWidth';{$ENDIF}
    FX: NativeInt; {$IFDEF PAS2JS} external name 'x';{$ENDIF}
    FY: NativeInt; {$IFDEF PAS2JS} external name 'y';{$ENDIF}
  Public
    alt: String;
    crossOrigin: String;
    decoding: String;
    height: NativeUInt;
    isMap: boolean;
    referrerPolicy: String;
    src: String;
    sizes: String;
    srcset: String;
    useMap: String;
    width: NativeUInt;
    constructor New(x,y : Cardinal); overload;
    function decode : TJSPromise;
    property complete: boolean read FComplete;
    property currentSrc: String read FCurrentSrc;
    property naturalHeight: NativeUInt read FNaturalHeight;
    property naturalWidth: NativeUInt read FNaturalWidth;
    property x: NativeInt read FX;
    property y: NativeInt read FY;
  end;

  TJSHTMLLinkElement = class {$IFDEF PAS2JS}external name 'HTMLLinkElement'(TJSHTMLElement){$ENDIF}
  Private
    frelList: TJSDOMTokenList; {$IFDEF PAS2JS} external name 'relList';{$ENDIF}
    fsizes: TJSDOMSettableTokenList {TJSDOMTokenList}; {$IFDEF PAS2JS} external name 'sizes';{$ENDIF}
  Public
    href: string;
    crossOrigin: string;
    rel: string;
    as_: string; {$IFDEF PAS2JS} external name 'as';{$ENDIF}
    media: string;
    integrity: string;
    hreflang: string;
    type_: string; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    imageSrcset: string;
    imageSizes: string;
    referrerPolicy: string;
    disabled: string;
    charset: string deprecated; // obsolete
    rev: string deprecated; // obsolete property
    target: string deprecated; // obsolete property
    Property relList: TJSDOMTokenList read frelList;
    Property sizes: TJSDOMSettableTokenList{TJSDOMTokenList} read fsizes;
  end;

  { TJSHTMLAnchorElement }

  TJSHTMLAnchorElement = class {$IFDEF PAS2JS}external name 'HTMLAnchorElement' (TJSHTMLElement){$ENDIF}
  Private
    FOrigin: string;{$IFDEF PAS2JS}external name 'origin';{$ENDIF}
    frelList: TJSDOMTokenList; {$IFDEF PAS2JS} external name 'relList';{$ENDIF}
  Public
    href: string;
    download: string;
    hash: string;
    host: string;
    hostname: string;
    hreflang: string;
    media: string ;
    password: string;
    Protocol: string;
    referrerPolicy : string;
    rel: string ;
    rev: string deprecated; // obsolete property
    target: string ;
    text : string;
    type_ : string; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    username : string;
    Property relList: TJSDOMTokenList read frelList;
    Property origin: string Read FOrigin;
  end;

  { TJSHTMLMenuElement }

  TJSHTMLMenuElement = class {$IFDEF PAS2JS}external name 'HTMLMenuElement' (TJSHTMLElement){$ENDIF}
  end;

  { TJSHTMLButtonElement }

  TJSHTMLButtonElement = class {$IFDEF PAS2JS}external name 'HTMLButtonElement' (TJSHTMLElement){$ENDIF}
  private
    FForm: TJSHTMLFormElement; {$IFDEF PAS2JS} external name 'form';{$ENDIF}
    FLabels: TJSNodeList; {$IFDEF PAS2JS} external name 'labels';{$ENDIF}
    FValidationmMessage: String; {$IFDEF PAS2JS} external name 'validationMessage';{$ENDIF}
    FValidity: TJSValidityState; {$IFDEF PAS2JS} external name 'validity';{$ENDIF}
    FWillValidate: boolean; {$IFDEF PAS2JS} external name 'willValidate';{$ENDIF}
  Public
    autofocus : boolean;
    disabled : boolean;
    formAction : String;
    formEnctype : String;
    formMethod : String;
    formNoValidate : Boolean;
    formTarget : String;
    menu: TJSHTMLMenuElement;
    _type : String; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    value : string;
  Public
    property form : TJSHTMLFormElement Read FForm;
    property labels : TJSNodeList Read FLabels;
    property validationMessage : String Read FValidationmMessage;
    property validity : TJSValidityState Read FValidity;
    property willValidate : boolean read FWillValidate;
  end;

  TJSHTMLLabelElement = class {$IFDEF PAS2JS}external name 'HTMLLabelElement' (TJSHTMLElement){$ENDIF}
  Public
    For_ : String; {$IFDEF PAS2JS} external name 'for';{$ENDIF}
    form : String;
  end;

  { TJSHTMLTextAreaElement }

  TJSHTMLTextAreaElement = class {$IFDEF PAS2JS}external name 'HTMLTextAreaElement' (TJSHTMLElement){$ENDIF}
  private
    FForm: TJSHTMLFormElement; {$IFDEF PAS2JS} external name 'form';{$ENDIF}
    FTextLength: NativeInt; {$IFDEF PAS2JS} external name 'textKength';{$ENDIF}
    FType: String; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    FValidationMessage: String; {$IFDEF PAS2JS} external name 'validationMessage';{$ENDIF}
    FValidity: TJSValidityState;{$IFDEF PAS2JS}external name 'validity';{$ENDIF}
    FWillValidate: boolean; {$IFDEF PAS2JS} external name 'willValidate';{$ENDIF}
  Public
    defaultValue : string;
    value : string;
    rows : cardinal;
    cols : cardinal;
    autofocus : boolean;
    disabled : boolean;
    maxLength : nativeInt;
    readOnly : Boolean;
    required : Boolean;
    selectionStart : Cardinal;
    selectionEnd : Cardinal;
    selectionDirection : String;
    wrap : string;
    Property Form : TJSHTMLFormElement Read FForm;
    Property Type_: String Read FType;
    Property textLength : NativeInt Read FTextLength;
    Property validity : TJSValidityState Read FValidity;
    property willValidate : boolean read FWillValidate;
    property validationMessage : String Read FValidationMessage;
  end;

  { TJSHTMLEmbedElement }

  TJSHTMLEmbedElement = class {$IFDEF PAS2JS}external name 'HTMLEmbedElement' (TJSHTMLElement){$ENDIF}
  Public
    height: String;
    src: String;
    _type : String; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    width: String;
  end;

  { TJSHTMLOptionElement }

  TJSHTMLOptionElement = class {$IFDEF PAS2JS}external name 'Option' (TJSHTMLElement){$ENDIF}
  private
    FForm: TJSHTMLFormElement; {$IFDEF PAS2JS} external name 'form';{$ENDIF}
    FIndex: NativeInt; {$IFDEF PAS2JS} external name 'index';{$ENDIF}
  Public
    Constructor New; overload;
    Constructor New(aText : String); overload;
    Constructor New(aText,aValue : String); overload;
    Constructor New(aText,aValue : String; aDefaultSelected : Boolean); overload;
    Constructor New(aText,aValue : String; aDefaultSelected,Selected : Boolean); overload;
  Public
    defaultSelected : boolean;
    disabled : boolean;
    _label : string ; {$IFDEF PAS2JS} external name 'label';{$ENDIF}
    selected : boolean;
    text : string;
    value : string;
    property index : NativeInt Read FIndex;
    property form : TJSHTMLFormElement Read FForm;
  end;

  TJSHTMLOptGroupElement = class {$IFDEF PAS2JS}external name 'HTMLOptGroupElement' (TJSHTMLElement){$ENDIF}
  end;

  TJSHTMLOptionsCollection = class {$IFDEF PAS2JS}external name 'HTMLOptionsCollection' (TJSHTMLCollection){$ENDIF}
  end;

  { TJSHTMLSelectElement }

  TJSHTMLSelectElement = class {$IFDEF PAS2JS}external name 'HTMLSelectElement' (TJSHTMLElement){$ENDIF}
  private
    FForm: TJSHTMLFormElement; {$IFDEF PAS2JS} external name 'form';{$ENDIF}
    FLabels: TJSNodeList; {$IFDEF PAS2JS} external name 'labels';{$ENDIF}
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
    FOptions: TJSHTMLOptionsCollection; {$IFDEF PAS2JS} external name 'options';{$ENDIF}
    FSelectedOptions: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'selectedOptions';{$ENDIF}
    FType: String; {$IFDEF PAS2JS} external name 'type';{$ENDIF}
    FValidationMessage: string; {$IFDEF PAS2JS} external name 'validationMessage';{$ENDIF}
    FValidity: TJSValidityState; {$IFDEF PAS2JS} external name 'validity';{$ENDIF}
    fwillValidate: Boolean; {$IFDEF PAS2JS} external name 'willValidate';{$ENDIF}
  Public
    Procedure add(anItem : TJSHTMLOptionElement); overload;
    Procedure add(anItem, before : TJSHTMLOptionElement); overload;
    function item(aIndex : NativeInt): TJSHTMLOptionElement;
    function namedItem(aName : String): TJSHTMLOptionElement;
    procedure remove(aIndex : NativeInt);
    procedure checkValidity;
    procedure setCustomValidity(aMessage : String);
  Public
    autofocus : Boolean;
    disabled : Boolean;
    multiple : boolean;
    required: boolean;
    selectedIndex : NativeInt;
    size : NativeInt;
    value : string;
    property length : NativeInt read FLength;
    Property options : TJSHTMLOptionsCollection read FOptions;
    Property selectedOptions : TJSHTMLCollection read FSelectedOptions;
    Property form : TJSHTMLFormElement read FForm;
    property labels : TJSNodeList Read FLabels;
    property _type : String Read FType;
    property validity : TJSValidityState Read FValidity;
    property validationMessage : string Read FValidationMessage;
    property willValidate : Boolean read fwillValidate;
  end;

  { TJSHTMLTableElement }

  TJSHTMLTableSectionElement = class;
  TJSHTMLTableRowElement = class;

  TJSHTMLTableElement = class {$IFDEF PAS2JS}external name 'HTMLTableElement'(TJSHTMLElement){$ENDIF}
  private
    FAlign: String; {$IFDEF PAS2JS} external name 'align';{$ENDIF}
    FBGColor: String; {$IFDEF PAS2JS} external name 'bgColor';{$ENDIF}
    FBorder: String; {$IFDEF PAS2JS} external name 'border';{$ENDIF}
    FCaption: TJSHTMLElement; {$IFDEF PAS2JS} external name 'caption';{$ENDIF}
    FCellPadding: String; {$IFDEF PAS2JS} external name 'cellPadding';{$ENDIF}
    FCellSpacing: String; {$IFDEF PAS2JS} external name 'cellSpacing';{$ENDIF}
    FFrame: String; {$IFDEF PAS2JS} external name 'frame';{$ENDIF}
    FRows: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'rows';{$ENDIF}
    FRules: String; {$IFDEF PAS2JS} external name 'rules';{$ENDIF}
    FSummary: String; {$IFDEF PAS2JS} external name 'summary';{$ENDIF}
    FTBodies: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'tBodies';{$ENDIF}
    FTfoot: TJSHTMLTableSectionElement; {$IFDEF PAS2JS} external name 'tfoot';{$ENDIF}
    FTHead: TJSHTMLTableSectionElement; {$IFDEF PAS2JS} external name 'tHead';{$ENDIF}
    FWidth: String; {$IFDEF PAS2JS} external name 'width';{$ENDIF}
  public
  { Methods }
    function createCaption: TJSHTMLElement;
    function createTFoot: TJSHTMLTableSectionElement;
    function createTHead: TJSHTMLTableSectionElement;
    procedure deleteCaption;
    procedure deleteRow(index: Integer);
    procedure deleteTFoot;
    procedure deleteTHead;
    function insertRow(index: Integer): TJSHTMLTableRowElement;
  { Properties }
    property align: String read FAlign write FAlign;
    property bgColor: String read FBGColor write FBGColor;
    property border: String read FBorder write FBorder;
    property caption: TJSHTMLElement read FCaption;
    property cellPadding: String read FCellPadding write FCellPadding;
    property cellSpacing: String read FCellSpacing write FCellSpacing;
    property frame: String read FFrame write FFrame;
    property rows: TJSHTMLCollection read FRows;
    property rules: String read FRules write FRules;
    property summary: String read FSummary write FSummary;
    property tBodies: TJSHTMLCollection read FTBodies;
    property tfoot: TJSHTMLTableSectionElement read FTfoot;
    property tHead: TJSHTMLTableSectionElement read FTHead;
    property width: String read FWidth write FWidth;
  end;

  { TJSHTMLTableSectionElement }

  TJSHTMLTableSectionElement = class {$IFDEF PAS2JS}external name 'HTMLTableSectionElement' (TJSHTMLElement){$ENDIF}
  private
    Falign: String; {$IFDEF PAS2JS} external name 'align';{$ENDIF}
    Frows: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'rows';{$ENDIF}
    Fch: String; {$IFDEF PAS2JS} external name 'ch';{$ENDIF}
    FchOff: String; {$IFDEF PAS2JS} external name 'chOff';{$ENDIF}
    FvAlign: String; {$IFDEF PAS2JS} external name 'vAlign';{$ENDIF}
  public
  { Methods }
    procedure deleteRow(index: Integer);
    function insertRow(index: Integer): TJSHTMLTableRowElement;
  { Properties }
    property align: String read Falign write Falign;
    property rows: TJSHTMLCollection read Frows;
    property ch: String read Fch write Fch;
    property chOff: String read FchOff write FchOff;
    property vAlign: String read FvAlign write FvAlign;
  end;

  { TJSHTMLTableCellElement }

  TJSHTMLTableCellElement = class {$IFDEF PAS2JS}external name 'HTMLTableCellElement' (TJSHTMLElement){$ENDIF}
  private
    Fabbr: String; {$IFDEF PAS2JS} external name 'abbr';{$ENDIF}
    Falign: String; {$IFDEF PAS2JS} external name 'align';{$ENDIF}
    Faxis: String; {$IFDEF PAS2JS} external name 'axis';{$ENDIF}
    FbgColor: String; {$IFDEF PAS2JS} external name 'bgColor';{$ENDIF}
    FcellIndex: Integer; {$IFDEF PAS2JS} external name 'cellIndex';{$ENDIF}
    Fch: String; {$IFDEF PAS2JS} external name 'ch';{$ENDIF}
    FchOff: String; {$IFDEF PAS2JS} external name 'chOff';{$ENDIF}
    FcolSpan: Integer; {$IFDEF PAS2JS} external name 'colSpan';{$ENDIF}
    Fheaders: String; {$IFDEF PAS2JS} external name 'headers';{$ENDIF}
    Fheight: String; {$IFDEF PAS2JS} external name 'height';{$ENDIF}
    FnoWrap: Boolean; {$IFDEF PAS2JS} external name 'noWrap';{$ENDIF}
    FrowSpan: Integer; {$IFDEF PAS2JS} external name 'rowSpan';{$ENDIF}
    Fscope: String; {$IFDEF PAS2JS} external name 'scope';{$ENDIF}
    FvAlign: String; {$IFDEF PAS2JS} external name 'vAlign';{$ENDIF}
    Fwidth: String; {$IFDEF PAS2JS} external name 'width';{$ENDIF}
  public
  { Properties }
    property abbr: String read Fabbr write Fabbr;
    property align: String read Falign write Falign;
    property axis: String read Faxis write Faxis;
    property bgColor: String read FbgColor write FbgColor;
    property cellIndex: Integer read FcellIndex;
    property ch: String read Fch write Fch;
    property chOff: String read FchOff write FchOff;
    property colSpan: Integer read FcolSpan write FcolSpan;
    property headers: String read Fheaders write Fheaders;
    property height: String read Fheight write Fheight;
    property noWrap: Boolean read FnoWrap write FnoWrap;
    property rowSpan: Integer read FrowSpan write FrowSpan;
    property scope: String read Fscope write Fscope;
    property vAlign: String read FvAlign write FvAlign;
    property width: String read Fwidth write Fwidth;
  end;

  { TJSHTMLTableRowElement }

  TJSHTMLTableRowElement = class {$IFDEF PAS2JS}external name 'HTMLTableRowElement' (TJSHTMLElement){$ENDIF}
  private
    Falign: String; {$IFDEF PAS2JS} external name 'align';{$ENDIF}
    FbgColor: String; {$IFDEF PAS2JS} external name 'bgColor';{$ENDIF}
    Fcells: TJSHTMLCollection; {$IFDEF PAS2JS} external name 'cells';{$ENDIF}
    Fch: String; {$IFDEF PAS2JS} external name 'ch';{$ENDIF}
    FchOff: String; {$IFDEF PAS2JS} external name 'chOff';{$ENDIF}
    FrowIndex: Integer; {$IFDEF PAS2JS} external name 'rowIndex';{$ENDIF}
    FsectionRowIndex: Integer; {$IFDEF PAS2JS} external name 'sectionRowIndex';{$ENDIF}
    FvAlign: String; {$IFDEF PAS2JS} external name 'vAlign';{$ENDIF}
  public
  { Methods }
    procedure deleteCell(index: Integer);
    function insertCell(index: Integer): TJSHTMLTableCellElement;
  { Properties }
    property align: String read Falign write Falign;
    property bgColor: String read FbgColor write FbgColor;
    property cells: TJSHTMLCollection read Fcells;
    property ch: String read Fch write Fch;
    property chOff: String read FchOff write FchOff;
    property rowIndex: Integer read FrowIndex;
    property sectionRowIndex: Integer read FsectionRowIndex;
    property vAlign: String read FvAlign write FvAlign;
  end;

  { TJSHTMLTableDataCellElement }

  TJSCanvasRenderingContext2D = Class;

  TJSHTMLTableDataCellElement = class {$IFDEF PAS2JS}external name 'HTMLTableDataCellElement' (TJSHTMLElement){$ENDIF}
  private
    Fabbr: String; {$IFDEF PAS2JS} external name 'abbr';{$ENDIF}
  public
  { Properties }
    property abbr: String read Fabbr write Fabbr;
  end;

  THTMLCanvasToBlobCallback = Reference to function (aBlob : TJSBlob) : boolean; {$IFDEF PAS2JS}safecall;{$ENDIF}

  TJSHTMLCanvasElement = class {$IFDEF PAS2JS}external name 'HTMLCanvasElement' (TJSHTMLElement){$ENDIF}
  Public
    height : integer;
    width : integer;
    Function getContext(contextType : string) : TJSObject; overload;
    Function getContext(contextType : string; contextAttributes : TJSObject) : TJSObject; overload;
    Function getContextAs2DContext(contextType : string; contextAttributes : TJSObject) : TJSCanvasRenderingContext2D; overload; {$IFDEF PAS2JS} external name 'getContext';{$ENDIF}
    Function getContextAs2DContext(contextType : string) : TJSCanvasRenderingContext2D; overload;{$IFDEF PAS2JS} external name 'getContext';{$ENDIF}
    Procedure toBlob (aCallBack : THTMLCanvasToBlobCallback; aMimeType : String); overload;
    Procedure toBlob (aCallBack : THTMLCanvasToBlobCallback; aMimeType : String; aQuality : Double); overload;
    Function toDataURL : String; overload;
    Function toDataURL(aMimeType : String) : String; overload;
    Function toDataURL(aMimeType : String; aQuality : Double) : String; overload;
  end;

  TJSHTMLProgressElement = class {$IFDEF PAS2JS}external name 'HTMLProgressElement' (TJSHTMLElement){$ENDIF}
  private
    Fposition: Double; {$IFDEF PAS2JS} external name 'position';{$ENDIF}
    Flabels: TJSNodeList; {$IFDEF PAS2JS} external name 'labels';{$ENDIF}
  public
    max: Double;
    value: Double;
    property position: Double read Fposition;
    property labels: TJSNodeList read Flabels;
  end;

  { TJSDOMException }

  TJSDOMException = class {$IFDEF PAS2JS}external name 'DOMException' (TJSObject){$ENDIF}
  private
    FCode: Integer; {$IFDEF PAS2JS} external name 'code';{$ENDIF}
    FMessage: String; {$IFDEF PAS2JS} external name 'message';{$ENDIF}
    FName: string; {$IFDEF PAS2JS} external name 'name';{$ENDIF}
  Public
    Property code : Integer Read FCode;
    Property Message : String Read FMessage;
    Property name : string Read FName;
  end;

  { TJSFileReader }

  TJSFileReader = class {$IFDEF PAS2JS}external name 'FileReader' (TJSEventTarget){$ENDIF}
  private
    FError: TJSDOMException; {$IFDEF PAS2JS} external name 'error';{$ENDIF}
    fReadyState: Integer; {$IFDEF PAS2JS} external name 'readyState';{$ENDIF}
    FResult: JSValue; {$IFDEF PAS2JS} external name 'result';{$ENDIF}
  Public
    EMPTY : Integer;
    LOADING : Integer;
    DONE : Integer;
  Public
    onabort : TJSEventHandler;
    onerror : TJSEventHandler;
    onload : TJSEventHandler;
    onloadstart : TJSEventHandler;
    onloadend : TJSEventHandler;
    onprogress : TJSEventHandler;
  Public
    constructor new;
    Procedure abort;
    procedure readAsArrayBuffer(Blob: TJSBlob);
    procedure readAsBinaryString(Blob: TJSBlob);
    procedure readAsDataURL(Blob: TJSBlob);
    procedure readAsText(Blob: TJSBlob; encoding : string); overload;
    procedure readAsText(Blob: TJSBlob); overload;
    property Error : TJSDOMException read FError;
    Property readyState : Integer Read fReadyState;
    property Result : JSValue Read FResult;
  end;

  TCanvasCoordType = double; // Is in fact a number.

  // Opaque objects
  TJSCanvasGradient = class {$IFDEF PAS2JS}external name 'CanvasGradient'  (TJSObject){$ENDIF}
  end;

  TJSCanvasPattern = class {$IFDEF PAS2JS}external name 'CanvasPattern'  (TJSObject){$ENDIF}
  end;

  TJSPath2D = class {$IFDEF PAS2JS}external name 'Path2D'  (TJSObject){$ENDIF}
  Public
    constructor new; overload;
    constructor new(aPath : TJSPath2D); overload;
    constructor new(SVGPath : String); overload;
    Procedure addPath(aPath : TJSPath2D);
    procedure arc(x,y, radius,startAngle,endAngle : TCanvasCoordType); overload;
    procedure arc(x,y, radius,startAngle,endAngle : TCanvasCoordType; antiClockWise : boolean); overload;
    procedure arcTo(x1,y1,x2,y2,radius : TCanvasCoordType); overload;
    procedure bezierCurveTo(cp1x,cp1y,cp2x,cp2y,x,y : TCanvasCoordType); overload;
    Procedure closePath;
    procedure ellipse(x, y, radiusX, radiusY : TCanvasCoordType; rotation, startAngle, endAngle : Double); overload;
    procedure ellipse(x, y, radiusX, radiusY : TCanvasCoordType; rotation, startAngle, endAngle : Double; anticlockwise : Boolean); overload;
    Procedure lineTo(X,Y : TCanvasCoordType);
    Procedure moveTo(X,Y : TCanvasCoordType);
    procedure quadraticCurveTo(cpx,cpy,x,y : TCanvasCoordType);
    procedure rect(x,y,awidth,aheight: TCanvasCoordType); overload;
  end;

  { TJSImageData }

  TJSImageData = class {$IFDEF PAS2JS}external name 'ImageData'  (TJSObject){$ENDIF}
  private
    FData: TJSUint8ClampedArray; {$IFDEF PAS2JS} external name 'data';{$ENDIF}
    FHeight: Integer; {$IFDEF PAS2JS} external name 'height';{$ENDIF}
    FWidth: Integer; {$IFDEF PAS2JS} external name 'width';{$ENDIF}
  Public
    constructor new(awidth,aheight : integer); overload;
    constructor new(anArray :TJSUint8ClampedArray; awidth,aheight : integer); overload;
    property data : TJSUint8ClampedArray read FData;
    property height : Integer Read FHeight;
    property width : Integer Read FWidth;
  end;


  TJSTextMetrics = class {$IFDEF PAS2JS}external name 'TextMetrics' (TJSObject){$ENDIF}
    width : TCanvasCoordType;
    actualBoundingBoxLeft : TCanvasCoordType;
    actualBoundingBoxRight : TCanvasCoordType;
    fontBoundingBoxAscent : TCanvasCoordType;
    fontBoundingBoxDescent : TCanvasCoordType;
    actualBoundingBoxAscent : TCanvasCoordType;
    actualBoundingBoxDescent : TCanvasCoordType;
    emHeightAscent : TCanvasCoordType;
    emHeightDescent : TCanvasCoordType;
    hangingBaseline : TCanvasCoordType;
    alphabeticBaseline : TCanvasCoordType;
    ideographicBaseline : TCanvasCoordType;
  end;

  { TJSCanvasRenderingContext2D }
  TJSCanvasRenderingContext2D = class {$IFDEF PAS2JS}external name 'CanvasRenderingContext2D'  (TJSObject){$ENDIF}
  private
    FCanvas: TJSHTMLCanvasElement; {$IFDEF PAS2JS} external name 'canvas';{$ENDIF}
    FfillStyleColor: String; {$IFDEF PAS2JS} external name 'fillStyle';{$ENDIF}
    FfillStyleGradient: TJSCanvasGradient; {$IFDEF PAS2JS} external name 'fillStyle';{$ENDIF}
    FfillStylePattern: TJSCanvasPattern; {$IFDEF PAS2JS} external name 'fillStyle';{$ENDIF}
    FstrokeStyleColor: String; {$IFDEF PAS2JS} external name 'strokeStyle';{$ENDIF}
    FstrokeStyleGradient: TJSCanvasGradient; {$IFDEF PAS2JS} external name 'strokeStyle';{$ENDIF}
    FstrokeStylePattern: TJSCanvasPattern; {$IFDEF PAS2JS} external name 'strokeStyle';{$ENDIF}
  Public
    fillStyle : JSValue;
    font : string;
    globalAlpha : double;
    globalCompositeOperation : String;
    lineCap : string;
    lineDashOffset : Double;
    lineJoin : String;
    lineWidth : Double;
    miterLimit : Double;
    shadowBlur : Double;
    shadowColor : String;
    shadowOffsetX : Double;
    shadowOffsetY : Double;
    strokeStyle : JSValue;
    textAlign : String;
    textBaseline : String;
    procedure arc(x,y, radius,startAngle,endAngle : TCanvasCoordType); overload;
    procedure arc(x,y, radius,startAngle,endAngle : TCanvasCoordType; antiClockWise : boolean); overload;
    procedure arcTo(x1,y1,x2,y2,radius : TCanvasCoordType); overload;
    procedure beginPath;
    procedure bezierCurveTo(cp1x,cp1y,cp2x,cp2y,x,y : TCanvasCoordType); overload;
    procedure clearRect(x,y,width,height : TCanvasCoordType);
    procedure clip; overload;
    procedure clip(aFillRule : String); overload;
    procedure clip(aPath : TJSPath2D); overload;
    procedure closePath;
    function createImageData(aWidth,aHeight : Integer) : TJSImageData; overload;
    function createImageData(aImage : TJSImageData) : TJSImageData; overload;
    function createLinearGradient(x0,y0,x1,y1 : TCanvasCoordType) : TJSCanvasGradient;
    function createPattern(aImage : TJSObject; repetition : string) : TJSCanvasPattern;
    function createRadialGradient(x0,y0,r0,x1,y1,r1 : TCanvasCoordType) : TJSCanvasGradient;
    procedure drawFocusIfNeeded(aElement : TJSElement); overload;
    procedure drawFocusIfNeeded(aPath : TJSPath2D; aElement : TJSElement); overload;
    procedure drawImage(image : TJSObject; dx,dy : TCanvasCoordType); overload;
    procedure drawImage(image : TJSObject; dx,dy,dwidth,dheight : TCanvasCoordType); overload;
    procedure drawImage(image : TJSObject; sx,sy,sWidth,sHeight,dx,dy,dwidth,dheight : TCanvasCoordType); overload;
    procedure ellipse(x, y, radiusX, radiusY : TCanvasCoordType; rotation, startAngle, endAngle : Double); overload;
    procedure ellipse(x, y, radiusX, radiusY : TCanvasCoordType; rotation, startAngle, endAngle : Double; anticlockwise : Boolean); overload;
    procedure fill; overload;
    procedure fill(aRule : String); overload;
    procedure fill(aPath : TJSPath2D); overload;
    procedure fill(aPath : TJSPath2D;aRule : String); overload;
    procedure fillRect(x,y,awidth,aheight: TCanvasCoordType); overload;
    procedure fillText(aText : string; x,y : TCanvasCoordType); overload;
    procedure fillText(aText : string; x,y, aMaxWidth : TCanvasCoordType); overload;
    function getImageData(x,y,awidth,aheight: TCanvasCoordType) : TJSImageData; overload;
    function getLineDash : TJSArray;
    function isPointInPath(x,y : TCanvasCoordType) : Boolean; overload;
    function isPointInPath(x,y : TCanvasCoordType; aFillRule : String) : Boolean; overload;
    function isPointInPath(aPath : TJSPath2D; x,y : TCanvasCoordType) : Boolean; overload;
    function isPointInPath(aPath : TJSPath2D; x,y : TCanvasCoordType; aFillRule : String) : Boolean; overload;
    function isPointInStroke(x,y : TCanvasCoordType) : Boolean; overload;
    function isPointInStroke(aPath : TJSPath2D; x,y : TCanvasCoordType) : Boolean; overload;
    procedure lineTo(x,y : TCanvasCoordType);
    function measureText(S : String) : TJSTextMetrics;
    procedure moveTo(x,y : TCanvasCoordType);
    procedure putImageData(aData : TJSImageData; x,y: TCanvasCoordType) ; overload;
    procedure putImageData(aData : TJSImageData; x,y,dityX,dirtyY,dirtyWidth,dirtyHeight: TCanvasCoordType) ; overload;
    procedure quadraticCurveTo(cpx,cpy,x,y : TCanvasCoordType);
    procedure rect(x,y,awidth,aheight: TCanvasCoordType); overload;
    procedure restore;
    procedure rotate(anAngle : double);
    procedure save;
    procedure scale(x,y : double);
    procedure setLineDash(segments : TJSArray); overload;
    procedure setLineDash(segments : array of integer); overload;
    procedure setTransform(a,b,c,d,e,f : double);
    procedure stroke; overload;
    procedure stroke(aPath : TJSPath2D); overload;
    procedure strokeRect(x,y,awidth,aheight: TCanvasCoordType);
    procedure strokeText(aText : string; x,y : TCanvasCoordType); overload;
    procedure strokeText(aText : string; x,y, aMaxWidth : TCanvasCoordType); overload;
    procedure transform(a,b,c,d,e,f : double);
    procedure translate(x,y : TCanvasCoordType);

    property canvas : TJSHTMLCanvasElement Read FCanvas;
    property fillStyleAsColor : String Read FfillStyleColor Write FfillStyleColor;
    property fillStyleAsGradient : TJSCanvasGradient Read FfillStyleGradient Write FfillStyleGradient;
    property fillStyleAsPattern : TJSCanvasPattern Read FfillStylePattern Write FfillStylePattern;
    property strokeStyleAsColor : String Read FstrokeStyleColor Write FstrokeStyleColor;
    property strokeStyleAsGradient : TJSCanvasGradient Read FstrokeStyleGradient Write FstrokeStyleGradient;
    property strokeStyleAsPattern : TJSCanvasPattern Read FstrokeStylePattern Write FstrokeStylePattern;
  end;

  { TJSHTMLIFrameElement }

  TJSHTMLIFrameElement = class {$IFDEF PAS2JS}external name 'HTMLIFrameElement' (TJSHTMLElement){$ENDIF}
  private
    FAllowPaymentRequest: Boolean; {$IFDEF PAS2JS} external name 'allowPaymentRequest';{$ENDIF}
    FContentDocument: TJSDocument; {$IFDEF PAS2JS} external name 'contentDocument';{$ENDIF}
    FContentWindow: TJSWindow; {$IFDEF PAS2JS} external name 'contentWindow';{$ENDIF}
    FSandbox: string; {$IFDEF PAS2JS} external name 'sandbox';{$ENDIF}
  Public
    height : string;
    src : string;
    srcdoc : string;
    width : string;
    Property allowPaymentRequest : Boolean Read FAllowPaymentRequest;
    property contentWindow : TJSWindow Read FContentWindow;
    property contentDocument : TJSDocument Read FContentDocument;
    property sandbox : string read FSandbox;
  end;

  TJSHTMLScriptElement = class {$IFDEF PAS2JS}external name 'HTMLScriptElement' (TJSHTMLElement){$ENDIF}
  Public
    type_ : String; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    src : String;
    charset : string;
    integrity : string;
    async : boolean;
    defer : boolean;
    text : string;
    crossOrigin : string;
    referrerPolicy : string;
    noModule : boolean;
  end;




  TJSXMLHttpRequestEventTarget = class {$IFDEF PAS2JS}external name 'XMLHttpRequestEventTarget' (TJSEventTarget){$ENDIF}
  end;

  TJSXMLHttpRequestUpload = class {$IFDEF PAS2JS}external name 'XMLHttpRequestUpload' (TJSXMLHttpRequestEventTarget){$ENDIF}
  end;

  { TJSXMLHttpRequest }
  TJSOnReadyStateChangeHandler = reference to procedure; {$IFDEF PAS2JS}safecall;{$ENDIF}

  TJSXMLHttpRequest = class {$IFDEF PAS2JS}external name 'XMLHttpRequest' (TJSXMLHttpRequestEventTarget){$ENDIF}
  private
    FReadyState: NativeInt; {$IFDEF PAS2JS} external name 'readyState';{$ENDIF}
    FResponse: JSValue; {$IFDEF PAS2JS} external name 'response';{$ENDIF}
    FResponseText: string; {$IFDEF PAS2JS} external name 'responseText';{$ENDIF}
    FResponseType: string; {$IFDEF PAS2JS} external name 'responseType';{$ENDIF}
    FresponseURL: string; {$IFDEF PAS2JS} external name 'responseURL';{$ENDIF}
    FresponseXML: TJSDocument; {$IFDEF PAS2JS} external name 'responseXML';{$ENDIF}
    FUpload: TJSXMLHttpRequestUpload; {$IFDEF PAS2JS} external name 'upload';{$ENDIF}
    FStatus : integer; {$IFDEF PAS2JS} external name 'status';{$ENDIF}
    FStatusText : string; {$IFDEF PAS2JS} external name 'statusText';{$ENDIF}
  public
    const
      UNSENT           = 0;
      OPENED           = 1;
      HEADERS_RECEIVED = 2;
      LOADING          = 3;
      DONE             = 4;
  public
    timeout : LongWord;
    withCredentials : Boolean;
    onreadystatechange : TJSOnReadyStateChangeHandler;
    constructor new;
    procedure abort;
    function getResponseHeader(aName : string) : String;
    function getAllResponseHeaders : String;
    procedure open(aMethod,aURL : String); overload;
    procedure open(aMethod,aURL : String; Async : Boolean); overload;
    procedure open(aMethod,aURL : String; Async : Boolean; AUserame : String); overload;
    procedure open(aMethod,aURL : String; Async : Boolean; AUserame,APassword : String); overload;
    procedure overrideMimeType(aType : String);
    procedure send(aBody : jsValue);overload;
    procedure send;overload;
    procedure setRequestHeader(aName, AValue : string);

    property readyState : NativeInt read FReadyState;
    property ResponseHeaders[aName : string] : string Read getResponseHeader;
    property responseXML : TJSDocument read FresponseXML;
    property responseURL : string read FresponseURL;
    property responseType : string read FResponseType Write FResponseType;
    property response : JSValue Read FResponse;
    property responseText : string read FResponseText;
    property Status : integer read FStatus;
    property StatusText : string read FStatusText;
    property upload : TJSXMLHttpRequestUpload read FUpload;

  end;

  { TJSUIEvent }

  TJSUIEvent = class {$IFDEF PAS2JS}external name 'UIEvent' (TJSEvent){$ENDIF}
  private
    FDetail: NativeInt; {$IFDEF PAS2JS} external name 'detail';{$ENDIF}
    FView: TJSWindow; {$IFDEF PAS2JS} external name 'view';{$ENDIF}
  Public
    property detail : NativeInt read FDetail;
    property view : TJSWindow read FView;
  end;

  { TJSMouseEvent }

  TJSMouseEvent = class {$IFDEF PAS2JS}external name 'MouseEvent' (TJSUIevent){$ENDIF}
  private
    FAltKey: Boolean; {$IFDEF PAS2JS} external name 'altKey';{$ENDIF}
    FBUtton: NativeInt; {$IFDEF PAS2JS} external name 'button';{$ENDIF}
    FBUttons: NativeInt; {$IFDEF PAS2JS} external name 'buttons';{$ENDIF}
    FClientX: Double; {$IFDEF PAS2JS} external name 'clientX';{$ENDIF}
    FClientY: Double; {$IFDEF PAS2JS} external name 'clientY';{$ENDIF}
    FCtrlKey: Boolean; {$IFDEF PAS2JS} external name 'ctrlKey';{$ENDIF}
    FMetaKey: Boolean; {$IFDEF PAS2JS} external name 'metaKey';{$ENDIF}
    FmovementX: Double; {$IFDEF PAS2JS} external name 'movementX';{$ENDIF}
    FmovementY: Double; {$IFDEF PAS2JS} external name 'movementY';{$ENDIF}
    FoffsetX: Double; {$IFDEF PAS2JS} external name 'offsetX';{$ENDIF}
    FoffsetY: Double; {$IFDEF PAS2JS} external name 'offsetY';{$ENDIF}
    FRegion: String; {$IFDEF PAS2JS} external name 'region';{$ENDIF}
    FRelatedTarget: TJSEventTarget; {$IFDEF PAS2JS} external name 'relatedTarget';{$ENDIF}
    FscreenX: Double; {$IFDEF PAS2JS} external name 'screenX';{$ENDIF}
    FscreenY: Double; {$IFDEF PAS2JS} external name 'screenY';{$ENDIF}
    FShiftKey: Boolean; {$IFDEF PAS2JS} external name 'shiftKey';{$ENDIF}
  Public
    function getModifierState(keyArg: String): boolean;
    Property altKey : Boolean read FAltKey;
    Property button: NativeInt read FBUtton;
    Property buttons: NativeInt read FBUttons;
    property clientX : Double read FClientX;
    property clientY : Double read FClientY;
    property ctrlKey : Boolean read FCtrlKey;
    property metaKey : Boolean read FMetaKey;
    property movementX : Double read FmovementX;
    property movementY : Double read FmovementY;
    property offsetX : Double read FoffsetX;
    property offsetY : Double read FoffsetY;
{$IFDEF FIREFOX}
    property pageX : Double read FpageX;
    property pageY : Double read FpageY;
{$ENDIF}
    property region : String read FRegion;
    property relatedTarget : TJSEventTarget read FRelatedTarget;
    property screenX : Double read FscreenX;
    property screenY : Double read FscreenY;
    property shiftKey : Boolean read FShiftKey;
    property x : Double read FClientX;
    property y : Double read FClientY;
  end;

  { TJSWheelEvent }
  TJSWheelEventInit = record
    deltaX : Double;
    deltaY : Double;
    deltaZ : Double;
    deltaMode : NativeInt;
  end;

  TJSWheelEvent = class {$IFDEF PAS2JS}external name 'WheelEvent' (TJSMouseEvent){$ENDIF}
  private
    FDeltaMode: NativeInt; {$IFDEF PAS2JS} external name 'deltaMode';{$ENDIF}
    FDeltaX: Double; {$IFDEF PAS2JS} external name 'deltaX';{$ENDIF}
    FDeltaY: Double; {$IFDEF PAS2JS} external name 'deltaY';{$ENDIF}
    FDeltaZ: Double; {$IFDEF PAS2JS} external name 'deltaZ';{$ENDIF}
  Public
    constructor new(atype : String); overload;
    constructor new(atype : String; aInit : TJSWheelEventInit); overload;
    Property deltaX : Double Read FDeltaX;
    Property deltaY : Double Read FDeltaY;
    Property deltaZ : Double Read FDeltaZ;
    Property deltaMode : NativeInt Read FDeltaMode;
  end;

  TJSPointerEvent = class {$IFDEF PAS2JS}external name 'PointerEvent' (TJSMouseEvent);{$ENDIF}
  end;

  TJSTouchEvent = class {$IFDEF PAS2JS}external name 'TouchEvent'(TJSUIEvent){$ENDIF}
  private
    FAltKey: Boolean; {$IFDEF PAS2JS} external name 'altKey';{$ENDIF}
    FChangedTouches: TJSTouchList; {$IFDEF PAS2JS} external name 'changedTouches';{$ENDIF}
    FCtrlKey: Boolean; {$IFDEF PAS2JS} external name 'ctrlKey';{$ENDIF}
    FMetaKey: Boolean; {$IFDEF PAS2JS} external name 'metaKey';{$ENDIF}
    FShiftKey: Boolean; {$IFDEF PAS2JS} external name 'shiftKey';{$ENDIF}
    FTargetTouches: TJSTouchList; {$IFDEF PAS2JS} external name 'targetTouches';{$ENDIF}
    FTouches: TJSTouchList; {$IFDEF PAS2JS} external name 'touches';{$ENDIF}
  Public
    Property altKey : Boolean Read FAltKey;
    Property ctrlKey : Boolean Read FCtrlKey;
    Property metaKey : Boolean Read FMetaKey;
    Property shiftKey : Boolean Read FShiftKey;
    property changedTouches : TJSTouchList Read FChangedTouches;
    property touches : TJSTouchList Read FTouches;
    property targetTouches : TJSTouchList Read FTargetTouches;
  end;


  // Namespace for standard key names.
  // See list at https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/key/Key_Values
  TJSKeyNames = Class
  Const
    Alt = 'Alt';
    AltGraph = 'AltGraph';
    CapsLock = 'CapsLock';
    Control = 'Control';
    Fn = 'Fn';
    FnLock = 'FnLock';
    Hyper = 'Hyper';
    Meta = 'Meta';
    NumLock = 'NumLock';
    ScrollLock = 'ScrollLock';
    Shift = 'Shift';
    Super = 'Super';
    Symbol = 'Symbol';
    SymbolLock = 'SymbolLock';
    Enter = 'Enter';
    Tab = 'Tab';
    Space = 'Space';
    ArrowDown = 'ArrowDown';
    ArrowLeft = 'ArrowLeft';
    ArrowRight = 'ArrowRight';
    ArrowUp = 'ArrowUp';
    _End = 'End';
    Home = 'Home';
    PageDown = 'PageDown';
    PageUp = 'PageUp';
    BackSpace = 'Backspace';
    Clear = 'Clear';
    Copy = 'Copy';
    CrSel = 'CrSel';
    Cut = 'Cut';
    Delete = 'Delete';
    EraseEof = 'EraseEof';
    ExSel = 'ExSel';
    Insert = 'Insert';
    Paste = 'Paste';
    Redo = 'Redo';
    Undo = 'Undo';
    Accept = 'Accept';
    Again = 'Again';
    Attn = 'Attn';
    Cancel = 'Cancel';
    ContextMenu = 'Contextmenu';
    Escape = 'Escape';
    Execute = 'Execute';
    Find = 'Find';
    Finish = 'Finish';
    Help = 'Help';
    Pause = 'Pause';
    Play = 'Play';
    Props = 'Props';
    Select = 'Select';
    ZoomIn = 'ZoomIn';
    ZoomOut = 'ZoomOut';
    BrightnessDown = 'BrightnessDown';
    BrightnessUp = 'BrightnessUp';
    Eject = 'Eject';
    LogOff = 'LogOff';
    Power = 'Power';
    PowerOff = 'PowerOff';
    PrintScreen = 'PrintScreen';
    Hibernate = 'Hibernate';
    Standby = 'Standby';
    WakeUp = 'WakeUp';
    AllCandidates = 'AllCandidates';
    Alphanumeric =  'Alphanumeric';
    CodeInput = 'CodeInput';
    Compose = 'Compose';
    Convert = 'Convert';
    Dead = 'Dead';
    FinalMode = 'FinalMode';
    GroupFirst = 'GroupFirst';
    GroupLast = 'GroupLast';
    GroupNext = 'GroupNext';
    GroupPrevious = 'GroupPrevious';
    ModelChange = 'ModelChange';
    NextCandidate = 'NextCandidate';
    NonConvert = 'NonConvert';
    PreviousCandidate = 'PreviousCandidate';
    Process = 'Process';
    SingleCandidate = 'SingleCandidate';
    HangulMode = 'HangulMode';
    HanjaMode = 'HanjaMode';
    JunjaMode = 'JunjaMode';
    Eisu = 'Eisu';
    Hankaku = 'Hankaku';
    Hiranga = 'Hiranga';
    HirangaKatakana = 'HirangaKatakana';
    KanaMode = 'KanaMode';
    Katakana = 'Katakana';
    Romaji = 'Romaji';
    Zenkaku = 'Zenkaku';
    ZenkakuHanaku = 'ZenkakuHanaku';
    F1 = 'F1';
    F2 = 'F2';
    F3 = 'F3';
    F4 = 'F4';
    F5 = 'F5';
    F6 = 'F6';
    F7 = 'F7';
    F8 = 'F8';
    F9 = 'F9';
    F10 = 'F10';
    F11 = 'F11';
    F12 = 'F12';
    F13 = 'F13';
    F14 = 'F14';
    F15 = 'F15';
    F16 = 'F16';
    F17 = 'F17';
    F18 = 'F18';
    F19 = 'F19';
    F20 = 'F20';
    Soft1 = 'Soft1';
    Soft2 = 'Soft2';
    Soft3 = 'Soft3';
    Soft4 = 'Soft4';
    Decimal = 'Decimal';
    Key11 = 'Key11';
    Key12 = 'Key12';
    Multiply = 'Multiply';
    Add = 'Add';
    NumClear = 'Clear';
    Divide = 'Divide';
    Subtract = 'Subtract';
    Separator = 'Separator';
    AppSwitch = 'AppSwitch';
    Call = 'Call';
    Camera = 'Camera';
    CameraFocus = 'CameraFocus';
    EndCall = 'EndCall';
    GoBack = 'GoBack';
    GoHome = 'GoHome';
    HeadsetHook = 'HeadsetHook';
    LastNumberRedial = 'LastNumberRedial';
    Notification = 'Notification';
    MannerMode = 'MannerMode';
    VoiceDial = 'VoiceDial';
    // TODO : Multimedia keys
    // TODO : Audio control keys
    // TODO : TV control keys
    // TODO : Media controller keys
    // TODO : Speech recognition keys
    // TODO : Document keys
    // TODO : Application selector keys
    // TODO : Browser Control keys
  end;


  { TJSKeyboardEvent }

  TJSKeyboardEvent = class {$IFDEF PAS2JS}external name 'KeyboardEvent' (TJSUIEvent){$ENDIF}
  private
    FAltKey: Boolean; {$IFDEF PAS2JS} external name 'altKey';{$ENDIF}
    FCode: string; {$IFDEF PAS2JS} external name 'code';{$ENDIF}
    FCtrlKey: Boolean; {$IFDEF PAS2JS} external name 'ctrlKey';{$ENDIF}
    FIsComposing: Boolean;{$IFDEF PAS2JS}external name 'isComposing';{$ENDIF}
    FKey: String; {$IFDEF PAS2JS} external name 'key';{$ENDIF}
    FLocale: string; {$IFDEF PAS2JS} external name 'locale';{$ENDIF}
    FLocation: NativeInt; {$IFDEF PAS2JS} external name 'location';{$ENDIF}
    FMetaKey: Boolean; {$IFDEF PAS2JS} external name 'metaKey';{$ENDIF}
    FRepeat: Boolean; {$IFDEF PAS2JS} external name 'repeat';{$ENDIF}
    FShiftKey: Boolean; {$IFDEF PAS2JS} external name 'shiftKey';{$ENDIF}
  Public
    function getModifierState(aKey : string) : Boolean;
    property code : string read FCode;
    Property altKey : Boolean read FAltKey;
    property ctrlKey : Boolean read FCtrlKey;
    property isComposing : Boolean read FIsComposing;
    property Key : String read FKey;
    property locale : string read FLocale;
    property location : NativeInt read FLocation;
    property metaKey : Boolean read FMetaKey;
    property _repeat : Boolean read FRepeat;
    property shiftKey : Boolean read FShiftKey;
  end;

  { MutationObserver }

  TJSMutationObserver = Class;

  TJSMutationRecord = record
    type_ : string;
    target : TJSNode;
    addedNodes : TJSNodeList;
    removedNodes : TJSNodeList;
    previousSibling : TJSNode;
    nextSibling : TJSNode;
    attributeName : String;
    attributeNamespace : String;
    oldValue : String;
  end;

  TJSMutationRecordArray = array of TJSMutationRecord;
  TJSMutationCallback = reference to procedure(mutations: TJSMutationRecordArray; observer: TJSMutationObserver); {$IFDEF PAS2JS}safecall;{$ENDIF}

  TJSMutationObserverInit = record
    attributes: boolean;
    attributeOldValue: boolean;
    characterData: boolean;
    characterDataOldValue: boolean;
    childList: boolean;
    subTree: boolean;
    attributeFilter: TJSArray;
  end;

  TJSMutationObserver = class {$IFDEF PAS2JS}external name 'MutationObserver' (TJSObject){$ENDIF}
  public
    { constructor }
    constructor new(mutationCallback: TJSMutationCallback); overload;
    { public methods }
    procedure observe(target: TJSNode); overload;
    procedure observe(target: TJSNode; options: TJSMutationObserverInit); overload;
    procedure observe(target: TJSNode; options: TJSObject); overload;
    procedure disconnect;
    function takeRecords: TJSMutationRecordArray;
  end;

  { --------------------------------------------------------------------
    TJSWebSocket
    --------------------------------------------------------------------}

  TJSMessagePortArray = Array of TJSMessagePort;

  { TJSMessageEvent }

  TJSMessageEvent = class {$IFDEF PAS2JS}external name 'MessageEvent' (TEventListenerEvent){$ENDIF}
  private
    FData: JSValue; {$IFDEF PAS2JS} external name 'data';{$ENDIF}
    FLastEventID: String; {$IFDEF PAS2JS} external name 'lastEventID';{$ENDIF}
    FOrigin: String;{$IFDEF PAS2JS}external name 'origin';{$ENDIF}
    FPorts: TJSMessagePortArray; {$IFDEF PAS2JS} external name 'ports';{$ENDIF}
  Public
    Property Data : JSValue Read FData;
    Property LastEventID : String Read FLastEventID;
    Property Origin : String Read FOrigin;
    Property Ports : TJSMessagePortArray Read FPorts;
  end;

  TJSWebSocket = class {$IFDEF PAS2JS}external name 'WebSocket'  (TJSEventTarget){$ENDIF}
  Private
    Furl : String; {$IFDEF PAS2JS} external name 'url';{$ENDIF}
    FreadyState : Cardinal; {$IFDEF PAS2JS} external name 'readyState';{$ENDIF}
    FbufferedAmount : NativeInt; {$IFDEF PAS2JS} external name 'bufferedAmount';{$ENDIF}
    Fextensions : String; {$IFDEF PAS2JS} external name 'extensions';{$ENDIF}
    Fprotocol : String; {$IFDEF PAS2JS} external name 'protocol';{$ENDIF}
  Public
    Const
      CONNECTING = 0;
      OPEN = 1;
      CLOSING = 2;
      CLOSED = 3;
  Public
    onopen : TJSEventHandler;
    onerror : TJSEventHandler;
    onclose : TJSEventHandler;
    onmessage : TJSEventHandler;
    binaryType : String;
    constructor new(url : String); overload;
    constructor new(url : String; protocol: String); overload;
    constructor new(url : String; protocols: array of String); overload;
    Procedure close; overload;
    Procedure close(code : Cardinal); overload;
    Procedure close(code : Cardinal; reason : String); overload;
    Procedure send(data : String); overload;
    Procedure send(data : TJSBlob); overload;
    Procedure send(data : TJSArrayBuffer); overload;
    Procedure send(data : TJSTypedArray); overload;
    Property url : String Read Furl;
    Property readyState : Cardinal Read FreadyState;
    Property bufferedAmount : NativeInt Read FbufferedAmount;
    Property extensions : String Read Fextensions;
    Property protocol : String Read Fprotocol;
  end;

  TJSHTMLAudioTrack = class {$IFDEF PAS2JS}external name 'AudioTrack' (TJSObject){$ENDIF}
  end;

  TJSHTMLAudioTrackList = class {$IFDEF PAS2JS}external name 'AudioTrackList' (TJSObject){$ENDIF}
    FLength : Integer; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
    function getitem(aIndex : nativeInt) : TJSHTMLAudioTrack ; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  Public
    onaddtrack : TJSEventHandler;
    onchange : TJSEventHandler;
    onremovetrack : TJSEventHandler;
    Property Length : Integer Read FLength;
    Property tracks [aIndex : NativeInt] : TJSHTMLAudioTrack read Getitem;
  end;

  TJSHTMLVideoTrack = class {$IFDEF PAS2JS}external name 'VideoTrack' (TJSObject){$ENDIF}
  end;

  TJSHTMLVideoTrackList = class {$IFDEF PAS2JS}external name 'VideoTrackList' (TJSObject){$ENDIF}
    FLength : Integer; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
    function getitem(aIndex : nativeInt) : TJSHTMLVideoTrack ; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  Public
    onaddtrack : TJSEventHandler;
    onchange : TJSEventHandler;
    onremovetrack : TJSEventHandler;
    Property Length : Integer Read FLength;
    Property tracks [aIndex : NativeInt] : TJSHTMLVideoTrack read Getitem;
  end;

  TJSHTMLTextTrack = class {$IFDEF PAS2JS}external name 'TextTrack' (TJSObject){$ENDIF}
  end;

  TJSHTMLTextTrackList = class {$IFDEF PAS2JS}external name 'TextTrackList' (TJSObject){$ENDIF}
    FLength : Integer; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
    function getitem(aIndex : nativeInt) : TJSHTMLTextTrack ; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  Public
    onaddtrack : TJSEventHandler;
    onchange : TJSEventHandler;
    onremovetrack : TJSEventHandler;
    Property Length : Integer Read FLength;
    Property tracks [aIndex : NativeInt] : TJSHTMLTextTrack read Getitem;
  end;


  { TJSHTMLMediaElement }
  TJSMEdiaError = class {$IFDEF PAS2JS}external name 'MediaError' (TJSObject){$ENDIF}
    code : NativeInt;
    message : string;
  end;

  TJSHTMLMediaStream = class {$IFDEF PAS2JS}external name 'MediaStream' (TJSObject);{$ENDIF}
  end;

  TJSHTMLMediaController = class {$IFDEF PAS2JS}external name 'MediaController' (TJSObject);{$ENDIF}
  end;

  TJSHTMLMediaElement = class {$IFDEF PAS2JS}external name 'HTMLMediaElement' (TJSHTMLElement){$ENDIF}
  private
    FAudioTracks: TJSHTMLAudioTrackList; {$IFDEF PAS2JS} external name 'audioTracks';{$ENDIF}
    FVideoTracks: TJSHTMLVideoTrackList; {$IFDEF PAS2JS} external name 'videoTracks';{$ENDIF}
    FTextTracks: TJSHTMLTextTrackList; {$IFDEF PAS2JS} external name 'textTracks';{$ENDIF}
    FControlsList: TJSDOMTokenList; {$IFDEF PAS2JS} external name 'controlslist';{$ENDIF}
    FCurrentSrc: String; {$IFDEF PAS2JS} external name 'currentSrc';{$ENDIF}
    FDuration: Double; {$IFDEF PAS2JS} external name 'duration';{$ENDIF}
    FEnded: Boolean;{$IFDEF PAS2JS}external name 'ended';{$ENDIF}
    FError: TJSMEdiaError; {$IFDEF PAS2JS} external name 'error';{$ENDIF}
    FNetworkState: NativeInt; {$IFDEF PAS2JS} external name 'networkState';{$ENDIF}
    FPaused: boolean; {$IFDEF PAS2JS} external name 'paused';{$ENDIF}
    FReadyState: NativeInt; {$IFDEF PAS2JS} external name 'readyState';{$ENDIF}
    FSeeking: boolean; {$IFDEF PAS2JS} external name 'seeking';{$ENDIF}
    FSinkID: string; {$IFDEF PAS2JS} external name 'sinkId';{$ENDIF}
  Public
    autoplay : Boolean;
    buffered : Boolean;
    controls : Boolean;
    controller : TJSHTMLMediaController;
    crossOrigin : String;
    currentTime : Double;
    defaultMuted : boolean;
    defaultPlaybackRate : Double;
    disableRemotePlayback : Boolean;
    loop : boolean;
    mediaGroup : string;
    muted : boolean;
    preload : string;
    preservesPitch : boolean;
    src : string;
    srcObject : TJSHTMLMediaStream;
    volume : double;
    onencrypted : TJSEventHandler;
    onwaitingforkey : TJSEventHandler;
    function canPlayType(aType : String) : String;
    Function captureStream : TJSHTMLMediaStream;
    Procedure play;
    Procedure load;
    Procedure pause;

    Property AudioTracks : TJSHTMLAudioTrackList Read FAudioTracks;
    Property Controlslist : TJSDOMTokenList Read FControlsList;
    Property CurrentSrc : String Read FCurrentSrc;
    Property Duration : Double read FDuration;
    Property Ended : Boolean read FEnded;
    Property Error : TJSMEdiaError read FError;
    property networkState : NativeInt read FNetworkState;
    property paused : boolean read FPaused;
    property readyState : NativeInt read FReadyState;
    property seeking : boolean read FSeeking;
    property sinkID : string read FSinkID;
    Property TextTracks : TJSHTMLTextTrackList Read FTextTracks;
    Property VideoTracks : TJSHTMLVideoTrackList Read FVideoTracks;
  end;

  TJSHTMLAudioElement = class {$IFDEF PAS2JS}external name 'HTMLAudioElement' (TJSHTMLMediaElement){$ENDIF}

  end;

  TJSFormDataEntryValue = String;
  TJSFormDataEntryValueArray = Array of TJSFormDataEntryValue;

  TJSFormData = class {$IFDEF PAS2JS}external name 'FormData' (TJSObject){$ENDIF}
    constructor new; overload;
    constructor new(aForm : TJSHTMLElement); overload;
    Procedure append(const aName,aValue : String); overload;
    Procedure append(const aName : String; aBlob : TJSBlob); overload;
    Procedure delete(const aName : String);
    Function entries : TJSFormDataEntryValueArray;
    Function get(const aName : String): TJSFormDataEntryValue;
    function has(const aName : String): Boolean;
    Function keys : TStringDynArray; reintroduce;
    Procedure set_(const aName,aValue : String); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    Procedure set_(const aName : String; aBlob : TJSBlob); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    Function getAll(const aName : String) : TJSFormDataEntryValueArray;
    Function values : TJSValueDynArray; reintroduce;
    Property Entry[const aIndex : String] : TJSFormDataEntryValue read get;
  end;

  TJSHTMLTemplateElement = class {$IFDEF PAS2JS}external name 'HTMLTemplateElement' (TJSHTMLElement){$ENDIF}
    content : TJSHTMLElement;
  end;


var
  document : TJSDocument; {$IFDEF PAS2JS} external name 'document';{$ENDIF}
  window : TJSWindow; {$IFDEF PAS2JS} external name 'window';{$ENDIF}
  console : TJSConsole; {$IFDEF PAS2JS} external name 'window.console';{$ENDIF}

implementation
    
{ TJSEventTarget }

{$IFDEF DCC}
procedure TJSEventTarget.addEventListener(aname: string; aListener: JSValue);
begin

end;

procedure TJSEventTarget.addEventListener(aname: string;
  aListener: TJSRawEventHandler);
begin

end;

procedure TJSEventTarget.addEventListener(aname: string;
  aListener: TJSEventHandler);
begin

end;

function TJSEventTarget.dispatchEvent(event: JSValue): Boolean;
begin
  Result := False;
end;

procedure TJSEventTarget.removeEventListener(aname: string; aListener: JSValue);
begin

end;

procedure TJSEventTarget.removeEventListener(aname: string;
  aListener: TJSRawEventHandler);
begin

end;

procedure TJSEventTarget.removeEventListener(aname: string;
  aListener: TJSEventHandler);
begin

end;

{ TJSNode }

function TJSNode.appendChild(aChild: TJSNode): TJSNode;
begin
  Result := nil;
end;

function TJSNode.cloneNode(deep: boolean): TJSNode;
begin
  Result := nil;
end;

function TJSNode.compareDocumentPosition(aNode: TJSNode): NativeInt;
begin
  Result := 0;
end;

function TJSNode.contains(aNode: TJSNode): boolean;
begin
  Result := False;
end;

function TJSNode.hasChildNodes: boolean;
begin
  Result := False;
end;

function TJSNode.insertBefore(newNode, referenceNode: TJSNode): TJSNode;
begin
  Result := nil;
end;

function TJSNode.isDefaultNameSpace(aNameSpaceURI: String): Boolean;
begin
  Result := False;
end;

function TJSNode.isEqualNode(aNode: TJSNode): boolean;
begin
  Result := False;
end;

function TJSNode.isSameNode(aNode: TJSNode): boolean;
begin
  Result := False;
end;

function TJSNode.lookupNamespaceURI(aPrefix: string): string;
begin
  Result := '';
end;

function TJSNode.lookupPrefix(aPrefix: string): string;
begin
  Result := '';
end;

procedure TJSNode.normalize;
begin

end;

function TJSNode.removeChild(aChild: TJSNode): TJSNode;
begin
  Result := nil;
end;

function TJSNode.replaceChild(aNewChild, aOldChild: TJSNode): TJSNode;
begin
  Result := nil;
end;

{ TJSNodeList }

procedure TJSNodeList.forEach(const aCallBack: TJSNodeListCallBack);
begin

end;

procedure TJSNodeList.forEach(const aCallBack: TJSNodeListEvent);
begin

end;

function TJSNodeList.item(aIndex: NativeInt): TJSNode;
begin
  Result := nil;
end;

{ TJSNamedNodeMap }

function TJSNamedNodeMap.getNamedItem(aName: string): TJSAttr;
begin
  Result := nil;
end;

{ TJSHTMLCollection }

function TJSHTMLCollection.item(aIndex: Integer): TJSNode;
begin
  Result := nil;
end;

function TJSHTMLCollection.namedItem(aName: string): TJSNode;
begin
  Result := nil;
end;

{ TJSDOMTokenList }

procedure TJSDOMTokenList.add(aToken: TJSDOMString);
begin

end;

function TJSDOMTokenList.contains(aToken: TJSDOMString): Boolean;
begin
  Result := False;
end;

procedure TJSDOMTokenList.forEach(const callback: TDOMTokenlistCallBack);
begin

end;

function TJSDOMTokenList.item(aIndex: NativeInt): String;
begin
  Result := '';
end;

procedure TJSDOMTokenList.remove(aToken: TJSDOMString);
begin

end;

procedure TJSDOMTokenList.replace(aOldToken, ANewToken: TJSDOMString);
begin

end;

function TJSDOMTokenList.supports(aToken: TJSDOMString): Boolean;
begin
  Result := False;
end;

function TJSDOMTokenList.toggle(aToken: TJSDOMString): Boolean;
begin
  Result := False;
end;

{ TJSElement }

procedure TJSElement.append(aNode: TJSElement);
begin

end;

procedure TJSElement.append(aText: String; aNode: TJSElement);
begin

end;

procedure TJSElement.append(aNode1, aNode2: TJSElement);
begin

end;

procedure TJSElement.append(aText: String);
begin

end;

function TJSElement.getAttribute(aName: string): string;
begin
  Result := '';
end;

function TJSElement.getAttributeNode(aName: string): TJSAttr;
begin
  Result := nil;
end;

function TJSElement.getAttributeNodeNS(aNameSpace, aName: string): TJSAttr;
begin
  Result := nil;
end;

function TJSElement.getAttributeNS(aNameSpace, aName: string): string;
begin
  Result := '';
end;

function TJSElement.getBoundingClientRect: TJSDOMRect;
begin
  Result := nil;
end;

function TJSElement.getClientRects: TJSClientRectArray;
begin
  Result := nil;
end;

function TJSElement.getElementsByClassName(
  aClassName: string): TJSHTMLCollection;
begin
  Result := nil;
end;

function TJSElement.getElementsByTagName(aTagName: String): TJSHTMLCollection;
begin
  Result := nil;
end;

function TJSElement.getElementsByTagNameNS(aNameSpace,
  aTagName: String): TJSHTMLCollection;
begin
  Result := nil;
end;

function TJSElement.hasAttribute(aName: String): Boolean;
begin
  Result := False;
end;

function TJSElement.hasAttributeNS(aNameSpace, aName: String): Boolean;
begin
  Result := False;
end;

function TJSElement.hasAttributes: Boolean;
begin
  Result := False;
end;

function TJSElement.insertAdjacentElement(aPosition: string;
  aElement: TJSElement): TJSElement;
begin
  Result := nil;
end;

procedure TJSElement.insertAdjacentHTML(aPosition, aHTML: string);
begin

end;

procedure TJSElement.insertAdjacentText(aPosition, aText: string);
begin

end;

function TJSElement.matches(aSelectorString: String): Boolean;
begin
  Result := False;
end;

function TJSElement.querySelector(aSelectors: String): TJSElement;
begin
  Result := nil;
end;

function TJSElement.querySelectorAll(aSelectors: String): TJSNodeList;
begin
  Result := nil;
end;

procedure TJSElement.releasePointerCapture(evID: JSValue);
begin

end;

procedure TJSElement.removeAttribute(aName: string);
begin

end;

function TJSElement.removeAttributeNode(aAttr: TJSAttr): TJSAttr;
begin
  Result := nil;
end;

procedure TJSElement.removeAttributeNS(aNameSpace, aName: string);
begin

end;

procedure TJSElement.requestFullScreen;
begin

end;

procedure TJSElement.setAttribute(aName, AValue: String);
begin

end;

function TJSElement.setAttributeNode(aNode: TJSAttr): TJSAttr;
begin
  Result := nil;
end;

function TJSElement.setAttributeNodeNS(aNode: TJSAttr): TJSAttr;
begin
  Result := nil;
end;

procedure TJSElement.setAttributeNS(aNameSpace, aName, AValue: String);
begin

end;

procedure TJSElement.setCapture(retargetToElement: Boolean);
begin

end;

procedure TJSElement.setPointerCapture(pointerID: JSValue);
begin

end;

{ TJSDOMImplementation }

function TJSDOMImplementation.createDocument(aNamespaceURI,
  aQualifiedNameStr: String; aDocumentType: TJSDocumentType): TJSDocument;
begin
  Result := nil;
end;

function TJSDOMImplementation.createDocumentType(aQualifiedNameStr, aPublicId,
  aSystemId: String): TJSDocumentType;
begin
  Result := nil;
end;

function TJSDOMImplementation.createHTMLDocument(aTitle: String): TJSDocument;
begin
  Result := nil;
end;

{ TJSLocation }

procedure TJSLocation.assign(aURL: String);
begin

end;

procedure TJSLocation.reload(aForce: Boolean);
begin

end;

procedure TJSLocation.replace(aURL: String);
begin

end;

{ TJSCSSRuleList }

function TJSCSSRuleList.item(index: NativeInt): TJSCSSRule;
begin
  Result := nil;
end;

{ TJSCSSStyleSheet }

procedure TJSCSSStyleSheet.deleteRule(aIndex: NativeInt);
begin

end;

function TJSCSSStyleSheet.insertRule(aRule: String;
  aIndex: NativeInt): NativeInt;
begin
  Result := 0;
end;

{ TJSStyleSheetList }

function TJSStyleSheetList.item(index: NativeInt): TJSStyleSheet;
begin
  Result := nil;
end;

{ TJSDocumentFragment }

constructor TJSDocumentFragment.new;
begin

end;

function TJSDocumentFragment.querySelector(aSelector: String): TJSElement;
begin
  Result := nil;
end;

function TJSDocumentFragment.querySelectorAll(aSelector: String): TJSNodeList;
begin
  Result := nil;
end;

{ TJSEvent }

constructor TJSEvent.new(aType: String; const aInit: TJSEventInit);
begin

end;

constructor TJSEvent.new(aType: String);
begin

end;

procedure TJSEvent.preventDefault;
begin

end;

procedure TJSEvent.stopImmediatePropagation;
begin

end;

procedure TJSEvent.stopPropagation;
begin

end;

{ TJSXPathExpression }

function TJSXPathExpression.evaluate(contextNode: TJSNode; aType: NativeInt;
  aResult: TJSXPathResult): TJSXPathResult;
begin
  Result := nil;
end;

function TJSXPathExpression.evaluateWithContext(contextNode: TJSNode; aPosition,
  aSize, aType: NativeInt; aResult: TJSXPathResult): TJSXPathResult;
begin
  Result := nil;
end;

{ TJSXPathNSResolver }

function TJSXPathNSResolver.lookupNamespaceURI(prefix: string): string;
begin
  Result := '';
end;

{ TJSRange }

function TJSRange.cloneContents: TJSDocumentFragment;
begin
  Result := nil;
end;

function TJSRange.cloneRange: TJSRange;
begin
  Result := nil;
end;

procedure TJSRange.collapse;
begin

end;

function TJSRange.compareBoundaryPoints(aHow: NativeInt): NativeInt;
begin
  Result := 0;
end;

function TJSRange.createContextualFragment(
  aTagstring: String): TJSDocumentFragment;
begin
  Result := nil;
end;

procedure TJSRange.deleteContents;
begin

end;

procedure TJSRange.detach;
begin

end;

function TJSRange.extractContents: TJSDocumentFragment;
begin
  Result := nil;
end;

procedure TJSRange.insertNode(aNode: TJSNode);
begin

end;

constructor TJSRange.new;
begin

end;

procedure TJSRange.selectNode(aNode: TJSNode);
begin

end;

procedure TJSRange.selectNodeContents(aNode: TJSNode);
begin

end;

procedure TJSRange.setEnd(aEndNode: TJSNode; aEndOffset: NativeInt);
begin

end;

procedure TJSRange.setEndAfter(aEndNode: TJSNode);
begin

end;

procedure TJSRange.setEndBefore(aEndNode: TJSNode);
begin

end;

procedure TJSRange.setStart(aStartNode: TJSNode; aStartOffset: NativeInt);
begin

end;

procedure TJSRange.setStartAfter(aStartNode: TJSNode);
begin

end;

procedure TJSRange.setStartBefore(aStartNode: TJSNode);
begin

end;

procedure TJSRange.surroundContents(aNode: TJSNode);
begin

end;

{ TJSTreeWalker }

function TJSTreeWalker.firstChild: TJSNode;
begin
  Result := nil;
end;

function TJSTreeWalker.lastChild: TJSNode;
begin
  Result := nil;
end;

function TJSTreeWalker.nextNode: TJSNode;
begin
  Result := nil;
end;

function TJSTreeWalker.nextSibling: TJSNode;
begin
  Result := nil;
end;

function TJSTreeWalker.parentNode: TJSNode;
begin
  Result := nil;
end;

function TJSTreeWalker.previousNode: TJSNode;
begin
  Result := nil;
end;

function TJSTreeWalker.previousSibling: TJSNode;
begin
  Result := nil;
end;

{ TJSNodeFilter }

function TJSNodeFilter.acceptNode(aNode: TJSNode): NativeInt;
begin
  Result := 0;
end;

{ TJSXPathResult }

function TJSXPathResult.iterateNext: TJSNode;
begin
  Result := nil;
end;

function TJSXPathResult.snapshotItem(Index: NativeInt): TJSNode;
begin
  Result := nil;
end;

{ TJSSelection }

procedure TJSSelection.addRange(aRange: TJSRange);
begin

end;

procedure TJSSelection.collapse(aParentNode: TJSNode; Offset: NativeInt);
begin

end;

procedure TJSSelection.collapseToEnd;
begin

end;

procedure TJSSelection.collapseToStart;
begin

end;

function TJSSelection.containsNode(aNode: TJSNode;
  aPartlyContained: Boolean): Boolean;
begin
  Result := False;
end;

procedure TJSSelection.deleteFromDocument;
begin

end;

procedure TJSSelection.extend(aParentNode: TJSNode; Offset: NativeInt);
begin

end;

function TJSSelection.getRangeAt(aIndex: NativeInt): TJSRange;
begin
  Result := nil;
end;

procedure TJSSelection.removeAllRanges;
begin

end;

procedure TJSSelection.removeRange(aRange: TJSRange);
begin

end;

procedure TJSSelection.selectAllChildren(aParentNode: TJSNode);
begin

end;

procedure TJSSelection.setBaseAndExtent(aAnchorNode: TJSNode;
  aAnchorOffset: NativeInt; aFocusNode: TJSNode; aFocusOffset: NativeInt);
begin

end;

{ TJSDataTransferItem }

function TJSDataTransferItem.getAsFile: TJSHTMLFile;
begin
  Result := nil;
end;

procedure TJSDataTransferItem.getAsString(
  aCallBack: TJSDataTransferItemCallBack);
begin

end;

{ TJSDataTransferItemList }

function TJSDataTransferItemList.add(aData, AType: string): TJSDataTransferItem;
begin
  Result := nil;
end;

function TJSDataTransferItemList.add(aFile: TJSHTMLFile): TJSDataTransferItem;
begin
  Result := nil;
end;

procedure TJSDataTransferItemList.clear;
begin

end;

function TJSDataTransferItemList.getitem(
  aIndex: nativeInt): TJSDataTransferItem;
begin
  Result := nil;
end;

procedure TJSDataTransferItemList.remove(aIndex: integer);
begin

end;

{ TJSDataTransfer }

procedure TJSDataTransfer.clearData;
begin

end;

procedure TJSDataTransfer.clearData(aFormat: string);
begin

end;

function TJSDataTransfer.getData(aFormat: string): String;
begin
  Result := '';
end;

procedure TJSDataTransfer.setData(aFormat, aData: String);
begin

end;

procedure TJSDataTransfer.setDragImage(aImage: TJSElement; xOffset,
  yOffset: integer);
begin

end;

{ TJSDocument }

function TJSDocument.adoptNode(aExternalNode: TJSNode): TJSNode;
begin
  Result := nil;
end;

procedure TJSDocument.close;
begin

end;

function TJSDocument.createAttribute(aName: string): TJSAttr;
begin
  Result := nil;
end;

function TJSDocument.createCDATASection(S: String): TJSNode;
begin
  Result := nil;
end;

function TJSDocument.createComment(S: String): TJSNode;
begin
  Result := nil;
end;

function TJSDocument.createDocumentFragment: TJSDocumentFragment;
begin
  Result := nil;
end;

function TJSDocument.createElement(tagName: string;
  const options: TJSElementCreationOptions): TJSElement;
begin
  Result := nil;
end;

function TJSDocument.createElement(tagName: string): TJSElement;
begin
  Result := nil;
end;

function TJSDocument.createElementNS(aNameSpace, tagName: string;
  const options: TJSElementCreationOptions): TJSElement;
begin
  Result := nil;
end;

function TJSDocument.createElementNS(aNameSpace, tagName: string): TJSElement;
begin
  Result := nil;
end;

function TJSDocument.createEvent(aType: string): TJSEvent;
begin
  Result := nil;
end;

function TJSDocument.createExpression(xPathText: String;
  aNameSpaceMapper: TJSNameSpaceMapperCallback): TJSXPathExpression;
begin
  Result := nil;
end;

function TJSDocument.createNSResolver(aNode: TJSNode): TJSXPathNSResolver;
begin
  Result := nil;
end;

function TJSDocument.createProcessingInstruction(target,
  data: String): TJSProcessingInstruction;
begin
  Result := nil;
end;

function TJSDocument.createRange: TJSRange;
begin
  Result := nil;
end;

function TJSDocument.createTextNode(S: String): TJSNode;
begin
  Result := nil;
end;

function TJSDocument.createTreeWalker(root: TJSNode; whatToShow: NativeInt;
  filter: TJSNodeFilter): TJSTreeWalker;
begin
  Result := nil;
end;

function TJSDocument.elementFromPoint(x, y: integer): TJSElement;
begin
  Result := nil;
end;

procedure TJSDocument.enableStyleSheetsForSet(aSet: String);
begin

end;

function TJSDocument.evaluate(xpathExpression: String; ContextNode: TJSNode;
  NameSpaceResolver: TJSNamespaceMapperCallBack; resultType: NativeInt;
  aResult: TJSXPathResult): TJSXPathResult;
begin
  Result := nil;
end;

function TJSDocument.execCommand(aCommandName: String; aShowDefaultUI: Boolean;
  AValueArgument: String): boolean;
begin
  Result := False;
end;

function TJSDocument.execCommand(aCommandName: String;
  aShowDefaultUI: Boolean): boolean;
begin
  Result := False;
end;

procedure TJSDocument.exitFullScreen;
begin

end;

function TJSDocument.getElementById(aID: String): TJSElement;
begin
  Result := nil;
end;

function TJSDocument.getElementsByClassName(aNames: string): TJSHTMLCollection;
begin
  Result := nil;
end;

function TJSDocument.getElementsByName(aName: String): TJSNodeList;
begin
  Result := nil;
end;

function TJSDocument.getElementsByTagName(aName: String): TJSHTMLCollection;
begin
  Result := nil;
end;

function TJSDocument.getElementsByTagNameNS(aNameSpace,
  aName: String): TJSHTMLCollection;
begin
  Result := nil;
end;

function TJSDocument.getSelection: TJSSelection;
begin
  Result := nil;
end;

function TJSDocument.hasFocus: boolean;
begin
  Result := False;
end;

function TJSDocument.importNode(aExternalNode: TJSNode; Deep: boolean): TJSNode;
begin
  Result := nil;
end;

procedure TJSDocument.open;
begin

end;

function TJSDocument.querySelector(aSelectors: String): TJSElement;
begin
  Result := nil;
end;

function TJSDocument.querySelectorAll(aSelectors: String): TJSNodeList;
begin
  Result := nil;
end;

procedure TJSDocument.releaseCapture;
begin

end;

procedure TJSDocument.write(aLine: string);
begin

end;

procedure TJSDocument.writeln(aLine: String);
begin

end;

{ TJSConsole }

procedure TJSConsole.assert(anAssertion: string; Obj1: JSValue);
begin

end;

procedure TJSConsole.clear;
begin

end;

procedure TJSConsole.count(aCounter: String);
begin

end;

procedure TJSConsole.count;
begin

end;

procedure TJSConsole.debug(Obj1: JSValue);
begin

end;

procedure TJSConsole.error(Obj1: JSValue);
begin

end;

procedure TJSConsole.group(aLabel: String);
begin

end;

procedure TJSConsole.group;
begin

end;

procedure TJSConsole.groupCollapsed(aLabel: String);
begin

end;

procedure TJSConsole.groupCollapsed;
begin

end;

procedure TJSConsole.groupEnd;
begin

end;

procedure TJSConsole.info(Obj1: JSValue);
begin

end;

procedure TJSConsole.log(Obj1: JSValue);
begin

end;

procedure TJSConsole.table(args: array of JSValue);
begin

end;

procedure TJSConsole.table(args: array of JSValue; Columns: array of string);
begin

end;

procedure TJSConsole.table(args: TJSObject);
begin

end;

procedure TJSConsole.table(args: TJSObject; Columns: array of string);
begin

end;

procedure TJSConsole.time(aName: string);
begin

end;

procedure TJSConsole.timeEnd(aName: string);
begin

end;

procedure TJSConsole.trace;
begin

end;

procedure TJSConsole.warn(Obj1: JSValue);
begin

end;

{ TJSSubtleCrypto }

function TJSSubtleCrypto.decrypt(algorithm: AlgorithmIdentifier;
  key: TJSCryptoKey; data: TJSBufferSource): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.deriveBits(algorithm: AlgorithmIdentifier;
  baseKey: TJSCryptoKey; length_: NativeInt): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.deriveKey(algorithm: AlgorithmIdentifier;
  baseKey: TJSCryptoKey; derivedKeyType: AlgorithmIdentifier;
  extractable: boolean; keyUsages: TKeyUsageDynArray): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.digest(algorithm: AlgorithmIdentifier;
  data: TJSBufferSource): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.encrypt(algorithm: AlgorithmIdentifier;
  key: TJSCryptoKey; data: TJSBufferSource): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.exportKey(format: KeyFormat;
  key: TJSCryptoKey): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.generateKey(algorithm: AlgorithmIdentifier;
  extractable: boolean; keyUsages: TKeyUsageDynArray): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.importKey(format: KeyFormat; keyData: TJSObject;
  algorithm: AlgorithmIdentifier; extractable: boolean;
  keyUsages: TKeyUsageDynArray): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.sign(algorithm: AlgorithmIdentifier; key: TJSCryptoKey;
  data: TJSBufferSource): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.unwrapKey(format: KeyFormat;
  wrappedKey: TJSBufferSource; unwrappingKey: TJSCryptoKey; unwrapAlgorithm,
  unwrappedKeyAlgorithm: AlgorithmIdentifier; extractable: boolean;
  keyUsages: TKeyUsageDynArray): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.verify(algorithm: AlgorithmIdentifier;
  key: TJSCryptoKey; signature, data: TJSBufferSource): TJSPromise;
begin
  Result := nil;
end;

function TJSSubtleCrypto.wrapKey(format: KeyFormat; key,
  wrappingKey: TJSCryptoKey; wrapAlgorithm: AlgorithmIdentifier): TJSPromise;
begin
  Result := nil;
end;

{ TJSCrypto }

procedure TJSCrypto.getRandomValues(anArray: TJSTypedArray);
begin

end;

{ TJSHistory }

procedure TJSHistory.back;
begin

end;

procedure TJSHistory.forward;
begin

end;

procedure TJSHistory.go(aIndex: NativeInt);
begin

end;

procedure TJSHistory.go;
begin

end;

procedure TJSHistory.pushState(aState: jsValue; aTitle, AURL: String);
begin

end;

procedure TJSHistory.pushState(aState: jsValue; aTitle: String);
begin

end;

procedure TJSHistory.replaceState(aState: jsValue);
begin

end;

procedure TJSHistory.replaceState(aState: jsValue; aTitle: String);
begin

end;

procedure TJSHistory.replaceState(aState: jsValue; aTitle, AURL: String);
begin

end;

{ TJSIDBTransaction }

procedure TJSIDBTransaction.abort;
begin

end;

function TJSIDBTransaction.objectStore(aName: String): TJSIDBObjectStore;
begin
  Result := nil;
end;

{ TJSIDBKeyRange }

class function TJSIDBKeyRange.bound(aLower, aUpper: JSValue;
  aLowerOpen: Boolean): TJSIDBKeyRange;
begin
  Result := nil;
end;

class function TJSIDBKeyRange.bound(aLower, aUpper: JSValue): TJSIDBKeyRange;
begin
  Result := nil;
end;

class function TJSIDBKeyRange.bound(aLower, aUpper: JSValue; aLowerOpen,
  aUpperOpen: Boolean): TJSIDBKeyRange;
begin
  Result := nil;
end;

function TJSIDBKeyRange.includes(aValue: JSValue): Boolean;
begin
  Result := False;
end;

class function TJSIDBKeyRange.lowerBound(aLower: JSValue): TJSIDBKeyRange;
begin
  Result := nil;
end;

class function TJSIDBKeyRange.lowerBound(aLower: JSValue;
  aOpen: Boolean): TJSIDBKeyRange;
begin
  Result := nil;
end;

class function TJSIDBKeyRange.only(aValue: JSValue): TJSIDBKeyRange;
begin
  Result := nil;
end;

class function TJSIDBKeyRange.upperBound(aUpper: JSValue): TJSIDBKeyRange;
begin
  Result := nil;
end;

class function TJSIDBKeyRange.upperBound(aUpper: JSValue;
  aOpen: Boolean): TJSIDBKeyRange;
begin
  Result := nil;
end;

{ TJSIDBIndex }

function TJSIDBIndex.count: TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.get(aKey: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.get(aKey: jsValue): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.getAll(aKey: jsValue; ACount: NativeInt): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.getAll(aKey: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.getAll(aKey: jsValue): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.getAll(aKey: TJSIDBKeyRange;
  ACount: NativeInt): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.getAllKeys(aKey: jsValue;
  ACount: NativeInt): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.getAllKeys(aKey: TJSIDBKeyRange;
  ACount: NativeInt): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.getAllKeys(aKey: jsValue): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.getAllKeys(aKey: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.getKey(aKey: jsValue): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.openCursor(aKeyRange: TJSIDBKeyRange;
  ADirection: String): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.openCursor(aKeyRange: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.openCursor: TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.openKeyCursor(aKeyRange: TJSIDBKeyRange;
  ADirection: String): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.openKeyCursor(aKeyRange: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBIndex.openKeyCursor: TJSIDBRequest;
begin
  Result := nil;
end;

{ TJSIDBCursor }

procedure TJSIDBCursor.advance(aCount: NativeInt);
begin

end;

procedure TJSIDBCursor.advance(aKey: JSValue);
begin

end;

procedure TJSIDBCursor.continue;
begin

end;

procedure TJSIDBCursor.continue(aKey: JSValue);
begin

end;

procedure TJSIDBCursor.continuePrimaryKey(aKey, aPrimaryKey: JSValue);
begin

end;

procedure TJSIDBCursor.continuePrimaryKey(aKey: JSValue);
begin

end;

procedure TJSIDBCursor.delete;
begin

end;

procedure TJSIDBCursor.update(aValue: JSValue);
begin

end;

{ TJSIDBObjectStore }

function TJSIDBObjectStore.add(aValue: JSValue; aKey: String): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.add(aValue: JSValue): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.clear: TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.count(aKeyRange: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.count(aKey: String): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.count: TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.createIndex(aIndexName: String;
  KeyPath: array of String; Options: TJSIDBIndexParameters): TJSIDBIndex;
begin
  Result := nil;
end;

function TJSIDBObjectStore.createIndex(aIndexName: String;
  KeyPath: array of String): TJSIDBIndex;
begin
  Result := nil;
end;

function TJSIDBObjectStore.createIndex(aIndexName,
  KeyPath: String): TJSIDBIndex;
begin
  Result := nil;
end;

function TJSIDBObjectStore.createIndex(aIndexName, KeyPath: String;
  Options: TJSIDBIndexParameters): TJSIDBIndex;
begin
  Result := nil;
end;

function TJSIDBObjectStore.delete(aKeyRange: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.delete(aKey: string): TJSIDBRequest;
begin
  Result := nil;
end;

procedure TJSIDBObjectStore.deleteIndex(aIndexName: String);
begin

end;

function TJSIDBObjectStore.get(aKeyRange: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.get(aKey: string): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getAll(aKey: String): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getAll(aKeyRange: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getAll(aKey: String;
  aCount: NativeInt): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getAll(aKeyRange: TJSIDBKeyRange;
  aCount: NativeInt): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getAll: TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getAllKeys(aKeyRange: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getAllKeys(aKey: String): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getAllKeys(aKeyRange: TJSIDBKeyRange;
  aCount: NativeInt): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getAllKeys(aKey: String;
  aCount: NativeInt): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getKey(aKeyRange: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.getKey(aKey: string): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.index(aIndexName: String): TJSIDBIndex;
begin
  Result := nil;
end;

function TJSIDBObjectStore.openCursor(aKeyRange: TJSIDBKeyRange;
  aDirection: string): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.openCursor(aKey, aDirection: string): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.openCursor(aKeyRange: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.openCursor(aKey: String): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.openCursor: TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.openKeyCursor: TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.openKeyCursor(aKeyRange: TJSIDBKeyRange;
  aDirection: string): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.openKeyCursor(aKey,
  aDirection: string): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.openKeyCursor(aKey: String): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.openKeyCursor(
  aKeyRange: TJSIDBKeyRange): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.put(aValue: JSValue; aKey: String): TJSIDBRequest;
begin
  Result := nil;
end;

function TJSIDBObjectStore.put(aValue: JSValue): TJSIDBRequest;
begin
  Result := nil;
end;

{ TIDBDatabase }

procedure TIDBDatabase.close;
begin

end;

function TIDBDatabase.createObjectStore(aName: string;
  Options: TJSCreateObjectStoreOptions): TJSIDBObjectStore;
begin
  Result := nil;
end;

function TIDBDatabase.createObjectStore(aName: string): TJSIDBObjectStore;
begin
  Result := nil;
end;

procedure TIDBDatabase.deleteObjectStore(aName: string);
begin

end;

function TIDBDatabase.transaction(aStoreNames: array of string;
  aMode: string): TJSIDBTransaction;
begin
  Result := nil;
end;

function TIDBDatabase.transaction(
  aStoreNames: array of string): TJSIDBTransaction;
begin
  Result := nil;
end;

{ TJSIDBFactory }

function TJSIDBFactory.cmp(a, b: jsValue): NativeInt;
begin
  Result := 0;
end;

function TJSIDBFactory.deleteDatabase(aName: string): TJSIDBOpenDBRequest;
begin
  Result := nil;
end;

function TJSIDBFactory.open(aName: string;
  aVersion: Integer): TJSIDBOpenDBRequest;
begin
  Result := nil;
end;

function TJSIDBFactory.open(aName: string): TJSIDBOpenDBRequest;
begin
  Result := nil;
end;

{ TJSStorage }

procedure TJSStorage.clear;
begin

end;

function TJSStorage.getItem(aKeyName: string): string;
begin
  Result := '';
end;

function TJSStorage.key(aIndex: Integer): String;
begin
  Result := '';
end;

procedure TJSStorage.removeItem(aKeyName: string);
begin

end;

procedure TJSStorage.setItem(aKeyName, aValue: string);
begin

end;

{ TJSGeoLocation }

procedure TJSGeoLocation.clearWatch(AID: NativeInt);
begin

end;

procedure TJSGeoLocation.getCurrentPosition(ASuccess: TJSGeoLocationCallback;
  aError: TJSGeoLocationErrorCallback; AOptions: TJSPositionOptions);
begin

end;

procedure TJSGeoLocation.getCurrentPosition(ASuccess: TJSGeoLocationCallback;
  aError: TJSGeoLocationErrorCallback);
begin

end;

procedure TJSGeoLocation.getCurrentPosition(ASuccess: TJSGeoLocationCallback);
begin

end;

function TJSGeoLocation.watchPosition(ASuccess: TJSGeoLocationCallback;
  aError: TJSGeoLocationErrorCallback; AOptions: TJSPositionOptions): NativeInt;
begin
  Result := 0;
end;

function TJSGeoLocation.watchPosition(ASuccess: TJSGeoLocationCallback;
  aError: TJSGeoLocationErrorCallback): NativeInt;
begin
  Result := 0;
end;

function TJSGeoLocation.watchPosition(
  ASuccess: TJSGeoLocationCallback): NativeInt;
begin
  Result := 0;
end;

{ TJSWorker }

constructor TJSWorker.new(aURL: string);
begin

end;

procedure TJSWorker.postMessage(aValue: JSValue);
begin

end;

procedure TJSWorker.postMessage(aValue: JSValue; aList: TJSValueDynArray);
begin

end;

{ TJSMessagePort }

procedure TJSMessagePort.close;
begin

end;

procedure TJSMessagePort.postMessage(aValue: JSValue);
begin

end;

procedure TJSMessagePort.postMessage(aValue: JSValue; aList: TJSValueDynArray);
begin

end;

procedure TJSMessagePort.start;
begin

end;

{ TJSSharedWorker }

constructor TJSSharedWorker.new(aURL, aName: string);
begin

end;

constructor TJSSharedWorker.new(aURL: String);
begin

end;

{ TJSServiceWorkerRegistration }

function TJSServiceWorkerRegistration.unregister: TJSPromise;
begin
  Result := nil;
end;

procedure TJSServiceWorkerRegistration.update;
begin

end;

{ TJSServiceWorkerContainer }

function TJSServiceWorkerContainer.getRegistration(aURL: String): TJSPromise;
begin
  Result := nil;
end;

function TJSServiceWorkerContainer.getRegistration: TJSPromise;
begin
  Result := nil;
end;

function TJSServiceWorkerContainer.getRegistrations: TJSPromise;
begin
  Result := nil;
end;

function TJSServiceWorkerContainer.register(aURL: String): TJSPromise;
begin
  Result := nil;
end;

function TJSServiceWorkerContainer.register(aURL: String;
  aOptions: TJSServiceWorkerContainerOptions): TJSPromise;
begin
  Result := nil;
end;

{ TJSNavigator }

function TJSNavigator.getBattery: TJSPromise;
begin
  Result := nil;
end;

procedure TJSNavigator.registerContentHandler(aMimeType, aURI, aTitle: string);
begin

end;

procedure TJSNavigator.registerProtocolHandler(aProtocol, aURI, aTitle: string);
begin

end;

function TJSNavigator.requestMediaKeySystemAccess(aKeySystem: String;
  supportedConfigurations: TJSValueDynArray): TJSPromise;
begin
  Result := nil;
end;

procedure TJSNavigator.vibrate(aPattern: NativeInt);
begin

end;

procedure TJSNavigator.vibrate(aPattern: array of NativeInt);
begin

end;

{ TJSTouchList }

function TJSTouchList.item(aIndex: Integer): TJSTouch;
begin
  Result := nil;
end;

{ TJSURLSearchParams }

procedure TJSURLSearchParams.append(const aName, aValue: string);
begin

end;

procedure TJSURLSearchParams.delete(const aName: string);
begin

end;

function TJSURLSearchParams.entries: TJSIterator;
begin
  Result := nil;
end;

procedure TJSURLSearchParams.foreach(aEnumCallBack: TJSParamEnumCallBack);
begin

end;

function TJSURLSearchParams.get(const aName: string): JSValue;
begin
  Result := nil;
end;

function TJSURLSearchParams.getAll(const aName: string): TStringDynArray;
begin
  Result := nil;
end;

function TJSURLSearchParams.getString(const aName: string): string;
begin
  Result := '';
end;

function TJSURLSearchParams.has(const aName: string): Boolean;
begin
  Result := False;
end;

function TJSURLSearchParams.keys: TJSIterator;
begin
  Result := nil;
end;

procedure TJSURLSearchParams.set_(const aName, aValue: string);
begin

end;

procedure TJSURLSearchParams.sort;
begin

end;

function TJSURLSearchParams.values: TJSIterator;
begin
  Result := nil;
end;

{ TJSURL }

class function TJSURL.createObjectURL(const v: JSValue): string;
begin
  Result := '';
end;

constructor TJSURL.new(aURL: String);
begin

end;

constructor TJSURL.new(aURL, aBase: String);
begin

end;

class function TJSURL.revokeObjectURL(const S: String): string;
begin
  Result := '';
end;

function TJSURL.toJSON: String;
begin
  Result := '';
end;

{ TJSHTMLHeaders }

procedure TJSHTMLHeaders.append(aName, aValue: String);
begin

end;

procedure TJSHTMLHeaders.delete(aName: String);
begin

end;

function TJSHTMLHeaders.entries: TJSIterator;
begin
  Result := nil;
end;

function TJSHTMLHeaders.get(aName: String): string;
begin
  Result := '';
end;

function TJSHTMLHeaders.has(aName: String): Boolean;
begin
  Result := False;
end;

function TJSHTMLHeaders.keys: TJSIterator;
begin
  Result := nil;
end;

constructor TJSHTMLHeaders.new(values: THeaderArray);
begin

end;

procedure TJSHTMLHeaders.set_(aName, aValue: String);
begin

end;

function TJSHTMLHeaders.values: TJSIterator;
begin
  Result := nil;
end;

{ TJSReadableStream }

function TJSReadableStream.cancel(reason: TJSDOMString): TJSPromise;
begin
  Result := nil;
end;

function TJSReadableStream.getReader(mode: TJSObject): TJSObject;
begin
  Result := nil;
end;

function TJSReadableStream.getReader: TJSObject;
begin
  Result := nil;
end;

constructor TJSReadableStream.new(underlyingSource: TJSObject);
begin

end;

constructor TJSReadableStream.new(underlyingSource,
  queueingStrategy: TJSObject);
begin

end;

function TJSReadableStream.pipeThrough(transformStream,
  options: TJSObject): TJSReadableStream;
begin
  Result := nil;
end;

function TJSReadableStream.pipeThrough(
  transformStream: TJSObject): TJSReadableStream;
begin
  Result := nil;
end;

function TJSReadableStream.pipeTo(destination, options: TJSObject): TJSPromise;
begin
  Result := nil;
end;

function TJSReadableStream.pipeTo(destination: TJSObject): TJSPromise;
begin
  Result := nil;
end;

function TJSReadableStream.tee: TJSArray;
begin
  Result := nil;
end;

{ TJSBody }

function TJSBody.arrayBuffer: TJSPromise;
begin
  Result := nil;
end;

function TJSBody.blob: TJSBlob;
begin
  Result := nil;
end;

function TJSBody.json: TJSPromise;
begin
  Result := nil;
end;

function TJSBody.text: string;
begin
  Result := '';
end;

{ TJSResponse }

function TJSResponse.clone: TJSResponse;
begin
  Result := nil;
end;

function TJSResponse.error: TJSResponse;
begin
  Result := nil;
end;

constructor TJSResponse.new(body, init: TJSObject);
begin

end;

function TJSResponse.redirect(url: String; Status: NativeInt): TJSResponse;
begin
  Result := nil;
end;

{ TJSWindow }

procedure TJSWindow.addEventListener(aname: string; aListener: TJSEventHandler);
begin

end;

procedure TJSWindow.addEventListener(aname: string; aListener: JSValue);
begin

end;

procedure TJSWindow.alert(const Msg: String);
begin

end;

function TJSWindow.atob(const aValue: string): string;
begin
  Result := '';
end;

procedure TJSWindow.blur;
begin

end;

function TJSWindow.btoa(const aValue: string): string;
begin
  Result := '';
end;

procedure TJSWindow.cancelAnimationFrame(aHandle: Integer);
begin

end;

procedure TJSWindow.clearInterval(aID: NativeInt);
begin

end;

procedure TJSWindow.clearTimeout(aID: NativeInt);
begin

end;

procedure TJSWindow.close;
begin

end;

function TJSWindow.confirm(const aMsg: String): boolean;
begin
  Result := False;
end;

function TJSWindow.fetch(resource: String; init: TJSObject): TJSPromise;
begin
  Result := nil;
end;

function TJSWindow.fetch(resource: String): TJSResponse;
begin
  Result := nil;
end;

function TJSWindow.fetch(resource: TJSObject): TJSPromise;
begin
  Result := nil;
end;

function TJSWindow.fetch(resource, init: TJSObject): TJSPromise;
begin
  Result := nil;
end;

procedure TJSWindow.focus;
begin

end;

function TJSWindow.getComputedStyle(aElement,
  aPseudoElement: TJSElement): TJSCSSStyleDeclaration;
begin
  Result := nil;
end;

function TJSWindow.getComputedStyle(
  aElement: TJSElement): TJSCSSStyleDeclaration;
begin
  Result := nil;
end;

function TJSWindow.matchMedia(aQuery: String): TJSMediaQueryList;
begin
  Result := nil;
end;

procedure TJSWindow.moveBy(x, y: NativeInt);
begin

end;

procedure TJSWindow.moveTo(x, y: NativeInt);
begin

end;

function TJSWindow.open(const aURL, aTarget: String): TJSWindow;
begin
  Result := nil;
end;

function TJSWindow.open(const aURL, aTarget: String;
  AOptions: TJSObject): TJSWindow;
begin
  Result := nil;
end;

function TJSWindow.open(const aURL: String): TJSWindow;
begin
  Result := nil;
end;

function TJSWindow.open: TJSWindow;
begin
  Result := nil;
end;

procedure TJSWindow.postMessage(aMessage: JSValue; aTarget: string);
begin

end;

procedure TJSWindow.postMessage(aMessage: JSValue; aTarget: string;
  aTransfer: TJSValueDynArray);
begin

end;

procedure TJSWindow.postMessage(aMessage: JSValue; aTransfer: TJSValueDynArray);
begin

end;

procedure TJSWindow.postMessage(aMessage: JSValue;
  aOptions: TJSPostMessageOptions);
begin

end;

procedure TJSWindow.postMessage(aMessage: JSValue);
begin

end;

procedure TJSWindow.print;
begin

end;

function TJSWindow.prompt(const aMessage, aDefault: String): String;
begin
  Result := '';
end;

function TJSWindow.prompt(const aMessage: String): String;
begin
  Result := '';
end;

procedure TJSWindow.removeEventListener(aname: string;
  aListener: TJSEventHandler);
begin

end;

procedure TJSWindow.removeEventListener(aname: string; aListener: JSValue);
begin

end;

function TJSWindow.requestAnimationFrame(
  aCallback: TFrameRequestCallback): Integer;
begin
  Result := 0;
end;

procedure TJSWindow.resizeBy(aWidth, aHeight: NativeInt);
begin

end;

procedure TJSWindow.resizeTo(aWidth, aHeight: NativeInt);
begin

end;

procedure TJSWindow.scrollBy(x, y: NativeInt);
begin

end;

procedure TJSWindow.scrollTo(x, y: NativeInt);
begin

end;

function TJSWindow.setInterval(ahandler: TJSTimerCallBack;
  aInterval: NativeUInt): NativeInt;
begin
  Result := 0;
end;

function TJSWindow.setTimeout(ahandler: TJSTimerCallBack): NativeInt;
begin
  Result := 0;
end;

function TJSWindow.setTimeout(ahandler: TJSTimerCallBack;
  aTimeout: NativeUInt): NativeInt;
begin
  Result := 0;
end;

procedure TJSWindow.stop;
begin

end;

{ TJSCSSStyleDeclaration }

function TJSCSSStyleDeclaration.getPropertyPriority(
  const aProperty: String): string;
begin
  Result := '';
end;

function TJSCSSStyleDeclaration.getPropertyValue(
  const aProperty: String): string;
begin
  Result := '';
end;

function TJSCSSStyleDeclaration.item(aIndex: Integer): string;
begin
  Result := '';
end;

function TJSCSSStyleDeclaration.removeProperty(const aProperty: String): string;
begin
  Result := '';
end;

procedure TJSCSSStyleDeclaration.setProperty(const aProperty, aValue,
  aPriority: string);
begin

end;

procedure TJSCSSStyleDeclaration.setProperty(const aProperty, aValue: String);
begin

end;

{ TJSHTMLElement }

procedure TJSHTMLElement.blur;
begin

end;

procedure TJSHTMLElement.click;
begin

end;

procedure TJSHTMLElement.focus;
begin

end;

{ TJSHTMLFormControlsCollection }

function TJSHTMLFormControlsCollection.namedItem(S: String): TJSElement;
begin
  Result := nil;
end;

{ TJSHTMLFormElement }

function TJSHTMLFormElement.checkValidity: Boolean;
begin
  Result := False;
end;

function TJSHTMLFormElement.reportValidity: Boolean;
begin
  Result := False;
end;

procedure TJSHTMLFormElement.reset;
begin

end;

procedure TJSHTMLFormElement.submit;
begin

end;

{ TJSBlob }

procedure TJSBlob.close;
begin

end;

function TJSBlob.slice: TJSBlob;
begin
  Result := nil;
end;

function TJSBlob.slice(aStart: NativeInt): TJSBlob;
begin
  Result := nil;
end;

function TJSBlob.slice(aStart, aEnd: NativeInt): TJSBlob;
begin
  Result := nil;
end;

function TJSBlob.slice(aStart, aEnd: NativeInt; AContentType: String): TJSBlob;
begin
  Result := nil;
end;

{ TJSHTMLFileList }

function TJSHTMLFileList.item(aIndex: NativeInt): TJSHTMLFile;
begin
  Result := nil;
end;

{ TJSHTMLInputElement }

function TJSHTMLInputElement.checkValidity: Boolean;
begin
  Result := False;
end;

function TJSHTMLInputElement.reportValidity: Boolean;
begin
  Result := False;
end;

procedure TJSHTMLInputElement.select;
begin

end;

procedure TJSHTMLInputElement.setCustomValidity(aText: string);
begin

end;

procedure TJSHTMLInputElement.setRangeText(aText: string; selectionStart,
  selectionEnd: NativeInt; Direction: string);
begin

end;

procedure TJSHTMLInputElement.setRangeText(aText: string; selectionStart,
  selectionEnd: NativeInt);
begin

end;

procedure TJSHTMLInputElement.setSelectionRange(selectionStart,
  selectionEnd: NativeInt; Direction: string);
begin

end;

procedure TJSHTMLInputElement.setSelectionRange(selectionStart,
  selectionEnd: NativeInt);
begin

end;

procedure TJSHTMLInputElement.stepUp;
begin

end;

procedure TJSHTMLInputElement.stepUp(n: Integer);
begin

end;

{ TJSHTMLOutputElement }

function TJSHTMLOutputElement.checkValidity: Boolean;
begin
  Result := False;
end;

function TJSHTMLOutputElement.reportValidity: Boolean;
begin
  Result := False;
end;

procedure TJSHTMLOutputElement.setCustomValidity(error: TJSDOMString);
begin

end;

{ TJSHTMLImageElement }

function TJSHTMLImageElement.decode: TJSPromise;
begin
  Result := nil;
end;

constructor TJSHTMLImageElement.New(x, y: Cardinal);
begin

end;

{ TJSHTMLOptionElement }

constructor TJSHTMLOptionElement.New;
begin

end;

constructor TJSHTMLOptionElement.New(aText: String);
begin

end;

constructor TJSHTMLOptionElement.New(aText, aValue: String);
begin

end;

constructor TJSHTMLOptionElement.New(aText, aValue: String;
  aDefaultSelected: Boolean);
begin

end;

constructor TJSHTMLOptionElement.New(aText, aValue: String; aDefaultSelected,
  Selected: Boolean);
begin

end;

{ TJSHTMLSelectElement }

procedure TJSHTMLSelectElement.add(anItem: TJSHTMLOptionElement);
begin

end;

procedure TJSHTMLSelectElement.add(anItem, before: TJSHTMLOptionElement);
begin

end;

procedure TJSHTMLSelectElement.checkValidity;
begin

end;

function TJSHTMLSelectElement.item(aIndex: NativeInt): TJSHTMLOptionElement;
begin
  Result := nil;
end;

function TJSHTMLSelectElement.namedItem(aName: String): TJSHTMLOptionElement;
begin
  Result := nil;
end;

procedure TJSHTMLSelectElement.remove(aIndex: NativeInt);
begin

end;

procedure TJSHTMLSelectElement.setCustomValidity(aMessage: String);
begin

end;

{ TJSHTMLTableElement }

function TJSHTMLTableElement.createCaption: TJSHTMLElement;
begin
  Result := nil;
end;

function TJSHTMLTableElement.createTFoot: TJSHTMLTableSectionElement;
begin
  Result := nil;
end;

function TJSHTMLTableElement.createTHead: TJSHTMLTableSectionElement;
begin
  Result := nil;
end;

procedure TJSHTMLTableElement.deleteCaption;
begin

end;

procedure TJSHTMLTableElement.deleteRow(index: Integer);
begin

end;

procedure TJSHTMLTableElement.deleteTFoot;
begin

end;

procedure TJSHTMLTableElement.deleteTHead;
begin

end;

function TJSHTMLTableElement.insertRow(index: Integer): TJSHTMLTableRowElement;
begin
  Result := nil;
end;

{ TJSHTMLTableSectionElement }

procedure TJSHTMLTableSectionElement.deleteRow(index: Integer);
begin

end;

function TJSHTMLTableSectionElement.insertRow(
  index: Integer): TJSHTMLTableRowElement;
begin
  Result := nil;
end;

{ TJSHTMLTableRowElement }

procedure TJSHTMLTableRowElement.deleteCell(index: Integer);
begin

end;

function TJSHTMLTableRowElement.insertCell(
  index: Integer): TJSHTMLTableCellElement;
begin
  Result := nil;
end;

{ TJSHTMLCanvasElement }

function TJSHTMLCanvasElement.getContext(contextType: string): TJSObject;
begin
  Result := nil;
end;

function TJSHTMLCanvasElement.getContext(contextType: string;
  contextAttributes: TJSObject): TJSObject;
begin
  Result := nil;
end;

function TJSHTMLCanvasElement.getContextAs2DContext(contextType: string;
  contextAttributes: TJSObject): TJSCanvasRenderingContext2D;
begin
  Result := nil;
end;

function TJSHTMLCanvasElement.getContextAs2DContext(
  contextType: string): TJSCanvasRenderingContext2D;
begin
  Result := nil;
end;

procedure TJSHTMLCanvasElement.toBlob(aCallBack: THTMLCanvasToBlobCallback;
  aMimeType: String);
begin

end;

procedure TJSHTMLCanvasElement.toBlob(aCallBack: THTMLCanvasToBlobCallback;
  aMimeType: String; aQuality: Double);
begin

end;

function TJSHTMLCanvasElement.toDataURL: String;
begin
  Result := '';
end;

function TJSHTMLCanvasElement.toDataURL(aMimeType: String): String;
begin
  Result := '';
end;

function TJSHTMLCanvasElement.toDataURL(aMimeType: String;
  aQuality: Double): String;
begin
  Result := '';
end;

{ TJSFileReader }

procedure TJSFileReader.abort;
begin

end;

constructor TJSFileReader.new;
begin

end;

procedure TJSFileReader.readAsArrayBuffer(Blob: TJSBlob);
begin

end;

procedure TJSFileReader.readAsBinaryString(Blob: TJSBlob);
begin

end;

procedure TJSFileReader.readAsDataURL(Blob: TJSBlob);
begin

end;

procedure TJSFileReader.readAsText(Blob: TJSBlob; encoding: string);
begin

end;

procedure TJSFileReader.readAsText(Blob: TJSBlob);
begin

end;

{ TJSPath2D }

procedure TJSPath2D.addPath(aPath: TJSPath2D);
begin

end;

procedure TJSPath2D.arc(x, y, radius, startAngle, endAngle: TCanvasCoordType);
begin

end;

procedure TJSPath2D.arc(x, y, radius, startAngle, endAngle: TCanvasCoordType;
  antiClockWise: boolean);
begin

end;

procedure TJSPath2D.arcTo(x1, y1, x2, y2, radius: TCanvasCoordType);
begin

end;

procedure TJSPath2D.bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x,
  y: TCanvasCoordType);
begin

end;

procedure TJSPath2D.closePath;
begin

end;

procedure TJSPath2D.ellipse(x, y, radiusX, radiusY: TCanvasCoordType; rotation,
  startAngle, endAngle: Double; anticlockwise: Boolean);
begin

end;

procedure TJSPath2D.ellipse(x, y, radiusX, radiusY: TCanvasCoordType; rotation,
  startAngle, endAngle: Double);
begin

end;

procedure TJSPath2D.lineTo(X, Y: TCanvasCoordType);
begin

end;

procedure TJSPath2D.moveTo(X, Y: TCanvasCoordType);
begin

end;

constructor TJSPath2D.new(SVGPath: String);
begin

end;

constructor TJSPath2D.new(aPath: TJSPath2D);
begin

end;

constructor TJSPath2D.new;
begin

end;

procedure TJSPath2D.quadraticCurveTo(cpx, cpy, x, y: TCanvasCoordType);
begin

end;

procedure TJSPath2D.rect(x, y, awidth, aheight: TCanvasCoordType);
begin

end;

{ TJSImageData }

constructor TJSImageData.new(anArray: TJSUint8ClampedArray; awidth,
  aheight: integer);
begin

end;

constructor TJSImageData.new(awidth, aheight: integer);
begin

end;

{ TJSCanvasRenderingContext2D }

procedure TJSCanvasRenderingContext2D.arc(x, y, radius, startAngle,
  endAngle: TCanvasCoordType; antiClockWise: boolean);
begin

end;

procedure TJSCanvasRenderingContext2D.arc(x, y, radius, startAngle,
  endAngle: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.arcTo(x1, y1, x2, y2,
  radius: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.beginPath;
begin

end;

procedure TJSCanvasRenderingContext2D.bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x,
  y: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.clearRect(x, y, width,
  height: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.clip(aPath: TJSPath2D);
begin

end;

procedure TJSCanvasRenderingContext2D.clip(aFillRule: String);
begin

end;

procedure TJSCanvasRenderingContext2D.clip;
begin

end;

procedure TJSCanvasRenderingContext2D.closePath;
begin

end;

function TJSCanvasRenderingContext2D.createImageData(
  aImage: TJSImageData): TJSImageData;
begin
  Result := nil;
end;

function TJSCanvasRenderingContext2D.createImageData(aWidth,
  aHeight: Integer): TJSImageData;
begin
  Result := nil;
end;

function TJSCanvasRenderingContext2D.createLinearGradient(x0, y0, x1,
  y1: TCanvasCoordType): TJSCanvasGradient;
begin
  Result := nil;
end;

function TJSCanvasRenderingContext2D.createPattern(aImage: TJSObject;
  repetition: string): TJSCanvasPattern;
begin
  Result := nil;
end;

function TJSCanvasRenderingContext2D.createRadialGradient(x0, y0, r0, x1, y1,
  r1: TCanvasCoordType): TJSCanvasGradient;
begin
  Result := nil;
end;

procedure TJSCanvasRenderingContext2D.drawFocusIfNeeded(aPath: TJSPath2D;
  aElement: TJSElement);
begin

end;

procedure TJSCanvasRenderingContext2D.drawFocusIfNeeded(aElement: TJSElement);
begin

end;

procedure TJSCanvasRenderingContext2D.drawImage(image: TJSObject; dx, dy,
  dwidth, dheight: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.drawImage(image: TJSObject; dx,
  dy: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.drawImage(image: TJSObject; sx, sy,
  sWidth, sHeight, dx, dy, dwidth, dheight: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.ellipse(x, y, radiusX,
  radiusY: TCanvasCoordType; rotation, startAngle, endAngle: Double;
  anticlockwise: Boolean);
begin

end;

procedure TJSCanvasRenderingContext2D.ellipse(x, y, radiusX,
  radiusY: TCanvasCoordType; rotation, startAngle, endAngle: Double);
begin

end;

procedure TJSCanvasRenderingContext2D.fill;
begin

end;

procedure TJSCanvasRenderingContext2D.fill(aRule: String);
begin

end;

procedure TJSCanvasRenderingContext2D.fill(aPath: TJSPath2D; aRule: String);
begin

end;

procedure TJSCanvasRenderingContext2D.fill(aPath: TJSPath2D);
begin

end;

procedure TJSCanvasRenderingContext2D.fillRect(x, y, awidth,
  aheight: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.fillText(aText: string; x,
  y: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.fillText(aText: string; x, y,
  aMaxWidth: TCanvasCoordType);
begin

end;

function TJSCanvasRenderingContext2D.getImageData(x, y, awidth,
  aheight: TCanvasCoordType): TJSImageData;
begin
  Result := nil;
end;

function TJSCanvasRenderingContext2D.getLineDash: TJSArray;
begin
  Result := nil;
end;

function TJSCanvasRenderingContext2D.isPointInPath(x,
  y: TCanvasCoordType): Boolean;
begin
  Result := False;
end;

function TJSCanvasRenderingContext2D.isPointInPath(aPath: TJSPath2D; x,
  y: TCanvasCoordType; aFillRule: String): Boolean;
begin
  Result := False;
end;

function TJSCanvasRenderingContext2D.isPointInPath(aPath: TJSPath2D; x,
  y: TCanvasCoordType): Boolean;
begin
  Result := False;
end;

function TJSCanvasRenderingContext2D.isPointInPath(x, y: TCanvasCoordType;
  aFillRule: String): Boolean;
begin
  Result := False;
end;

function TJSCanvasRenderingContext2D.isPointInStroke(x,
  y: TCanvasCoordType): Boolean;
begin
  Result := False;
end;

function TJSCanvasRenderingContext2D.isPointInStroke(aPath: TJSPath2D; x,
  y: TCanvasCoordType): Boolean;
begin
  Result := False;
end;

procedure TJSCanvasRenderingContext2D.lineTo(x, y: TCanvasCoordType);
begin

end;

function TJSCanvasRenderingContext2D.measureText(S: String): TJSTextMetrics;
begin
  Result := nil;
end;

procedure TJSCanvasRenderingContext2D.moveTo(x, y: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.putImageData(aData: TJSImageData; x, y,
  dityX, dirtyY, dirtyWidth, dirtyHeight: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.putImageData(aData: TJSImageData; x,
  y: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.quadraticCurveTo(cpx, cpy, x,
  y: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.rect(x, y, awidth,
  aheight: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.restore;
begin

end;

procedure TJSCanvasRenderingContext2D.rotate(anAngle: double);
begin

end;

procedure TJSCanvasRenderingContext2D.save;
begin

end;

procedure TJSCanvasRenderingContext2D.scale(x, y: double);
begin

end;

procedure TJSCanvasRenderingContext2D.setLineDash(segments: TJSArray);
begin

end;

procedure TJSCanvasRenderingContext2D.setLineDash(segments: array of integer);
begin

end;

procedure TJSCanvasRenderingContext2D.setTransform(a, b, c, d, e, f: double);
begin

end;

procedure TJSCanvasRenderingContext2D.stroke(aPath: TJSPath2D);
begin

end;

procedure TJSCanvasRenderingContext2D.stroke;
begin

end;

procedure TJSCanvasRenderingContext2D.strokeRect(x, y, awidth,
  aheight: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.strokeText(aText: string; x,
  y: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.strokeText(aText: string; x, y,
  aMaxWidth: TCanvasCoordType);
begin

end;

procedure TJSCanvasRenderingContext2D.transform(a, b, c, d, e, f: double);
begin

end;

procedure TJSCanvasRenderingContext2D.translate(x, y: TCanvasCoordType);
begin

end;

{ TJSXMLHttpRequest }

procedure TJSXMLHttpRequest.abort;
begin

end;

function TJSXMLHttpRequest.getAllResponseHeaders: String;
begin
  Result := '';
end;

function TJSXMLHttpRequest.getResponseHeader(aName: string): String;
begin
  Result := '';
end;

constructor TJSXMLHttpRequest.new;
begin

end;

procedure TJSXMLHttpRequest.open(aMethod, aURL: String);
begin

end;

procedure TJSXMLHttpRequest.open(aMethod, aURL: String; Async: Boolean);
begin

end;

procedure TJSXMLHttpRequest.open(aMethod, aURL: String; Async: Boolean;
  AUserame: String);
begin

end;

procedure TJSXMLHttpRequest.open(aMethod, aURL: String; Async: Boolean;
  AUserame, APassword: String);
begin

end;

procedure TJSXMLHttpRequest.overrideMimeType(aType: String);
begin

end;

procedure TJSXMLHttpRequest.send(aBody: jsValue);
begin

end;

procedure TJSXMLHttpRequest.send;
begin

end;

procedure TJSXMLHttpRequest.setRequestHeader(aName, AValue: string);
begin

end;

{ TJSMouseEvent }

function TJSMouseEvent.getModifierState(keyArg: String): boolean;
begin
  Result := False;
end;

{ TJSWheelEvent }

constructor TJSWheelEvent.new(atype: String; aInit: TJSWheelEventInit);
begin

end;

constructor TJSWheelEvent.new(atype: String);
begin

end;

{ TJSKeyboardEvent }

function TJSKeyboardEvent.getModifierState(aKey: string): Boolean;
begin
  Result := False;
end;

{ TJSMutationObserver }

procedure TJSMutationObserver.disconnect;
begin

end;

constructor TJSMutationObserver.new(mutationCallback: TJSMutationCallback);
begin

end;

procedure TJSMutationObserver.observe(target: TJSNode);
begin

end;

procedure TJSMutationObserver.observe(target: TJSNode;
  options: TJSMutationObserverInit);
begin

end;

procedure TJSMutationObserver.observe(target: TJSNode; options: TJSObject);
begin

end;

function TJSMutationObserver.takeRecords: TJSMutationRecordArray;
begin
  Result := nil;
end;

{ TJSWebSocket }

procedure TJSWebSocket.close;
begin

end;

procedure TJSWebSocket.close(code: Cardinal);
begin

end;

procedure TJSWebSocket.close(code: Cardinal; reason: String);
begin

end;

constructor TJSWebSocket.new(url: String; protocols: array of String);
begin

end;

constructor TJSWebSocket.new(url, protocol: String);
begin

end;

constructor TJSWebSocket.new(url: String);
begin

end;

procedure TJSWebSocket.send(data: String);
begin

end;

procedure TJSWebSocket.send(data: TJSTypedArray);
begin

end;

procedure TJSWebSocket.send(data: TJSArrayBuffer);
begin

end;

procedure TJSWebSocket.send(data: TJSBlob);
begin

end;

{ TJSHTMLAudioTrackList }

function TJSHTMLAudioTrackList.getitem(aIndex: nativeInt): TJSHTMLAudioTrack;
begin
  Result := nil;
end;

{ TJSHTMLVideoTrackList }

function TJSHTMLVideoTrackList.getitem(aIndex: nativeInt): TJSHTMLVideoTrack;
begin
  Result := nil;
end;

{ TJSHTMLTextTrackList }

function TJSHTMLTextTrackList.getitem(aIndex: nativeInt): TJSHTMLTextTrack;
begin
  Result := nil;
end;

{ TJSHTMLMediaElement }

function TJSHTMLMediaElement.canPlayType(aType: String): String;
begin
  Result := '';
end;

function TJSHTMLMediaElement.captureStream: TJSHTMLMediaStream;
begin
  Result := nil;
end;

procedure TJSHTMLMediaElement.load;
begin

end;

procedure TJSHTMLMediaElement.pause;
begin

end;

procedure TJSHTMLMediaElement.play;
begin

end;

{ TJSFormData }

procedure TJSFormData.append(const aName, aValue: String);
begin

end;

procedure TJSFormData.append(const aName: String; aBlob: TJSBlob);
begin

end;

procedure TJSFormData.delete(const aName: String);
begin

end;

function TJSFormData.entries: TJSFormDataEntryValueArray;
begin
  Result := nil;
end;

function TJSFormData.get(const aName: String): TJSFormDataEntryValue;
begin
  Result := '';
end;

function TJSFormData.getAll(const aName: String): TJSFormDataEntryValueArray;
begin
  Result := nil;
end;

function TJSFormData.has(const aName: String): Boolean;
begin
  Result := False;
end;

function TJSFormData.keys: TStringDynArray;
begin
  Result := nil;
end;

constructor TJSFormData.new;
begin

end;

constructor TJSFormData.new(aForm: TJSHTMLElement);
begin

end;

procedure TJSFormData.set_(const aName: String; aBlob: TJSBlob);
begin

end;

procedure TJSFormData.set_(const aName, aValue: String);
begin

end;

function TJSFormData.values: TJSValueDynArray;
begin
  Result := nil;
end;
{$ENDIF}
end.
