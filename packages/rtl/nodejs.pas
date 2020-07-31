{
    This file is part of the Pas2JS run time library.
    Copyright (c) 2017 by Mattias Gaertner

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}
unit NodeJS;

{$IFDEF PAS2JS}
{$mode objfpc}
{$ModeSwitch externalclass}
{$ENDIF}

interface

uses
  JS, Types;

type

  { TNJSOS }

  TNJSOS = class {$IFDEF PAS2JS}external name 'os'{$ENDIF}
  public {$IFDEF PAS2JS}const{$ENDIF}
    EOL: string; // end of line, Windows: \r\n, Posix: \r
    function arch: string; // name of architecture, e.g. 'arm', 'arm64', 'ia32', 'mips', 'mipsel', 'ppc', 'ppc64', 's390', 's390x', 'x32', and 'x64'
    function cpus: TJSObjectDynArray;
    function endianness: string; // 'BE', 'LE'
    function freemem: nativeint; // free memory in bytes
    function getPriority(pid: NativeInt = 0): NativeInt;
    function homedir: string;
    function hostname: string;
    function loadavg: TDoubleDynArray; // 1, 5 and 15 minutes
    function networkInterfaces: TJSObject;
    function platform: string; // e.g. 'aix', 'darwin', 'freebsd', 'linux', 'openbsd', 'sunos', 'win32'
    function release: string; // operating system release
    procedure setPriority(pid, priority: NativeInt); overload;
    procedure setPriority(priority: NativeInt); overload; // current process
    function tmpdir: string; // operating system's default directory for temporary files
    function totalmem: NativeInt;
    function ostype: string; // e.g. 'Linux', 'Darwin', 'Windows_NT'
    function uptime: NativeInt;
    function userInfo(const options: TJSObject): TJSObject;
  end;

  { TNJSBuffer }
  TNJSBuffer = Class {$IFDEF PAS2JS}external name 'Buffer'{$ENDIF} (TJSObject)
  private
    FBuffer : TJSArrayBuffer; {$IFDEF PAS2JS}external name 'buffer';{$ENDIF}
    FByteOffset : NativeInt; {$IFDEF PAS2JS}external name 'byteOffset';{$ENDIF}
    function getbuf(Index : NativeInt): Byte; {$IFDEF PAS2JS}external name '[]';{$ENDIF}
    procedure setbuf(Index : NativeInt; AValue: Byte); {$IFDEF PAS2JS}external name '[]';{$ENDIF}
    class var FPoolSize : NativeInt; {$IFDEF PAS2JS}external name 'poolSize';{$ENDIF}
  public
    constructor new (size : NativeInt); overload; deprecated;
    constructor new (aString : string); overload; deprecated;
    constructor new (aString,aEncoding : string); overload; deprecated;
    constructor new (arrayBuffer : TJSArray); overload; deprecated;
    constructor new (Buffer : TNJSBuffer); overload; deprecated;
    constructor new (Buffer : TJSUint8Array); overload; deprecated;
    constructor new (arrayBuffer : TJSArrayBuffer); overload; deprecated;
    constructor new (arrayBuffer : TJSArrayBuffer; byteOffset : NativeInt); overload; deprecated;
    constructor new (arrayBuffer : TJSArrayBuffer; byteOffset,length : NativeInt); overload;deprecated;
    class function alloc(size : NativeInt) : TNJSBuffer; overload;
    class function alloc(size : NativeInt; Fill : string) : TNJSBuffer; overload;
    class function alloc(size : NativeInt; Fill : TNJSBuffer) : TNJSBuffer; overload;
    class function alloc(size : NativeInt; Fill : NativeInt) : TNJSBuffer; overload;
    class function alloc(size : NativeInt; Fill,Encoding : string) : TNJSBuffer; overload;
    class function allocUnsafe(size : NativeInt) : TNJSBuffer; overload;
    class function allocUnsafeSlow(size : NativeInt) : TNJSBuffer; overload;
    class function byteLength(aData: string) : NativeInt; overload;
    class function byteLength(aData,aEncoding: string) : NativeInt; overload;
    class function byteLength(aData: TNJSBuffer) : NativeInt; overload;
    class function byteLength(aData: TJSDataView) : NativeInt; overload;
    class function byteLength(aData: TJSArrayBuffer) : NativeInt; overload;
//    class function byteLength(aData: TJSSharedArrayBuffer) : NativeInt; overload;
    class function compare(buf1, buf2 : TNJSBuffer) : NativeInt; overload;
    class function compare(buf1, buf2 : TJSUint8Array) : NativeInt; overload;
    class function compare(buf1: TJSUint8Array; buf2 : TNJSBuffer) : NativeInt; overload;
    class function compare(buf1: TNJSBuffer; buf2 : TJSUint8Array) : NativeInt; overload;
    class function concat(buf1: array of TNJSBuffer) : TNJSBuffer; overload;
    class function concat(buf1: array of TJSUInt8Array) : TNJSBuffer; overload;
    class function concat(buf1: array of TNJSBuffer; totalLength : NativeInt) : TNJSBuffer; overload;
    class function concat(buf1: array of TJSUInt8Array; totalLength : NativeInt) : TNJSBuffer; overload;
    class function from(arr: array of byte): TNJSBuffer; overload;
    class function from(arr: array of Integer): TNJSBuffer; overload;
    class function from(arrayBuffer : TJSArrayBuffer): TNJSBuffer; overload;
    class function from(arrayBuffer : TJSArrayBuffer; aByteOffset : NativeInt): TNJSBuffer; overload;
    class function from(arrayBuffer : TJSArrayBuffer; aByteOffset,aLength : NativeInt): TNJSBuffer; overload;
    class function from(const Values: TJSValueDynArray): TNJSBuffer; overload;
    class function from(arrayBuffer : TJSUint8Array): TNJSBuffer; overload;
    class function from(arrayBuffer : TNJSBuffer): TNJSBuffer; overload;
    class function from(aObject : TJSObject): TNJSBuffer; overload;
    class function from(aObject : TJSObject; aEncoding : String): TNJSBuffer; overload;
    class function from(aObject : TJSObject; aOffset : NativeInt): TNJSBuffer; overload;
    class function from(aObject : TJSObject; aEncoding : String;aLength : NativeInt): TNJSBuffer; overload;
    class function from(aObject : TJSObject; aOffset,aLength : NativeInt): TNJSBuffer; overload;
    class function from(aString : String): TNJSBuffer; overload;
    class function from(aString, aEncoding : String): TNJSBuffer; overload;
    class function isBuffer(aObj : TJSObject): Boolean; overload;
    class function isEncoding(aEncoding : string): Boolean; overload;
    class property poolSize : NativeInt read FPoolSize;
    function compare(target : TNJSBuffer) : NativeInt; overload;
    function compare(target : TJSUint8Array) : NativeInt; overload;
    function compare(target : TNJSBuffer; targetStart: NativeInt) : NativeInt; overload;
    function compare(target : TJSUint8Array; targetStart: NativeInt) : NativeInt; overload;
    function compare(target : TNJSBuffer; targetStart, targetEnd: NativeInt) : NativeInt; overload;
    function compare(target : TJSUint8Array; targetStart, targetEnd: NativeInt) : NativeInt; overload;
    function compare(target : TNJSBuffer; targetStart, targetEnd, sourceStart: NativeInt) : NativeInt; overload;
    function compare(target : TJSUint8Array; targetStart, targetEnd, sourceStart: NativeInt) : NativeInt; overload;
    function compare(target : TNJSBuffer; targetStart, targetEnd, sourceStart, SourceEnd: NativeInt) : NativeInt; overload;
    function compare(target : TJSUint8Array; targetStart, targetEnd, sourceStart, SourceEnd: NativeInt) : NativeInt; overload;
    function copy(target : TNJSBuffer) : NativeInt; overload;
    function copy(target : TJSUint8Array) : NativeInt; overload;
    function copy(target : TNJSBuffer; targetStart: NativeInt) : NativeInt; overload;
    function copy(target : TJSUint8Array; targetStart: NativeInt) : NativeInt; overload;
    function copy(target : TNJSBuffer; targetStart, sourceStart: NativeInt) : NativeInt; overload;
    function copy(target : TJSUint8Array; targetStart, sourceStart: NativeInt) : NativeInt; overload;
    function copy(target : TNJSBuffer; targetStart, sourceStart, sourceEnd: NativeInt) : NativeInt; overload;
    function copy(target : TJSUint8Array; targetStart, sourceStart, sourceEnd: NativeInt) : NativeInt; overload;
    function fill(value : String) : TNJSBuffer;overload;
    function fill(value : String; aOffset : integer) : TNJSBuffer;overload;
    function fill(value : String; aOffset,aEnd : integer) : TNJSBuffer;overload;
    function fill(value : String; aOffset,aEnd : integer;aEncoding : string) : TNJSBuffer;overload;
    function fill(value : TNJSBuffer) : TNJSBuffer;overload;
    function fill(value : TNJSBuffer; aOffset : integer) : TNJSBuffer;overload;
    function fill(value : TNJSBuffer; aOffset,aEnd : integer) : TNJSBuffer;overload;
    function fill(value : NativeInt) : TNJSBuffer;overload;
    function fill(value : NativeInt; aOffset : integer) : TNJSBuffer;overload;
    function fill(value : NativeInt; aOffset,aEnd : integer) : TNJSBuffer;overload;
    function fill(value : TJSUint8Array) : TNJSBuffer;overload;
    function fill(value : TJSUint8Array; aOffset : integer) : TNJSBuffer;overload;
    function fill(value : TJSUint8Array; aOffset,aEnd : integer) : TNJSBuffer;overload;
    function includes(value : string)  : Boolean;overload;
    function includes(value,encoding : string)  : Boolean;overload;
    function includes(value : integer)  : Boolean;overload;
    function includes(value  : Boolean)  : Boolean;overload;
    function includes(value : TJSUint8Array)  : Boolean;overload;
    function includes(value : string; aByteOffset:NativeInt)  : Boolean;overload;
    function includes(value : string;aByteOffset:NativeInt;encoding : string)  : Boolean;overload;
    function includes(value : integer; aByteOffset:NativeInt)  : Boolean;overload;
    function includes(value  : Boolean; aByteOffset:NativeInt)  : Boolean;overload;
    function includes(value : TJSUint8Array; aByteOffset:NativeInt)  : Boolean;overload;
    function indexOf(value : string)  : NativeInt;overload;
    function indexOf(value,encoding : string)  : NativeInt;overload;
    function indexOf(value : integer)  : NativeInt;overload;
    function indexOf(value  : NativeInt)  : NativeInt;overload;
    function indexOf(value : TJSUint8Array)  : NativeInt;overload;
    function indexOf(value : string; aByteOffset:NativeInt)  : NativeInt;overload;
    function indexOf(value : string;aByteOffset:NativeInt;encoding : string)  : NativeInt;overload;
    function indexOf(value : integer; aByteOffset:NativeInt)  : NativeInt;overload;
    function indexOf(value  : NativeInt; aByteOffset:NativeInt)  : NativeInt;overload;
    function indexOf(value : TJSUint8Array; aByteOffset:NativeInt)  : NativeInt;overload;
    function entries : TJSIterator;
    function equals(target : TNJSBuffer) : boolean; overload;
    function equals(target : TJSUint8Array) : boolean; overload;
    property buf [Index : NativeInt] : Byte Read getbuf write setbuf;
    property buffer : TJSArrayBuffer read FBuffer;
    property byteOffset : nativeint read FByteOffset;
  end;

  TNJSProcessConfig = TJSObject;
  TNJSProcessCPUUsage = TJSObject;

  { TJSProcess }

  TNJSProcess = class {$IFDEF PAS2JS}external name 'process'{$ENDIF}
  private
    class var FVersions: TJSObject; {$IFDEF PAS2JS}external name 'versions';{$ENDIF}
    class var FVersion: String; {$IFDEF PAS2JS}external name 'version';{$ENDIF}
    class var FRelease: TJSObject; {$IFDEF PAS2JS}external name 'release';{$ENDIF}
    class var FPlatform: String; {$IFDEF PAS2JS}external name 'platform';{$ENDIF}
    class var FPid: NativeInt; {$IFDEF PAS2JS}external name 'pid';{$ENDIF}
    class var FExecPath: String; {$IFDEF PAS2JS}external name 'execPath';{$ENDIF}
    class var FExecArgv: TStringDynArray; {$IFDEF PAS2JS}external name 'execArgv';{$ENDIF}
    class var FEnv: TJSObject; {$IFDEF PAS2JS}external name 'env';{$ENDIF}
    class var FConfig: TNJSProcessConfig; {$IFDEF PAS2JS}external name 'config';{$ENDIF}
    class var FArch: string; {$IFDEF PAS2JS}external name 'arch';{$ENDIF}
    class var FArgv: TStringDynArray; {$IFDEF PAS2JS}external name 'argv';{$ENDIF}
    class function Getumask: NativeInt; {$IFDEF PAS2JS}external name 'umask';{$ENDIF} static;
    class procedure Setumask(const AValue: NativeInt); {$IFDEF PAS2JS} external name 'umask';{$ENDIF} static;
  public
    class procedure abort;
    class property arch: string read FArch;
    class property argv: TStringDynArray read FArgv;
    // ToDo assert
    // ToDo binding
    class procedure chdir(Directory: String);
    class property config: TNJSProcessConfig read FConfig;
    class function cpuUsage: TNJSProcessCPUUsage; overload;
    class function cpuUsage(const previousValue: TNJSProcessCPUUsage): TNJSProcessCPUUsage; overload;
    class function cwd: String;
    class procedure emitWarning(warning: String); overload;
    class procedure emitWarning(warning, name: String); overload;
    //class procedure emitWarning(warning, name: String; ctor: ?);
    class property env: TJSObject read FEnv;
    class property execArgv: TStringDynArray read FExecArgv;
    class property execPath: String read FExecPath;
    class procedure exit(code: NativeInt = 0);
    class var exitCode: NativeInt;
    class function getegid: NativeInt; // only POSIX platforms
    class function geteuid: NativeInt; // only POSIX platforms
    class function getgid: JSValue; // only POSIX platforms
    class function getgroups: TJSValueDynArray; // only POSIX platforms
    class function getuid: NativeInt; // only POSIX platforms
    // ToDo hrtime([time])
    // ToDo: initgroups(user, extra_group)
    class procedure kill(pid: NativeInt); overload;
    class procedure kill(pid: NativeInt; signal: String); overload;
    // ToDo: mainModule
    class function memoryUsage: TJSObject; // ToDo
    // ToDo: nextTick(callback[, ...args])
    // ToDo: openStdin
    class property pid: NativeInt read FPid;
    class property platform: String read FPlatform;
    class property release: TJSObject read FRelease;
    // ToDo: send(message[, sendHandle[, options]][, callback])
    class procedure setegid(const id: JSValue);
    class procedure seteuid(const id: JSValue);
    class procedure setgid(const id: JSValue);
    class procedure setgroups(const groups: TJSValueDynArray);
    class procedure setuid(const id: JSValue);
    // ToDo: stderr
    // ToDo: stdin
    // ToDo: stdout
    class var title: String;
    class property umask: NativeInt read Getumask write Setumask;
    class function uptime: NativeInt;
    class property version: String read FVersion;
    class property versions: TJSObject read FVersions;
  end;

  { TNJSConsole }

  TNJSConsole = class {$IFDEF PAS2JS}external name 'Console'{$ENDIF}
  Public
    procedure assert(anAssertion : string; const Obj1 : JSValue); {$IFDEF PAS2JS}varargs;{$ENDIF}
    procedure dir(const Obj1 : JSValue); overload;
    procedure dir(const Obj1 : JSValue; const options: TJSObject); overload;
    procedure error(const Obj1 : JSValue); {$IFDEF PAS2JS}varargs;{$ENDIF}
    procedure info(const Obj1 : JSValue); {$IFDEF PAS2JS}varargs;{$ENDIF}
    procedure log(const Obj1 : JSValue); {$IFDEF PAS2JS}varargs;{$ENDIF}
    procedure time(const aName : string);
    procedure timeEnd(const aName : string);
    procedure trace;
    procedure warn(const Obj1 : JSValue); {$IFDEF PAS2JS}varargs;{$ENDIF}
  end;

  TNJSEventEmitterHandler = reference to procedure(arg : JSValue);
  TNJSEventEmitterHandlerArray = array of TNJSEventEmitterHandler;

  TNJSEventEmitter = class {$IFDEF PAS2JS}external name 'EventEmitter'{$ENDIF} (TJSObject)
    class var captureRejections : Boolean;
    class var defaultMaxListeners : Integer;
    class var errorMonitor : TNJSEventEmitter;
    function addListener(const EventName : String; Listener : TNJSEventEmitterHandler) : TNJSEventEmitter;
    function on_(const EventName : String; Listener : TNJSEventEmitterHandler) : TNJSEventEmitter;
    function once(const EventName : String; Listener : TNJSEventEmitterHandler) : TNJSEventEmitter;
    function off(const EventName : String; Listener : TNJSEventEmitterHandler) : TNJSEventEmitter;
    function emit(const EventName : String) : Boolean; {$IFDEF PAS2JS}varargs;{$ENDIF}
    function eventnames : TJSStringDynArray;
    function getMaxListeners : Integer;
    function listenerCount(const EventName : String) : Integer;
    function listeners(const EventName : String) : TNJSEventEmitterHandlerArray;
    function prependListener(const EventName : String; Listener : TNJSEventEmitterHandler) : TNJSEventEmitter;
    function prependOnceListener(const EventName : String; Listener : TNJSEventEmitterHandler) : TNJSEventEmitter;
    function removeListener(const EventName : String; Listener : TNJSEventEmitterHandler) : TNJSEventEmitter;
    function setMaxListeners(aMax : Integer): TNJSEventEmitter;
    function rawListeners(const EventName : String) : TNJSEventEmitterHandlerArray;
  end;


  TNJSEvents = class {$IFDEF PAS2JS}external name 'events'{$ENDIF} (TJSObject)
    function once(emitter : TNJSEventEmitter; aName : string) : TJSPromise;
    function on_(emitter : TNJSEventEmitter; aName : string) : TJSAsyncIterator;
  end;

  TNJSTimerCallBack = reference to procedure;

  TNJSImmediate = class {$IFDEF PAS2JS}external name 'Immediate'{$ENDIF} (TJSObject)
    function hasRef : boolean;
    function ref : TNJSImmediate;
    function unref : TNJSImmediate;
  end;

  TNJSTimeout = class {$IFDEF PAS2JS}external name 'Timeout'{$ENDIF} (TJSObject)
    function hasRef : boolean;
    function ref : TNJSTimeout;
    function refresh : TNJSTimeout;
    function unref : TNJSTimeout;
  end;



{$IFDEF PAS2JS}
function Require(ModuleName: String): JSValue; {$IFDEF PAS2JS}external name 'require';{$ENDIF}
Procedure clearImmediate(aImmediate : TNJSImmediate); {$IFDEF PAS2JS}external name 'clearImmediate';{$ENDIF}
Procedure clearInterval(aTimeout : TNJSTimeout); {$IFDEF PAS2JS}external name 'clearInterval';{$ENDIF}
Procedure clearTimeout(aTimeout : TNJSTimeout); {$IFDEF PAS2JS}external name 'clearTimeout';{$ENDIF}
function setImmediate(aCallback : TNJSTimerCallBack) : TNJSImmediate; {$IFDEF PAS2JS}varargs; external name 'setImmediate';{$ENDIF}
function setInterval(aCallback : TNJSTimerCallBack; aMsecDelay : Integer) : TNJStimeout; {$IFDEF PAS2JS}varargs; external name 'setInterval';{$ENDIF}
function setTimeout(aCallback : TNJSTimerCallBack; aMsecDelay : Integer) : TNJStimeout; {$IFDEF PAS2JS}varargs; external name 'setTimeout';{$ENDIF}
{$ENDIF}

var
  Console: TNJSConsole {$IFDEF PAS2JS}external name 'console'{$ENDIF};
  global : TJSObject;
  NJS_OS: TNJSOS;

implementation

{$IFDEF DCC}
{ TNJSOS }

function TNJSOS.arch: string;
begin

end;

function TNJSOS.cpus: TJSObjectDynArray;
begin

end;

function TNJSOS.endianness: string;
begin

end;

function TNJSOS.freemem: nativeint;
begin

end;

function TNJSOS.getPriority(pid: NativeInt): NativeInt;
begin

end;

function TNJSOS.homedir: string;
begin

end;

function TNJSOS.hostname: string;
begin

end;

function TNJSOS.loadavg: TDoubleDynArray;
begin

end;

function TNJSOS.networkInterfaces: TJSObject;
begin

end;

function TNJSOS.ostype: string;
begin

end;

function TNJSOS.platform: string;
begin

end;

function TNJSOS.release: string;
begin

end;

procedure TNJSOS.setPriority(priority: NativeInt);
begin

end;

procedure TNJSOS.setPriority(pid, priority: NativeInt);
begin

end;

function TNJSOS.tmpdir: string;
begin

end;

function TNJSOS.totalmem: NativeInt;
begin

end;

function TNJSOS.uptime: NativeInt;
begin

end;

function TNJSOS.userInfo(const options: TJSObject): TJSObject;
begin

end;

{ TNJSBuffer }

class function TNJSBuffer.alloc(size: NativeInt): TNJSBuffer;
begin

end;

class function TNJSBuffer.alloc(size: NativeInt; Fill: TNJSBuffer): TNJSBuffer;
begin

end;

class function TNJSBuffer.alloc(size: NativeInt; Fill: string): TNJSBuffer;
begin

end;

class function TNJSBuffer.alloc(size, Fill: NativeInt): TNJSBuffer;
begin

end;

class function TNJSBuffer.alloc(size: NativeInt; Fill,
  Encoding: string): TNJSBuffer;
begin

end;

class function TNJSBuffer.allocUnsafe(size: NativeInt): TNJSBuffer;
begin

end;

class function TNJSBuffer.allocUnsafeSlow(size: NativeInt): TNJSBuffer;
begin

end;

class function TNJSBuffer.byteLength(aData: string): NativeInt;
begin

end;

class function TNJSBuffer.byteLength(aData, aEncoding: string): NativeInt;
begin

end;

class function TNJSBuffer.byteLength(aData: TNJSBuffer): NativeInt;
begin

end;

class function TNJSBuffer.byteLength(aData: TJSDataView): NativeInt;
begin

end;

class function TNJSBuffer.byteLength(aData: TJSArrayBuffer): NativeInt;
begin

end;

function TNJSBuffer.compare(target: TJSUint8Array;
  targetStart: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.compare(target: TNJSBuffer; targetStart,
  targetEnd: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.compare(target: TJSUint8Array; targetStart,
  targetEnd: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.compare(target: TNJSBuffer; targetStart, targetEnd,
  sourceStart: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.compare(target: TJSUint8Array): NativeInt;
begin

end;

function TNJSBuffer.compare(target: TNJSBuffer;
  targetStart: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.compare(target: TNJSBuffer): NativeInt;
begin

end;

class function TNJSBuffer.compare(buf1: TNJSBuffer;
  buf2: TJSUint8Array): NativeInt;
begin

end;

class function TNJSBuffer.compare(buf1: TJSUint8Array;
  buf2: TNJSBuffer): NativeInt;
begin

end;

class function TNJSBuffer.compare(buf1, buf2: TJSUint8Array): NativeInt;
begin

end;

class function TNJSBuffer.compare(buf1, buf2: TNJSBuffer): NativeInt;
begin

end;

function TNJSBuffer.compare(target: TJSUint8Array; targetStart, targetEnd,
  sourceStart: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.compare(target: TNJSBuffer; targetStart, targetEnd,
  sourceStart, SourceEnd: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.compare(target: TJSUint8Array; targetStart, targetEnd,
  sourceStart, SourceEnd: NativeInt): NativeInt;
begin

end;

class function TNJSBuffer.concat(buf1: array of TNJSBuffer;
  totalLength: NativeInt): TNJSBuffer;
begin

end;

class function TNJSBuffer.concat(buf1: array of TJSUInt8Array): TNJSBuffer;
begin

end;

class function TNJSBuffer.concat(buf1: array of TNJSBuffer): TNJSBuffer;
begin

end;

class function TNJSBuffer.concat(buf1: array of TJSUInt8Array;
  totalLength: NativeInt): TNJSBuffer;
begin

end;

function TNJSBuffer.copy(target: TJSUint8Array; targetStart, sourceStart,
  sourceEnd: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.copy(target: TJSUint8Array): NativeInt;
begin

end;

function TNJSBuffer.copy(target: TNJSBuffer): NativeInt;
begin

end;

function TNJSBuffer.copy(target: TNJSBuffer; targetStart, sourceStart,
  sourceEnd: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.copy(target: TNJSBuffer; targetStart: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.copy(target: TJSUint8Array;
  targetStart: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.copy(target: TNJSBuffer; targetStart,
  sourceStart: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.copy(target: TJSUint8Array; targetStart,
  sourceStart: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.entries: TJSIterator;
begin

end;

function TNJSBuffer.equals(target: TJSUint8Array): boolean;
begin

end;

function TNJSBuffer.equals(target: TNJSBuffer): boolean;
begin

end;

function TNJSBuffer.fill(value: String; aOffset, aEnd: integer;
  aEncoding: string): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: TNJSBuffer): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: TNJSBuffer; aOffset: integer): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: String): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: String; aOffset: integer): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: String; aOffset, aEnd: integer): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: TNJSBuffer; aOffset, aEnd: integer): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: TJSUint8Array): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: TJSUint8Array; aOffset: integer): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: TJSUint8Array; aOffset,
  aEnd: integer): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: NativeInt): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: NativeInt; aOffset: integer): TNJSBuffer;
begin

end;

function TNJSBuffer.fill(value: NativeInt; aOffset, aEnd: integer): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(aObject: TJSObject;
  aOffset: NativeInt): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(aObject: TJSObject;
  aEncoding: String): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(aObject: TJSObject): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(arrayBuffer: TNJSBuffer): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(aString, aEncoding: String): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(aString: String): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(aObject: TJSObject; aOffset,
  aLength: NativeInt): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(aObject: TJSObject; aEncoding: String;
  aLength: NativeInt): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(arrayBuffer: TJSArrayBuffer;
  aByteOffset: NativeInt): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(arrayBuffer: TJSArrayBuffer): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(arr: array of Integer): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(arr: array of byte): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(const Values: TJSValueDynArray): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(arrayBuffer: TJSUint8Array): TNJSBuffer;
begin

end;

class function TNJSBuffer.from(arrayBuffer: TJSArrayBuffer; aByteOffset,
  aLength: NativeInt): TNJSBuffer;
begin

end;

function TNJSBuffer.getbuf(Index: NativeInt): Byte;
begin

end;

function TNJSBuffer.includes(value: string; aByteOffset: NativeInt): Boolean;
begin

end;

function TNJSBuffer.includes(value: string; aByteOffset: NativeInt;
  encoding: string): Boolean;
begin

end;

function TNJSBuffer.includes(value: integer; aByteOffset: NativeInt): Boolean;
begin

end;

function TNJSBuffer.includes(value: Boolean; aByteOffset: NativeInt): Boolean;
begin

end;

function TNJSBuffer.includes(value: TJSUint8Array;
  aByteOffset: NativeInt): Boolean;
begin

end;

function TNJSBuffer.includes(value: TJSUint8Array): Boolean;
begin

end;

function TNJSBuffer.includes(value: string): Boolean;
begin

end;

function TNJSBuffer.includes(value, encoding: string): Boolean;
begin

end;

function TNJSBuffer.includes(value: Boolean): Boolean;
begin

end;

function TNJSBuffer.includes(value: integer): Boolean;
begin

end;

function TNJSBuffer.indexOf(value: string; aByteOffset: NativeInt;
  encoding: string): NativeInt;
begin

end;

function TNJSBuffer.indexOf(value: string; aByteOffset: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.indexOf(value: TJSUint8Array): NativeInt;
begin

end;

function TNJSBuffer.indexOf(value: TJSUint8Array;
  aByteOffset: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.indexOf(value, aByteOffset: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.indexOf(value: integer; aByteOffset: NativeInt): NativeInt;
begin

end;

function TNJSBuffer.indexOf(value: string): NativeInt;
begin

end;

function TNJSBuffer.indexOf(value, encoding: string): NativeInt;
begin

end;

function TNJSBuffer.indexOf(value: integer): NativeInt;
begin

end;

function TNJSBuffer.indexOf(value: NativeInt): NativeInt;
begin

end;

class function TNJSBuffer.isBuffer(aObj: TJSObject): Boolean;
begin

end;

class function TNJSBuffer.isEncoding(aEncoding: string): Boolean;
begin

end;

constructor TNJSBuffer.new(Buffer: TNJSBuffer);
begin

end;

constructor TNJSBuffer.new(Buffer: TJSUint8Array);
begin

end;

constructor TNJSBuffer.new(arrayBuffer: TJSArrayBuffer);
begin

end;

constructor TNJSBuffer.new(arrayBuffer: TJSArrayBuffer; byteOffset: NativeInt);
begin

end;

constructor TNJSBuffer.new(arrayBuffer: TJSArrayBuffer; byteOffset,
  length: NativeInt);
begin

end;

constructor TNJSBuffer.new(size: NativeInt);
begin

end;

constructor TNJSBuffer.new(aString: string);
begin

end;

constructor TNJSBuffer.new(arrayBuffer: TJSArray);
begin

end;

constructor TNJSBuffer.new(aString, aEncoding: string);
begin

end;

procedure TNJSBuffer.setbuf(Index: NativeInt; AValue: Byte);
begin

end;

{ TNJSProcess }

class procedure TNJSProcess.abort;
begin

end;

class procedure TNJSProcess.chdir(Directory: String);
begin

end;

class function TNJSProcess.cpuUsage(
  const previousValue: TNJSProcessCPUUsage): TNJSProcessCPUUsage;
begin

end;

class function TNJSProcess.cpuUsage: TNJSProcessCPUUsage;
begin

end;

class function TNJSProcess.cwd: String;
begin

end;

class procedure TNJSProcess.emitWarning(warning, name: String);
begin

end;

class procedure TNJSProcess.emitWarning(warning: String);
begin

end;

class procedure TNJSProcess.exit(code: NativeInt);
begin

end;

class function TNJSProcess.getegid: NativeInt;
begin

end;

class function TNJSProcess.geteuid: NativeInt;
begin

end;

class function TNJSProcess.getgid: JSValue;
begin

end;

class function TNJSProcess.getgroups: TJSValueDynArray;
begin

end;

class function TNJSProcess.getuid: NativeInt;
begin

end;

class function TNJSProcess.Getumask: NativeInt;
begin

end;

class procedure TNJSProcess.kill(pid: NativeInt; signal: String);
begin

end;

class procedure TNJSProcess.kill(pid: NativeInt);
begin

end;

class function TNJSProcess.memoryUsage: TJSObject;
begin

end;

class procedure TNJSProcess.setegid(const id: JSValue);
begin

end;

class procedure TNJSProcess.seteuid(const id: JSValue);
begin

end;

class procedure TNJSProcess.setgid(const id: JSValue);
begin

end;

class procedure TNJSProcess.setgroups(const groups: TJSValueDynArray);
begin

end;

class procedure TNJSProcess.setuid(const id: JSValue);
begin

end;

class procedure TNJSProcess.Setumask(const AValue: NativeInt);
begin

end;

class function TNJSProcess.uptime: NativeInt;
begin

end;

{ TNJSConsole }

procedure TNJSConsole.assert(anAssertion: string; const Obj1: JSValue);
begin

end;

procedure TNJSConsole.dir(const Obj1: JSValue);
begin

end;

procedure TNJSConsole.dir(const Obj1: JSValue; const options: TJSObject);
begin

end;

procedure TNJSConsole.error(const Obj1: JSValue);
begin

end;

procedure TNJSConsole.info(const Obj1: JSValue);
begin

end;

procedure TNJSConsole.log(const Obj1: JSValue);
begin

end;

procedure TNJSConsole.time(const aName: string);
begin

end;

procedure TNJSConsole.timeEnd(const aName: string);
begin

end;

procedure TNJSConsole.trace;
begin

end;

procedure TNJSConsole.warn(const Obj1: JSValue);
begin

end;

{ TNJSEventEmitter }

function TNJSEventEmitter.addListener(const EventName: String;
  Listener: TNJSEventEmitterHandler): TNJSEventEmitter;
begin

end;

function TNJSEventEmitter.emit(const EventName: String): Boolean;
begin

end;

function TNJSEventEmitter.eventnames: TJSStringDynArray;
begin

end;

function TNJSEventEmitter.getMaxListeners: Integer;
begin

end;

function TNJSEventEmitter.listenerCount(const EventName: String): Integer;
begin

end;

function TNJSEventEmitter.listeners(
  const EventName: String): TNJSEventEmitterHandlerArray;
begin

end;

function TNJSEventEmitter.off(const EventName: String;
  Listener: TNJSEventEmitterHandler): TNJSEventEmitter;
begin

end;

function TNJSEventEmitter.once(const EventName: String;
  Listener: TNJSEventEmitterHandler): TNJSEventEmitter;
begin

end;

function TNJSEventEmitter.on_(const EventName: String;
  Listener: TNJSEventEmitterHandler): TNJSEventEmitter;
begin

end;

function TNJSEventEmitter.prependListener(const EventName: String;
  Listener: TNJSEventEmitterHandler): TNJSEventEmitter;
begin

end;

function TNJSEventEmitter.prependOnceListener(const EventName: String;
  Listener: TNJSEventEmitterHandler): TNJSEventEmitter;
begin

end;

function TNJSEventEmitter.rawListeners(
  const EventName: String): TNJSEventEmitterHandlerArray;
begin

end;

function TNJSEventEmitter.removeListener(const EventName: String;
  Listener: TNJSEventEmitterHandler): TNJSEventEmitter;
begin

end;

function TNJSEventEmitter.setMaxListeners(aMax: Integer): TNJSEventEmitter;
begin

end;

{ TNJSEvents }

function TNJSEvents.once(emitter: TNJSEventEmitter; aName: string): TJSPromise;
begin

end;

function TNJSEvents.on_(emitter: TNJSEventEmitter;
  aName: string): TJSAsyncIterator;
begin

end;

{ TNJSImmediate }

function TNJSImmediate.hasRef: boolean;
begin

end;

function TNJSImmediate.ref: TNJSImmediate;
begin

end;

function TNJSImmediate.unref: TNJSImmediate;
begin

end;

{ TNJSTimeout }

function TNJSTimeout.hasRef: boolean;
begin

end;

function TNJSTimeout.ref: TNJSTimeout;
begin

end;

function TNJSTimeout.refresh: TNJSTimeout;
begin

end;

function TNJSTimeout.unref: TNJSTimeout;
begin

end;
{$ENDIF}

initialization
  {$IFDEF PAS2JS}
  NJS_OS:=TNJSOS(Require('os'));
  LineEnding:=NJS_OS.EOL;
  sLineBreak:=NJS_OS.EOL;
  {$ENDIF}

end.

