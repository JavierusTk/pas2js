unit Pas2Js.Reg;

interface

procedure Register;

implementation

uses ToolsApi, Environment.Options, IDE.Notifier;

var
  GOptions: INTAAddInOptions = nil;

  GIndexIDENotifier: Integer;

procedure Register;
begin
  GIndexIDENotifier := (BorlandIDEServices as IOTAServices).AddNotifier(TIDENotifier.Create);
  GOptions := TPas2JsConfiguration.Create;

  (BorlandIDEServices as INTAEnvironmentOptionsServices).RegisterAddInOptions(GOptions);
end;

initialization

finalization
  (BorlandIDEServices as INTAEnvironmentOptionsServices).UnregisterAddInOptions(GOptions);

  (BorlandIDEServices as IOTAServices).RemoveNotifier(GIndexIDENotifier);

end.
