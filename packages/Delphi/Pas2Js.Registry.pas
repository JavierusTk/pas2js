unit Pas2Js.Registry;

interface

uses System.Win.Registry;

type
  TPas2JsRegistry = class
  private
    FRegistry: TRegIniFile;

    function GetCompilerPath: String;

    procedure SetCompilerPath(const Value: String);
  public
    constructor Create;

    destructor Destroy; override;

    property CompilerPath: String read GetCompilerPath write SetCompilerPath;
  end;

const
  PAS2JS_NAME = 'Pas2js';

implementation

uses System.SysUtils, ToolsApi;

const
  COMPILER_PATH = 'Compiler Path';

{ TPas2JsRegistry }

constructor TPas2JsRegistry.Create;
begin
  inherited;

  FRegistry := TRegIniFile.Create((BorlandIDEServices as IOTAServices).GetBaseRegistryKey);
end;

destructor TPas2JsRegistry.Destroy;
begin
  FRegistry.Free;

  inherited;
end;

function TPas2JsRegistry.GetCompilerPath: String;
begin
  Result := FRegistry.ReadString(PAS2JS_NAME, COMPILER_PATH, EmptyStr);
end;

procedure TPas2JsRegistry.SetCompilerPath(const Value: String);
begin
  FRegistry.WriteString(PAS2JS_NAME, COMPILER_PATH, Value);
end;

end.
