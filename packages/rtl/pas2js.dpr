program pas2js;

uses
  Vcl.Forms,
  browserconsole in 'browserconsole.pas',
  class2pas in 'class2pas.pas',
  contnrs in 'contnrs.pas',
  dateutils in 'dateutils.pas',
  generics.collections in 'generics.collections.pas',
  generics.defaults in 'generics.defaults.pas',
  generics.strings in 'generics.strings.pas',
  hotreloadclient in 'hotreloadclient.pas',
  js in 'js.pas',
  libjquery in 'libjquery.pas',
  math in 'math.pas',
  nodejs in 'nodejs.pas',
  objpas in 'objpas.pas',
  pas2js_rtl in 'pas2js_rtl.pas',
  Rtl.ScriptLoader in 'Rtl.ScriptLoader.pas',
  Rtl.TemplateLoader in 'Rtl.TemplateLoader.pas',
  Rtl.UnitLoader in 'Rtl.UnitLoader.pas',
  rtlconsts in 'rtlconsts.pas',
  rtti in 'rtti.pas',
  simplelinkedlist in 'simplelinkedlist.pas',
  strutils in 'strutils.pas',
  sysutils in 'sysutils.pas',
  timer in 'timer.pas',
  types in 'types.pas',
  typinfo in 'typinfo.pas',
  web in 'web.pas',
  webassembly in 'webassembly.pas',
  webaudio in 'webaudio.pas',
  webbluetooth in 'webbluetooth.pas',
  webgl in 'webgl.pas',
  webrtc in 'webrtc.pas',
  websvg in 'websvg.pas',
  webutils in 'webutils.pas',
  SystemPas2JS in 'SystemPas2JS.pas',
  classes in 'classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
