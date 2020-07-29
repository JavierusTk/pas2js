unit IDE.Notifier;

interface

uses ToolsApi, Pas2Js.Registry;

type
  TIDENotifier = class(TNotifierObject, IOTANotifier, IOTAIDENotifier, IOTAIDENotifier50, IOTAIDENotifier80)
  private
    FRegistry: TPas2JsRegistry;

    function BuildCommandLine(const Project: IOTAProject): String;

    procedure AfterCompile(Succeeded: Boolean); overload;
    procedure AfterCompile(Succeeded: Boolean; IsCodeInsight: Boolean); overload;
    procedure AfterCompile(const Project: IOTAProject; Succeeded: Boolean; IsCodeInsight: Boolean); overload;
    procedure BeforeCompile(const Project: IOTAProject; IsCodeInsight: Boolean; var Cancel: Boolean); overload;
    procedure BeforeCompile(const Project: IOTAProject; var Cancel: Boolean); overload;
    procedure FileNotification(NotifyCode: TOTAFileNotification; const FileName: String; var Cancel: Boolean);
  public
    constructor Create;

    destructor Destroy; override;
  end;

implementation

uses System.SysUtils, System.IOUtils, Winapi.Windows, Vcl.Dialogs, System.Classes, CommonOptionStrs, DCCStrs;

const
  COMPILING_PAS2JS = 'Compiling Pas2Js';

{ TIDENotifier }

procedure TIDENotifier.AfterCompile(Succeeded, IsCodeInsight: Boolean);
begin

end;

procedure TIDENotifier.AfterCompile(const Project: IOTAProject; Succeeded, IsCodeInsight: Boolean);
const
  BUFFER_SIZE = 5000;

var
  StartUp: TStartupInfo;

  ProcessInformation: TProcessInformation;

  Security: TSecurityAttributes;

  Buffer: array[0..BUFFER_SIZE] of AnsiChar;

  ReadSize, Running: DWORD;

begin
  if Succeeded and not IsCodeInsight then
  begin
    var Messages := (BorlandIDEServices as IOTAMessageServices60);

    FillChar(Security, SizeOf(Security), 0);

    FillChar(StartUp, SizeOf(StartUp), 0);

    Security.nLength := SizeOf(Security);
    Security.bInheritHandle := True;
    StartUp.cb := SizeOf(StartUp);
    StartUp.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    StartUp.wShowWindow := SW_HIDE;

    Messages.AddTitleMessage(COMPILING_PAS2JS);

    try
      if not CreatePipe(StartUp.hStdInput, StartUp.hStdOutput, @Security, 0) then
        RaiseLastOSError;

      StartUp.hStdError := StartUp.hStdOutput;

      if not CreateProcess(nil, PChar(BuildCommandLine(Project)), @Security, @Security, True, NORMAL_PRIORITY_CLASS, nil, PChar(ExtractFilePath(Project.FileName)), StartUp,
        ProcessInformation) then
        RaiseLastOSError;

      repeat
        Running := WaitForSingleObject(ProcessInformation.hProcess, 100);
        
        ReadFile(StartUp.hStdInput, Buffer[0], BUFFER_SIZE, ReadSize, nil);

        Buffer[ReadSize] := #0;

        for var Text in String(PAnsiChar(@Buffer[0])).Split([#13#10]) do
          if not Text.IsEmpty then
            Messages.AddToolMessage(EmptyStr, Text, EmptyStr, 0, 0)
      until Running <> WAIT_TIMEOUT;
    finally
      CloseHandle(ProcessInformation.hProcess);

      CloseHandle(ProcessInformation.hThread);

      CloseHandle(StartUp.hStdInput);

      CloseHandle(StartUp.hStdOutput);
    end;
  end;
end;

procedure TIDENotifier.AfterCompile(Succeeded: Boolean);
begin

end;

procedure TIDENotifier.BeforeCompile(const Project: IOTAProject; IsCodeInsight: Boolean; var Cancel: Boolean);
begin

end;

procedure TIDENotifier.BeforeCompile(const Project: IOTAProject; var Cancel: Boolean);
begin

end;

function TIDENotifier.BuildCommandLine(const Project: IOTAProject): String;
begin
  var Options := Project.ProjectOptions as IOTAProjectOptionsConfigurations;
  Result := Format('"%s" -MDelphi -JRjs %s', [FRegistry.CompilerPath, ChangeFileExt(Project.FileName, '.dpr')]);

{$IFDEF DEBUG}
  Result := Result + ' -vd';
{$ENDIF}

  Result := Result + Format(' -Fu..\..\packages\rtl;"%s"', [Options.ActiveConfiguration[sUnitSearchPath]]);
end;

constructor TIDENotifier.Create;
begin
  inherited;

  FRegistry := TPas2JsRegistry.Create;
end;

destructor TIDENotifier.Destroy;
begin
  FRegistry.Free;

  inherited;
end;

procedure TIDENotifier.FileNotification(NotifyCode: TOTAFileNotification; const FileName: String; var Cancel: Boolean);
begin

end;

end.

