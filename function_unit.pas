unit function_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,edit;

type
   TeditList = class(TList)
  private
    function Get(Index: Integer): Teditfrm;
    procedure Put(Index: Integer; const Value: Teditfrm);
  public
    property Items[Index: Integer]: Teditfrm read Get write Put; default;
     destructor Destroy; override;
  end;
  { Tfunctionunit }

  Tfunctionunit = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    editlist:Teditlist;
    function window_off(i:integer):boolean;
    function newwindow(count:integer):boolean;
  end;

var
  functionunit: Tfunctionunit;

implementation

uses Main;

{$R *.lfm}

{ Tfunctionunit }

procedure Tfunctionunit.FormCreate(Sender: TObject);
begin
  editlist := TeditList.Create;
  editlist.clear;
end;


function TeditList.Get(Index: Integer): Teditfrm;
begin
  Result :=  Teditfrm( inherited Get(Index) );
end;

procedure TeditList.Put(Index: Integer; const Value: Teditfrm);
begin
  inherited Put( Index, Value );
end;

destructor TeditList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Free;
  inherited Destroy;
end;

function Tfunctionunit.window_off(i:integer):boolean;
begin
   try
      with editlist.Items[i] do begin
        DragMode := dmAutomatic;//dmManual;
        DragKind := dkDock;//dkDrag;
        ManualDock(MainForm);
        ManualDock(MainForm.EditDockPanel);
        BorderStyle:= bsnone;
        //function_unit.resizedocwindow;
      end;
   except
   end;
end;



function Tfunctionunit.newwindow(count:integer):boolean;
begin
  editlist.Add(Teditfrm);
  editlist.Items[count] := Teditfrm.Create(self);

  //edit[count] := Teditfrm.Create(self);
  //edit[count].Visible:= false;
  //edit[count].SynMemo1.Lines.Clear;
  //function_unit.write_names(count,'NewFile' + inttostr(MainForm.count_new));
  //MainForm.Caption:= editname + function_unit.coll_filename(count) + ']';
  //MainForm.TabControl1.Tabs.Add(function_unit.coll_filename(count));
  //MainForm.TabControl1.TabIndex := count;
  //function_unit.write_saves(count,false);
  with editlist.Items[count] do
  begin
    DragMode := dmAutomatic;
    //Caption := utf8tosys(ExtractFileName(function_unit.coll_filename(count)));
    //No := count;
    //function_unit.write_saves(count,False);
    //MainForm.Caption := editname + utf8tosys(function_unit.coll_filename(count)) + ']';
    Show;

    editlist.Items[count].Top := 20;//MainForm.Top + MainForm.Height + 20;
    editlist.Items[count].Left := MainForm.Left;
    editlist.Items[count].Width := MainForm.Width;
    WindowState:= wsNormal;
    //editfrm[count].SynMemo1.ScrollBars:= ssBoth;
    //inc(MainForm.count_new);
  end;
end;









end.

