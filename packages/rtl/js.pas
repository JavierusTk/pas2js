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
{$mode objfpc}
{$modeswitch externalclass}
{$ENDIF}

interface

uses
  Types;

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
    function toString: String; {$IFDEF DCC} reintroduce;{$ENDIF}
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
    constructor New; reintroduce; overload;
    constructor New(const MilliSecsSince1970: NativeInt); overload; // milliseconds since 1 January 1970 00:00:00 UTC, with leap seconds ignored
    constructor New(const aDateString: String); overload; // RFC 2822, ISO8601
    constructor New(aYear: NativeInt; aMonth: NativeInt; aDayOfMonth: NativeInt = 1;
      TheHours: NativeInt = 0; TheMinutes: NativeInt = 0; TheSeconds: NativeInt = 0;
      TheMilliseconds: NativeInt = 0); overload;
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
    function toString : String; {$IFDEF DCC}reintroduce;{$ENDIF}
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
    function toString : string; {$IFDEF DCC}reintroduce;{$ENDIF}
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
    function toString : String; {$IFDEF DCC}reintroduce;{$ENDIF}
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
//    class function from(aValue : jsValue) : TJSTypedArray;
//    class function from(aValue : jsValue; Map : TJSTypedArrayMapCallBack) : TJSTypedArray;
//    class function from(aValue : jsValue; aMap : TJSTypedArrayMapEvent) : TJSTypedArray;
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
    function toString : String; {$IFDEF DCC}reintroduce;{$ENDIF}
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

{$IFDEF DCC}
uses
  System.SysUtils;

function decodeURIComponent(encodedURI : String) : String;
begin
  Result := '';
end;

function encodeURIComponent(str : String) : String;
begin
  Result := '';
end;

function parseInt(s: String; Radix: NativeInt): NativeInt;
begin
  Result := 0;
end;

function parseInt(s: String): NativeInt;
begin
  Result := 0;
end;

function parseFloat(s: String): double;
begin
  Result := 0;
end;

function hasString(const v: JSValue): boolean;
begin
  Result := False;
end;

function isArray(const v: JSValue): boolean;
begin
  Result := False;
end;

function isFunction(const v: JSValue): boolean;
begin
  Result := False;
end;

function isModule(const v: JSValue): boolean;
begin
  Result := False;
end;

function isNumber(const v: JSValue): boolean;
begin
  Result := False;
end;

function isObject(const v: JSValue): boolean;
begin
  Result := False;
end;

function isString(const v: JSValue): boolean;
begin
  Result := False;
end;

function isExt(const InstanceOrClass, aClass: JSValue): boolean;
begin
  Result := False;
end;

function jsTypeOf(const v: JSValue): String;
begin
  Result := '';
end;

function jsIsNaN(const v: JSValue): boolean;
begin
  Result := False;
end;

function jsIsFinite(const v: JSValue): boolean;
begin
  Result := False;
end;
{$ENDIF}

function new(aElements: TJSValueDynArray): TJSObject;

  function toString(I : Integer): string; {$IFDEF PAS2JS} external name 'String';{$ENDIF} overload;
  {$IFDEF DCC}
  begin
    Result := IntToStr(I);
  end;
  {$ENDIF}

Var
  L,I : integer;
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

{$IFDEF DCC}
{ TJSObject }

class function TJSObject.assign(const Target, Source1: TJSObject): TJSObject;
begin
  Result := nil;
end;

class function TJSObject.create(const proto: TJSObject): TJSObject;
begin
  Result := nil;
end;

class function TJSObject.create(const proto,
  propertiesObject: TJSObject): TJSObject;
begin
  Result := nil;
end;

class procedure TJSObject.defineProperty(const obj: TJSObject; propname: String;
  const descriptor: TJSObjectPropertyDescriptor);
begin

end;

class function TJSObject.freeze(const obj: TJSObject): TJSObject;
begin
  Result := nil;
end;

class function TJSObject.getOwnPropertyDescriptor(const obj: TJSObject;
  propname: String): TJSObjectPropertyDescriptor;
begin
  Result := nil;
end;

class function TJSObject.getOwnPropertyNames(
  const obj: TJSObject): TStringDynArray;
begin
  Result := nil;
end;

function TJSObject.GetProperties(Name: String): JSValue;
begin
  Result := nil;
end;

class function TJSObject.getPrototypeOf(const obj: TJSObject): TJSObject;
begin
  Result := nil;
end;

function TJSObject.hasOwnProperty(prop: String): boolean;
begin
  Result := False;
end;

class function TJSObject.isExtensible(const obj: TJSObject): boolean;
begin
  Result := False;
end;

class function TJSObject.isFrozen(const obj: TJSObject): boolean;
begin
  Result := False;
end;

function TJSObject.isPrototypeOf(const obj: TJSObject): boolean;
begin
  Result := False;
end;

class function TJSObject.isSealed(const obj: TJSObject): boolean;
begin
  Result := False;
end;

class function TJSObject.keys(const obj: TJSObject): TStringDynArray;
begin
  Result := nil;
end;

constructor TJSObject.new;
begin

end;

class function TJSObject.preventExtensions(const obj: TJSObject): TJSObject;
begin
  Result := nil;
end;

function TJSObject.propertyIsEnumerable(propname: String): boolean;
begin
  Result := False;
end;

class function TJSObject.seal(const obj: TJSObject): TJSObject;
begin
  Result := nil;
end;

procedure TJSObject.SetProperties(Name: String; const AValue: JSValue);
begin

end;

class function TJSObject.setPrototypeOf(const obj,
  prototype: TJSObject): TJSObject;
begin
  Result := nil;
end;

function TJSObject.toLocaleString: String;
begin
  Result := '';
end;

function TJSObject.toString: String;
begin
  Result := '';
end;

function TJSObject.valueOf: JSValue;
begin
  Result := nil;
end;

class function TJSObject.values(const obj: JSValue): TJSObject;
begin
  Result := nil;
end;

{ TJSIterator }

function TJSIterator.next: TJSIteratorValue;
begin
  Result := nil;
end;

{ TJSSet }

function TJSSet.add(value: JSValue): TJSSet;
begin
  Result := nil;
end;

procedure TJSSet.clear;
begin

end;

function TJSSet.delete(value: JSValue): Boolean;
begin
  Result := False;
end;

function TJSSet.entries: TJSIterator;
begin
  Result := nil;
end;

procedure TJSSet.forEach(const aCallBack: TJSSetEventProc; thisArg: JSValue);
begin

end;

procedure TJSSet.forEach(const aCallBack: TJSSetProcCallBack);
begin

end;

procedure TJSSet.forEach(const aCallBack: TJSSetEventProc);
begin

end;

function TJSSet.has(value: JSValue): Boolean;
begin
  Result := False;
end;

function TJSSet.keys: TJSIterator;
begin
  Result := nil;
end;

constructor TJSSet.new(aElement1: JSValue);
begin

end;

constructor TJSSet.new;
begin

end;

function TJSSet.values: TJSIterator;
begin
  Result := nil;
end;

{ TJSMap }

procedure TJSMap.clear;
begin

end;

function TJSMap.delete(key: JSValue): Boolean;
begin
  Result := False;
end;

function TJSMap.entries: TJSIterator;
begin
  Result := nil;
end;

procedure TJSMap.forEach(const aCallBack: TJSMapFunctionCallBack);
begin

end;

procedure TJSMap.forEach(const aCallBack: TJSMapProcCallBack);
begin

end;

procedure TJSMap.forEach(const aCallBack: TJSMapFunctionCallBack;
  thisArg: JSValue);
begin

end;

function TJSMap.get(key: JSValue): JSValue;
begin
  Result := nil;
end;

function TJSMap.has(key: JSValue): Boolean;
begin
  Result := False;
end;

function TJSMap.keys: TJSIterator;
begin
  Result := nil;
end;

constructor TJSMap.new(aElement1: JSValue);
begin

end;

constructor TJSMap.new;
begin

end;

function TJSMap.&set(key, value: JSValue): TJSMap;
begin
  Result := nil;
end;

function TJSMap.values: TJSIterator;
begin
  Result := nil;
end;

{ TJSFunction }

function TJSFunction.apply(thisArg: TJSObject;
  const ArgArray: TJSValueDynArray): JSValue;
begin
  Result := nil;
end;

function TJSFunction.bind(thisArg: TJSObject): JSValue;
begin
  Result := nil;
end;

function TJSFunction.call(thisArg: TJSObject): JSValue;
begin
  Result := nil;
end;

{ TJSDate }

function TJSDate.getDate: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getDay: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getFullYear: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getHours: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getMilliseconds: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getMinutes: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getMonth: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getSeconds: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getTime: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getTimezoneOffset: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getUTCDate: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getUTCDay: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getUTCFullYear: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getUTCHours: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getUTCMilliseconds: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getUTCMinutes: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getUTCMonth: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getUTCSeconds: NativeInt;
begin
  Result := 0;
end;

function TJSDate.getYear: NativeInt;
begin
  Result := 0;
end;

constructor TJSDate.New(aYear, aMonth, aDayOfMonth, TheHours, TheMinutes,
  TheSeconds, TheMilliseconds: NativeInt);
begin

end;

constructor TJSDate.New;
begin

end;

constructor TJSDate.New(const MilliSecsSince1970: NativeInt);
begin

end;

constructor TJSDate.New(const aDateString: String);
begin

end;

class function TJSDate.now: NativeInt;
begin
  Result := 0;
end;

class function TJSDate.parse(const aDateString: string): NativeInt;
begin
  Result := 0;
end;

procedure TJSDate.setDate(const AValue: NativeInt);
begin

end;

procedure TJSDate.setFullYear(const AValue: NativeInt);
begin

end;

procedure TJSDate.setHours(const AValue: NativeInt);
begin

end;

procedure TJSDate.setMilliseconds(const AValue: NativeInt);
begin

end;

procedure TJSDate.setMinutes(const AValue: NativeInt);
begin

end;

procedure TJSDate.setMonth(const AValue: NativeInt);
begin

end;

procedure TJSDate.setSeconds(const AValue: NativeInt);
begin

end;

procedure TJSDate.setTime(const AValue: NativeInt);
begin

end;

procedure TJSDate.setUTCDate(const AValue: NativeInt);
begin

end;

procedure TJSDate.setUTCFullYear(const AValue: NativeInt);
begin

end;

procedure TJSDate.setUTCHours(const AValue: NativeInt);
begin

end;

procedure TJSDate.setUTCMilliseconds(const AValue: NativeInt);
begin

end;

procedure TJSDate.setUTCMinutes(const AValue: NativeInt);
begin

end;

procedure TJSDate.setUTCMonth(const AValue: NativeInt);
begin

end;

procedure TJSDate.setUTCSeconds(const AValue: NativeInt);
begin

end;

procedure TJSDate.setYear(const AValue: NativeInt);
begin

end;

function TJSDate.toDateString: string;
begin
  Result := '';
end;

function TJSDate.toGMTString: string;
begin
  Result := '';
end;

function TJSDate.toISOString: string;
begin
  Result := '';
end;

function TJSDate.toJSON: string;
begin
  Result := '';
end;

function TJSDate.toLocaleDateString: string;
begin
  Result := '';
end;

function TJSDate.toLocaleString: string;
begin
  Result := '';
end;

function TJSDate.toLocaleTimeString: string;
begin
  Result := '';
end;

function TJSDate.toTimeString: string;
begin
  Result := '';
end;

function TJSDate.toUTCString: string;
begin
  Result := '';
end;

class function TJSDate.UTC(aYear, aMonth, aDayOfMonth, TheHours, TheMinutes,
  TheSeconds, TheMilliseconds: NativeInt): NativeInt;
begin
  Result := 0;
end;

{ TJSRegexp }

function TJSRegexp.exec(aString: string): TStringDynArray;
begin
  Result := nil;
end;

constructor TJSRegexp.New(Pattern: string);
begin

end;

constructor TJSRegexp.New(Pattern, Flags: string);
begin

end;

function TJSRegexp.test(aString: string): boolean;
begin
  Result := False;
end;

function TJSRegexp.toString: String;
begin
  Result := '';
end;

{ TJSString }

function TJSString.anchor(const aName: string): string;
begin
  Result := '';
end;

function TJSString.charAt(aIndex: NativeInt): string;
begin
  Result := '';
end;

function TJSString.charCodeAt(aIndex: NativeInt): NativeInt;
begin
  Result := 0;
end;

function TJSString.codePointAt(aIndex: NativeInt): NativeInt;
begin
  Result := 0;
end;

function TJSString.concat(s: string): string;
begin
  Result := '';
end;

function TJSString.endsWith(aSearchString: string): boolean;
begin
  Result := False;
end;

function TJSString.endsWith(aSearchString: string; Pos: NativeInt): boolean;
begin
  Result := False;
end;

class function TJSString.fromCharCode: string;
begin
  Result := '';
end;

class function TJSString.fromCodePoint: string;
begin
  Result := '';
end;

function TJSString.includes(aSearchString: string; Pos: NativeInt): boolean;
begin
  Result := False;
end;

function TJSString.indexOf(aSearchString: String; Pos: NativeInt): Integer;
begin
  Result := 0;
end;

function TJSString.lastIndexOf(aSearchString: String): NativeInt;
begin
  Result := 0;
end;

function TJSString.lastIndexOf(aSearchString: String; Pos: NativeInt): Integer;
begin
  Result := 0;
end;

function TJSString.link(aUrl: string): String;
begin
  Result := '';
end;

function TJSString.localeCompare(compareString, locales: string;
  Options: TlocaleCompareOptions): integer;
begin
  Result := 0;
end;

function TJSString.localeCompare(aCompareString, aLocales: string): integer;
begin
  Result := 0;
end;

function TJSString.localeCompare(aCompareString: string): NativeInt;
begin
  Result := 0;
end;

function TJSString.match(aRegexp: String): TStringDynArray;
begin
  Result := nil;
end;

function TJSString.match(aRegexp: TJSRegexp): TStringDynArray;
begin
  Result := nil;
end;

constructor TJSString.New(const S: String);
begin

end;

constructor TJSString.New(const I: NativeInt);
begin

end;

constructor TJSString.New(const D: double);
begin

end;

function TJSString.replace(Regexp: String;
  aCallback: TReplaceCallBack0): String;
begin
  Result := '';
end;

function TJSString.replace(aRegexp, NewString: String): String;
begin
  Result := '';
end;

function TJSString.replace(Regexp: TJSRegexp;
  aCallback: TReplaceCallBack): String;
begin
  Result := '';
end;

function TJSString.replace(Regexp: String; aCallback: TReplaceCallBack): String;
begin
  Result := '';
end;

function TJSString.replace(aRegexp: TJSRegexp; NewString: String): String;
begin
  Result := '';
end;

function TJSString.replace(Regexp: TJSRegexp;
  aCallback: TReplaceCallBack2): String;
begin
  Result := '';
end;

function TJSString.replace(Regexp: String;
  aCallback: TReplaceCallBack2): String;
begin
  Result := '';
end;

function TJSString.replace(Regexp: TJSRegexp;
  aCallback: TReplaceCallBack1): String;
begin
  Result := '';
end;

function TJSString.replace(Regexp: String;
  aCallback: TReplaceCallBack1): String;
begin
  Result := '';
end;

function TJSString.replace(Regexp: TJSRegexp;
  aCallback: TReplaceCallBack0): String;
begin
  Result := '';
end;

function TJSString.search(Regexp: JSValue): NativeInt;
begin
  Result := 0;
end;

function TJSString.search(Regexp: TJSRegexp): NativeInt;
begin
  Result := 0;
end;

function TJSString.slice(aBeginIndex: NativeInt): String;
begin
  Result := '';
end;

function TJSString.slice(aBeginIndex, aEndIndex: NativeInt): String;
begin
  Result := '';
end;

function TJSString.split(aSeparator: string): TStringDynArray;
begin
  Result := nil;
end;

function TJSString.split(aSeparator: string;
  aLimit: NativeInt): TStringDynArray;
begin
  Result := nil;
end;

function TJSString.split: TStringDynArray;
begin
  Result := nil;
end;

function TJSString.split(aRegexp: TJSRegexp): TStringDynArray;
begin
  Result := nil;
end;

function TJSString.split(aSeparator: array of string;
  aLimit: NativeInt): TStringDynArray;
begin
  Result := nil;
end;

function TJSString.split(aSeparator: array of string): TStringDynArray;
begin
  Result := nil;
end;

function TJSString.startsWith(aSearchString: String;
  aPosition: NativeInt): Boolean;
begin
  Result := false;
end;

function TJSString.startsWith(aSearchString: String): Boolean;
begin
  Result := false;
end;

function TJSString.substr(aStartIndex: NativeInt): String;
begin
  Result := '';
end;

function TJSString.substr(aStartIndex, aLength: NativeInt): String;
begin
  Result := '';
end;

function TJSString.substring(aStartIndex: NativeInt): String;
begin
  Result := '';
end;

function TJSString.substring(aStartIndex, aEndIndex: NativeInt): String;
begin
  Result := '';
end;

function TJSString.toLocaleLowerCase: String;
begin
  Result := '';
end;

function TJSString.toLocaleUpperCase: String;
begin
  Result := '';
end;

function TJSString.toLowerCase: String;
begin
  Result := '';
end;

function TJSString.toString: string;
begin
  Result := '';
end;

function TJSString.toUpperCase: String;
begin
  Result := '';
end;

function TJSString.trim: string;
begin
  Result := '';
end;

function TJSString.valueOf: string;
begin
  Result := '';
end;

function TJSString._repeat(aCount: NativeInt): Integer;
begin
  Result := 0;
end;

{ TJSArray }

function TJSArray.concat(el: JSValue): TJSArray;
begin
  Result := nil;
end;

function TJSArray.copyWithin(aTarget, aStart, aEnd: NativeInt): TJSarray;
begin
  Result := nil;
end;

function TJSArray.copyWithin(aTarget: NativeInt): TJSarray;
begin
  Result := nil;
end;

function TJSArray.copyWithin(aTarget, aStart: NativeInt): TJSarray;
begin
  Result := nil;
end;

function TJSArray.entries: TJSIterator;
begin
  Result := nil;
end;

function TJSArray.every(const aCallback: TJSArrayEvent;
  aThis: TObject): boolean;
begin
  Result := False;
end;

function TJSArray.every(const aCallback: TJSArrayCallBack): boolean;
begin
  Result := False;
end;

function TJSArray.fill(aValue: JSValue; aStartIndex,
  aEndIndex: NativeInt): TJSArray;
begin
  Result := nil;
end;

function TJSArray.fill(aValue: JSValue; aStartIndex: NativeInt): TJSArray;
begin
  Result := nil;
end;

function TJSArray.fill(aValue: JSValue): TJSArray;
begin
  Result := nil;
end;

function TJSArray.filter(const aCallBack: TJSArrayCallBack): TJSArray;
begin
  Result := nil;
end;

function TJSArray.filter(const aCallBack: TJSArrayEvent;
  aThis: TObject): TJSArray;
begin
  Result := nil;
end;

function TJSArray.find(const aCallBack: TJSArrayCallBack): JSValue;
begin
  Result := nil;
end;

function TJSArray.find(const aCallBack: TJSArrayEvent; aThis: TObject): JSValue;
begin
  Result := nil;
end;

function TJSArray.findIndex(const aCallBack: TJSArrayEvent;
  aThis: TObject): NativeInt;
begin
  Result := 0;
end;

function TJSArray.findIndex(const aCallBack: TJSArrayCallBack): NativeInt;
begin
  Result := 0;
end;

procedure TJSArray.forEach(const aCallBack: TJSArrayEventProc);
begin

end;

procedure TJSArray.forEach(const aCallBack: TJSArrayEvent);
begin

end;

procedure TJSArray.forEach(const aCallBack: TJSArrayEvent; aThis: TObject);
begin

end;

function TJSArray.GetElements(Index: NativeInt): JSValue;
begin
  Result := nil;
end;

function TJSArray.includes(aElement: JSValue): Boolean;
begin
  Result := false;
end;

function TJSArray.includes(aElement: JSValue; FromIndex: NativeInt): Boolean;
begin
  Result := false;
end;

function TJSArray.indexOf(aElement: JSValue): NativeInt;
begin
  Result := 0;
end;

function TJSArray.indexOf(aElement: JSValue; FromIndex: NativeInt): NativeInt;
begin
  Result := 0;
end;

class function TJSArray.isArray(a: JSValue): Boolean;
begin
  Result := false;
end;

function TJSArray.join: String;
begin
  Result := '';
end;

function TJSArray.join(aSeparator: string): String;
begin
  Result := '';
end;

function TJSArray.keys: TJSIterator;
begin
  Result := nil;
end;

function TJSArray.lastIndexOf(aElement: JSValue): NativeInt;
begin
  Result := 0;
end;

function TJSArray.lastIndexOf(aElement: JSValue;
  FromIndex: NativeInt): NativeInt;
begin
  Result := 0;
end;

function TJSArray.map(const aCallBack: TJSArrayMapEvent;
  aThis: TObject): TJSArray;
begin
  Result := nil;
end;

function TJSArray.map(const aCallBack: TJSArrayMapCallBack): TJSArray;
begin
  Result := nil;
end;

constructor TJSArray.new(aLength: NativeInt);
begin

end;

constructor TJSArray.new;
begin

end;

constructor TJSArray.new(aElement1: JSValue);
begin

end;

function TJSArray.pop: JSValue;
begin
  Result := nil;
end;

function TJSArray.push(aElement: JSValue): NativeInt;
begin
  Result := 0;
end;

function TJSArray.reduce(const aCallBack: TJSArrayReduceCallBack): JSValue;
begin
  Result := nil;
end;

function TJSArray.reduce(const aCallBack: TJSArrayReduceCallBack;
  initialValue: JSValue): JSValue;
begin
  Result := nil;
end;

function TJSArray.reduceRight(const aCallBack: TJSArrayReduceCallBack;
  initialValue: JSValue): JSValue;
begin
  Result := nil;
end;

function TJSArray.reduceRight(const aCallBack: TJSArrayReduceCallBack): JSValue;
begin
  Result := nil;
end;

function TJSArray.reverse: TJSArray;
begin
  Result := nil;
end;

procedure TJSArray.SetElements(Index: NativeInt; const AValue: JSValue);
begin

end;

function TJSArray.shift: JSValue;
begin
  Result := nil;
end;

function TJSArray.slice(aBegin: NativeInt): TJSArray;
begin
  Result := nil;
end;

function TJSArray.slice: TJSArray;
begin
  Result := nil;
end;

function TJSArray.slice(aBegin, aEnd: NativeInt): TJSArray;
begin
  Result := nil;
end;

function TJSArray.some(const aCallback: TJSArrayEvent; aThis: TObject): boolean;
begin
  Result := false;
end;

function TJSArray.some(const aCallback: TJSArrayCallBack): boolean;
begin
  Result := false;
end;

function TJSArray.sort(const aCallback: TJSArrayCompareCallBack): TJSArray;
begin
  Result := nil;
end;

function TJSArray.sort: TJSArray;
begin
  Result := nil;
end;

function TJSArray.splice(aStart, aDeleteCount: NativeInt): TJSArray;
begin
  Result := nil;
end;

function TJSArray.splice(aStart: NativeInt): TJSArray;
begin
  Result := nil;
end;

function TJSArray.toLocaleString(locales: string): String;
begin
  Result := '';
end;

function TJSArray.toLocaleString(locales: string;
  const Options: TLocaleCompareOptions): String;
begin
  Result := '';
end;

function TJSArray.toLocaleString: String;
begin
  Result := '';
end;

function TJSArray.toString: String;
begin
  Result := '';
end;

function TJSArray.unshift: NativeInt;
begin
  Result := 0;
end;

function TJSArray.values: TJSIterator;
begin
  Result := nil;
end;

class function TJSArray._of: TJSArray;
begin
  Result := nil;
end;

{ TJSArrayBuffer }

class function TJSArrayBuffer.isView(aValue: JSValue): Boolean;
begin
  Result := false;
end;

constructor TJSArrayBuffer.new(aByteLength: NativeInt);
begin

end;

function TJSArrayBuffer.slice(aBegin, aEnd: NativeInt): TJSArrayBuffer;
begin
  Result := nil;
end;

function TJSArrayBuffer.slice(aBegin: NativeInt): TJSArrayBuffer;
begin
  Result := nil;
end;

{ TJSTypedArray }

function TJSTypedArray.copyWithin(aTarget, aStart,
  aEnd: NativeInt): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.copyWithin(aTarget: NativeInt): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.copyWithin(aTarget, aStart: NativeInt): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.every(const aCallback: TJSTypedArrayEvent;
  aThis: TObject): boolean;
begin
  Result := false;
end;

function TJSTypedArray.every(const aCallback: TJSTypedArrayCallBack): boolean;
begin
  Result := false;
end;

function TJSTypedArray.fill(aValue: JSValue;
  aStartIndex: NativeInt): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.fill(aValue: JSValue; aStartIndex,
  aEndIndex: NativeInt): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.fill(aValue: JSValue): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.filter(
  const aCallBack: TJSTypedArrayCallBack): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.filter(const aCallBack: TJSTypedArrayEvent;
  aThis: TObject): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.find(const aCallBack: TJSTypedArrayCallBack): JSValue;
begin
  Result := nil;
end;

function TJSTypedArray.find(const aCallBack: TJSTypedArrayEvent;
  aThis: TObject): JSValue;
begin
  Result := nil;
end;

function TJSTypedArray.findIndex(const aCallBack: TJSTypedArrayEvent;
  aThis: TObject): NativeInt;
begin
  Result := 0;
end;

function TJSTypedArray.findIndex(
  const aCallBack: TJSTypedArrayCallBack): NativeInt;
begin
  Result := 0;
end;

procedure TJSTypedArray.forEach(const aCallBack: TJSTypedArrayCallBack);
begin

end;

procedure TJSTypedArray.forEach(const aCallBack: TJSTypedArrayEvent;
  aThis: TObject);
begin

end;

function TJSTypedArray.getValue(Index: NativeInt): JSValue;
begin
  Result := nil;
end;

function TJSTypedArray.includes(aElement: JSValue): Boolean;
begin
  Result := False;
end;

function TJSTypedArray.includes(aElement: JSValue;
  FromIndex: NativeInt): Boolean;
begin
  Result := False;
end;

function TJSTypedArray.indexOf(aElement: JSValue): NativeInt;
begin
  Result := 0;
end;

function TJSTypedArray.indexOf(aElement: JSValue;
  FromIndex: NativeInt): NativeInt;
begin
  Result := 0;
end;

function TJSTypedArray.join: String;
begin
  Result := '';
end;

function TJSTypedArray.join(aSeparator: string): String;
begin
  Result := '';
end;

function TJSTypedArray.lastIndexOf(aElement: JSValue;
  FromIndex: NativeInt): NativeInt;
begin
  Result := 0;
end;

function TJSTypedArray.lastIndexOf(aElement: JSValue): NativeInt;
begin
  Result := 0;
end;

function TJSTypedArray.map(const aCallBack: TJSTypedArrayEvent;
  aThis: TObject): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.map(
  const aCallBack: TJSTypedArrayCallBack): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.reduce(const aCallBack: TJSTypedArrayReduceCallBack;
  initialValue: JSValue): JSValue;
begin
  Result := nil;
end;

function TJSTypedArray.reduce(
  const aCallBack: TJSTypedArrayReduceCallBack): JSValue;
begin
  Result := nil;
end;

function TJSTypedArray.reduceRight(
  const aCallBack: TJSTypedArrayReduceCallBack): JSValue;
begin
  Result := nil;
end;

function TJSTypedArray.reduceRight(const aCallBack: TJSTypedArrayReduceCallBack;
  initialValue: JSValue): JSValue;
begin
  Result := nil;
end;

function TJSTypedArray.reverse: TJSTypedArray;
begin
  Result := nil;
end;

procedure TJSTypedArray.setValue(Index: NativeInt; AValue: JSValue);
begin

end;

function TJSTypedArray.slice(aBegin, aEnd: NativeInt): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.slice(aBegin: NativeInt): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.slice: TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.some(const aCallback: TJSTypedArrayEvent;
  aThis: TObject): boolean;
begin
  Result := false;
end;

function TJSTypedArray.some(const aCallback: TJSTypedArrayCallBack): boolean;
begin
   Result := false;
end;

function TJSTypedArray.sort: TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.sort(
  const aCallback: TJSTypedArrayCompareCallBack): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.splice(aStart, aDeleteCount: NativeInt): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.splice(aStart: NativeInt): TJSTypedArray;
begin
  Result := nil;
end;

function TJSTypedArray.toLocaleString: String;
begin
  Result := '';
end;

function TJSTypedArray.toLocaleString(locales: string): String;
begin
  Result := '';
end;

function TJSTypedArray.toLocaleString(locales: string;
  const Options: TLocaleCompareOptions): String;
begin
  Result := '';
end;

function TJSTypedArray.toString: String;
begin
  Result := '';
end;

function TJSTypedArray.unshift: NativeInt;
begin
  Result := 0;
end;

class function TJSTypedArray._of(aValue: jsValue): TJSTypedArray;
begin
  Result := nil;
end;

procedure TJSTypedArray._set(anArray: TJSTypedArray);
begin

end;

procedure TJSTypedArray._set(anArray: TJSArray; anOffset: NativeInt);
begin

end;

procedure TJSTypedArray._set(anArray: TJSArray);
begin

end;

procedure TJSTypedArray._set(anArray: TJSTypedArray; anOffset: NativeInt);
begin

end;

{ TJSInt8Array }

class function TJSInt8Array.from(aValue: jsValue): TJSInt8Array;
begin
  Result := nil;
end;

class function TJSInt8Array.from(aValue: jsValue;
  Map: TJSTypedArrayMapCallBack): TJSInt8Array;
begin
  Result := nil;
end;

class function TJSInt8Array.from(aValue: jsValue;
  aMap: TJSTypedArrayMapEvent): TJSInt8Array;
begin
  Result := nil;
end;

function TJSInt8Array.getTypedValue(Index: NativeInt): Shortint;
begin
  Result := 0;
end;

constructor TJSInt8Array.new(aObject: TJSObject);
begin

end;

constructor TJSInt8Array.new(atypedArray: TJSTypedArray);
begin

end;

constructor TJSInt8Array.new(length: NativeInt);
begin

end;

constructor TJSInt8Array.new(buffer: TJSArrayBuffer);
begin

end;

constructor TJSInt8Array.new(buffer: TJSArrayBuffer; aByteOffset,
  aLength: NativeInt);
begin

end;

constructor TJSInt8Array.new(buffer: TJSArrayBuffer; aByteOffset: NativeInt);
begin

end;

procedure TJSInt8Array.setTypedValue(Index: NativeInt; AValue: Shortint);
begin

end;

function TJSInt8Array.subarray(aBegin, aEnd: Integer): TJSInt8Array;
begin
  Result := nil;
end;

function TJSInt8Array.subarray(aBegin: Integer): TJSInt8Array;
begin
  Result := nil;
end;

class function TJSInt8Array._of(aValue: TJSValueDynArray): TJSInt8Array;
begin
  Result := nil;
end;

class function TJSInt8Array._of(aValue: jsValue): TJSInt8Array;
begin
  Result := nil;
end;

procedure TJSInt8Array._set(anArray: array of ShortInt);
begin

end;

procedure TJSInt8Array._set(anArray: array of ShortInt; anOffset: NativeInt);
begin

end;

{ TJSUint8Array }

class function TJSUint8Array.from(aValue: jsValue): TJSUInt8Array;
begin
  Result := nil;
end;

class function TJSUint8Array.from(aValue: jsValue;
  Map: TJSTypedArrayMapCallBack): TJSUInt8Array;
begin
  Result := nil;
end;

class function TJSUint8Array.from(aValue: jsValue;
  aMap: TJSTypedArrayMapEvent): TJSUInt8Array;
begin
  Result := nil;
end;

function TJSUint8Array.getTypedValue(Index: NativeInt): Byte;
begin
  Result := 0;
end;

constructor TJSUint8Array.new(aObject: TJSObject);
begin

end;

constructor TJSUint8Array.new(atypedArray: TJSTypedArray);
begin

end;

constructor TJSUint8Array.new(length: NativeInt);
begin

end;

constructor TJSUint8Array.new(buffer: TJSArrayBuffer; aByteOffset,
  aLength: NativeInt);
begin

end;

constructor TJSUint8Array.new(buffer: TJSArrayBuffer; aByteOffset: NativeInt);
begin

end;

constructor TJSUint8Array.new(buffer: TJSArrayBuffer);
begin

end;

procedure TJSUint8Array.setTypedValue(Index: NativeInt; AValue: Byte);
begin

end;

function TJSUint8Array.subarray(aBegin, aEnd: Integer): TJSUInt8Array;
begin
  Result := nil;
end;

function TJSUint8Array.subarray(aBegin: Integer): TJSUInt8Array;
begin
  Result := nil;
end;

class function TJSUint8Array._of(aValue: jsValue): TJSUInt8Array;
begin
  Result := nil;
end;

procedure TJSUint8Array._set(anArray: array of Byte);
begin

end;

procedure TJSUint8Array._set(anArray: array of Byte; anOffset: NativeInt);
begin

end;

{ TJSUint8ClampedArray }

class function TJSUint8ClampedArray.from(aValue: jsValue): TJSUInt8ClampedArray;
begin
  Result := nil;
end;

class function TJSUint8ClampedArray.from(aValue: jsValue;
  Map: TJSTypedArrayMapCallBack): TJSUInt8ClampedArray;
begin
  Result := nil;
end;

class function TJSUint8ClampedArray.from(aValue: jsValue;
  aMap: TJSTypedArrayMapEvent): TJSUInt8ClampedArray;
begin
  Result := nil;
end;

function TJSUint8ClampedArray.getTypedValue(Index: NativeInt): Byte;
begin
  Result := 0;
end;

constructor TJSUint8ClampedArray.new(aObject: TJSObject);
begin

end;

constructor TJSUint8ClampedArray.new(atypedArray: TJSTypedArray);
begin

end;

constructor TJSUint8ClampedArray.new(length: NativeInt);
begin

end;

constructor TJSUint8ClampedArray.new(buffer: TJSArrayBuffer; aByteOffset,
  aLength: NativeInt);
begin

end;

constructor TJSUint8ClampedArray.new(buffer: TJSArrayBuffer;
  aByteOffset: NativeInt);
begin

end;

constructor TJSUint8ClampedArray.new(buffer: TJSArrayBuffer);
begin

end;

procedure TJSUint8ClampedArray.setTypedValue(Index: NativeInt; AValue: Byte);
begin

end;

function TJSUint8ClampedArray.subarray(aBegin,
  aEnd: Integer): TJSUInt8ClampedArray;
begin
  Result := nil;
end;

function TJSUint8ClampedArray.subarray(aBegin: Integer): TJSUInt8ClampedArray;
begin
  Result := nil;
end;

class function TJSUint8ClampedArray._of(aValue: jsValue): TJSUInt8ClampedArray;
begin
  Result := nil;
end;

procedure TJSUint8ClampedArray._set(anArray: array of Byte);
begin

end;

procedure TJSUint8ClampedArray._set(anArray: array of Byte;
  anOffset: NativeInt);
begin

end;

{ TJSInt16Array }

class function TJSInt16Array.from(aValue: jsValue): TJSInt16Array;
begin
  Result := nil;
end;

class function TJSInt16Array.from(aValue: jsValue;
  Map: TJSTypedArrayMapCallBack): TJSInt16Array;
begin
  Result := nil;
end;

class function TJSInt16Array.from(aValue: jsValue;
  aMap: TJSTypedArrayMapEvent): TJSInt16Array;
begin
  Result := nil;
end;

function TJSInt16Array.getTypedValue(Index: NativeInt): smallint;
begin
  Result := 0;
end;

constructor TJSInt16Array.new(aObject: TJSObject);
begin

end;

constructor TJSInt16Array.new(atypedArray: TJSTypedArray);
begin

end;

constructor TJSInt16Array.new(length: NativeInt);
begin

end;

constructor TJSInt16Array.new(buffer: TJSArrayBuffer; aByteOffset,
  aLength: NativeInt);
begin

end;

constructor TJSInt16Array.new(buffer: TJSArrayBuffer; aByteOffset: NativeInt);
begin

end;

constructor TJSInt16Array.new(buffer: TJSArrayBuffer);
begin

end;

procedure TJSInt16Array.setTypedValue(Index: NativeInt; AValue: Smallint);
begin

end;

function TJSInt16Array.subarray(aBegin, aEnd: Integer): TJSInt16Array;
begin
  Result := nil;
end;

function TJSInt16Array.subarray(aBegin: Integer): TJSInt16Array;
begin
  Result := nil;
end;

class function TJSInt16Array._of(aValue: jsValue): TJSInt16Array;
begin
  Result := nil;
end;

procedure TJSInt16Array._set(anArray: array of SmallInt);
begin

end;

procedure TJSInt16Array._set(anArray: array of SmallInt; anOffset: NativeInt);
begin

end;

{ TJSUint16Array }

class function TJSUint16Array.from(aValue: jsValue): TJSUInt16Array;
begin
  Result := nil;
end;

class function TJSUint16Array.from(aValue: jsValue;
  Map: TJSTypedArrayMapCallBack): TJSUInt16Array;
begin
  Result := nil;
end;

class function TJSUint16Array.from(aValue: jsValue;
  aMap: TJSTypedArrayMapEvent): TJSUInt16Array;
begin
  Result := nil;
end;

function TJSUint16Array.getTypedValue(Index: NativeInt): Word;
begin
  Result := 0;
end;

constructor TJSUint16Array.new(aObject: TJSObject);
begin

end;

constructor TJSUint16Array.new(atypedArray: TJSTypedArray);
begin

end;

constructor TJSUint16Array.new(length: NativeInt);
begin

end;

constructor TJSUint16Array.new(buffer: TJSArrayBuffer; aByteOffset,
  aLength: NativeInt);
begin

end;

constructor TJSUint16Array.new(buffer: TJSArrayBuffer; aByteOffset: NativeInt);
begin

end;

constructor TJSUint16Array.new(buffer: TJSArrayBuffer);
begin

end;

procedure TJSUint16Array.setTypedValue(Index: NativeInt; AValue: Word);
begin

end;

function TJSUint16Array.subarray(aBegin, aEnd: Integer): TJSUInt16Array;
begin
  Result := nil;
end;

function TJSUint16Array.subarray(aBegin: Integer): TJSUInt16Array;
begin
  Result := nil;
end;

class function TJSUint16Array._of(aValue: jsValue): TJSUInt16Array;
begin
  Result := nil;
end;

procedure TJSUint16Array._set(anArray: array of Word);
begin

end;

procedure TJSUint16Array._set(anArray: array of Word; anOffset: NativeInt);
begin

end;

{ TJSInt32Array }

class function TJSInt32Array.from(aValue: jsValue): TJSInt32Array;
begin
  Result := nil;
end;

class function TJSInt32Array.from(aValue: jsValue;
  Map: TJSTypedArrayMapCallBack): TJSInt32Array;
begin
  Result := nil;
end;

class function TJSInt32Array.from(aValue: jsValue;
  aMap: TJSTypedArrayMapEvent): TJSInt32Array;
begin
  Result := nil;
end;

function TJSInt32Array.getTypedValue(Index: NativeInt): longint;
begin
  Result := 0;
end;

constructor TJSInt32Array.new(aObject: TJSObject);
begin

end;

constructor TJSInt32Array.new(atypedArray: TJSTypedArray);
begin

end;

constructor TJSInt32Array.new(length: NativeInt);
begin

end;

constructor TJSInt32Array.new(buffer: TJSArrayBuffer; aByteOffset,
  aLength: NativeInt);
begin

end;

constructor TJSInt32Array.new(buffer: TJSArrayBuffer; aByteOffset: NativeInt);
begin

end;

constructor TJSInt32Array.new(buffer: TJSArrayBuffer);
begin

end;

procedure TJSInt32Array.setTypedValue(Index: NativeInt; AValue: longint);
begin

end;

function TJSInt32Array.subarray(aBegin, aEnd: Integer): TJSInt32Array;
begin
  Result := nil;
end;

function TJSInt32Array.subarray(aBegin: Integer): TJSInt32Array;
begin
  Result := nil;
end;

class function TJSInt32Array._of(aValue: jsValue): TJSInt32Array;
begin
  Result := nil;
end;

procedure TJSInt32Array._set(anArray: array of LongInt);
begin

end;

procedure TJSInt32Array._set(anArray: array of LongInt; anOffset: NativeInt);
begin

end;

{ TJSUint32Array }

class function TJSUint32Array.from(aValue: jsValue): TJSUInt32Array;
begin
  Result := nil;
end;

class function TJSUint32Array.from(aValue: jsValue;
  Map: TJSTypedArrayMapCallBack): TJSUInt32Array;
begin
  Result := nil;
end;

class function TJSUint32Array.from(aValue: jsValue;
  aMap: TJSTypedArrayMapEvent): TJSUInt32Array;
begin
  Result := nil;
end;

function TJSUint32Array.getTypedValue(Index: NativeInt): LongWord;
begin
  Result := 0;
end;

constructor TJSUint32Array.new(aObject: TJSObject);
begin

end;

constructor TJSUint32Array.new(atypedArray: TJSTypedArray);
begin

end;

constructor TJSUint32Array.new(length: NativeInt);
begin

end;

constructor TJSUint32Array.new(buffer: TJSArrayBuffer; aByteOffset,
  aLength: NativeInt);
begin

end;

constructor TJSUint32Array.new(buffer: TJSArrayBuffer; aByteOffset: NativeInt);
begin

end;

constructor TJSUint32Array.new(buffer: TJSArrayBuffer);
begin

end;

procedure TJSUint32Array.setTypedValue(Index: NativeInt; AValue: LongWord);
begin

end;

function TJSUint32Array.subarray(aBegin, aEnd: Integer): TJSUInt32Array;
begin
  Result := nil;
end;

function TJSUint32Array.subarray(aBegin: Integer): TJSUInt32Array;
begin
  Result := nil;
end;

class function TJSUint32Array._of(aValue: jsValue): TJSUInt32Array;
begin
  Result := nil;
end;

procedure TJSUint32Array._set(anArray: array of Cardinal);
begin

end;

procedure TJSUint32Array._set(anArray: array of Cardinal; anOffset: NativeInt);
begin

end;

{ TJSFloat32Array }

class function TJSFloat32Array.from(aValue: jsValue): TJSFloat32Array;
begin
  Result := nil;
end;

class function TJSFloat32Array.from(aValue: jsValue;
  Map: TJSTypedArrayMapCallBack): TJSFloat32Array;
begin
  Result := nil;
end;

class function TJSFloat32Array.from(aValue: jsValue;
  aMap: TJSTypedArrayMapEvent): TJSFloat32Array;
begin
  Result := nil;
end;

function TJSFloat32Array.getTypedValue(Index: NativeInt): Float32;
begin
  Result := 0;
end;

constructor TJSFloat32Array.new(aObject: TJSObject);
begin

end;

constructor TJSFloat32Array.new(atypedArray: TJSTypedArray);
begin

end;

constructor TJSFloat32Array.new(length: NativeInt);
begin

end;

constructor TJSFloat32Array.new(buffer: TJSArrayBuffer; aByteOffset,
  aLength: NativeInt);
begin

end;

constructor TJSFloat32Array.new(buffer: TJSArrayBuffer; aByteOffset: NativeInt);
begin

end;

constructor TJSFloat32Array.new(buffer: TJSArrayBuffer);
begin

end;

procedure TJSFloat32Array.setTypedValue(Index: NativeInt; AValue: Float32);
begin

end;

function TJSFloat32Array.subarray(aBegin, aEnd: Integer): TJSFloat32Array;
begin
  Result := nil;
end;

function TJSFloat32Array.subarray(aBegin: Integer): TJSFloat32Array;
begin
  Result := nil;
end;

class function TJSFloat32Array._of(aValue: jsValue): TJSFloat32Array;
begin
  Result := nil;
end;

procedure TJSFloat32Array._set(anArray: array of Double);
begin

end;

procedure TJSFloat32Array._set(anArray: array of Double; anOffset: NativeInt);
begin

end;

{ TJSFloat64Array }

class function TJSFloat64Array.from(aValue: jsValue): TJSFloat64Array;
begin
  Result := nil;
end;

class function TJSFloat64Array.from(aValue: jsValue;
  Map: TJSTypedArrayMapCallBack): TJSFloat64Array;
begin
  Result := nil;
end;

class function TJSFloat64Array.from(aValue: jsValue;
  aMap: TJSTypedArrayMapEvent): TJSFloat64Array;
begin
  Result := nil;
end;

function TJSFloat64Array.getTypedValue(Index: NativeInt): Float64;
begin
  Result := 0;
end;

constructor TJSFloat64Array.new(aObject: TJSObject);
begin

end;

constructor TJSFloat64Array.new(atypedArray: TJSTypedArray);
begin

end;

constructor TJSFloat64Array.new(length: NativeInt);
begin

end;

constructor TJSFloat64Array.new(buffer: TJSArrayBuffer; aByteOffset,
  aLength: NativeInt);
begin

end;

constructor TJSFloat64Array.new(buffer: TJSArrayBuffer; aByteOffset: NativeInt);
begin

end;

constructor TJSFloat64Array.new(buffer: TJSArrayBuffer);
begin

end;

procedure TJSFloat64Array.setTypedValue(Index: NativeInt; AValue: Float64);
begin

end;

function TJSFloat64Array.subarray(aBegin, aEnd: Integer): TJSFloat64Array;
begin
  Result := nil;
end;

function TJSFloat64Array.subarray(aBegin: Integer): TJSFloat64Array;
begin
  Result := nil;
end;

class function TJSFloat64Array._of(aValue: jsValue): TJSFloat64Array;
begin
  Result := nil;
end;

procedure TJSFloat64Array._set(anArray: array of Double);
begin

end;

procedure TJSFloat64Array._set(anArray: array of Double; anOffset: NativeInt);
begin

end;

{ TJSDataView }

function TJSDataView.getFloat32(aByteOffset: NativeInt): double;
begin
  Result := 0;
end;

function TJSDataView.getFloat32(aByteOffset: NativeInt;
  aLittleEndian: Boolean): double;
begin
  Result := 0;
end;

function TJSDataView.getFloat64(aByteOffset: NativeInt): double;
begin
  Result := 0;
end;

function TJSDataView.getFloat64(aByteOffset: NativeInt;
  aLittleEndian: Boolean): double;
begin
  Result := 0;
end;

function TJSDataView.getInt16(aByteOffset: NativeInt): SmallInt;
begin
  Result := 0;
end;

function TJSDataView.getInt16(aByteOffset: NativeInt;
  aLittleEndian: Boolean): SmallInt;
begin
  Result := 0;
end;

function TJSDataView.getInt32(aByteOffset: NativeInt): Longint;
begin
  Result := 0;
end;

function TJSDataView.getInt32(aByteOffset: NativeInt;
  aLittleEndian: Boolean): Longint;
begin
  Result := 0;
end;

function TJSDataView.getInt8(aByteOffset: NativeInt): ShortInt;
begin
  Result := 0;
end;

function TJSDataView.getUint16(aByteOffset: NativeInt): Word;
begin
  Result := 0;
end;

function TJSDataView.getUint16(aByteOffset: NativeInt;
  aLittleEndian: Boolean): Word;
begin
  Result := 0;
end;

function TJSDataView.getUint32(aByteOffset: NativeInt;
  aLittleEndian: Boolean): LongWord;
begin
  Result := 0;
end;

function TJSDataView.getUint32(aByteOffset: NativeInt): LongWord;
begin
  Result := 0;
end;

function TJSDataView.getUint8(aByteOffset: NativeInt): Byte;
begin
  Result := 0;
end;

constructor TJSDataView.new(aBuffer: TJSArrayBuffer);
begin

end;

constructor TJSDataView.new(aBuffer: TJSArrayBuffer; aOffset: NativeInt);
begin

end;

constructor TJSDataView.new(aBuffer: TJSArrayBuffer; aOffset,
  aByteLength: NativeInt);
begin

end;

procedure TJSDataView.setFloat32(aByteOffset: NativeInt; aValue: double;
  aLittleEndian: Boolean);
begin

end;

procedure TJSDataView.setFloat32(aByteOffset: NativeInt; aValue: double);
begin

end;

procedure TJSDataView.setFloat64(aByteOffset: NativeInt; aValue: double);
begin

end;

procedure TJSDataView.setFloat64(aByteOffset: NativeInt; aValue: double;
  aLittleEndian: Boolean);
begin

end;

procedure TJSDataView.setInt16(aByteOffset: NativeInt; aValue: SmallInt;
  aLittleEndian: Boolean);
begin

end;

procedure TJSDataView.setInt16(aByteOffset: NativeInt; aValue: SmallInt);
begin

end;

procedure TJSDataView.setInt32(aByteOffset: NativeInt; aValue: Longint);
begin

end;

procedure TJSDataView.setInt32(aByteOffset: NativeInt; aValue: Longint;
  aLittleEndian: Boolean);
begin

end;

procedure TJSDataView.setInt8(aByteOffset: NativeInt; aValue: ShortInt);
begin

end;

procedure TJSDataView.setUint16(aByteOffset: NativeInt; aValue: Word);
begin

end;

procedure TJSDataView.setUint16(aByteOffset: NativeInt; aValue: Word;
  aLittleEndian: Boolean);
begin

end;

procedure TJSDataView.setUint32(aByteOffset: NativeInt; aValue: LongWord;
  aLittleEndian: Boolean);
begin

end;

procedure TJSDataView.setUint32(aByteOffset: NativeInt; aValue: LongWord);
begin

end;

procedure TJSDataView.setUint8(aByteOffset: NativeInt; aValue: Byte);
begin

end;

{ TJSJSON }

class function TJSJSON.parse(aJSON: String): JSValue;
begin
  Result := nil;
end;

class function TJSJSON.parseObject(aJSON: String): TJSObject;
begin
  Result := nil;
end;

class function TJSJSON.stringify(aValue: JSValue): string;
begin
  Result := '';
end;

class function TJSJSON.stringify(aValue, aReplacer: JSValue): string;
begin
  Result := '';
end;

class function TJSJSON.stringify(aValue, aReplacer: JSValue;
  space: NativeInt): string;
begin
  Result := '';
end;

class function TJSJSON.stringify(aValue, aReplacer: JSValue;
  space: String): string;
begin
  Result := '';
end;

{ TJSError }

constructor TJSError.new;
begin

end;

constructor TJSError.new(const aMessage: string);
begin

end;

constructor TJSError.new(const aMessage, aFileName: string);
begin

end;

constructor TJSError.new(const aMessage, aFileName: string;
  aLineNumber: NativeInt);
begin

end;

{ TJSPromise }

class function TJSPromise.all(arg: TJSPromiseArray): TJSPromise;
begin
  Result := nil;
end;

class function TJSPromise.all(arg: JSValue): TJSPromise;
begin
  Result := nil;
end;

class function TJSPromise.all(arg: array of JSValue): TJSPromise;
begin
  Result := nil;
end;

function TJSPromise.catch(onRejected: TJSPromiseResolver): TJSPromise;
begin
  Result := nil;
end;

constructor TJSPromise.new(Executor: TJSPromiseExecutor);
begin

end;

class function TJSPromise.race(arg: array of JSValue): TJSPromise;
begin
  Result := nil;
end;

class function TJSPromise.race(arg: TJSPromiseArray): TJSPromise;
begin
  Result := nil;
end;

class function TJSPromise.race(arg: JSValue): TJSPromise;
begin
  Result := nil;
end;

class function TJSPromise.reject(reason: JSValue): TJSPromise;
begin
  Result := nil;
end;

class function TJSPromise.resolve: TJSPromise;
begin
  Result := nil;
end;

class function TJSPromise.resolve(value: JSValue): TJSPromise;
begin
  Result := nil;
end;

function TJSPromise._finally(value: TJSPromiseFinallyHandler): TJSPromise;
begin
  Result := nil;
end;

function TJSPromise._then(onAccepted,
  OnRejected: TJSPromiseResolver): TJSPromise;
begin
  Result := nil;
end;

function TJSPromise._then(onAccepted: TJSPromiseResolver): TJSPromise;
begin
  Result := nil;
end;

{ TJSFunctionArguments }

function TJSFunctionArguments.GetElements(Index: NativeInt): JSValue;
begin
  Result := nil;
end;

procedure TJSFunctionArguments.SetElements(Index: NativeInt;
  const AValue: JSValue);
begin

end;

{ TJSAsyncIterator }

function TJSAsyncIterator.next: TJSIteratorResult;
begin
  Result := nil;
end;
{$ENDIF}

end.

