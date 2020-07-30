unit webassembly;

{$IFDEF PAS2JS}
{$mode objfpc}
{$modeswitch externalclass}
{$ENDIF}

interface

uses
  js, Web;

Type

  { TJSModulesArray }

  TJSModulesExports = Class {$IFDEF PAS2JS}external name 'anon'{$ENDIF} (TJSObject)
  private
    function GetFun(aName : String): TJSFunction; {$IFDEF PAS2JS}external name '[]';{$ENDIF}
  public
    Property functions [aName : String] : TJSFunction read GetFun; default;
  end;

  TJSModulesImports =  TJSModulesExports;

  TJSWebAssemblyModule = class {$IFDEF PAS2JS}external name 'WebAssembly.Module'{$ENDIF} (TJSObject)
    constructor new(buffer : TJSArrayBuffer);
    Class Function customSections(module: TJSWebAssemblyModule; const SectionName : string) : TJSArrayBuffer;
    Class Function exports_(module: TJSWebAssemblyModule) : TJSModulesExports; {$IFDEF PAS2JS}external name 'exports';{$ENDIF}
    Class Function imports(module: TJSWebAssemblyModule) : TJSModulesImports; {$IFDEF PAS2JS}external name 'exports';{$ENDIF}
  end;

  { TJSWebAssemblyInstance }

  TJSWebAssemblyInstance = class {$IFDEF PAS2JS}external name 'WebAssembly.Instance'{$ENDIF} (TJSObject)
  private
    Fexports: TJSModulesExports; {$IFDEF PAS2JS}external name 'exports';{$ENDIF}
  public
    constructor new(module : TJSWebAssemblyModule; ImportObject : TJSOBject); overload;
    constructor new(module : TJSWebAssemblyModule); overload;
    Property exports_ : TJSModulesExports Read Fexports;
  end;

  { TJSInstantiated }
  // Result returned when calling instantiate with buffer

  { TJSInstantiateResult }

  TJSInstantiateResult = Class {$IFDEF PAS2JS}external name 'anon'{$ENDIF} (TJSObject)
  private
    FInstance: TJSWebAssemblyInstance; {$IFDEF PAS2JS}external name 'instance';{$ENDIF}
    FModule: TJSWebAssemblyModule; {$IFDEF PAS2JS}external name 'module';{$ENDIF}
  public
    Property Module : TJSWebAssemblyModule Read FModule;
    Property Instance : TJSWebAssemblyInstance Read Finstance;
  end;

  TJSWebAssembly = class {$IFDEF PAS2JS}external name 'WebAssembly'{$ENDIF} (TJSObject)
    Class Function instantiate(Buffer : TJSArrayBuffer; ImportObject :  TJSObject) : TJSPromise; overload;
    Class Function instantiate(Buffer : TJSArrayBuffer) : TJSPromise; overload;
    Class Function instantiate(Buffer : TJSWebAssemblyModule; ImportObject :  TJSObject) : TJSPromise; overload;
    Class Function instantiate(Buffer : TJSWebAssemblyModule) : TJSPromise; overload;
    Class Function compile(Buffer : TJSArrayBuffer): TJSPromise;
    Class Function compileStreaming(source : TJSResponse): TJSPromise;
    Class Function instantiateStreaming(source : TJSResponse; ImportObject :  TJSObject) : TJSPromise; overload;
    Class Function instantiateStreaming(source : TJSResponse) : TJSPromise; overload;
    Class Function validate(Buffer : TJSArrayBuffer): Boolean;
  end;

  { TJSWebAssemblyTable }

  TJSWebAssemblyTableDescriptor = record
    element : string;
    initial,
    maximum : integer;
  end;

  TJSWebAssemblyTable = class {$IFDEF PAS2JS}external name 'WebAssembly.Table'{$ENDIF} (TJSObject)
  private
    FLength: NativeInt;
  Public
    constructor new (tabledescriptor : TJSWebAssemblyTableDescriptor); overload;
    constructor new (tabledescriptor : TJSObject); overload;
    Property length: NativeInt Read FLength;
  end;
  { TJSWebAssemblyMemory }

  TJSWebAssemblyMemoryDescriptor = record
    initial,
    maximum : integer;
  end;

  TJSWebAssemblyMemory = class {$IFDEF PAS2JS}external name 'WebAssembly.Memory'{$ENDIF} (TJSObject)
  private
    FBuffer: TJSArrayBuffer; {$IFDEF PAS2JS}external name 'buffer';{$ENDIF}
    FLength: NativeInt; {$IFDEF PAS2JS}external name 'length';{$ENDIF}
  Public
    constructor new (memorydescriptor : TJSWebAssemblyMemoryDescriptor); overload;
    constructor new (memorydescriptor : TJSObject); overload;
    Property buffer : TJSArrayBuffer Read FBuffer;
    Property length: NativeInt Read FLength;
  end;

implementation
{$IFDEF DCC}
{ TJSModulesExports }

function TJSModulesExports.GetFun(aName: String): TJSFunction;
begin

end;

{ TJSWebAssemblyModule }

class function TJSWebAssemblyModule.customSections(module: TJSWebAssemblyModule;
  const SectionName: string): TJSArrayBuffer;
begin

end;

class function TJSWebAssemblyModule.exports_(
  module: TJSWebAssemblyModule): TJSModulesExports;
begin

end;

class function TJSWebAssemblyModule.imports(
  module: TJSWebAssemblyModule): TJSModulesImports;
begin

end;

constructor TJSWebAssemblyModule.new(buffer: TJSArrayBuffer);
begin

end;

{ TJSWebAssemblyInstance }

constructor TJSWebAssemblyInstance.new(module: TJSWebAssemblyModule);
begin

end;

constructor TJSWebAssemblyInstance.new(module: TJSWebAssemblyModule;
  ImportObject: TJSOBject);
begin

end;

{ TJSWebAssembly }

class function TJSWebAssembly.compile(Buffer: TJSArrayBuffer): TJSPromise;
begin

end;

class function TJSWebAssembly.compileStreaming(source: TJSResponse): TJSPromise;
begin

end;

class function TJSWebAssembly.instantiate(Buffer: TJSWebAssemblyModule;
  ImportObject: TJSObject): TJSPromise;
begin

end;

class function TJSWebAssembly.instantiate(Buffer: TJSArrayBuffer): TJSPromise;
begin

end;

class function TJSWebAssembly.instantiate(Buffer: TJSArrayBuffer;
  ImportObject: TJSObject): TJSPromise;
begin

end;

class function TJSWebAssembly.instantiate(
  Buffer: TJSWebAssemblyModule): TJSPromise;
begin

end;

class function TJSWebAssembly.instantiateStreaming(
  source: TJSResponse): TJSPromise;
begin

end;

class function TJSWebAssembly.instantiateStreaming(source: TJSResponse;
  ImportObject: TJSObject): TJSPromise;
begin

end;

class function TJSWebAssembly.validate(Buffer: TJSArrayBuffer): Boolean;
begin

end;

{ TJSWebAssemblyTable }

constructor TJSWebAssemblyTable.new(tabledescriptor: TJSObject);
begin

end;

constructor TJSWebAssemblyTable.new(
  tabledescriptor: TJSWebAssemblyTableDescriptor);
begin

end;

{ TJSWebAssemblyMemory }

constructor TJSWebAssemblyMemory.new(memorydescriptor: TJSObject);
begin

end;

constructor TJSWebAssemblyMemory.new(
  memorydescriptor: TJSWebAssemblyMemoryDescriptor);
begin

end;
{$ENDIF}
end.

