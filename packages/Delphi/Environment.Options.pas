unit Environment.Options;

interface

uses Vcl.Forms, ToolsApi, Environment.Options.Frame, Pas2Js.Registry;

type
  TPas2JsConfiguration = class(TInterfacedObject, INTAAddInOptions)
  private
    FRegistry: TPas2JsRegistry;

    FFrame: TEnvironmentOptionsFrame;

    function GetArea: String;
    function GetCaption: String;
    function GetFrameClass: TCustomFrameClass;
    function GetHelpContext: Integer;
    function IncludeInIDEInsight: Boolean;
    function ValidateContents: Boolean;

    procedure DialogClosed(Accepted: Boolean);
    procedure FrameCreated(AFrame: TCustomFrame);
  public
    constructor Create;

    destructor Destroy; override;
  end;

implementation

uses System.SysUtils;

{ TPas2JsConfiguration }

constructor TPas2JsConfiguration.Create;
begin
  inherited;

  FRegistry := TPas2JsRegistry.Create;
end;

destructor TPas2JsConfiguration.Destroy;
begin
  FRegistry.Free;

  inherited;
end;

procedure TPas2JsConfiguration.DialogClosed(Accepted: Boolean);
begin
  if Accepted then
    FRegistry.CompilerPath := FFrame.CompilerPath.Text;
end;

procedure TPas2JsConfiguration.FrameCreated(AFrame: TCustomFrame);
begin
  FFrame := AFrame as TEnvironmentOptionsFrame;
  FFrame.CompilerPath.Text := FRegistry.CompilerPath;
end;

function TPas2JsConfiguration.GetArea: String;
begin
  Result := PAS2JS_NAME;
end;

function TPas2JsConfiguration.GetCaption: String;
begin
  Result := EmptyStr;
end;

function TPas2JsConfiguration.GetFrameClass: TCustomFrameClass;
begin
  Result := TEnvironmentOptionsFrame;
end;

function TPas2JsConfiguration.GetHelpContext: Integer;
begin
  Result := -1;
end;

function TPas2JsConfiguration.IncludeInIDEInsight: Boolean;
begin
  Result := True;
end;

function TPas2JsConfiguration.ValidateContents: Boolean;
begin
  Result := True;
end;

end.

