unit Rtl.ScriptLoader;

interface

uses types;

Type
  TloadedCallBack = Reference to procedure(Data : TObject);
  TProc = reference to procedure;

procedure loadScripts(scripts : TStringDynArray; callback : TLoadedCallback; Data : TObject);

implementation

{$IFDEF PAS2JS}uses js, web;{$ENDIF}

procedure loadScripts(scripts : TStringDynArray; callback : TLoadedCallback; Data : TObject);
  {$IFDEF PAS2JS}
  Procedure loader (src : String; handler : TProc);
  var 
    head,script : TJSElement;
    Procedure DoLoaded;
    begin
      script.Properties['onload']:=Nil;
      script.Properties['onreadystatechange']:=Nil;
      Handler;
    end;
  begin
    script:= document.createElement('script');
    script['src'] := src;
    script.Properties['onload'] := @DoLoaded;
    script.Properties['onreadystatechange']:=@DoLoaded;
    head:=TJSElement(document.getElementsByTagName('head')[0]);
    if Head=Nil then
      Head:=Document.body;
    head.appendChild( script );
  end;
  {$ENDIF}
    
  Procedure run;
  begin
    {$IFDEF PAS2JS}
    if Length(Scripts)<>0 then
      loader(String(TJSArray(scripts).shift()), @run)
    else if Assigned(callback) then
      callback(data);
    {$ENDIF}
  end;
begin
  Run;
end;

end. 
