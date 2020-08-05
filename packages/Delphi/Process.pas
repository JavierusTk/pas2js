unit Process;

interface

uses System.SysUtils, Pipe;

type
  TProcess = class
  private
    FOutputEvent: TProc<String>;

    function ReadPipe(Pipe: TPipe): String;
  public
    procedure Execute(WorkingDirectory, CommandLine: String);

    property OutputEvent: TProc<String> read FOutputEvent write FOutputEvent;
  end;

implementation

uses Winapi.Windows;

{ TProcess }

procedure TProcess.Execute(WorkingDirectory, CommandLine: String);
var
  StartUp: TStartupInfo;

  ProcessInformation: TProcessInformation;

  Security: TSecurityAttributes;

  Running: DWORD;

begin
  FillChar(Security, SizeOf(Security), 0);

  FillChar(StartUp, SizeOf(StartUp), 0);

  Security.nLength := SizeOf(Security);
  Security.bInheritHandle := True;
  StartUp.cb := SizeOf(StartUp);
  StartUp.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
  StartUp.wShowWindow := SW_HIDE;

  var PipeError := TPipe.Create(Security);
  var PipeStd := TPipe.Create(Security);

  try
    StartUp.hStdInput := PipeStd.InputHandle;
    StartUp.hStdOutput := PipeStd.OutputHandle;
    StartUp.hStdError := PipeError.OutputHandle;

    if not CreateProcess(nil, PChar(CommandLine), @Security, @Security, True, NORMAL_PRIORITY_CLASS, nil, PChar(WorkingDirectory), StartUp, ProcessInformation) then
      RaiseLastOSError;

    repeat
      Running := WaitForSingleObject(ProcessInformation.hProcess, 100);

      var PipeText := ReadPipe(PipeStd);

      if not PipeText.IsEmpty then
        for var Text in PipeText.Split([#13#10]) do
          if not Text.IsEmpty then
            OutputEvent(Text);

      PipeText := ReadPipe(PipeError);

      if not PipeText.IsEmpty then
        raise Exception.Create(PipeText);
    until Running <> WAIT_TIMEOUT;
  finally
    CloseHandle(ProcessInformation.hProcess);

    CloseHandle(ProcessInformation.hThread);

    PipeStd.Free;

    PipeError.Free;
  end;
end;

function TProcess.ReadPipe(Pipe: TPipe): String;
const
  BUFFER_SIZE = 5000;

var
  ReadSize: DWORD;

  Buffer: array[0..BUFFER_SIZE] of AnsiChar;

begin
  Result := EmptyStr;

  if PeekNamedPipe(Pipe.InputHandle, nil, 0, nil, @ReadSize, nil) and (ReadSize > 0) then
  begin
    ReadFile(Pipe.InputHandle, Buffer[0], BUFFER_SIZE, ReadSize, nil);

    Buffer[ReadSize] := #0;

    Result := String(PAnsiChar(@Buffer[0]));
  end;
end;

end.
