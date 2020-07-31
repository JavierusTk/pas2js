{
    This file is part of the Pas2JS run time library.
    Copyright (c) 2018 by Mattias Gaertner

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}
unit TypInfo;

{$IFDEF PAS2JS}
{$mode objfpc}
{$modeswitch externalclass}
{$ENDIF}

interface

uses
  SysUtils, Types, RTLConsts, JS;

type
  // if you change the following enumeration type in any way
  // you also have to change the rtl.js in an appropriate way !
  TTypeKind = (
    tkUnknown,  // 0
    tkInteger,  // 1
    tkChar,     // 2 in Delphi/FPC tkWChar, tkUChar
    tkString,   // 3 in Delphi/FPC tkSString, tkWString or tkUString
    tkEnumeration, // 4
    tkSet,      // 5
    tkDouble,   // 6
    tkBool,     // 7
    tkProcVar,  // 8  function or procedure
    tkMethod,   // 9  proc var of object
    tkArray,    // 10 static array
    tkDynArray, // 11
    tkRecord,   // 12
    tkClass,    // 13
    tkClassRef, // 14
    tkPointer,  // 15
    tkJSValue,  // 16
    tkRefToProcVar, // 17  variable of procedure type
    tkInterface, // 18
    //tkObject,
    //tkSString,tkLString,tkAString,tkWString,
    //tkVariant,
    //tkWChar,
    //tkInt64,
    //tkQWord,
    //tkInterfaceRaw,
    //tkUString,tkUChar,
    tkHelper,   // 19
    //tkFile,
    tkExtClass  // 20
    );
  TTypeKinds = set of TTypeKind;

  // TCallConv for compatibility with Delphi/FPC, ignored under pas2js
  TCallConv = (ccReg, ccCdecl, ccPascal, ccStdCall, ccSafeCall, ccCppdecl,
    ccFar16, ccOldFPCCall, ccInternProc, ccSysCall, ccSoftFloat, ccMWPascal);

const
  tkFloat = tkDouble; // for compatibility with Delphi/FPC
  tkProcedure = tkProcVar; // for compatibility with Delphi
  tkAny = [Low(TTypeKind)..High(TTypeKind)];
  tkMethods = [tkMethod];
  tkProperties = tkAny-tkMethods-[tkUnknown];

type

  { TTypeInfoModule }

  TTypeInfoModule = class {$IFDEF PAS2JS}external name 'pasmodule'{$ENDIF}
  public
    Name: String; {$IFDEF PAS2JS}external name '$name';{$ENDIF}
  end;

  TTypeInfoAttributes = type TJSValueDynArray;

  { TTypeInfo }

  TTypeInfo = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfo'{$ENDIF}
  public
    Name: String; {$IFDEF PAS2JS}external name 'name';{$ENDIF}
    Kind: TTypeKind; {$IFDEF PAS2JS}external name 'kind';{$ENDIF}
    Attributes: TTypeInfoAttributes; {$IFDEF PAS2JS}external name 'attr';{$ENDIF} // can be undefined
    Module: TTypeInfoModule; {$IFDEF PAS2JS}external name '$module';{$ENDIF} // can be undefined
  end;
  TTypeInfoClassOf = class of TTypeInfo;

  PTypeInfo = Pointer; // for compatibility with Delphi/FPC, under pas2js it is a TTypeInfo

  TOrdType  = (
    otSByte,      // 0
    otUByte,      // 1
    otSWord,      // 2
    otUWord,      // 3
    otSLong,      // 4
    otULong,      // 5
    otSIntDouble, // 6 NativeInt
    otUIntDouble  // 7 NativeUInt
    );

  { TTypeInfoInteger - Kind = tkInteger }

  TTypeInfoInteger = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoInteger'(TTypeInfo){$ENDIF}
  public
    MinValue: NativeInt; {$IFDEF PAS2JS}external name 'minvalue';{$ENDIF}
    MaxValue: NativeInt; {$IFDEF PAS2JS}external name 'maxvalue';{$ENDIF}
    OrdType : TOrdType; {$IFDEF PAS2JS}external name 'ordtype';{$ENDIF}
  end;

  { TEnumType }

  TEnumType = class {$IFDEF PAS2JS}external name 'anonymous'{$ENDIF}
  private
    function GetIntToName(Index: NativeInt): String; {$IFDEF PAS2JS}external name '[]';{$ENDIF}
    function GetNameToInt(Name: String): NativeInt; {$IFDEF PAS2JS}external name '[]';{$ENDIF}
  public
    property IntToName[Index: NativeInt]: String read GetIntToName;
    property NameToInt[Name: String]: NativeInt read GetNameToInt;
  end;

  { TTypeInfoEnum - Kind = tkEnumeration }

  TTypeInfoEnum = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoEnum'(TTypeInfoInteger){$ENDIF}
  public
    // not supported: BaseType: TTypeInfo
    EnumType: TEnumType; {$IFDEF PAS2JS}external name 'enumtype';{$ENDIF}
  end;

  { TTypeInfoSet - Kind = tkSet }

  TTypeInfoSet = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoSet'(TTypeInfo){$ENDIF}
  public
    // not supported: BaseType: TTypeInfo
    CompType: TTypeInfo; {$IFDEF PAS2JS}external name 'comptype';{$ENDIF}
  end;

  { TTypeInfoStaticArray - Kind = tkArray }

  TTypeInfoStaticArray = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoStaticArray'(TTypeInfo){$ENDIF}
  public
    Dims: TIntegerDynArray;
    ElType: TTypeInfo; {$IFDEF PAS2JS}external name 'eltype';{$ENDIF}
  end;

  { TTypeInfoDynArray - Kind = tkDynArray }

  TTypeInfoDynArray = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoDynArray'(TTypeInfo){$ENDIF}
  public
    DimCount: NativeInt; {$IFDEF PAS2JS}external name 'dimcount';{$ENDIF}
    ElType: TTypeInfo; {$IFDEF PAS2JS}external name 'eltype';{$ENDIF}
  end;

  TParamFlag     = (
    pfVar,     // 2^0 = 1
    pfConst,   // 2^1 = 2
    pfOut,     // 2^2 = 4
    pfArray,   // 2^3 = 8
    pfAddress, // 2^4 = 16
    pfReference // 2^5 = 32
    );
  TParamFlags = set of TParamFlag;

  { TProcedureParam }

  TProcedureParam = class {$IFDEF PAS2JS}external name 'anonymous'{$ENDIF}
  public
    Name: String; {$IFDEF PAS2JS}external name 'name';{$ENDIF}
    TypeInfo: TTypeInfo; {$IFDEF PAS2JS}external name 'typeinfo';{$ENDIF}
    Flags: NativeInt; {$IFDEF PAS2JS}external name 'flags';{$ENDIF} // TParamFlags as bit vector
  end;

  TProcedureParams = array of TProcedureParam;

  TProcedureFlag = (
    pfStatic,   // 2^0 = 1
    pfVarargs,  // 2^1 = 2
    pfExternal  // 2^2 = 4  name may be an expression
    );
  TProcedureFlags = set of TProcedureFlag;

  { TProcedureSignature }

  TProcedureSignature = class {$IFDEF PAS2JS}external name 'anonymous'{$ENDIF}
  public
    Params: TProcedureParams; {$IFDEF PAS2JS}external name 'params';{$ENDIF} // can be null
    ResultType: TTypeInfo; {$IFDEF PAS2JS}external name 'resulttype';{$ENDIF} // can be null
    Flags: NativeInt; {$IFDEF PAS2JS}external name 'flags';{$ENDIF} // TProcedureFlags as bit vector
  end;

  { TTypeInfoProcVar - Kind = tkProcVar }

  TTypeInfoProcVar = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoProcVar'(TTypeInfo){$ENDIF}
  public
    ProcSig: TProcedureSignature; {$IFDEF PAS2JS}external name 'procsig';{$ENDIF}
  end;

  { TTypeInfoRefToProcVar - Kind = tkRefToProcVar }

  TTypeInfoRefToProcVar = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoRefToProcVar'(TTypeInfoProcVar){$ENDIF}
  end;

  TMethodKind = (
    mkProcedure,     // 0  default
    mkFunction,      // 1
    mkConstructor,   // 2
    mkDestructor,    // 3
    mkClassProcedure,// 4
    mkClassFunction  // 5
    //mkClassConstructor,mkClassDestructor,mkOperatorOverload
    );
  TMethodKinds = set of TMethodKind;

  { TTypeInfoMethodVar - Kind = tkMethod }

  TTypeInfoMethodVar = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoMethodVar'(TTypeInfoProcVar){$ENDIF}
  public
    MethodKind: TMethodKind {$IFDEF PAS2JS}external name 'methodkind';{$ENDIF}
  end;

  TTypeMemberKind = (
    tmkUnknown,  // 0
    tmkField,    // 1
    tmkMethod,   // 2
    tmkProperty  // 3
    );
  TTypeMemberKinds = set of TTypeMemberKind;

  { TTypeMember }

  TTypeMember = class {$IFDEF PAS2JS}external name 'rtl.tTypeMember'{$ENDIF}
  public
    Name: String; {$IFDEF PAS2JS}external name 'name';{$ENDIF}
    Kind: TTypeMemberKind; {$IFDEF PAS2JS}external name 'kind';{$ENDIF}
    Attributes: TTypeInfoAttributes; {$IFDEF PAS2JS}external name 'attr';{$ENDIF} // can be undefined
  end;
  TTypeMemberDynArray = array of TTypeMember;

  { TTypeMemberField - Kind = tmkField }

  TTypeMemberField = class {$IFDEF PAS2JS}external name 'rtl.tTypeMemberField'(TTypeMember){$ENDIF}
  public
    TypeInfo: TTypeInfo; {$IFDEF PAS2JS}external name 'typeinfo';{$ENDIF}
  end;

  { TTypeMemberMethod - Kind = tmkMethod }

  TTypeMemberMethod = class {$IFDEF PAS2JS}external name 'rtl.tTypeMemberMethod'(TTypeMember){$ENDIF}
  public
    MethodKind: TMethodKind; {$IFDEF PAS2JS}external name 'methodkind';{$ENDIF}
    ProcSig: TProcedureSignature; {$IFDEF PAS2JS}external name 'procsig';{$ENDIF}
  end;
  TTypeMemberMethodDynArray = array of TTypeMemberMethod;

const
  pfGetFunction = 1; // getter is a function
  pfSetProcedure = 2; // setter is a procedure
  // stored is a 2-bit vector:
  pfStoredFalse = 4; // stored false, never
  pfStoredField = 8; // stored field, field name is in Stored
  pfStoredFunction = 12; // stored function, function name is in Stored
  pfHasIndex = 16; { if getter is function, append Index as last param
                     if setter is function, append Index as second last param }
type
  { TTypeMemberProperty - Kind = tmkProperty }

  TTypeMemberProperty = class {$IFDEF PAS2JS}external name 'rtl.tTypeMemberProperty'(TTypeMember){$ENDIF}
  public
    TypeInfo: TTypeInfo; {$IFDEF PAS2JS}external name 'typeinfo';{$ENDIF}
    Flags: NativeInt; {$IFDEF PAS2JS}external name 'flags';{$ENDIF} // bit vector, see pf constants above
    Params: TProcedureParams; {$IFDEF PAS2JS}external name 'params';{$ENDIF} // can be null or undefined
    Index: JSValue; {$IFDEF PAS2JS}external name 'index';{$ENDIF} // can be undefined
    Getter: String; {$IFDEF PAS2JS}external name 'getter';{$ENDIF} // name of field or function
    Setter: String; {$IFDEF PAS2JS}external name 'setter';{$ENDIF} // name of field or function
    Stored: String; {$IFDEF PAS2JS}external name 'stored';{$ENDIF} // name of field or function, can be undefined
    Default: JSValue; {$IFDEF PAS2JS}external name 'Default';{$ENDIF} // can be undefined
  end;
  TTypeMemberPropertyDynArray = array of TTypeMemberProperty;

  { TTypeMembers }

  TTypeMembers = class {$IFDEF PAS2JS}external name 'rtl.tTypeMembers'{$ENDIF}
  private
    function GetItems(Name: String): TTypeMember;{$IFDEF PAS2JS} external name '[]';{$ENDIF}
    procedure SetItems(Name: String; const AValue: TTypeMember); {$IFDEF PAS2JS}external name '[]';{$ENDIF}
  public
    property Members[Name: String]: TTypeMember read GetItems write SetItems; default;
  end;

  { TTypeInfoStruct }

  TTypeInfoStruct = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoStruct'(TTypeInfo){$ENDIF}
  private
    FFieldCount: NativeInt; {$IFDEF PAS2JS}external name 'fields.length';{$ENDIF}
    FMethodCount: NativeInt; {$IFDEF PAS2JS}external name 'methods.length';{$ENDIF}
    FPropCount: NativeInt; {$IFDEF PAS2JS}external name 'properties.length';{$ENDIF}
  public
    Members: TTypeMembers; {$IFDEF PAS2JS}external name 'members';{$ENDIF}
    Names: TStringDynArray; {$IFDEF PAS2JS}external name 'names';{$ENDIF} // all member names with TTypeInfo
    Fields: TStringDynArray; {$IFDEF PAS2JS}external name 'fields';{$ENDIF}
    Methods: TStringDynArray; {$IFDEF PAS2JS}external name 'methods';{$ENDIF}
    Properties: TStringDynArray; {$IFDEF PAS2JS}external name 'properties';{$ENDIF}
    property FieldCount: NativeInt read FFieldCount;
    function GetField(Index: NativeInt): TTypeMemberField; {$IFDEF PAS2JS}external name 'getField';{$ENDIF}
    function AddField(aName: String; aType: TTypeInfo; Options: TJSObject = nil
      ): TTypeMemberField; {$IFDEF PAS2JS}external name 'addField';{$ENDIF}
    property MethodCount: NativeInt read FMethodCount;
    function GetMethod(Index: NativeInt): TTypeMemberMethod; {$IFDEF PAS2JS}external name 'getMethod';{$ENDIF}
    function AddMethod(aName: String; MethodKind: TMethodKind = mkProcedure;
      Params: TJSArray = nil; ResultType: TTypeInfo = nil;
      Options: TJSObject = nil): TTypeMemberMethod; {$IFDEF PAS2JS}external name 'addMethod';{$ENDIF}
    property PropCount: NativeInt read FPropCount;
    function GetProp(Index: NativeInt): TTypeMemberProperty; {$IFDEF PAS2JS}external name 'getProperty';{$ENDIF}
    function AddProperty(aName: String; Flags: NativeInt; ResultType: TTypeInfo;
      Getter, Setter: String; Options: TJSObject = nil): TTypeMemberProperty; {$IFDEF PAS2JS}external name 'addProperty';{$ENDIF}
  end;

  { TTypeInfoRecord - Kind = tkRecord }

  TTypeInfoRecord = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoRecord'(TTypeInfoStruct){$ENDIF}
  public
    RecordType: TJSObject; {$IFDEF PAS2JS}external name 'record';{$ENDIF}
  end;

  { TTypeInfoClass - Kind = tkClass }

  TTypeInfoClass = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoClass'(TTypeInfoStruct){$ENDIF}
  public
    ClassType: TClass; {$IFDEF PAS2JS}external name 'class';{$ENDIF}
    Ancestor: TTypeInfoClass; {$IFDEF PAS2JS}external name 'ancestor';{$ENDIF}
  end;

  { TTypeInfoExtClass - Kind = tkExtClass }

  TTypeInfoExtClass = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoExtClass'(TTypeInfoClass){$ENDIF}
  public
    JSClassName: String; {$IFDEF PAS2JS}external name 'jsclass';{$ENDIF}
  end;

  { TTypeInfoClassRef - class-of, Kind = tkClassRef }

  TTypeInfoClassRef = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoClassRef'(TTypeInfo){$ENDIF}
  public
    InstanceType: TTypeInfo; {$IFDEF PAS2JS}external name 'instancetype';{$ENDIF}
  end;

  { TTypeInfoPointer - Kind = tkPointer }

  TTypeInfoPointer = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoPointer'(TTypeInfo){$ENDIF}
  public
    RefType: TTypeInfo; {$IFDEF PAS2JS}external name 'reftype';{$ENDIF} // can be null
  end;

  { TTypeInfoInterface - Kind = tkInterface }

  TTypeInfoInterface = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoInterface'(TTypeInfoStruct){$ENDIF}
  public
    InterfaceType: TJSObject; {$IFDEF PAS2JS}external name 'interface';{$ENDIF}
    Ancestor: TTypeInfoInterface; {$IFDEF PAS2JS}external name 'ancestor';{$ENDIF}
  end;

  { TTypeInfoHelper - Kind = tkHelper }

  TTypeInfoHelper = class {$IFDEF PAS2JS}external name 'rtl.tTypeInfoHelper'(TTypeInfoStruct){$ENDIF}
  public
    HelperType: TJSObject; {$IFDEF PAS2JS}external name 'helper';{$ENDIF}
    Ancestor: TTypeInfoHelper; {$IFDEF PAS2JS}external name 'ancestor';{$ENDIF}
    HelperFor: TTypeInfo; {$IFDEF PAS2JS}external name 'helperfor';{$ENDIF}
  end;

  EPropertyError  = class(Exception);

function GetClassMembers(aTIStruct: TTypeInfoStruct): TTypeMemberDynArray;
function GetClassMember(aTIStruct: TTypeInfoStruct; const aName: String): TTypeMember;
function GetInstanceMethod(Instance: TObject; const aName: String): Pointer;
function GetClassMethods(aTIStruct: TTypeInfoStruct): TTypeMemberMethodDynArray;
function CreateMethod(Instance: TObject; FuncName: String): Pointer; {$IFDEF PAS2JS}external name 'rtl.createCallback';{$ENDIF}

function GetInterfaceMembers(aTIInterface: TTypeInfoInterface): TTypeMemberDynArray;
function GetInterfaceMember(aTIInterface: TTypeInfoInterface; const aName: String): TTypeMember;
function GetInterfaceMethods(aTIInterface: TTypeInfoInterface): TTypeMemberMethodDynArray;

{$IFDEF PAS2JS}function GetRTTIAttributes(const Attributes: TTypeInfoAttributes): TCustomAttributeArray;{$ENDIF}

function GetPropInfos(aTIStruct: TTypeInfoStruct): TTypeMemberPropertyDynArray;
function GetPropList(aTIStruct: TTypeInfoStruct; TypeKinds: TTypeKinds; Sorted: boolean = true): TTypeMemberPropertyDynArray; overload;
function GetPropList(aTIStruct: TTypeInfoStruct): TTypeMemberPropertyDynArray; overload;
function GetPropList(AClass: TClass): TTypeMemberPropertyDynArray; overload;
function GetPropList(Instance: TObject): TTypeMemberPropertyDynArray; overload;

function GetPropInfo(TI: TTypeInfoStruct; const PropName: String): TTypeMemberProperty; overload;
function GetPropInfo(TI: TTypeInfoStruct; const PropName: String; const Kinds: TTypeKinds): TTypeMemberProperty; overload;
function GetPropInfo(Instance: TObject; const PropName: String): TTypeMemberProperty; overload;
function GetPropInfo(Instance: TObject; const PropName: String; const Kinds: TTypeKinds): TTypeMemberProperty; overload;
function GetPropInfo(aClass: TClass; const PropName: String): TTypeMemberProperty; overload;
function GetPropInfo(aClass: TClass; const PropName: String; const Kinds: TTypeKinds): TTypeMemberProperty; overload;

function FindPropInfo(Instance: TObject; const PropName: String): TTypeMemberProperty; overload;
function FindPropInfo(Instance: TObject; const PropName: String; const Kinds: TTypeKinds): TTypeMemberProperty; overload;
function FindPropInfo(aClass: TClass; const PropName: String): TTypeMemberProperty; overload;
function FindPropInfo(aClass: TClass; const PropName: String; const Kinds: TTypeKinds): TTypeMemberProperty; overload;

// Property information routines.
Function IsStoredProp(Instance: TObject; const PropInfo: TTypeMemberProperty): Boolean; overload;
Function IsStoredProp(Instance: TObject; const PropName: string): Boolean; overload;
function IsPublishedProp(Instance: TObject; const PropName: String): Boolean; overload;
function IsPublishedProp(aClass: TClass; const PropName: String): Boolean; overload;
function PropType(Instance: TObject; const PropName: string): TTypeKind; overload;
function PropType(aClass: TClass; const PropName: string): TTypeKind; overload;
function PropIsType(Instance: TObject; const PropName: string; const TypeKind: TTypeKind): Boolean; overload;
function PropIsType(aClass: TClass; const PropName: string; const TypeKind: TTypeKind): Boolean; overload;

function GetJSValueProp(Instance: TJSObject; TI: TTypeInfoStruct; const PropName: String): JSValue; overload;
function GetJSValueProp(Instance: TJSObject; const PropInfo: TTypeMemberProperty): JSValue; overload;
function GetJSValueProp(Instance: TObject; const PropName: String): JSValue; overload;
function GetJSValueProp(Instance: TObject; const PropInfo: TTypeMemberProperty): JSValue; overload;
procedure SetJSValueProp(Instance: TJSObject; TI: TTypeInfoStruct; const PropName: String; Value: JSValue); overload;
procedure SetJSValueProp(Instance: TJSObject; const PropInfo: TTypeMemberProperty; Value: JSValue); overload;
procedure SetJSValueProp(Instance: TObject; const PropName: String; Value: JSValue); overload;
procedure SetJSValueProp(Instance: TObject; const PropInfo: TTypeMemberProperty; Value: JSValue); overload;

function GetNativeIntProp(Instance: TObject; const PropName: String): NativeInt; overload;
function GetNativeIntProp(Instance: TObject; const PropInfo: TTypeMemberProperty): NativeInt; overload;
procedure SetNativeIntProp(Instance: TObject; const PropName: String; Value: NativeInt); overload;
procedure SetNativeIntProp(Instance: TObject; const PropInfo: TTypeMemberProperty; Value: NativeInt); overload;

function GetOrdProp(Instance: TObject; const PropName: String): longint; overload;
function GetOrdProp(Instance: TObject; const PropInfo: TTypeMemberProperty): longint; overload;
procedure SetOrdProp(Instance: TObject; const PropName: String; Value: longint); overload;
procedure SetOrdProp(Instance: TObject; const PropInfo: TTypeMemberProperty; Value: longint); overload;

function GetEnumProp(Instance: TObject; const PropName: String): String; overload;
function GetEnumProp(Instance: TObject; const PropInfo: TTypeMemberProperty): String; overload;
procedure SetEnumProp(Instance: TObject; const PropName: String; const Value: String); overload;
procedure SetEnumProp(Instance: TObject; const PropInfo: TTypeMemberProperty; const Value: String); overload;
// Auxiliary routines, which may be useful
function GetEnumName(TypeInfo: TTypeInfoEnum; Value: Integer): String;
function GetEnumValue(TypeInfo: TTypeInfoEnum; const Name: string): Longint;
function GetEnumNameCount(TypeInfo: TTypeInfoEnum): Longint;

function GetSetProp(Instance: TObject; const PropName: String): String; overload;
function GetSetProp(Instance: TObject; const PropInfo: TTypeMemberProperty): String; overload;
function GetSetPropArray(Instance: TObject; const PropName: String): TIntegerDynArray; overload;
function GetSetPropArray(Instance: TObject; const PropInfo: TTypeMemberProperty): TIntegerDynArray; overload;
procedure SetSetPropArray(Instance: TObject; const PropName: String; const Arr: TIntegerDynArray); overload;
procedure SetSetPropArray(Instance: TObject; const PropInfo: TTypeMemberProperty; const Arr: TIntegerDynArray); overload;

function GetBoolProp(Instance: TObject; const PropName: String): boolean; overload;
function GetBoolProp(Instance: TObject; const PropInfo: TTypeMemberProperty): boolean; overload;
procedure SetBoolProp(Instance: TObject; const PropName: String; Value: boolean); overload;
procedure SetBoolProp(Instance: TObject; const PropInfo: TTypeMemberProperty; Value: boolean); overload;

function GetStrProp(Instance: TObject; const PropName: String): String; overload;
function GetStrProp(Instance: TObject; const PropInfo: TTypeMemberProperty): String; overload;
procedure SetStrProp(Instance: TObject; const PropName: String; Value: String); overload;
procedure SetStrProp(Instance: TObject; const PropInfo: TTypeMemberProperty; Value: String); overload;

function GetStringProp(Instance: TObject; const PropName: String): String; deprecated; overload; // use GetStrProp
function GetStringProp(Instance: TObject; const PropInfo: TTypeMemberProperty): String; deprecated; overload; // use GetStrProp
procedure SetStringProp(Instance: TObject; const PropName: String; Value: String); deprecated; overload; // use GetStrProp
procedure SetStringProp(Instance: TObject; const PropInfo: TTypeMemberProperty; Value: String); deprecated; overload; // use GetStrProp

function  GetFloatProp(Instance: TObject; const PropName: string): Double; overload;
function  GetFloatProp(Instance: TObject; PropInfo : TTypeMemberProperty) : Double; overload;
procedure SetFloatProp(Instance: TObject; const PropName: string; Value: Double); overload;
procedure SetFloatProp(Instance: TObject; PropInfo : TTypeMemberProperty;  Value : Double); overload;

function GetObjectProp(Instance: TObject; const PropName: String): TObject; overload;
function GetObjectProp(Instance: TObject; const PropName: String; MinClass: TClass): TObject; overload;
function GetObjectProp(Instance: TObject; const PropInfo: TTypeMemberProperty):  TObject; overload;
function GetObjectProp(Instance: TObject; const PropInfo: TTypeMemberProperty; MinClass: TClass):  TObject; overload;
procedure SetObjectProp(Instance: TObject; const PropName: String; Value: TObject); overload;
procedure SetObjectProp(Instance: TObject; const PropInfo: TTypeMemberProperty; Value: TObject); overload;

function GetMethodProp(Instance: TObject; PropInfo: TTypeMemberProperty): TMethod; overload;
function GetMethodProp(Instance: TObject; const PropName: string): TMethod; overload;
procedure SetMethodProp(Instance: TObject; PropInfo: TTypeMemberProperty;  const Value : TMethod); overload;
procedure SetMethodProp(Instance: TObject; const PropName: string; const Value: TMethod); overload;

function GetInterfaceProp(Instance: TObject; const PropName: string): IInterface; overload;
function GetInterfaceProp(Instance: TObject; PropInfo: TTypeMemberProperty): IInterface; overload;
procedure SetInterfaceProp(Instance: TObject; const PropName: string; const Value: IInterface); overload;
procedure SetInterfaceProp(Instance: TObject; PropInfo: TTypeMemberProperty; const Value: IInterface); overload;

function GetRawInterfaceProp(Instance: TObject; const PropName: string): Pointer; overload;
function GetRawInterfaceProp(Instance: TObject; PropInfo: TTypeMemberProperty): Pointer; overload;
procedure SetRawInterfaceProp(Instance: TObject; const PropName: string; const Value: Pointer); overload;
procedure SetRawInterfaceProp(Instance: TObject; PropInfo: TTypeMemberProperty; const Value: Pointer); overload;

implementation

function GetClassMembers(aTIStruct: TTypeInfoStruct): TTypeMemberDynArray;
var
  C: TTypeInfoStruct;
  i: Integer;
  PropName: String;
  Names: TJSObject;
begin
  {$IFDEF PAS2JS}
  Result:=nil;
  Names:=TJSObject.new;
  C:=aTIStruct;
  while C<>nil do
  begin
    for i:=0 to length(C.Names)-1 do
    begin
      PropName:=C.Names[i];
      if Names.hasOwnProperty(PropName) then continue;
      TJSArray(Result).push(C.Members[PropName]);
      Names[PropName]:=true;
    end;
    if not (C is TTypeInfoClass) then break;
    C:=TTypeInfoClass(C).Ancestor;
  end;
  {$ENDIF}
end;

function GetClassMember(aTIStruct: TTypeInfoStruct; const aName: String): TTypeMember;
var
  C: TTypeInfoStruct;
  i: Integer;
begin
  {$IFDEF PAS2JS}
  // quick search: case sensitive
  C:=aTIStruct;
  while C<>nil do
  begin
    if TJSObject(C.Members).hasOwnProperty(aName) then
      exit(C.Members[aName]);
    if not (C is TTypeInfoClass) then break;
    C:=TTypeInfoClass(C).Ancestor;
  end;
  // slow search: case insensitive
  C:=aTIStruct;
  while C<>nil do
  begin
    for i:=0 to length(C.Names)-1 do
      if CompareText(C.Names[i],aName)=0 then
        exit(C.Members[C.Names[i]]);
    if not (C is TTypeInfoClass) then break;
    C:=TTypeInfoClass(C).Ancestor;
  end;
  Result:=nil;
  {$ENDIF}
end;

function GetInstanceMethod(Instance: TObject; const aName: String): Pointer;
var
  TI: TTypeMember;
begin
  {$IFDEF PAS2JS}
  if Instance=nil then exit(nil);
  TI:=GetClassMember(TypeInfo(Instance),aName);
  if not (TI is TTypeMemberMethod) then exit(nil);
  Result:=CreateMethod(Instance,TI.Name); // Note: use TI.Name for the correct case!
  {$ENDIF}
end;

{$IFDEF DCC}
function CreateMethod(Instance: TObject; FuncName: String): Pointer;
begin
  Result := nil;
end;
{$ENDIF}

function GetClassMethods(aTIStruct: TTypeInfoStruct): TTypeMemberMethodDynArray;
var
  C: TTypeInfoStruct;
  i, Cnt, j: Integer;
begin
  {$IFDEF PAS2JS}
  Cnt:=0;
  C:=aTIStruct;
  while C<>nil do
  begin
    inc(Cnt,C.MethodCount);
    if not (C is TTypeInfoClass) then break;
    C:=TTypeInfoClass(C).Ancestor;
  end;
  SetLength(Result,Cnt);
  C:=aTIStruct;
  i:=0;
  while C<>nil do
  begin
    for j:=0 to C.MethodCount-1 do
    begin
      Result[i]:=TTypeMemberMethod(C.Members[C.Methods[j]]);
      inc(i);
    end;
    if not (C is TTypeInfoClass) then break;
    C:=TTypeInfoClass(C).Ancestor;
  end;
  {$ENDIF}
end;

function GetInterfaceMembers(aTIInterface: TTypeInfoInterface
  ): TTypeMemberDynArray;
var
  Intf: TTypeInfoInterface;
  i, Cnt, j: Integer;
begin
  {$IFDEF PAS2JS}
  Cnt:=0;
  Intf:=aTIInterface;
  while Intf<>nil do
  begin
    inc(Cnt,length(Intf.Names));
    Intf:=Intf.Ancestor;
  end;
  SetLength(Result,Cnt);
  Intf:=aTIInterface;
  i:=0;
  while Intf<>nil do
  begin
    for j:=0 to length(Intf.Names)-1 do
    begin
      Result[i]:=Intf.Members[Intf.Names[j]];
      inc(i);
    end;
    Intf:=Intf.Ancestor;
  end;
  {$ENDIF}
end;

function GetInterfaceMember(aTIInterface: TTypeInfoInterface;
  const aName: String): TTypeMember;
var
  Intf: TTypeInfoInterface;
  i: Integer;
begin
  // quick search: case sensitive
  {$IFDEF PAS2JS}
  Intf:=aTIInterface;
  while Intf<>nil do
  begin
    if TJSObject(Intf.Members).hasOwnProperty(aName) then
      exit(Intf.Members[aName]);
    Intf:=Intf.Ancestor;
  end;
  // slow search: case insensitive
  Intf:=aTIInterface;
  while Intf<>nil do
  begin
    for i:=0 to length(Intf.Names)-1 do
      if CompareText(Intf.Names[i],aName)=0 then
        exit(Intf.Members[Intf.Names[i]]);
    Intf:=Intf.Ancestor;
  end;
  Result:=nil;
  {$ENDIF}
end;

function GetInterfaceMethods(aTIInterface: TTypeInfoInterface
  ): TTypeMemberMethodDynArray;
var
  Intf: TTypeInfoInterface;
  i, Cnt, j: Integer;
begin
  {$IFDEF PAS2JS}
  Cnt:=0;
  Intf:=aTIInterface;
  while Intf<>nil do
  begin
    inc(Cnt,Intf.MethodCount);
    Intf:=Intf.Ancestor;
  end;
  SetLength(Result,Cnt);
  Intf:=aTIInterface;
  i:=0;
  while Intf<>nil do
  begin
    for j:=0 to Intf.MethodCount-1 do
    begin
      Result[i]:=TTypeMemberMethod(Intf.Members[Intf.Methods[j]]);
      inc(i);
    end;
    Intf:=Intf.Ancestor;
  end;
  {$ENDIF}
end;

type
  TCreatorAttribute = class {$IFDEF PAS2JS}external name 'attr'{$ENDIF}
    class function Create(const ProcName: string): TCustomAttribute; overload; {$IFDEF PAS2JS}external name '$create';{$ENDIF}
    class function Create(const ProcName: string; Params: jsvalue): TCustomAttribute; overload; {$IFDEF PAS2JS}external name '$create';{$ENDIF}
  end;
  TCreatorAttributeClass = class of TCreatorAttribute;
{$IFDEF PAS2JS}
function GetRTTIAttributes(const Attributes: TTypeInfoAttributes
  ): TCustomAttributeArray;
var
  i, len: Integer;
  AttrClass: TCreatorAttributeClass;
  ProcName: String;
  Attr: TCustomAttribute;
begin
  Result:=nil;
  if Attributes=Undefined then exit;
  i:=0;
  len:=length(Attributes);
  while i<len do
    begin
    AttrClass:=TCreatorAttributeClass(Attributes[i]);
    inc(i);
    ProcName:=String(Attributes[i]);
    inc(i);
    if (i<len) and isArray(Attributes[i]) then
      begin
      Attr:=AttrClass.Create(ProcName,Attributes[i]);
      inc(i);
      end
    else
      Attr:=AttrClass.Create(ProcName);
    Insert(Attr,Result,length(Result));
    end;
end;
{$ENDIF}

function GetPropInfos(aTIStruct: TTypeInfoStruct): TTypeMemberPropertyDynArray;
var
  C: TTypeInfoStruct;
  i: Integer;
  Names: TJSObject;
  PropName: String;
begin
  {$IFDEF PAS2JS}
  Result:=nil;
  C:=aTIStruct;
  Names:=TJSObject.new;
  while C<>nil do
  begin
    for i:=0 to C.PropCount-1 do
    begin
      PropName:=C.Properties[i];
      if Names.hasOwnProperty(PropName) then continue;
      TJSArray(Result).push(TTypeMemberProperty(C.Members[PropName]));
      Names[PropName]:=true;
    end;
    if not (C is TTypeInfoClass) then
      break;
    C:=TTypeInfoClass(C).Ancestor;
  end;
  {$ENDIF}
end;

function GetPropList(aTIStruct: TTypeInfoStruct; TypeKinds: TTypeKinds;
  Sorted: boolean): TTypeMemberPropertyDynArray;

  function NameSort(a,b: JSValue): NativeInt;
  begin
    {$IFDEF PAS2JS}
    if TTypeMemberProperty(a).Name<TTypeMemberProperty(b).Name then
      Result:=-1
    else if TTypeMemberProperty(a).Name>TTypeMemberProperty(b).Name then
      Result:=1
    else
      Result:=0;
    {$ENDIF}
  end;

var
  C: TTypeInfoStruct;
  i: Integer;
  Names: TJSObject;
  PropName: String;
  Prop: TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}
  Result:=nil;
  C:=aTIStruct;
  Names:=TJSObject.new;
  while C<>nil do
  begin
    for i:=0 to C.PropCount-1 do
    begin
      PropName:=C.Properties[i];
      if Names.hasOwnProperty(PropName) then continue;
      Prop:=TTypeMemberProperty(C.Members[PropName]);
      if not (Prop.TypeInfo.Kind in TypeKinds) then continue;
      TJSArray(Result).push(Prop);
      Names[PropName]:=true;
    end;
    if not (C is TTypeInfoClass) then
      break;
    C:=TTypeInfoClass(C).Ancestor;
  end;
  if Sorted then
    TJSArray(Result).sort(@NameSort);
  {$ENDIF}
end;

function GetPropList(aTIStruct: TTypeInfoStruct): TTypeMemberPropertyDynArray;
begin
  Result:=GetPropInfos(aTIStruct);
end;

function GetPropList(AClass: TClass): TTypeMemberPropertyDynArray;
begin
  {$IFDEF PAS2JS}Result:=GetPropInfos(TypeInfo(AClass));{$ENDIF}
end;

function GetPropList(Instance: TObject): TTypeMemberPropertyDynArray;
begin
  Result:=GetPropList(Instance.ClassType);
end;

function GetPropInfo(TI: TTypeInfoStruct; const PropName: String
  ): TTypeMemberProperty;
var
  m: TTypeMember;
  i: Integer;
  C: TTypeInfoStruct;
begin
  // quick search case sensitive
  {$IFDEF PAS2JS}
  C:=TI;
  while C<>nil do
  begin
    m:=C.Members[PropName];
    if m is TTypeMemberProperty then
      exit(TTypeMemberProperty(m));
    if not (C is TTypeInfoClass) then
      break;
    C:=TTypeInfoClass(C).Ancestor;
  end;

  // slow search case insensitive
  Result:=nil;
  repeat
    for i:=0 to TI.PropCount-1 do
      if CompareText(PropName,TI.Properties[i])=0 then
      begin
        m:=TI.Members[TI.Properties[i]];
        if m is TTypeMemberProperty then
          Result:=TTypeMemberProperty(m);
        exit;
      end;
    if not (TI is TTypeInfoClass) then
      break;
    TI:=TTypeInfoClass(TI).Ancestor;
  until TI=nil;
  {$ENDIF}
end;

function GetPropInfo(TI: TTypeInfoStruct; const PropName: String;
  const Kinds: TTypeKinds): TTypeMemberProperty;
begin
  Result:=GetPropInfo(TI,PropName);
  if (Kinds<>[]) and (Result<>nil) and not (Result.TypeInfo.Kind in Kinds) then
    Result:=nil;
end;

function GetPropInfo(Instance: TObject; const PropName: String
  ): TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}Result:=GetPropInfo(TypeInfo(Instance),PropName,[]);{$ENDIF}
end;

function GetPropInfo(Instance: TObject; const PropName: String;
  const Kinds: TTypeKinds): TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}Result:=GetPropInfo(TypeInfo(Instance),PropName,Kinds);{$ENDIF}
end;

function GetPropInfo(aClass: TClass; const PropName: String
  ): TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}Result:=GetPropInfo(TypeInfo(AClass),PropName,[]);{$ENDIF}
end;

function GetPropInfo(aClass: TClass; const PropName: String;
  const Kinds: TTypeKinds): TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}Result:=GetPropInfo(TypeInfo(AClass),PropName,Kinds);{$ENDIF}
end;

function FindPropInfo(Instance: TObject; const PropName: String
  ): TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}
  Result:=GetPropInfo(TypeInfo(Instance), PropName);
  if Result=nil then
    raise EPropertyError.CreateFmt(SErrPropertyNotFound, [PropName]);
  {$ENDIF}
end;

function FindPropInfo(Instance: TObject; const PropName: String;
  const Kinds: TTypeKinds): TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}
  Result:=GetPropInfo(TypeInfo(Instance), PropName, Kinds);
  if Result=nil then
    raise EPropertyError.CreateFmt(SErrPropertyNotFound, [PropName]);
  {$ENDIF}
end;

function FindPropInfo(aClass: TClass; const PropName: String
  ): TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}
  Result:=GetPropInfo(TypeInfo(aClass), PropName);
  if Result=nil then
    raise EPropertyError.CreateFmt(SErrPropertyNotFound, [PropName]);
  {$ENDIF}
end;

function FindPropInfo(aClass: TClass; const PropName: String;
  const Kinds: TTypeKinds): TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}
  Result:=GetPropInfo(TypeInfo(aClass), PropName, Kinds);
  if Result=nil then
    raise EPropertyError.CreateFmt(SErrPropertyNotFound, [PropName]);
  {$ENDIF}
end;

function IsStoredProp(Instance: TObject; const PropInfo: TTypeMemberProperty
  ): Boolean;
type
  TIsStored = function: Boolean of object;
begin
  {$IFDEF PAS2JS}
  case PropInfo.Flags and 12 of
  0: Result:=true;
  4: Result:=false;
  8: Result:=Boolean(TJSObject(Instance)[PropInfo.Stored]);
  else Result:=TIsStored(TJSObject(Instance)[PropInfo.Stored])();
  end;
  {$ENDIF}
end;

function IsStoredProp(Instance: TObject; const PropName: string): Boolean;
begin
  Result:=IsStoredProp(Instance,FindPropInfo(Instance,PropName));
end;

function IsPublishedProp(Instance: TObject; const PropName: String): Boolean;
begin
  Result:=GetPropInfo(Instance,PropName)<>nil;
end;

function IsPublishedProp(aClass: TClass; const PropName: String): Boolean;
begin
  Result:=GetPropInfo(aClass,PropName)<>nil;
end;

function PropType(Instance: TObject; const PropName: string): TTypeKind;
begin
  Result:=FindPropInfo(Instance,PropName).TypeInfo.Kind;
end;

function PropType(aClass: TClass; const PropName: string): TTypeKind;
begin
  Result:=FindPropInfo(aClass,PropName).TypeInfo.Kind;
end;

function PropIsType(Instance: TObject; const PropName: string;
  const TypeKind: TTypeKind): Boolean;
begin
  Result:=PropType(Instance,PropName)=TypeKind;
end;

function PropIsType(aClass: TClass; const PropName: string;
  const TypeKind: TTypeKind): Boolean;
begin
  Result:=PropType(aClass,PropName)=TypeKind;
end;

type
  TGetterKind = (
    gkNone,
    gkField,
    gkFunction,
    gkFunctionWithParams
  );

function GetPropGetterKind(const PropInfo: TTypeMemberProperty): TGetterKind;
begin
  if PropInfo.Getter='' then
    Result:=gkNone
  else if (pfGetFunction and PropInfo.Flags)>0 then
    begin
    if length(PropInfo.Params)>0 then
      // array property
      Result:=gkFunctionWithParams
    else
      Result:=gkFunction;
    end
  else
    Result:=gkField;
end;

type
  TSetterKind = (
    skNone,
    skField,
    skProcedure,
    skProcedureWithParams
  );

function GetPropSetterKind(const PropInfo: TTypeMemberProperty): TSetterKind;
begin
  if PropInfo.Setter='' then
    Result:=skNone
  else if (pfSetProcedure and PropInfo.Flags)>0 then
    begin
    if length(PropInfo.Params)>0 then
      // array property
      Result:=skProcedureWithParams
    else
      Result:=skProcedure;
    end
  else
    Result:=skField;
end;

function GetJSValueProp(Instance: TJSObject; TI: TTypeInfoStruct;
  const PropName: String): JSValue;
var
  PropInfo: TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}
  PropInfo:=GetPropInfo(TI,PropName);
  if PropInfo=nil then
    raise EPropertyError.CreateFmt(SErrPropertyNotFound, [PropName]);
  Result:=GetJSValueProp(Instance,PropInfo);
  {$ENDIF}
end;

function GetJSValueProp(Instance: TJSObject;
  const PropInfo: TTypeMemberProperty): JSValue;
type
  TGetter = function: JSValue of object;
  TGetterWithIndex = function(Index: JSValue): JSValue of object;
var
  gk: TGetterKind;
begin
  {$IFDEF PAS2JS}
  gk:=GetPropGetterKind(PropInfo);
  case gk of
    gkNone:
      raise EPropertyError.CreateFmt(SCantReadPropertyS, [PropInfo.Name]);
    gkField:
      Result:=Instance[PropInfo.Getter];
    gkFunction:
      if (pfHasIndex and PropInfo.Flags)>0 then
        Result:=TGetterWithIndex(Instance[PropInfo.Getter])(PropInfo.Index)
      else
        Result:=TGetter(Instance[PropInfo.Getter])();
    gkFunctionWithParams:
      raise EPropertyError.CreateFmt(SIndexedPropertyNeedsParams, [PropInfo.Name]);
  end;
  {$ENDIF}
end;

function GetJSValueProp(Instance: TObject; const PropName: String): JSValue;
begin
  Result:=GetJSValueProp(Instance,FindPropInfo(Instance,PropName));
end;

function GetJSValueProp(Instance: TObject; const PropInfo: TTypeMemberProperty
  ): JSValue;
begin
  Result:=GetJSValueProp(TJSObject(Instance),PropInfo);
end;

procedure SetJSValueProp(Instance: TJSObject; TI: TTypeInfoStruct;
  const PropName: String; Value: JSValue);
var
  PropInfo: TTypeMemberProperty;
begin
  {$IFDEF PAS2JS}
  PropInfo:=GetPropInfo(TI,PropName);
  if PropInfo=nil then
    raise EPropertyError.CreateFmt(SErrPropertyNotFound, [PropName]);
  SetJSValueProp(Instance,PropInfo,Value);
  {$ENDIF}
end;

procedure SetJSValueProp(Instance: TJSObject;
  const PropInfo: TTypeMemberProperty; Value: JSValue);
type
  TSetter = procedure(Value: JSValue) of object;
  TSetterWithIndex = procedure(Index, Value: JSValue) of object;
var
  sk: TSetterKind;
begin
  {$IFDEF PAS2JS}
  sk:=GetPropSetterKind(PropInfo);
  case sk of
    skNone:
      raise EPropertyError.CreateFmt(SCantWritePropertyS, [PropInfo.Name]);
    skField:
      Instance[PropInfo.Setter]:=Value;
    skProcedure:
      if (pfHasIndex and PropInfo.Flags)>0 then
        TSetterWithIndex(Instance[PropInfo.Setter])(PropInfo.Index,Value)
      else
        TSetter(Instance[PropInfo.Setter])(Value);
    skProcedureWithParams:
      raise EPropertyError.CreateFmt(SIndexedPropertyNeedsParams, [PropInfo.Name]);
  end;
  {$ENDIF}
end;

procedure SetJSValueProp(Instance: TObject; const PropName: String;
  Value: JSValue);
begin
  SetJSValueProp(Instance,FindPropInfo(Instance,PropName),Value);
end;

procedure SetJSValueProp(Instance: TObject;
  const PropInfo: TTypeMemberProperty; Value: JSValue);
begin
  SetJSValueProp(TJSObject(Instance),PropInfo,Value);
end;

function GetNativeIntProp(Instance: TObject; const PropName: String): NativeInt;
begin
  Result:=GetNativeIntProp(Instance,FindPropInfo(Instance,PropName));
end;

function GetNativeIntProp(Instance: TObject; const PropInfo: TTypeMemberProperty
  ): NativeInt;
begin
  Result:=NativeInt(GetJSValueProp(Instance,PropInfo));
end;

procedure SetNativeIntProp(Instance: TObject; const PropName: String;
  Value: NativeInt);
begin
  {$IFDEF PAS2JS}SetJSValueProp(Instance,FindPropInfo(Instance,PropName),Value);{$ENDIF}
end;

procedure SetNativeIntProp(Instance: TObject;
  const PropInfo: TTypeMemberProperty; Value: NativeInt);
begin
  {$IFDEF PAS2JS}SetJSValueProp(Instance,PropInfo,Value);{$ENDIF}
end;

function GetOrdProp(Instance: TObject; const PropName: String): longint;
begin
  Result:=GetOrdProp(Instance,FindPropInfo(Instance,PropName));
end;

function GetOrdProp(Instance: TObject; const PropInfo: TTypeMemberProperty
  ): longint;
var
  o: TJSObject;
  Key: String;
  n: NativeInt;
begin
  {$IFDEF PAS2JS}
  if PropInfo.TypeInfo.Kind=tkSet then
  begin
    // a set is a JS object, with the following property: o[ElementDecimal]=true
    o:=TJSObject(GetJSValueProp(Instance,PropInfo));
    Result:=0;
    for Key in o do
    begin
      n:=parseInt(Key,10);
      if n<32 then
        Result:=Result+(1 shl n);
    end;
  end else
    Result:=longint(GetJSValueProp(Instance,PropInfo));
  {$ENDIF}
end;

procedure SetOrdProp(Instance: TObject; const PropName: String; Value: longint);
begin
  SetOrdProp(Instance,FindPropInfo(Instance,PropName),Value);
end;

procedure SetOrdProp(Instance: TObject; const PropInfo: TTypeMemberProperty;
  Value: longint);
var
  o: TJSObject;
  i: Integer;
begin
  {$IFDEF PAS2JS}
  if PropInfo.TypeInfo.Kind=tkSet then
  begin
    o:=TJSObject.new;
    for i:=0 to 31 do
      if (1 shl i) and Value>0 then
        o[str(i)]:=true;
    SetJSValueProp(Instance,PropInfo,o);
  end else
    SetJSValueProp(Instance,PropInfo,Value);
  {$ENDIF}
end;

function GetEnumProp(Instance: TObject; const PropName: String): String;
begin
  Result:=GetEnumProp(Instance,FindPropInfo(Instance,PropName));
end;

function GetEnumProp(Instance: TObject; const PropInfo: TTypeMemberProperty): String;
var
  n: NativeInt;
  TIEnum: TTypeInfoEnum;
begin
  {$IFDEF PAS2JS}
  TIEnum:=PropInfo.TypeInfo as TTypeInfoEnum;
  n:=NativeInt(GetJSValueProp(Instance,PropInfo));
  if (n>=TIEnum.MinValue) and (n<=TIEnum.MaxValue) then
    Result:=TIEnum.EnumType.IntToName[n]
  else
    Result:=str(n);
  {$ENDIF}
end;

procedure SetEnumProp(Instance: TObject; const PropName: String;
  const Value: String);
begin
  SetEnumProp(Instance,FindPropInfo(Instance,PropName),Value);
end;

procedure SetEnumProp(Instance: TObject; const PropInfo: TTypeMemberProperty;
  const Value: String);
var
  TIEnum: TTypeInfoEnum;
  n: NativeInt;
begin
  {$IFDEF PAS2JS}
  TIEnum:=PropInfo.TypeInfo as TTypeInfoEnum;
  n:=TIEnum.EnumType.NameToInt[Value];
  if not isUndefined(n) then
    SetJSValueProp(Instance,PropInfo,n);
  {$ENDIF}
end;

function GetEnumName(TypeInfo: TTypeInfoEnum; Value: Integer): String;
begin
  Result:=TypeInfo.EnumType.IntToName[Value];
end;

function GetEnumValue(TypeInfo: TTypeInfoEnum; const Name: string): Longint;
begin
  Result:=TypeInfo.EnumType.NameToInt[Name];
end;

function GetEnumNameCount(TypeInfo: TTypeInfoEnum): Longint;
var
  o: TJSObject;
  l, r: LongInt;
begin
  o:=TJSObject(TypeInfo.EnumType);
  // as of pas2js 1.0 the RTTI does not contain a min/max value
  // -> use exponential search
  // ToDo: adapt this once enums with gaps are supported
  Result:=1;
  while o.hasOwnProperty(String(JSValue(Result))) do
    Result:=Result*2;
  l:=Result div 2;
  r:=Result;
  while l<=r do
    begin
    Result:=(l+r) div 2;
    if o.hasOwnProperty(String(JSValue(Result))) then
      l:=Result+1
    else
      r:=Result-1;
    end;
  if o.hasOwnProperty(String(JSValue(Result))) then
    inc(Result);
end;

function GetSetProp(Instance: TObject; const PropName: String): String;
begin
  Result:=GetSetProp(Instance,FindPropInfo(Instance,PropName));
end;

function GetSetProp(Instance: TObject; const PropInfo: TTypeMemberProperty
  ): String;
var
  o: TJSObject;
  key, Value: String;
  n: NativeInt;
  TIEnum: TTypeInfoEnum;
  TISet: TTypeInfoSet;
begin
  {$IFDEF PAS2JS}
  Result:='';
  // get enum type if available
  TISet:=PropInfo.TypeInfo as TTypeInfoSet;
  TIEnum:=nil;
  if TISet.CompType is TTypeInfoEnum then
    TIEnum:=TTypeInfoEnum(TISet.CompType);
  // read value
  o:=TJSObject(GetJSValueProp(Instance,PropInfo));
  // a set is a JS object, where included element is stored as: o[ElementDecimal]=true
  for Key in o do
  begin
    n:=parseInt(Key,10);
    if (TIEnum<>nil) and (n>=TIEnum.MinValue) and (n<=TIEnum.MaxValue) then
      Value:=TIEnum.EnumType.IntToName[n]
    else
      Value:=str(n);
    if Result<>'' then Result:=Result+',';
    Result:=Result+Value;
  end;
  Result:='['+Result+']';
  {$ENDIF}
end;

function GetSetPropArray(Instance: TObject; const PropName: String
  ): TIntegerDynArray;
begin
  Result:=GetSetPropArray(Instance,FindPropInfo(Instance,PropName));
end;

function GetSetPropArray(Instance: TObject; const PropInfo: TTypeMemberProperty
  ): TIntegerDynArray;
var
  o: TJSObject;
  Key: string;
begin
  {$IFDEF PAS2JS}
  Result:=[];
  // read value
  o:=TJSObject(GetJSValueProp(Instance,PropInfo));
  // a set is a JS object, where included element is stored as: o[ElementDecimal]=true
  for Key in o do
    TJSArray(Result).push(parseInt(Key,10));
  {$ENDIF}
end;

procedure SetSetPropArray(Instance: TObject; const PropName: String;
  const Arr: TIntegerDynArray);
begin
  SetSetPropArray(Instance,FindPropInfo(Instance,PropName),Arr);
end;

procedure SetSetPropArray(Instance: TObject;
  const PropInfo: TTypeMemberProperty; const Arr: TIntegerDynArray);
var
  o: TJSObject;
  i: integer;
begin
  {$IFDEF PAS2JS}
  o:=TJSObject.new;
  for i in Arr do
    o[str(i)]:=true;
  SetJSValueProp(Instance,PropInfo,o);
  {$ENDIF}
end;

function GetStrProp(Instance: TObject; const PropName: String): String;
begin
  Result:=GetStrProp(Instance,FindPropInfo(Instance,PropName));
end;

function GetStrProp(Instance: TObject; const PropInfo: TTypeMemberProperty
  ): String;
begin
  Result:=String(GetJSValueProp(Instance,PropInfo));
end;

procedure SetStrProp(Instance: TObject; const PropName: String; Value: String
  );
begin
  SetStrProp(Instance,FindPropInfo(Instance,PropName),Value);
end;

procedure SetStrProp(Instance: TObject; const PropInfo: TTypeMemberProperty;
  Value: String);
begin
  {$IFDEF PAS2JS}SetJSValueProp(Instance,PropInfo,Value);{$ENDIF}
end;

function GetStringProp(Instance: TObject; const PropName: String): String;
begin
  Result:=GetStrProp(Instance,PropName);
end;

function GetStringProp(Instance: TObject; const PropInfo: TTypeMemberProperty
  ): String;
begin
  Result:=GetStrProp(Instance,PropInfo);
end;

procedure SetStringProp(Instance: TObject; const PropName: String; Value: String
  );
begin
  SetStrProp(Instance,PropName,Value);
end;

procedure SetStringProp(Instance: TObject; const PropInfo: TTypeMemberProperty;
  Value: String);
begin
  SetStrProp(Instance,PropInfo,Value);
end;

function GetBoolProp(Instance: TObject; const PropName: String): boolean;
begin
  Result:=GetBoolProp(Instance,FindPropInfo(Instance,PropName));
end;

function GetBoolProp(Instance: TObject; const PropInfo: TTypeMemberProperty
  ): boolean;
begin
  Result:=Boolean(GetJSValueProp(Instance,PropInfo));
end;

procedure SetBoolProp(Instance: TObject; const PropName: String; Value: boolean
  );
begin
  SetBoolProp(Instance,FindPropInfo(Instance,PropName),Value);
end;

procedure SetBoolProp(Instance: TObject; const PropInfo: TTypeMemberProperty;
  Value: boolean);
begin
  {$IFDEF PAS2JS}SetJSValueProp(Instance,PropInfo,Value);{$ENDIF}
end;

function GetObjectProp(Instance: TObject; const PropName: String): TObject;
begin
  Result:=GetObjectProp(Instance,FindPropInfo(Instance,PropName));
end;

function GetObjectProp(Instance: TObject; const PropName: String; MinClass : TClass): TObject;
begin
  Result:=GetObjectProp(Instance,FindPropInfo(Instance,PropName));
  if (MinClass<>Nil) and (Result<>Nil) Then
    if not Result.InheritsFrom(MinClass) then
      Result:=Nil;
end;

function GetObjectProp(Instance: TObject; const PropInfo: TTypeMemberProperty):  TObject;

begin
  Result:=GetObjectProp(Instance,PropInfo,Nil);
end;

function GetObjectProp(Instance: TObject; const PropInfo: TTypeMemberProperty; MinClass : TClass):  TObject;

Var
  O : TObject;

begin
  O:=TObject(GetJSValueProp(Instance,PropInfo));
  if (MinClass<>Nil) and not O.InheritsFrom(MinClass) then
    Result:=Nil
  else
    Result:=O;
end;

procedure SetObjectProp(Instance: TObject; const PropName: String; Value: TObject) ;

begin
  SetObjectProp(Instance,FindPropInfo(Instance,PropName),Value);
end;

procedure SetObjectProp(Instance: TObject; const PropInfo: TTypeMemberProperty; Value: TObject);

begin
  {$IFDEF PAS2JS}SetJSValueProp(Instance,PropInfo,Value);{$ENDIF}
end;

function GetMethodProp(Instance: TObject; PropInfo: TTypeMemberProperty
  ): TMethod;
var
  v, fn: JSValue;
begin
  {$IFDEF PAS2JS}
  Result.Code:=nil;
  Result.Data:=nil;
  v:=GetJSValueProp(Instance,PropInfo);
  if not isFunction(v) then exit;
  Result.Data:=Pointer(TJSObject(v)['scope']);
  fn:=TJSObject(v)['fn'];
  if isString(fn) then
    begin
    if Result.Data<>nil then
      // named callback
      Result.Code:=CodePointer(TJSObject(Result.Data)[String(fn)])
    else
      // this is not an rtl callback, return the value
      Result.Code:=CodePointer(v);
    end
  else
    // anonymous callback
    Result.Code:=CodePointer(fn);
  {$ENDIF}
end;

function GetMethodProp(Instance: TObject; const PropName: string): TMethod;
begin
  Result:=GetMethodProp(Instance,FindPropInfo(Instance,PropName));
end;
{$IFDEF PAS2JS}
function createCallbackPtr(scope: Pointer; fn: CodePointer): TJSFunction; external name 'rtl.createCallback';
function createCallbackStr(scope: Pointer; fn: string): TJSFunction; external name 'rtl.createCallback';
{$ENDIF}

procedure SetMethodProp(Instance: TObject; PropInfo: TTypeMemberProperty;
  const Value: TMethod);
var
  cb: TJSFunction;
  Code: Pointer;
begin
  {$IFDEF PAS2JS}
  // Note: Value.Data=nil is allowed and can be used by designer code
  Code:=Value.Code;
  if Code=nil then
    cb:=nil
  else if isFunction(Code) then
    begin
    if (TJSObject(Code)['scope']=Value.Data)
        and (isFunction(TJSObject(Code)['fn']) or isString(TJSObject(Code)['fn']))
      then
      begin
      // Value.Code is already the needed callback
      cb:=TJSFunction(Code);
      end
    else if isString(TJSObject(Code)['fn']) then
      // named callback, different scope
      cb:=createCallbackStr(Value.Data,string(TJSObject(Code)['fn']))
    else
      // normal function
      cb:=createCallbackPtr(Value.Data,Code);
    end
  else
    // not a valid value -> for compatibility set it anyway
    cb:=createCallbackPtr(Value.Data,Code);
  SetJSValueProp(Instance,PropInfo,cb);
  {$ENDIF}
end;

procedure SetMethodProp(Instance: TObject; const PropName: string;
  const Value: TMethod);
begin
  SetMethodProp(Instance,FindPropInfo(Instance,PropName),Value);
end;

function GetInterfaceProp(Instance: TObject; const PropName: string
  ): IInterface;
begin
  Result:=GetInterfaceProp(Instance,FindPropInfo(Instance,PropName));
end;

function GetInterfaceProp(Instance: TObject; PropInfo: TTypeMemberProperty
  ): IInterface;
type
  TGetter = function: IInterface of object;
  TGetterWithIndex = function(Index: JSValue): IInterface of object;
var
  gk: TGetterKind;
begin
  {$IFDEF PAS2JS}
  if Propinfo.TypeInfo.Kind<>tkInterface then
    raise Exception.Create('Cannot get RAW interface from IInterface interface');
  gk:=GetPropGetterKind(PropInfo);
  case gk of
    gkNone:
      raise EPropertyError.CreateFmt(SCantReadPropertyS, [PropInfo.Name]);
    gkField:
      Result:=IInterface(TJSObject(Instance)[PropInfo.Getter]);
    gkFunction:
      if (pfHasIndex and PropInfo.Flags)>0 then
        Result:=TGetterWithIndex(TJSObject(Instance)[PropInfo.Getter])(PropInfo.Index)
      else
        Result:=TGetter(TJSObject(Instance)[PropInfo.Getter])();
    gkFunctionWithParams:
      raise EPropertyError.CreateFmt(SIndexedPropertyNeedsParams, [PropInfo.Name]);
  end;
  {$ENDIF}
end;

procedure SetInterfaceProp(Instance: TObject; const PropName: string;
  const Value: IInterface);
begin
  SetInterfaceProp(Instance,FindPropInfo(Instance,PropName),Value);
end;

procedure SetInterfaceProp(Instance: TObject; PropInfo: TTypeMemberProperty;
  const Value: IInterface);
type
  TSetter = procedure(Value: IInterface) of object;
  TSetterWithIndex = procedure(Index: JSValue; Value: IInterface) of object;
  procedure setIntfP(Instance: TObject; const PropName: string; value: jsvalue);{$IFDEF PAS2JS} external name 'rtl.setIntfP';{$ENDIF}
  {$IFDEF DCC}
  begin
  end;
  {$ENDIF}
var
  sk: TSetterKind;
  Setter: String;
begin
  if Propinfo.TypeInfo.Kind<>tkInterface then
    raise Exception.Create('Cannot set RAW interface from IInterface interface');
  sk:=GetPropSetterKind(PropInfo);
  Setter:=PropInfo.Setter;
  case sk of
    skNone:
      raise EPropertyError.CreateFmt(SCantWritePropertyS, [PropInfo.Name]);
    skField:
      setIntfP(Instance,Setter,Value);
    skProcedure:
      if (pfHasIndex and PropInfo.Flags)>0 then
        TSetterWithIndex(TJSObject(Instance)[Setter])(PropInfo.Index,Value)
      else
        TSetter(TJSObject(Instance)[Setter])(Value);
    skProcedureWithParams:
      raise EPropertyError.CreateFmt(SIndexedPropertyNeedsParams, [PropInfo.Name]);
  end;
end;

function GetRawInterfaceProp(Instance: TObject; const PropName: string
  ): Pointer; overload;
begin
  {$IFDEF PAS2JS}Result:=GetRawInterfaceProp(Instance,FindPropInfo(Instance,PropName));{$ENDIF}
end;

function GetRawInterfaceProp(Instance: TObject; PropInfo: TTypeMemberProperty
  ): Pointer; overload;
begin
  Result:=Pointer(GetJSValueProp(Instance,PropInfo));
end;

procedure SetRawInterfaceProp(Instance: TObject; const PropName: string;
  const Value: Pointer); overload;
begin
  {$IFDEF PAS2JS}SetRawInterfaceProp(Instance,FindPropInfo(Instance,PropName),Value);{$ENDIF}
end;

procedure SetRawInterfaceProp(Instance: TObject; PropInfo: TTypeMemberProperty;
  const Value: Pointer); overload;
begin
  SetJSValueProp(Instance,PropInfo,Value);
end;

function GetFloatProp(Instance: TObject; PropInfo: TTypeMemberProperty): Double; overload;
begin
  {$IFDEF PAS2JS}Result:=Double(GetJSValueProp(Instance,PropInfo));{$ENDIF}
end;

function GetFloatProp(Instance: TObject; const PropName: string): Double; overload;
begin
  Result:=GetFloatProp(Instance,FindPropInfo(Instance,PropName));
end;

procedure SetFloatProp(Instance: TObject; const PropName: string; Value: Double); overload;
begin
  {$IFDEF PAS2JS}SetFloatProp(Instance,FindPropInfo(Instance,PropName),Value);{$ENDIF}
end;

procedure SetFloatProp(Instance: TObject; PropInfo: TTypeMemberProperty; Value: Double); overload;
begin
  {$IFDEF PAS2JS}SetJSValueProp(Instance,PropInfo,Value);{$ENDIF}
end;

{ TEnumType }
{$IFDEF DCC}
function TEnumType.GetIntToName(Index: NativeInt): String;
begin
  Result := '';
end;

function TEnumType.GetNameToInt(Name: String): NativeInt;
begin
  Result := 0;
end;

{ TTypeMembers }

function TTypeMembers.GetItems(Name: String): TTypeMember;
begin
  Result := nil;
end;

procedure TTypeMembers.SetItems(Name: String; const AValue: TTypeMember);
begin

end;

{ TTypeInfoStruct }

function TTypeInfoStruct.AddField(aName: String; aType: TTypeInfo;
  Options: TJSObject): TTypeMemberField;
begin
  Result := nil;
end;

function TTypeInfoStruct.AddMethod(aName: String; MethodKind: TMethodKind;
  Params: TJSArray; ResultType: TTypeInfo;
  Options: TJSObject): TTypeMemberMethod;
begin

end;

function TTypeInfoStruct.AddProperty(aName: String; Flags: NativeInt;
  ResultType: TTypeInfo; Getter, Setter: String;
  Options: TJSObject): TTypeMemberProperty;
begin
  Result := nil;
end;

function TTypeInfoStruct.GetField(Index: NativeInt): TTypeMemberField;
begin
  Result := nil;
end;

function TTypeInfoStruct.GetMethod(Index: NativeInt): TTypeMemberMethod;
begin
  Result := nil;
end;

function TTypeInfoStruct.GetProp(Index: NativeInt): TTypeMemberProperty;
begin
  Result := nil;
end;

{ TCreatorAttribute }

class function TCreatorAttribute.Create(const ProcName: string;
  Params: jsvalue): TCustomAttribute;
begin
  Result := nil;
end;

class function TCreatorAttribute.Create(
  const ProcName: string): TCustomAttribute;
begin
  Result := nil;
end;
{$ENDIF}
end.

