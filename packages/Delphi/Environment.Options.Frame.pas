unit Environment.Options.Frame;

interface

uses Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Controls, System.Classes,
  Vcl.Dialogs;

type
  TEnvironmentOptionsFrame = class(TFrame)
    Compiler: TGroupBox;
    lblPath: TLabel;
    CompilerPath: TEdit;
    OpenDialog: TButton;
    Dialog: TOpenDialog;
    procedure OpenDialogClick(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TEnvironmentOptionsFrame.OpenDialogClick(Sender: TObject);
begin
  if Dialog.Execute then
    CompilerPath.Text := Dialog.FileName;
end;

end.
