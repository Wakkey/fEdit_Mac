program fEdit_Mac;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, edit, Main, functionunit, compunit, find, printer4lazarus, lazcontrols;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(Tfunction_unit, function_unit);
  Application.CreateForm(Tcomp_unit, comp_unit);
  Application.CreateForm(Tfind_form, find_form);
  Application.Run;
end.

