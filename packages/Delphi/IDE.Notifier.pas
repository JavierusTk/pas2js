unit IDE.Notifier;

interface

uses ToolsApi;

type
  TIDENotifier = class(TNotifierObject, IOTANotifier, IOTAIDENotifier, IOTAIDENotifier50, IOTAIDENotifier80)
  private
    procedure AfterCompile(Succeeded: Boolean); overload;
    procedure AfterCompile(Succeeded: Boolean; IsCodeInsight: Boolean); overload;
    procedure AfterCompile(const Project: IOTAProject; Succeeded: Boolean; IsCodeInsight: Boolean); overload;
    procedure BeforeCompile(const Project: IOTAProject; IsCodeInsight: Boolean; var Cancel: Boolean); overload;
    procedure BeforeCompile(const Project: IOTAProject; var Cancel: Boolean); overload;
    procedure FileNotification(NotifyCode: TOTAFileNotification; const FileName: String; var Cancel: Boolean);
  end;

implementation

uses Pas2Js.Compiler;

{ TIDENotifier }

procedure TIDENotifier.AfterCompile(Succeeded, IsCodeInsight: Boolean);
begin

end;

procedure TIDENotifier.AfterCompile(const Project: IOTAProject; Succeeded, IsCodeInsight: Boolean);
begin
  if Succeeded and not IsCodeInsight then
  begin
    var Compiler := TPas2JsCompiler.Create;

    Compiler.Compile(Project, BorlandIDEServices as IOTAMessageServices);

    Compiler.Free;
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

procedure TIDENotifier.FileNotification(NotifyCode: TOTAFileNotification; const FileName: String; var Cancel: Boolean);
begin

end;

end.

