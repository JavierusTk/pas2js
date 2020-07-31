unit Pipe;

interface

uses Winapi.Windows;

type
  TPipe = class
  private
    FInputHandle: THandle;
    FOutputHandle: THandle;
  public
    constructor Create(var Security: TSecurityAttributes);

    destructor Destroy; override;

    property InputHandle: THandle read FInputHandle;
    property OutputHandle: THandle read FOutputHandle;
  end;

implementation

uses System.SysUtils;

{ TPipe }

constructor TPipe.Create(var Security: TSecurityAttributes);
begin
  if not CreatePipe(FInputHandle, FOutputHandle, @Security, 0) then
    RaiseLastOSError;
end;

destructor TPipe.Destroy;
begin
  CloseHandle(InputHandle);

  CloseHandle(OutputHandle);

  inherited;
end;

end.
