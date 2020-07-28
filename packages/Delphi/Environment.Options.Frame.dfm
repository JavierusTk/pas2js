object EnvironmentOptionsFrame: TEnvironmentOptionsFrame
  Left = 0
  Top = 0
  Width = 324
  Height = 124
  Align = alClient
  TabOrder = 0
  object Compiler: TGroupBox
    Left = 0
    Top = 0
    Width = 324
    Height = 124
    Align = alClient
    Caption = 'Compiler'
    TabOrder = 0
    ExplicitHeight = 240
    DesignSize = (
      324
      124)
    object lblPath: TLabel
      Left = 11
      Top = 24
      Width = 22
      Height = 13
      Caption = 'Path'
    end
    object CompilerPath: TEdit
      Left = 11
      Top = 43
      Width = 271
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object OpenDialog: TButton
      Left = 288
      Top = 41
      Width = 33
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 1
      OnClick = OpenDialogClick
    end
  end
  object Dialog: TOpenDialog
    FileName = 'pas2js.exe'
    Filter = 'Compiler|pas2js.exe'
    Options = [ofFileMustExist, ofEnableIncludeNotify, ofEnableSizing]
    Left = 184
    Top = 72
  end
end
