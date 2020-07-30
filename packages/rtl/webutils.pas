unit webutils;

{$IFDEF PAS2JS}
{$mode objfpc}
{$ENDIF}

interface

uses
  web, js;

function AsyncSleep(ms: NativeInt): TJSPromise;

implementation

function AsyncSleep(ms: NativeInt): TJSPromise;

begin
  {$IFDEF PAS2JS}
  Result := TJSPromise.New(
  procedure(resolve,reject : TJSPromiseResolver)
  begin
    window.setTimeout(
    procedure()
    begin
      resolve(ms);
    end,
    ms);
  end);
  {$ENDIF}
end;

end.

