unit Pas2Js.Compiler;

interface

uses ToolsApi, Pas2Js.Registry;

type
  TPas2JsCompiler = class
  private
    FRegistry: TPas2JsRegistry;

    function BuildCommandLine(const Project: IOTAProject): String;
  public
    constructor Create;

    destructor Destroy; override;

    procedure Compile(const Project: IOTAProject; const Messages: IOTAMessageServices);
  end;

const
  COMPILING_PAS2JS = 'Compiling Pas2Js';

implementation

uses System.SysUtils, CommonOptionStrs, DCCStrs, Process;

function ExpandMacros(Value: String): String;
begin
  Result := (BorlandIDEServices as IOTAServices).ExpandRootMacro(Value);
end;

{ TPas2JsCompiler }

function TPas2JsCompiler.BuildCommandLine(const Project: IOTAProject): String;
begin
  var CompilerPath := ExpandMacros(FRegistry.CompilerPath);
  var Options := Project.ProjectOptions as IOTAProjectOptionsConfigurations;
  Result := Format('"%s" -MDelphi -JRjs "%s"', [CompilerPath, ChangeFileExt(Project.FileName, '.dpr')]);

{$IFDEF DEBUG}
  Result := Result + ' -vd';
{$ENDIF}

  Result := Result + Format(' -Jc -Fu"%s\..\..\packages\rtl";"%s" -FE"%s" -FU"%s"', [ExtractFilePath(CompilerPath), ExpandMacros(Options.ActiveConfiguration[sUnitSearchPath]),
    ExpandMacros(Options.ActiveConfiguration[sExeOutput]), ExpandMacros(Options.ActiveConfiguration[sDcuOutput])]);
end;

procedure TPas2JsCompiler.Compile(const Project: IOTAProject; const Messages: IOTAMessageServices);
var
  Process: TProcess;

begin
  Process := TProcess.Create;

  Messages.AddTitleMessage(COMPILING_PAS2JS);

  Process.OutputEvent :=
    procedure (Text: String)
    begin
      Messages.AddToolMessage(EmptyStr, Text, EmptyStr, 0, 0);
    end;

  Process.Execute(ExtractFilePath(Project.FileName), BuildCommandLine(Project));

  Process.Free;
end;

constructor TPas2JsCompiler.Create;
begin
  inherited;

  FRegistry := TPas2JsRegistry.Create;
end;

destructor TPas2JsCompiler.Destroy;
begin
  FRegistry.Free;

  inherited;
end;

end.
