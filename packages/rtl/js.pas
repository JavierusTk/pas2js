{
    This file is part of the Pas2JS run time library.
    Copyright (c) 2017-2020 by the Pas2JS development team.

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}
unit JS;

{$IFDEF PAS2JS}
{$modeswitch externalclass}
{$ENDIF}

interface

uses
  Types{$IFDEF DCC}, System.SysUtils{$ENDIF};

type
  // We cannot use EConvertError or Exception, this would result in a circular dependency.

  { EJS }

  EJS = class(TObject)
  private
    FMessage: string;
  Public
    constructor Create(const Msg: String); reintroduce;
    property Message : string Read FMessage Write FMessage;
  end;

  TJSObjectPropertyDescriptor = JSValue;
  Float32 = Double;
  Float64 = Double;

  { TJSObject }

  TJSObject = class {$IFDEF PAS2JS} external name 'Object' {$ENDIF}
  private
    function GetProperties(Name: String): JSValue; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure SetProperties(Name: String; const AValue: JSValue); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  public
    constructor new;
    class function create(const proto: TJSObject): TJSObject; overload;
    class function create(const proto, propertiesObject: TJSObject): TJSObject; overload;
    class function assign(const Target, Source1: TJSObject): TJSObject; {$IFDEF PAS2JS} varargs; {$ENDIF}
    class procedure defineProperty(const obj: TJSObject; propname: String; const descriptor: TJSObjectPropertyDescriptor);
    //class procedure defineProperties
    class function freeze(const obj: TJSObject): TJSObject;
    class function getOwnPropertyDescriptor(const obj: TJSObject; propname: String): TJSObjectPropertyDescriptor;
    //class function getOwnPropertyDescriptors
    class function getOwnPropertyNames(const obj: TJSObject): TStringDynArray;
    class function values(const obj: JSValue): TJSObject;
    {$IFDEF FIREFOX}
    class function getOwnPropertySymbols(const obj: TJSObject): TJSValueDynArray;
    {$ENDIF}
    class function getPrototypeOf(const obj: TJSObject): TJSObject;
    {$IFDEF FIREFOX}
    class function _is(const value1, value2: JSValue): boolean;
    {$ENDIF}
    class function isExtensible(const obj: TJSObject): boolean;
    class function isFrozen(const obj: TJSObject): boolean;
    class function isSealed(const obj: TJSObject): boolean;
    class function keys(const obj: TJSObject): TStringDynArray;
    class function preventExtensions(const obj: TJSObject): TJSObject;
    class function seal(const obj: TJSObject): TJSObject;
    class function setPrototypeOf(const obj, prototype: TJSObject): TJSObject;
    function hasOwnProperty(prop: String): boolean;
    function isPrototypeOf(const obj: TJSObject): boolean;
    function propertyIsEnumerable(propname: String): boolean;
    function toLocaleString: String;
    function toString: String;
    function valueOf: JSValue;
    property Properties[Name: String]: JSValue read GetProperties write SetProperties; default;
  end;

  TJSObjectDynArray = Array of TJSObject;
  TJSObjectDynArrayArray = Array of TJSObjectDynArray;
  TJSStringDynArray = Array of String;


  { TJSIteratorValue }
  TJSIteratorValue = class {$IFDEF PAS2JS} external name 'IteratorValue' {$ENDIF}
  public
    value : JSValue; {$IFDEF PAS2JS} external name 'value';{$ENDIF}
    done : boolean; {$IFDEF PAS2JS} external name 'done';{$ENDIF}
  end;

  { TJSIterator }
  TJSIterator = class {$IFDEF PAS2JS} external name 'Iterator'{$ENDIF}
  Public
    function next: TJSIteratorValue;
  end;


  TJSSet = class;

  TJSSetEventProc = reference to procedure(value : JSValue; key: NativeInt; set_: TJSSet);
  TJSSetProcCallBack = reference  to procedure(value: JSValue; key: JSValue);

   { TJSSet }
  TJSSet = class {$IFDEF PAS2JS} external name 'Set'{$ENDIF}
  private
    FSize : NativeInt; {$IFDEF PAS2JS} external name 'size'; {$ENDIF}
  public
    constructor new; overload;
    constructor new(aElement1 : JSValue);{$IFDEF PAS2JS} varargs; {$ENDIF} overload;
    function add(value: JSValue): TJSSet;
    function has(value: JSValue): Boolean;
    function delete(value: JSValue): Boolean;
    procedure clear;
    function values: TJSIterator;
    procedure forEach(const aCallBack: TJSSetEventProc); overload;
    procedure forEach(const aCallBack: TJSSetProcCallBack); overload;
    procedure forEach(const aCallBack: TJSSetEventProc; thisArg: JSValue); overload;
    function entries: TJSIterator;
    function keys: TJSIterator;
    Property size : NativeInt Read FSize;
  end;

  TJSMapFunctionCallBack = reference  to function(arg : JSValue): JSValue;
  TJSMapProcCallBack = reference  to procedure(value: JSValue; key: JSValue);

  { TJSMap }
  TJSMap = class {$IFDEF PAS2JS} external name 'Map'{$ENDIF}
  Private
    FSize : NativeInt; {$IFDEF PAS2JS} external name 'size';{$ENDIF}
  public
    constructor new;{$IFDEF PAS2JS} varargs; {$ENDIF} overload;
    constructor new(aElement1 : JSValue);{$IFDEF PAS2JS} varargs; {$ENDIF} overload;
    function &set(key: JSValue; value: JSValue) :TJSMap;
    function get(key : JSValue): JSValue;
    function has(key: JSValue): Boolean;
    function delete(key: JSValue): Boolean;
    procedure clear;
    function entries: TJSIterator;
    procedure forEach(const aCallBack: TJSMapFunctionCallBack); overload;
    procedure forEach(const aCallBack: TJSMapFunctionCallBack; thisArg: JSValue); overload;
    procedure forEach(const aCallBack: TJSMapProcCallBack); overload;
    function keys: TJSIterator;
    function values: TJSIterator;
    property size : NativeInt Read FSize;
  end;

  { TJSFunction }

  TJSFunction = class {$IFDEF PAS2JS} external name 'Function'(TJSObject){$ENDIF}
  private
    Flength: NativeInt; {$IFDEF PAS2JS}  external name 'length';{$ENDIF}
    Fprototyp: TJSFunction; {$IFDEF PAS2JS} external name 'prototyp';{$ENDIF}
  public
    name: String;
    property prototyp: TJSFunction read Fprototyp;
    property length: NativeInt read Flength;
    function apply(thisArg: TJSObject; const ArgArray: TJSValueDynArray): JSValue;{$IFDEF PAS2JS} varargs; {$ENDIF}
    function bind(thisArg: TJSObject): JSValue;{$IFDEF PAS2JS} varargs; {$ENDIF}
    function call(thisArg: TJSObject): JSValue;{$IFDEF PAS2JS} varargs; {$ENDIF}
  end;

  { TJSDate - wrapper for JavaScript Date }

  TJSDate = class {$IFDEF PAS2JS} external name 'Date'(TJSFunction){$ENDIF}
  private
    function getDate: NativeInt;
    function getFullYear: NativeInt;
    function getHours: NativeInt;
    function getMilliseconds: NativeInt;
    function getMinutes: NativeInt;
    function getMonth: NativeInt;
    function getSeconds: NativeInt;
    function getYear: NativeInt;
    function getTime: NativeInt;
    function getUTCDate: NativeInt;
    function getUTCFullYear: NativeInt;
    function getUTCHours: NativeInt;
    function getUTCMilliseconds: NativeInt;
    function getUTCMinutes: NativeInt;
    function getUTCMonth: NativeInt;
    function getUTCSeconds: NativeInt;
    procedure setDate(const AValue: NativeInt);
    procedure setFullYear(const AValue: NativeInt);
    procedure setHours(const AValue: NativeInt);
    procedure setMilliseconds(const AValue: NativeInt);
    procedure setMinutes(const AValue: NativeInt);
    procedure setMonth(const AValue: NativeInt);
    procedure setSeconds(const AValue: NativeInt);
    procedure setYear(const AValue: NativeInt);
    procedure setTime(const AValue: NativeInt);
    procedure setUTCDate(const AValue: NativeInt);
    procedure setUTCFullYear(const AValue: NativeInt);
    procedure setUTCHours(const AValue: NativeInt);
    procedure setUTCMilliseconds(const AValue: NativeInt);
    procedure setUTCMinutes(const AValue: NativeInt);
    procedure setUTCMonth(const AValue: NativeInt);
    procedure setUTCSeconds(const AValue: NativeInt);
  public
    constructor New; reintroduce;  overload;
    constructor New(const MilliSecsSince1970: NativeInt); overload;
    constructor New(const aDateString: String); overload;
    constructor New(aYear: NativeInt; aMonth: NativeInt; aDayOfMonth: NativeInt = 1;
                    TheHours: NativeInt = 0; TheMinutes: NativeInt = 0;
                    TheSeconds: NativeInt = 0; TheMilliseconds: NativeInt = 0);  overload;
    class function now: NativeInt; // current date and time in milliseconds since 1 January 1970 00:00:00 UTC, with leap seconds ignored
    class function parse(const aDateString: string): NativeInt; // format depends on browser
    class function UTC(aYear: NativeInt; aMonth: NativeInt = 0; aDayOfMonth: NativeInt = 1;
      TheHours: NativeInt = 0; TheMinutes: NativeInt = 0; TheSeconds: NativeInt = 0;
      TheMilliseconds: NativeInt = 0): NativeInt;
    function getDay: NativeInt;
    function getTimezoneOffset: NativeInt;
    function getUTCDay: NativeInt; // day of the week
    function toDateString: string; // human readable date, without time
    function toISOString: string; // ISO 8601 Extended Format
    function toJSON: string;
    function toGMTString: string; // in GMT timezone
    function toLocaleDateString: string; // date in locale timezone, no time
    function toLocaleString: string; reintroduce; // date and time in locale timezone
    function toLocaleTimeString: string; // time in locale timezone, no date
    function toTimeString: string; // time human readable, no date
    function toUTCString: string; // date and time using UTC timezone
    property Year: NativeInt read getYear write setYear;
    property Time: NativeInt read getTime write setTime; // milliseconds since 1 January 1970 00:00:00 UTC, with leap seconds ignored
    property FullYear: NativeInt read getFullYear write setFullYear;
    property UTCDate: NativeInt read getUTCDate write setUTCDate; // day of month
    property UTCFullYear: NativeInt read getUTCFullYear write setUTCFullYear;
    property UTCHours: NativeInt read getUTCHours write setUTCHours;
    property UTCMilliseconds: NativeInt read getUTCMilliseconds write setUTCMilliseconds;
    property UTCMinutes: NativeInt read getUTCMinutes write setUTCMinutes;
    property UTCMonth: NativeInt read getUTCMonth write setUTCMonth;
    property UTCSeconds: NativeInt read getUTCSeconds write setUTCSeconds;
    property Month: NativeInt read getMonth write setMonth;
    property Date: NativeInt read getDate write setDate; // day of the month, starting at 1
    property Hours: NativeInt read getHours write setHours;
    property Minutes: NativeInt read getMinutes write setMinutes;
    property Seconds: NativeInt read getSeconds write setSeconds;
    property Milliseconds: NativeInt read getMilliseconds write setMilliseconds;
  end;

  TLocaleCompareOptions = record
    localematched : string;
    usage: string;
    sensitivity : string;
    ignorePunctuation : Boolean;
    numeric : boolean;
    caseFirst : string;
  end;

  TJSRegexp = class {$IFDEF PAS2JS} external name 'RegExp'{$ENDIF}
  private
  {$IFDEF FIREFOX}
    // not on all browsers:
    FFlags : string; {$IFDEF PAS2JS} external name 'flags';{$ENDIF}
    FSticky : boolean; {$IFDEF PAS2JS} external name 'sticky';{$ENDIF}
  {$endif}
    fglobal: boolean; {$IFDEF PAS2JS} external name 'global';{$ENDIF}
    fignoreCase : boolean; {$IFDEF PAS2JS} external name 'ignoreCase';{$ENDIF}
    fmultiline : boolean; {$IFDEF PAS2JS} external name 'multiline';{$ENDIF}
    fsource : string; {$IFDEF PAS2JS} external name 'source';{$ENDIF}
    funicode : boolean; {$IFDEF PAS2JS} external name 'unicode';{$ENDIF}
  public
    lastIndex: NativeInt;
    Constructor New(Pattern : string); overload;
    Constructor New(Pattern, Flags : string); overload;
    function exec(aString : string): TStringDynArray;
    function test(aString : string) : boolean;
    function toString : String;
    property Global : boolean read fglobal;
    property IgnoreCase : Boolean read FIgnoreCase;
    property Multiline : Boolean Read FMultiLine;
    Property Source : string Read FSource;
    Property Unicode : boolean Read FUnicode;
    {$IFDEF FIREFOX}
    // not on all browsers:
    property Flags : string read FFlags;
    property Sticky : boolean read FSticky;
    {$endif}
  end;


  TReplaceCallBack = reference to Function (Const match : string) : string;{$IFDEF PAS2JS} varargs; {$ENDIF}
  TReplaceCallBack0 = reference to Function (Const match : string; offset : Integer; AString : String) : string;
  TReplaceCallBack1 = reference to Function (Const match,p1 : string; offset : Integer; AString : String) : string;
  TReplaceCallBack2 = reference to Function (Const match,p1,p2 : string; offset : Integer; AString : String) : string;

  TJSString = class {$IFDEF PAS2JS} external name 'String'{$ENDIF}
  private
    flength : NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
  public 
    constructor New(Const S : String); overload;
    constructor New(Const I : NativeInt); overload;
    constructor New(Const D : double); overload;
    property length : NativeInt read flength; 
    class function fromCharCode() : string;{$IFDEF PAS2JS} varargs; {$ENDIF}
    class function fromCodePoint() : string;{$IFDEF PAS2JS} varargs; {$ENDIF}
    function anchor(const aName : string) : string;
    function charAt(aIndex : NativeInt) : string;
    function charCodeAt(aIndex : NativeInt) : NativeInt;
    function codePointAt(aIndex : NativeInt) : NativeInt;
    function concat(s : string) : string;{$IFDEF PAS2JS} varargs; {$ENDIF}
    function endsWith(aSearchString : string) : boolean; overload;
    function endsWith(aSearchString : string; Pos : NativeInt) : boolean; overload;
    function includes(aSearchString : string; Pos : NativeInt = 0) : boolean;
    function indexOf(aSearchString : String; Pos : NativeInt = 0) : Integer;
    function lastIndexOf(aSearchString : String) : NativeInt;overload;
    function lastIndexOf(aSearchString : String; Pos : NativeInt) : Integer;overload;
    function link(aUrl : string) : String;
    function localeCompare(aCompareString : string) : NativeInt; overload;
    function localeCompare(aCompareString : string; aLocales: string) : integer; overload;
    function localeCompare(compareString : string; locales: string; Options : TlocaleCompareOptions) : integer; overload;
    function match(aRegexp : TJSRegexp) : TStringDynArray; overload;
    function match(aRegexp : String) : TStringDynArray;overload;
    {$IFDEF ECMAScript6}
    function normalize : string;
    function normalize(aForm : string) : string;
    {$ENDIF}
    function _repeat(aCount : NativeInt) : Integer; {$IFDEF PAS2JS} external name 'repeat';{$ENDIF}
    function replace(aRegexp : String; NewString : String) : String; overload;
    function replace(aRegexp : TJSRegexp; NewString : String) : String; overload;
    function replace(Regexp : String; aCallback : TReplaceCallBack) : String; overload;
    function replace(Regexp : TJSRegexp; aCallback : TReplaceCallBack) : String; overload;
    function replace(Regexp : String; aCallback : TReplaceCallBack0) : String; overload;
    function replace(Regexp : TJSRegexp; aCallback : TReplaceCallBack0) : String; overload;
    function replace(Regexp : String; aCallback : TReplaceCallBack1) : String; overload;
    function replace(Regexp : TJSRegexp; aCallback : TReplaceCallBack1) : String; overload;
    function replace(Regexp : String; aCallback : TReplaceCallBack2) : String; overload;
    function replace(Regexp : TJSRegexp; aCallback : TReplaceCallBack2) : String; overload;
    function search(Regexp : TJSRegexp) : NativeInt; overload;
    function search(Regexp : JSValue) : NativeInt; overload;
    function slice(aBeginIndex : NativeInt) : String; overload;
    function slice(aBeginIndex, aEndIndex : NativeInt) : String; overload;
    function split : TStringDynArray; overload;
    function split(aRegexp : TJSRegexp) : TStringDynArray; overload;
    function split(aSeparator : string) : TStringDynArray; overload;
    function split(aSeparator : string; aLimit : NativeInt) : TStringDynArray; overload;
    function split(aSeparator : array of string) : TStringDynArray; overload;
    function split(aSeparator : array of string; aLimit : NativeInt) : TStringDynArray; overload;
    function startsWith(aSearchString : String) : Boolean; overload;
    function startsWith(aSearchString : String; aPosition : NativeInt) : Boolean; overload;
    function substr(aStartIndex : NativeInt) : String; overload;
    function substr(aStartIndex,aLength : NativeInt) : String; overload;
    function substring(aStartIndex : NativeInt) : String; overload;
    function substring(aStartIndex,aEndIndex : NativeInt) : String; overload;
    function toLocaleLowerCase : String;
    function toLocaleUpperCase : String;
    function toLowerCase : String;
    function toString : string;
    function toUpperCase : String;
    function trim : string;
    function valueOf : string;
  end;

  TJSArray = Class;
  
  TJSArrayEventProc = reference to procedure(element : JSValue; index: NativeInt; anArray : TJSArray);
  TJSArrayEvent = reference to function (element : JSValue; index: NativeInt; anArray : TJSArray) : Boolean;
  TJSArrayMapEvent = reference to function (element : JSValue; index: NativeInt; anArray : TJSArray) : JSValue;
  TJSArrayReduceEvent = reference to function (accumulator, currentValue : JSValue; currentIndex : NativeInt; anArray : TJSArray) : JSValue;
  TJSArrayCompareEvent = reference to function (a,b : JSValue) : NativeInt;
  TJSArrayCallback = TJSArrayEvent;
  TJSArrayMapCallback = TJSArrayMapEvent;
  TJSArrayReduceCallBack = TJSArrayReduceEvent;
  TJSArrayCompareCallBack = TJSArrayCompareEvent;

  { TJSArray }

  TJSArray = class {$IFDEF PAS2JS} external name 'Array'{$ENDIF}
  private
    function GetElements(Index: NativeInt): JSValue; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure SetElements(Index: NativeInt; const AValue: JSValue); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  public
    FLength : NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
    constructor new; overload;
    constructor new(aLength : NativeInt); overload;
    constructor new(aElement1 : JSValue);{$IFDEF PAS2JS} varargs; {$ENDIF} overload;
    class function _of() : TJSArray;{$IFDEF PAS2JS} varargs; external name 'of';{$ENDIF}
    class function isArray(a: JSValue) : Boolean;
{$IFDEF JAVASCRIPT2015}    
    class function from(a : JSValue) : TJSArray;
    class function from(arrayLike : JSValue; mapFunction : TJSMapFunctionCallBack): TJSArray; overload;
    class function from(arrayLike : JSValue; mapFunction : TJSMapFunctionCallBack; thisArg : JSValue): TJSArray; overload;
{$ENDIF}
    function concat(el : JSValue) : TJSArray;{$IFDEF PAS2JS} varargs; {$ENDIF}
    function copyWithin(aTarget : NativeInt) : TJSarray;overload; // not in IE
    function copyWithin(aTarget, aStart : NativeInt) : TJSarray;overload; // not in IE
    function copyWithin(aTarget, aStart, aEnd : NativeInt) : TJSarray;overload; // not in IE
    function entries: TJSIterator;
    Function every(const aCallback : TJSArrayCallBack) : boolean;overload;
    Function every(const aCallback : TJSArrayEvent; aThis : TObject) : boolean;overload;
    Function filter(const aCallBack : TJSArrayCallBack) : TJSArray; overload;
    Function filter(const aCallBack : TJSArrayEvent; aThis : TObject) : TJSArray;overload;
    Function fill(aValue : JSValue) : TJSArray; overload;
    Function fill(aValue : JSValue; aStartIndex : NativeInt) : TJSArray; overload;
    Function fill(aValue : JSValue; aStartIndex,aEndIndex : NativeInt) : TJSArray; overload;
    Function find(const aCallBack : TJSArrayCallBack) : JSValue; overload;
    Function find(const aCallBack : TJSArrayEvent; aThis : TObject) : JSValue; overload;
    Function findIndex(const aCallBack : TJSArrayCallBack) : NativeInt; overload;
    Function findIndex(const aCallBack : TJSArrayEvent; aThis : TObject) : NativeInt; overload;
    procedure forEach(const aCallBack : TJSArrayEventProc); overload;
    procedure forEach(const aCallBack : TJSArrayEvent); overload;
    procedure forEach(const aCallBack : TJSArrayEvent; aThis : TObject); overload;
    function includes(aElement : JSValue) : Boolean; overload;
    function includes(aElement : JSValue; FromIndex : NativeInt) : Boolean; overload;
    function indexOf(aElement : JSValue) : NativeInt; overload;
    function indexOf(aElement : JSValue; FromIndex : NativeInt) : NativeInt; overload;
    function join : String; overload;
    function join (aSeparator : string) : String; overload;
    function keys: TJSIterator;
    function lastIndexOf(aElement : JSValue) : NativeInt; overload;
    function lastIndexOf(aElement : JSValue; FromIndex : NativeInt) : NativeInt; overload;
//    Function map(const aCallBack : TJSArrayMapEventArray) : JSValue; overload;
    Function map(const aCallBack : TJSArrayMapCallBack) : TJSArray; overload;
    Function map(const aCallBack : TJSArrayMapEvent; aThis : TObject) : TJSArray; overload;
    function pop : JSValue; 
    function push(aElement : JSValue) : NativeInt;{$IFDEF PAS2JS} varargs; {$ENDIF}
    function reduce(const aCallBack : TJSArrayReduceCallBack) : JSValue; overload;
    function reduce(const aCallBack : TJSArrayReduceCallBack; initialValue : JSValue) : JSValue; overload;
    function reduceRight(const aCallBack : TJSArrayReduceCallBack) : JSValue; overload;
    function reduceRight(const aCallBack : TJSArrayReduceCallBack; initialValue : JSValue) : JSValue; overload;
    Function reverse : TJSArray;
    Function shift : JSValue;
    Function slice : TJSArray; overload;
    function slice(aBegin : NativeInt) : TJSArray; overload;
    function slice(aBegin,aEnd : NativeInt) : TJSArray; overload;
    Function some(const aCallback : TJSArrayCallBack) : boolean; overload;
    Function some(const aCallback : TJSArrayEvent; aThis : TObject) : boolean; overload;
    Function sort(const aCallback : TJSArrayCompareCallBack) : TJSArray; overload;
    Function sort() : TJSArray; overload;
    function splice(aStart : NativeInt) : TJSArray; overload;
    function splice(aStart,aDeleteCount : NativeInt) : TJSArray;{$IFDEF PAS2JS} varargs; {$ENDIF} overload;
    function toLocaleString: String; overload;
    function toLocaleString(locales : string) : String; overload;
    function toLocaleString(locales : string; const Options : TLocaleCompareOptions) : String; overload;
    function toString : String;
    function unshift : NativeInt;{$IFDEF PAS2JS} varargs; {$ENDIF}
    function values: TJSIterator;
    Property Length : NativeInt Read FLength Write FLength;
    property Elements[Index: NativeInt]: JSValue read GetElements write SetElements; default;
  end;

  TJSArrayBuffer = class {$IFDEF PAS2JS} external name 'ArrayBuffer' (TJSObject){$ENDIF}
  private
    fLength : NativeInt; {$IFDEF PAS2JS} external name 'byteLength';{$ENDIF}
  public
    constructor new(aByteLength : NativeInt);
    class function isView(aValue : JSValue) : Boolean;   
    function slice(aBegin : NativeInt) : TJSArrayBuffer; overload;
    function slice(aBegin,aEnd : NativeInt) : TJSArrayBuffer; overload;
    Property byteLength : NativeInt Read fLength;
  end;

  TJSBufferSource = class {$IFDEF PAS2JS} external name 'BufferSource'{$ENDIF}
  end;

  { TJSTypedArray }
  TJSTypedArray = Class;

  TJSTypedArrayCallBack = function (element : JSValue; index: NativeInt; anArray : TJSTypedArray) : Boolean;
  TJSTypedArrayEvent = function (element : JSValue; index: NativeInt; anArray : TJSTypedArray) : Boolean of object;
  TJSTypedArrayMapCallBack = function (element : JSValue; index: NativeInt; anArray : TJSTypedArray) : JSValue;
  TJSTypedArrayMapEvent = function (element : JSValue; index: NativeInt; anArray : TJSTypedArray) : JSValue of object;
  TJSTypedArrayReduceCallBack = function (accumulator, currentValue : JSValue; currentIndex : NativeInt; anArray : TJSTypedArray) : JSValue;
  TJSTypedArrayCompareCallBack = function (a,b : JSValue) : NativeInt;

  TJSTypedArray = class {$IFDEF PAS2JS} external name 'TypedArray' (TJSBufferSource){$ENDIF}
  Private
    FBuffer: TJSArrayBuffer; {$IFDEF PAS2JS} external name 'buffer';{$ENDIF}
    FByteLength: NativeInt; {$IFDEF PAS2JS} external name 'byteLength'; {$ENDIF}
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length'; {$ENDIF}
    FByteOffset: NativeInt; {$IFDEF PAS2JS} external name 'byteOffset';{$ENDIF}
    FBytesPerElement : NativeInt; {$IFDEF PAS2JS} external name 'BYTES_PER_ELEMENT';{$ENDIF}
    function getValue(Index : NativeInt) : JSValue; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure setValue(Index : NativeInt;AValue : JSValue); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  Public
    property BYTES_PER_ELEMENT : NativeInt Read FBytesPerElement;
    class var name : string;
    class function _of(aValue : jsValue) : TJSTypedArray;{$IFDEF PAS2JS} varargs; external name 'of';{$ENDIF}
    function copyWithin(aTarget : NativeInt) : TJSTypedArray;overload;
    function copyWithin(aTarget, aStart : NativeInt) : TJSTypedArray;overload;
    function copyWithin(aTarget, aStart, aEnd : NativeInt) : TJSTypedArray;overload;
    Function every(const aCallback : TJSTypedArrayCallBack) : boolean;overload;
    Function every(const aCallback : TJSTypedArrayEvent; aThis : TObject) : boolean;overload;
    Function fill(aValue : JSValue) : TJSTypedArray; overload;
    Function fill(aValue : JSValue; aStartIndex : NativeInt) : TJSTypedArray; overload;
    Function fill(aValue : JSValue; aStartIndex,aEndIndex : NativeInt) : TJSTypedArray; overload;
    Function filter(const aCallBack : TJSTypedArrayCallBack) : TJSTypedArray; overload;
    Function filter(const aCallBack : TJSTypedArrayEvent; aThis : TObject) : TJSTypedArray;overload;
    Function find(const aCallBack : TJSTypedArrayCallBack) : JSValue; overload;
    Function find(const aCallBack : TJSTypedArrayEvent; aThis : TObject) : JSValue; overload;
    Function findIndex(const aCallBack : TJSTypedArrayCallBack) : NativeInt; overload;
    Function findIndex(const aCallBack : TJSTypedArrayEvent; aThis : TObject) : NativeInt; overload;
    procedure forEach(const aCallBack : TJSTypedArrayCallBack); overload;
    procedure forEach(const aCallBack : TJSTypedArrayEvent; aThis : TObject); overload;
    function includes(aElement : JSValue) : Boolean; overload;
    function includes(aElement : JSValue; FromIndex : NativeInt) : Boolean; overload;
    function indexOf(aElement : JSValue) : NativeInt; overload;
    function indexOf(aElement : JSValue; FromIndex : NativeInt) : NativeInt; overload;
    function join : String; overload;
    function join (aSeparator : string) : String; overload;
    function lastIndexOf(aElement : JSValue) : NativeInt; overload;
    function lastIndexOf(aElement : JSValue; FromIndex : NativeInt) : NativeInt; overload;
    Function map(const aCallBack : TJSTypedArrayCallBack) : TJSTypedArray; overload;
    Function map(const aCallBack : TJSTypedArrayEvent; aThis : TObject) : TJSTypedArray; overload;
    function reduce(const aCallBack : TJSTypedArrayReduceCallBack) : JSValue; overload;
    function reduce(const aCallBack : TJSTypedArrayReduceCallBack; initialValue : JSValue) : JSValue; overload;
    function reduceRight(const aCallBack : TJSTypedArrayReduceCallBack) : JSValue; overload;
    function reduceRight(const aCallBack : TJSTypedArrayReduceCallBack; initialValue : JSValue) : JSValue; overload;
    Function reverse : TJSTypedArray;
    procedure _set(anArray : TJSArray); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    procedure _set(anArray : TJSArray; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    procedure _set(anArray : TJSTypedArray); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    procedure _set(anArray : TJSTypedArray; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    Function slice : TJSTypedArray; overload;
    function slice(aBegin : NativeInt) : TJSTypedArray; overload;
    function slice(aBegin,aEnd : NativeInt) : TJSTypedArray; overload;
    Function some(const aCallback : TJSTypedArrayCallBack) : boolean; overload;
    Function some(const aCallback : TJSTypedArrayEvent; aThis : TObject) : boolean; overload;
    Function sort(const aCallback : TJSTypedArrayCompareCallBack) : TJSTypedArray; overload;
    Function sort() : TJSTypedArray; overload;
    function splice(aStart : NativeInt) : TJSTypedArray; overload;
    function splice(aStart,aDeleteCount : NativeInt) : TJSTypedArray;{$IFDEF PAS2JS} varargs; {$ENDIF} overload;
    function toLocaleString: String; overload;
    function toLocaleString(locales : string) : String; overload;
    function toLocaleString(locales : string; const Options : TLocaleCompareOptions) : String; overload;
    function toString : String;
    function unshift : NativeInt;{$IFDEF PAS2JS} varargs; {$ENDIF}
    property buffer : TJSArrayBuffer read FBuffer;
    property byteLength : NativeInt Read FByteLength;
    property byteOffset : NativeInt Read FByteOffset;
    property length : NativeInt Read FLength;
    property values[Index : NativeInt] : JSValue Read getValue Write SetValue; default;
  end;

  { TJSInt8Array }

  TJSInt8Array = class {$IFDEF PAS2JS} external name 'Int8Array' (TJSTypedArray){$ENDIF}
  private
    function getTypedValue(Index : NativeInt): Shortint; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure setTypedValue(Index : NativeInt; AValue: Shortint); {$IFDEF PAS2JS}external name '[]';{$ENDIF}
  public
{$IFDEF JAVASCRIPT2017}
    constructor new; // new in ES2017
{$ENDIF}
    constructor new (length : NativeInt); overload;
    constructor new (atypedArray : TJSTypedArray); overload;
    constructor new (aObject : TJSObject); overload;
    constructor new (buffer : TJSArrayBuffer); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset: NativeInt); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset, aLength: NativeInt); overload;
    class function from(aValue : jsValue) : TJSInt8Array; reintroduce; overload;
    class function from(aValue : jsValue; Map : TJSTypedArrayMapCallBack) : TJSInt8Array; reintroduce; overload;
    class function from(aValue : jsValue; aMap : TJSTypedArrayMapEvent) : TJSInt8Array; reintroduce; overload;
    class function _of(aValue : jsValue) : TJSInt8Array;{$IFDEF PAS2JS} varargs; external name 'of';{$ENDIF} reintroduce; overload;
    class function _of(aValue : TJSValueDynArray) : TJSInt8Array;{$IFDEF PAS2JS} varargs; external name 'of';{$ENDIF} reintroduce; overload;
    function subarray(aBegin, aEnd: Integer): TJSInt8Array;  overload;
    function subarray(aBegin: Integer): TJSInt8Array; overload;
    procedure _set(anArray : Array of ShortInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of ShortInt; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    property values[Index : NativeInt] : Shortint Read getTypedValue Write setTypedValue; default;
  end;

  TJSUint8Array  = class {$IFDEF PAS2JS} external name 'Uint8Array' (TJSTypedArray){$ENDIF}
  private
    function getTypedValue(Index : NativeInt): Byte; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure setTypedValue(Index : NativeInt; AValue: Byte); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  public
    constructor new (length : NativeInt); overload;
    constructor new (atypedArray : TJSTypedArray); overload;
    constructor new (aObject : TJSObject); overload;
    constructor new (buffer : TJSArrayBuffer); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset: NativeInt); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset, aLength: NativeInt); overload;
    class function from(aValue : jsValue) : TJSUInt8Array; reintroduce; overload;
    class function from(aValue : jsValue; Map : TJSTypedArrayMapCallBack) : TJSUInt8Array; reintroduce; overload;
    class function from(aValue : jsValue; aMap : TJSTypedArrayMapEvent) : TJSUInt8Array; reintroduce; overload;
    class function _of(aValue : jsValue) : TJSUInt8Array;{$IFDEF PAS2JS} varargs; external name 'of';{$ENDIF} reintroduce; overload;
    function subarray(aBegin, aEnd: Integer): TJSUInt8Array;  overload;
    function subarray(aBegin: Integer): TJSUInt8Array; overload;
    procedure _set(anArray : Array of Byte); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of Byte; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    Property values[Index : NativeInt] : Byte Read getTypedValue Write setTypedValue; default;
  end;

  TJSUint8ClampedArray  = class {$IFDEF PAS2JS} external name 'Uint8ClampedArray' (TJSTypedArray){$ENDIF}
  private
    function getTypedValue(Index : NativeInt): Byte; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure setTypedValue(Index : NativeInt; AValue: Byte); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  public
    constructor new (length : NativeInt); overload;
    constructor new (atypedArray : TJSTypedArray); overload;
    constructor new (aObject : TJSObject); overload;
    constructor new (buffer : TJSArrayBuffer); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset: NativeInt); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset, aLength: NativeInt); overload;
    class function from(aValue : jsValue) : TJSUInt8ClampedArray; reintroduce; overload;
    class function from(aValue : jsValue; Map : TJSTypedArrayMapCallBack) : TJSUInt8ClampedArray; reintroduce; overload;
    class function from(aValue : jsValue; aMap : TJSTypedArrayMapEvent) : TJSUInt8ClampedArray; reintroduce; overload;
    class function _of(aValue : jsValue) : TJSUInt8ClampedArray;{$IFDEF PAS2JS} varargs; external name 'of';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of Byte); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of Byte; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    function subarray(aBegin, aEnd: Integer): TJSUInt8ClampedArray;  overload;
    function subarray(aBegin: Integer): TJSUInt8ClampedArray; overload;
    Property values[Index : NativeInt] : Byte Read getTypedValue Write setTypedValue; default;
  end;

  TJSInt16Array = class {$IFDEF PAS2JS} external name 'Int16Array' (TJSTypedArray){$ENDIF}
  private
    function getTypedValue(Index : NativeInt): smallint; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure setTypedValue(Index : NativeInt; AValue: Smallint); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  public
    constructor new (length : NativeInt); overload;
    constructor new (atypedArray : TJSTypedArray); overload;
    constructor new (aObject : TJSObject); overload;
    constructor new (buffer : TJSArrayBuffer); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset: NativeInt); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset, aLength: NativeInt); overload;
    class function from(aValue : jsValue) : TJSInt16Array; reintroduce; overload;
    class function from(aValue : jsValue; Map : TJSTypedArrayMapCallBack) : TJSInt16Array; reintroduce; overload;
    class function from(aValue : jsValue; aMap : TJSTypedArrayMapEvent) : TJSInt16Array; reintroduce; overload;
    class function _of(aValue : jsValue) : TJSInt16Array;{$IFDEF PAS2JS} varargs; external name 'of';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of SmallInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of SmallInt; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    function subarray(aBegin, aEnd: Integer): TJSInt16Array;  overload;
    function subarray(aBegin: Integer): TJSInt16Array; overload;
    Property values[Index : NativeInt] : SmallInt Read getTypedValue Write setTypedValue; default;
  end;

  TJSUint16Array = class {$IFDEF PAS2JS} external name 'Uint16Array' (TJSTypedArray){$ENDIF}
  private
    function getTypedValue(Index : NativeInt): Word; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure setTypedValue(Index : NativeInt; AValue: Word); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  public
    constructor new (length : NativeInt); overload;
    constructor new (atypedArray : TJSTypedArray); overload;
    constructor new (aObject : TJSObject); overload;
    constructor new (buffer : TJSArrayBuffer); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset: NativeInt); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset, aLength: NativeInt); overload;
    class function from(aValue : jsValue) : TJSUInt16Array; reintroduce; overload;
    class function from(aValue : jsValue; Map : TJSTypedArrayMapCallBack) : TJSUInt16Array; reintroduce; overload;
    class function from(aValue : jsValue; aMap : TJSTypedArrayMapEvent) : TJSUInt16Array; reintroduce; overload;
    class function _of(aValue : jsValue) : TJSUInt16Array;{$IFDEF PAS2JS} varargs; external name 'of';{$ENDIF} reintroduce;
    procedure _set(anArray : Array of Word); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of Word; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    function subarray(aBegin, aEnd: Integer): TJSUInt16Array;  overload;
    function subarray(aBegin: Integer): TJSUInt16Array; overload;
    Property values[Index : NativeInt] : Word Read getTypedValue Write setTypedValue; default;
  end;

  TJSInt32Array = class {$IFDEF PAS2JS} external name 'Int32Array' (TJSTypedArray){$ENDIF}
  private
    function getTypedValue(Index : NativeInt): longint; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure setTypedValue(Index : NativeInt; AValue: longint); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  public
    constructor new (length : NativeInt); overload;
    constructor new (atypedArray : TJSTypedArray); overload;
    constructor new (aObject : TJSObject); overload;
    constructor new (buffer : TJSArrayBuffer); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset: NativeInt); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset, aLength: NativeInt); overload;
    class function from(aValue : jsValue) : TJSInt32Array; reintroduce; overload;
    class function from(aValue : jsValue; Map : TJSTypedArrayMapCallBack) : TJSInt32Array; reintroduce; overload;
    class function from(aValue : jsValue; aMap : TJSTypedArrayMapEvent) : TJSInt32Array; reintroduce; overload;
    class function _of(aValue : jsValue) : TJSInt32Array;{$IFDEF PAS2JS} varargs; external name 'of';{$ENDIF} reintroduce;
    procedure _set(anArray : Array of LongInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of LongInt; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    function subarray(aBegin, aEnd: Integer): TJSInt32Array;  overload;
    function subarray(aBegin: Integer): TJSInt32Array; overload;
    Property values[Index : NativeInt] : longint Read getTypedValue Write setTypedValue; default;
  end;

  TJSUint32Array = class {$IFDEF PAS2JS} external name 'Uint32Array' (TJSTypedArray){$ENDIF}
  private
    function getTypedValue(Index : NativeInt): LongWord; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure setTypedValue(Index : NativeInt; AValue: LongWord); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  public
    constructor new (length : NativeInt); overload;
    constructor new (atypedArray : TJSTypedArray); overload;
    constructor new (aObject : TJSObject); overload;
    constructor new (buffer : TJSArrayBuffer); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset: NativeInt); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset, aLength: NativeInt); overload;
    class function from(aValue : jsValue) : TJSUInt32Array; reintroduce; overload;
    class function from(aValue : jsValue; Map : TJSTypedArrayMapCallBack) : TJSUInt32Array; reintroduce; overload;
    class function from(aValue : jsValue; aMap : TJSTypedArrayMapEvent) : TJSUInt32Array; reintroduce; overload;
    class function _of(aValue : jsValue) : TJSUInt32Array;{$IFDEF PAS2JS} varargs; external name 'of';{$ENDIF} reintroduce;
    procedure _set(anArray : Array of Cardinal); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of Cardinal; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} overload;
    function subarray(aBegin, aEnd: Integer): TJSUInt32Array;  overload;
    function subarray(aBegin: Integer): TJSUInt32Array; overload;
    Property values[Index : NativeInt] : LongWord Read getTypedValue Write setTypedValue; default;
  end;

  TJSFloat32Array = class {$IFDEF PAS2JS} external name 'Float32Array' (TJSTypedArray){$ENDIF}
  private
    function getTypedValue(Index : NativeInt): Float32; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure setTypedValue(Index : NativeInt; AValue: Float32); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  public
    constructor new (length : NativeInt); overload;
    constructor new (atypedArray : TJSTypedArray); overload;
    constructor new (aObject : TJSObject); overload;
    constructor new (buffer : TJSArrayBuffer); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset: NativeInt); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset, aLength: NativeInt); overload;
    class function from(aValue : jsValue) : TJSFloat32Array; reintroduce; overload;
    class function from(aValue : jsValue; Map : TJSTypedArrayMapCallBack) : TJSFloat32Array; reintroduce; overload;
    class function from(aValue : jsValue; aMap : TJSTypedArrayMapEvent) : TJSFloat32Array; reintroduce; overload;
    class function _of(aValue : jsValue) : TJSFloat32Array;{$IFDEF PAS2JS} varargs; {$ENDIF} reintroduce;
    procedure _set(anArray : Array of Double); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of Double; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    function subarray(aBegin, aEnd: Integer): TJSFloat32Array;  overload;
    function subarray(aBegin: Integer): TJSFloat32Array; overload;
    Property values[Index : NativeInt] : Float32 Read getTypedValue Write setTypedValue; default;
  end;

  TJSFloat64Array = class {$IFDEF PAS2JS} external name 'Float64Array' (TJSTypedArray){$ENDIF}
  private
    function getTypedValue(Index : NativeInt): Float64; {$IFDEF PAS2JS}external name '[]';{$ENDIF}
    procedure setTypedValue(Index : NativeInt; AValue: Float64); {$IFDEF PAS2JS}external name '[]';{$ENDIF}
  public
    constructor new (length : NativeInt); overload;
    constructor new (atypedArray : TJSTypedArray); overload;
    constructor new (aObject : TJSObject); overload;
    constructor new (buffer : TJSArrayBuffer); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset: NativeInt); overload;
    constructor new (buffer : TJSArrayBuffer; aByteOffset, aLength: NativeInt); overload;
    class function from(aValue : jsValue) : TJSFloat64Array; reintroduce; overload;
    class function from(aValue : jsValue; Map : TJSTypedArrayMapCallBack) : TJSFloat64Array; reintroduce; overload;
    class function from(aValue : jsValue; aMap : TJSTypedArrayMapEvent) : TJSFloat64Array; reintroduce; overload;
    class function _of(aValue : jsValue) : TJSFloat64Array;{$IFDEF PAS2JS} varargs; {$ENDIF} reintroduce;
    procedure _set(anArray : Array of Double); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    procedure _set(anArray : Array of Double; anOffset : NativeInt); {$IFDEF PAS2JS} external name 'set';{$ENDIF} reintroduce; overload;
    function subarray(aBegin, aEnd: Integer): TJSFloat64Array;  overload;
    function subarray(aBegin: Integer): TJSFloat64Array; overload;
    Property values[Index : NativeInt] : Float64 Read getTypedValue Write setTypedValue; default;
  end;

  TJSDataView = class {$IFDEF PAS2JS} external name 'DataView' (TJSBufferSource){$ENDIF}
  private
    fBuffer : TJSArrayBuffer; {$IFDEF PAS2JS} external name 'buffer';{$ENDIF}
    fLength : NativeInt; {$IFDEF PAS2JS} external name 'byteLength';{$ENDIF}
    fOffset : NativeInt; {$IFDEF PAS2JS} external name 'byteOffset';{$ENDIF}
  public
    constructor new(aBuffer : TJSArrayBuffer); overload;
    constructor new(aBuffer : TJSArrayBuffer; aOffset : NativeInt); overload;
    constructor new(aBuffer : TJSArrayBuffer; aOffset,aByteLength : NativeInt); overload;
    function getFloat32(aByteOffset : NativeInt) : double; overload;
    function getFloat32(aByteOffset : NativeInt; aLittleEndian: Boolean) : double; overload;
    function getFloat64(aByteOffset : NativeInt) : double; overload;
    function getFloat64(aByteOffset : NativeInt; aLittleEndian: Boolean) : double; overload;
    function getInt8(aByteOffset : NativeInt) : ShortInt; 
    function getInt16(aByteOffset : NativeInt) : SmallInt; overload;
    function getInt16(aByteOffset : NativeInt; aLittleEndian : Boolean) : SmallInt; overload;
    function getInt32(aByteOffset : NativeInt) : Longint; overload;
    function getInt32(aByteOffset : NativeInt; aLittleEndian : Boolean) : Longint; overload;
    function getUint8(aByteOffset : NativeInt) : Byte; overload;
    function getUint16(aByteOffset : NativeInt) : Word; overload;
    function getUint16(aByteOffset : NativeInt; aLittleEndian : Boolean) : Word; overload;
    function getUint32(aByteOffset : NativeInt) : LongWord; overload;
    function getUint32(aByteOffset : NativeInt; aLittleEndian : Boolean) : LongWord; overload;

    procedure setFloat32(aByteOffset : NativeInt; aValue : double); overload;
    procedure setFloat32(aByteOffset : NativeInt; aValue : double; aLittleEndian: Boolean); overload;
    procedure setFloat64(aByteOffset : NativeInt; aValue : double); overload;
    procedure setFloat64(aByteOffset : NativeInt; aValue : double; aLittleEndian: Boolean); overload;
    procedure setInt8(aByteOffset : NativeInt; aValue : ShortInt); 
    procedure setInt16(aByteOffset : NativeInt; aValue : SmallInt); overload;
    procedure setInt16(aByteOffset : NativeInt; aValue : SmallInt; aLittleEndian : Boolean); overload;
    procedure setInt32(aByteOffset : NativeInt; aValue : Longint); overload;
    procedure setInt32(aByteOffset : NativeInt; aValue : Longint; aLittleEndian : Boolean); overload;
    procedure setUint8(aByteOffset : NativeInt; aValue : Byte); overload;
    procedure setUint16(aByteOffset : NativeInt; aValue : Word); overload;
    procedure setUint16(aByteOffset : NativeInt; aValue : Word; aLittleEndian : Boolean); overload;
    procedure setUint32(aByteOffset : NativeInt; aValue : LongWord); overload;
    procedure setUint32(aByteOffset : NativeInt; aValue: LongWord; aLittleEndian : Boolean); overload;
    Property byteLength : NativeInt Read fLength;
    Property byteOffset : NativeInt read fOffset;
    property buffer : TJSArrayBuffer Read fBuffer;
  end;

  TJSJSON = class {$IFDEF PAS2JS} external name 'JSON' (TJSObject){$ENDIF}
  Public
    class function parse(aJSON : String) : JSValue;
    // Use this only when you are sure you will get an object, no checking is done.
    class function parseObject(aJSON : String) : TJSObject; {$IFDEF PAS2JS} external name 'parse';{$ENDIF}
    class function stringify(aValue : JSValue) : string; overload;
    class function stringify(aValue,aReplacer : JSValue) : string; overload;
    class function stringify(aValue,aReplacer : JSValue; space:  NativeInt) : string; overload;
    class function stringify(aValue,aReplacer : JSValue; space:  String) : string; overload;
  end;

  { TJSError }

  TJSError = class {$IFDEF PAS2JS} external name 'Error'   (TJSObject){$ENDIF}
  private
    FMessage: String; {$IFDEF PAS2JS} external name 'message';{$ENDIF}
    {$ifdef NodeJS}
    FStack: JSValue; {$IFDEF PAS2JS} external name 'stack';{$ENDIF}
    {$endif}
  Public
    Constructor new; overload;
    Constructor new(Const aMessage : string); overload;
    Constructor new(Const aMessage,aFileName : string); overload;
    Constructor new(Const aMessage,aFileName : string; aLineNumber : NativeInt); overload;
    Property Message : String Read FMessage;
    {$ifdef NodeJS}
    Property Stack: JSValue read FStack;
    {$endif}
  end;


  TJSPromiseResolver = reference to function (aValue : JSValue) : JSValue;
  TJSPromiseExecutor = reference to procedure (resolve,reject : TJSPromiseResolver);
  TJSPromiseFinallyHandler = reference to procedure;
  TJSPromise = Class;
  TJSPromiseArray = array of TJSPromise;

  TJSPromise = class {$IFDEF PAS2JS} external name 'Promise' {$ENDIF}
    constructor new(Executor : TJSPromiseExecutor);
    class function all(arg : Array of JSValue) : TJSPromise; overload;
    class function all(arg : JSValue) : TJSPromise; overload;
    class function all(arg : TJSPromiseArray) : TJSPromise; overload;
    class function race(arg : Array of JSValue) : TJSPromise; overload;
    class function race(arg : JSValue) : TJSPromise; overload;
    class function race(arg : TJSPromiseArray) : TJSPromise; overload;
    class function reject(reason : JSValue) : TJSPromise;
    class function resolve(value : JSValue): TJSPromise; overload;
    class function resolve : TJSPromise; overload;
    function _then (onAccepted : TJSPromiseResolver) : TJSPromise; {$IFDEF PAS2JS} external name 'then';{$ENDIF} overload;
    function _then (onAccepted,OnRejected: TJSPromiseResolver) : TJSPromise; {$IFDEF PAS2JS} external name 'then';{$ENDIF} overload;
    function catch (onRejected : TJSPromiseResolver) : TJSPromise;
    function _finally(value : TJSPromiseFinallyHandler): TJSPromise;
  end;


  TJSFunctionArguments = class {$IFDEF PAS2JS} external name 'arguments'{$ENDIF}
  private
    FLength: NativeInt; {$IFDEF PAS2JS} external name 'length';{$ENDIF}
    function GetElements(Index: NativeInt): JSValue; {$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure SetElements(Index: NativeInt; const AValue: JSValue); {$IFDEF PAS2JS} external name '[]';{$ENDIF}
  public
    property Length: NativeInt read FLength;
    property Elements[Index: NativeInt]: JSValue read GetElements write SetElements; default;
  end;

  TJSIteratorResult = class {$IFDEF PAS2JS} external name 'IteratorResult' (TJSObject){$ENDIF}
  Private
    fDone : Boolean; {$IFDEF PAS2JS} external name 'done';{$ENDIF}
    fValue : JSValue; {$IFDEF PAS2JS} external name 'value';{$ENDIF}
  Public
    property done : boolean Read FDone;
    property value : JSValue read FValue;
  end;

  TJSAsyncIterator = class {$IFDEF PAS2JS} external name 'AsyncIterator' (TJSObject){$ENDIF}
    function next: TJSIteratorResult;
  end;


var
  // JSArguments can be used in procedures/functions to provide access to the 'arguments' array.
  JSArguments: TJSFunctionArguments; {$IFDEF PAS2JS} external name 'arguments';{$ENDIF}
  // JSThis can be used in all code to access the javascript 'this' object.
  JSThis: TJSObject; {$IFDEF PAS2JS} external name 'this';{$ENDIF}
  // JSExceptValue can be used in catch blocks to access the JS throw value
  JSExceptValue: JSValue; {$IFDEF PAS2JS} external name '$e';{$ENDIF}

function new(aElements: TJSValueDynArray) : TJSObject; overload;
function JSDelete(const Obj: JSValue; const PropName: string): boolean; assembler; overload;

function decodeURIComponent(encodedURI : String) : String; {$IFDEF PAS2JS} external name 'decodeURIComponent';{$ENDIF}
function encodeURIComponent(str : String) : String; {$IFDEF PAS2JS} external name 'encodeURIComponent';{$ENDIF}

function parseInt(s: String; Radix: NativeInt): NativeInt; overload; {$IFDEF PAS2JS} external name 'parseInt';{$ENDIF} // may result NaN
function parseInt(s: String): NativeInt; overload; {$IFDEF PAS2JS} external name 'parseInt';{$ENDIF} // may result NaN
function parseFloat(s: String): double; overload; {$IFDEF PAS2JS} external name 'parseFloat';{$ENDIF} // may result NaN

function hasString(const v: JSValue): boolean; {$IFDEF PAS2JS} external name 'rtl.hasString';{$ENDIF}// isString(v) and v<>''
function hasValue(const v: JSValue): boolean; assembler; // returns the JS definition of if(v): v is not false, undefined, null, 0, NaN, or the empty string. Note: JS if(new Boolean(false)) returns true.
function isArray(const v: JSValue): boolean; {$IFDEF PAS2JS} external name 'rtl.isArray';{$ENDIF}
function isBoolean(const v: JSValue): boolean; assembler;
function isDate(const v: JSValue): boolean; assembler;
function isCallback(const v: JSValue): boolean; assembler;
function isChar(const v: JSValue): boolean; assembler;
function isClass(const v: JSValue): boolean; assembler; // is a Pascal class, e.g. a TClass
function isClassInstance(const v: JSValue): boolean; assembler;// is a Pascal class instance, e.g. a TObject
function isFunction(const v: JSValue): boolean; {$IFDEF PAS2JS} external name 'rtl.isFunction';{$ENDIF}
function isInteger(const v: JSValue): boolean; assembler;
function isModule(const v: JSValue): boolean; {$IFDEF PAS2JS} external name 'rtl.isModule';{$ENDIF}
function isNull(const v: JSValue): boolean; assembler;
function isNumber(const v: JSValue): boolean; {$IFDEF PAS2JS} external name 'rtl.isNumber';{$ENDIF}
function isObject(const v: JSValue): boolean; {$IFDEF PAS2JS} external name 'rtl.isObject';{$ENDIF} // true if not null and a JS Object
function isRecord(const v: JSValue): boolean; assembler;
function isString(const v: JSValue): boolean; {$IFDEF PAS2JS} external name 'rtl.isString';{$ENDIF}
function isUndefined(const v: JSValue): boolean; assembler;
function isDefined(const v: JSValue): boolean; assembler;
function isUTF16Char(const v: JSValue): boolean; assembler;
function isExt(const InstanceOrClass, aClass: JSValue): boolean; {$IFDEF PAS2JS} external name 'rtl.isExt';{$ENDIF} // aClass can be a JS object or function
function jsInstanceOf(const aFunction, aFunctionWithPrototype: JSValue): Boolean; assembler;
function jsTypeOf(const v: JSValue): String; {$IFDEF PAS2JS} external name 'typeof';{$ENDIF}
function jsIsNaN(const v: JSValue): boolean; {$IFDEF PAS2JS} external name 'isNaN';{$ENDIF}// true if value cannot be converted to a number. e.g. True on NaN, undefined, {}, '123'. False on true, null, '', ' ', '1A'
function jsIsFinite(const v: JSValue): boolean; {$IFDEF PAS2JS} external name 'isFinite';{$ENDIF}// true if value is a Finite number
function toNumber(const v: JSValue): double; assembler; // if not possible, returns NaN
function toInteger(const v: JSValue): NativeInt; // if v is not an integer, returns 0
function toObject(Value: JSValue): TJSObject; // If Value is not a Javascript object, returns Nil
function toArray(Value: JSValue): TJSArray; // If Value is not a Javascript array, returns Nil
function toBoolean(Value: JSValue): Boolean; // If Value is not a Boolean, returns False
function toString(Value: JSValue): String; overload; // If Value is not a string, returns ''

Type
  TJSValueType = (jvtNull,jvtBoolean,jvtInteger,jvtFloat,jvtString,jvtObject,jvtArray);

Function GetValueType(JS : JSValue) : TJSValueType;

Const
  Null : JSValue{$IFDEF PAS2JS}; external name 'null'{$ELSE} = nil{$ENDIF};
  Undefined : JSValue{$IFDEF PAS2JS}; external name 'undefined' {$ELSE} = nil{$ENDIF};

implementation

function new(aElements: TJSValueDynArray): TJSObject;

  function toString(I : Integer): string; {$IFDEF PAS2JS} external name 'String';{$ENDIF} overload;
  {$IFDEF DCC}
  begin
    Result := IntToStr(I);
  end;
  {$ENDIF}

Var
  L, I : integer;
  S : String;
begin
  L:=length(aElements);
  if (L mod 2)=1 then
    raise EJS.Create('Number of arguments must be even');
  I:=0;
  // Check all arguments;
  While (i<L) do
    begin
    if Not isString(aElements[i]) then
      begin
      S:=ToString(I);
      raise EJS.Create('Argument '+S+' must be a string.');
      end;
    inc(I,2);
    end;
  I:=0;
  Result:=TJSObject.New;
  While (i<L) do
    begin
    S:=String(aElements[i]);
    Result.Properties[S]:=aElements[i+1];
    inc(I,2);
    end;
end;

function JSDelete(const Obj: JSValue; const PropName: string): boolean; assembler;
asm
  {$IFDEF PAS2JS}return delete Obj[PropName];{$ENDIF}
end;

function hasValue(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}if(v){ return true; } else { return false; };{$ENDIF}
end;

function isBoolean(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}return typeof(v) == 'boolean';{$ENDIF}
end;

function isDate(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}return (v instanceof Date);{$ENDIF}
end;

function isCallback(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}return rtl.isObject(v) && rtl.isObject(v.scope) && (rtl.isString(v.fn) || rtl.isFunction(v.fn));{$ENDIF}
end;

function isChar(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}return (typeof(v)!="string") && (v.length==1);{$ENDIF}
end;

function isClass(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}return (typeof(v)=="object") && (v!=null) && (v.$class == v);{$ENDIF}
end;

function isClassInstance(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}return (typeof(v)=="object") && (v!=null) && (v.$class == Object.getPrototypeOf(v));{$ENDIF}
end;

function isInteger(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}return Math.floor(v)===v;{$ENDIF}
end;

function isNull(const v: JSValue): boolean; assembler;
// Note: use identity, "==" would fit undefined
asm
  {$IFDEF PAS2JS}return v === null;{$ENDIF}
end;

function isRecord(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}
  return (typeof(v)==="object")
      && (typeof(v.$new)==="function")
      && (typeof(v.$clone)==="function")
      && (typeof(v.$eq)==="function")
      && (typeof(v.$assign)==="function");
  {$ENDIF}
end;

function isUndefined(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}return v == undefined;{$ENDIF}
end;

function isDefined(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}return !(v == undefined);{$ENDIF}
end;

function isUTF16Char(const v: JSValue): boolean; assembler;
asm
  {$IFDEF PAS2JS}
  if (typeof(v)!="string") return false;
  if ((v.length==0) || (v.length>2)) return false;
  var code = v.charCodeAt(0);
  if (code < 0xD800){
    if (v.length == 1) return true;
  } else if (code <= 0xDBFF){
    if (v.length==2){
      code = v.charCodeAt(1);
      if (code >= 0xDC00 && code <= 0xDFFF) return true;
    };
  };
  return false;
  {$ENDIF}
end;

function jsInstanceOf(const aFunction, aFunctionWithPrototype: JSValue
  ): Boolean; assembler;
asm
  {$IFDEF PAS2JS}return aFunction instanceof aFunctionWithPrototype;{$ENDIF}
end;

function toNumber(const v: JSValue): double; assembler;
asm
  {$IFDEF PAS2JS}return v-0;{$ENDIF}
end;

function toInteger(const v: JSValue): NativeInt;
begin
  if IsInteger(v) then
    Result:=NativeInt(v)
  else
    Result:=0;
end;

function toObject(Value: JSValue): TJSObject;

begin
  if IsObject(Value) then
    Result:=TJSObject(Value)
  else
    Result:=Nil;
end;

function toArray(Value: JSValue): TJSArray; // If not possible, returns Nil

begin
  if IsArray(Value) then
    Result:=TJSArray(Value)
  else
    Result:=Nil;
end;

function toBoolean(Value: JSValue): Boolean; // If not possible, returns False

begin
  if isBoolean(Value) then
    Result:=Boolean(Value)
  else
    Result:=False;
end;

function toString(Value: JSValue): String; // If not possible, returns ''

begin
  if IsString(Value) then
    Result:=String(Value)
  else
    Result:='';
end;

{ EJS }

constructor EJS.Create(const Msg: String);
begin
  FMessage:=Msg;
end;


function GetValueType(JS: JSValue): TJSValueType;

Var
  t : string;

begin
  if isNull(js) then   // null reported as object
    result:=jvtNull
  else
    begin
    t:=jsTypeOf(js);
    if (t='string') then
      Result:=jvtString
    else if (t='boolean') then
      Result:=jvtBoolean
    else if (t='object') then
      begin
      if IsArray(JS) then
        Result:=jvtArray
      else
        Result:=jvtObject;
      end
    else if (t='number') then
      if isInteger(JS) then
        result:=jvtInteger
      else
        result:=jvtFloat
    end;
end;

end.

