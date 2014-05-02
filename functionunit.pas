unit functionunit;

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
  { Tfunction_unit }

  Tfunction_unit = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    editlist:Teditlist;
    function window_off(i:integer):boolean;
    function newwindow(count:integer):boolean;
    function newedit(i:integer):boolean;
    function chingSize(i:integer):boolean;
    function frmpsnset(count:integer):boolean;
    function resizedocwindow(count:integer):boolean;
    function resizewindow2:boolean;
    function changtabset(i:integer):boolean;
    function closeTab(i:integer):boolean;
    function closeAllTab:boolean;

    function chengingtab(i:integer):boolean;

    function chengtab(i1:integer):boolean;

  end;

var
  function_unit: Tfunction_unit;

implementation

uses Main;

{$R *.lfm}

{ Tfunction_unit }

procedure Tfunction_unit.FormCreate(Sender: TObject);
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

function Tfunction_unit.window_off(i:integer):boolean;
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

function Tfunction_unit.chingSize(i:integer):boolean;
begin
  if i = -1 then
    exit;
  if MainForm.Height <> screen.Height then
    if MainForm.Width <> screen.Width then
      function_unit.frmpsnset(i);
  function_unit.resizewindow2;
end;

function Tfunction_unit.newwindow(count:integer):boolean;
begin
  editlist.add(Teditfrm);
  editlist.Items[count] := Teditfrm.Create(self);
  editlist.Items[count].Name:= 'new' + inttostr(count);
  mainform.TabControl1.Tabs.Insert(count,'');
  mainform.TabControl1.Tabs[count] := editlist.Items[count].Name;

  editlist.Items[count].Visible:= false;
  editlist.Items[count].SynMemo1.Lines.Clear;
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

    editlist.Items[count].Top := MainForm.Top {+ MainForm.Height} + 20;
    editlist.Items[count].Left := MainForm.Left;
    editlist.Items[count].Width := MainForm.Width;
    editlist.Items[count].Height:= mainform.Height;
    WindowState:= wsNormal;
    //editfrm[count].SynMemo1.ScrollBars:= ssBoth;
    //inc(MainForm.count_new);
  end;
end;

function Tfunction_unit.newedit(i:integer):boolean;
begin
  function_unit.newwindow(i);
  function_unit.window_off(i);
  mainform.TabControl1.TabIndex:= i;
  //function_unit.chengtab(i);
   //mainform.tabclicks := true;
   function_unit.resizewindow2;
end;

function Tfunction_unit.frmpsnset(count:integer):boolean;
begin
  with editlist.Items[count] do begin
    Top := MainForm.Top;
    left:= MainForm.Left;
    width:= MainForm.Width;
    height:= MainForm.Height;
  end;
end;

function Tfunction_unit.changtabset(i:integer):boolean;
begin
  //if MainForm.T_W_sw then begin
    //exit;
  //end;
  //if MainForm.TabControl1.Tabs[i] = 'ADD' then begin
    //Menu_NewClick(Sender);
   // exit;
  //end;
   function_unit.chengtab(i);
   //mainform.tabclicks := true;
   function_unit.resizewindow2;
end;
function Tfunction_unit.resizedocwindow(count:integer):boolean;
begin
  //if MainForm.count > 0 then
  begin
    //if not MainForm.Menu_MultWindow.Checked then
       begin
      with editlist.Items[count] do begin
      Top:= 0;
      Left:=0;
      Width:= MainForm.EditDockPanel.Width;
      Height:=MainForm.EditDockPanel.Height;
      end;
    end;
  end;
end;


function Tfunction_unit.resizewindow2:boolean;
var
  s:string;
begin
  {if MainForm.Menu_MultWindow.Checked then begin
    s := function_unit.toolbaraligin('?');
    if (s = 'top') or (s = 'bottom') then begin
      MainForm.TabControl1.Height:= 60;
      MainForm.winmodeheight:= MainForm.toolbar2.Height + MainForm.PageControl1.Height + MainForm.TabControl1.Height;
      MainForm.Height := MainForm.winmodeheight;
    end;
    if (s = 'left') or (s = 'right') then begin
      MainForm.TabControl1.Width:= 20;
      MainForm.winmodeheight:= 200;//MainForm.toolbar2.Width + MainForm.TabControl1.Width;
      MainForm.Width := MainForm.winmodeheight;
    end;

  end else }begin
     function_unit.resizedocwindow(mainform.TabControl1.TabIndex);
  end;
end;

function Tfunction_unit.closeTab(i:integer):boolean;
begin
  function_unit.editlist.Items[i].Close;
  function_unit.editlist.Delete(i);
  mainform.TabControl1.Tabs.Delete(i);
end;

function Tfunction_unit.closeAllTab:boolean;
var
  i:integer;
begin
  i:= function_unit.editlist.Count;
  while i > 0 do begin
    function_unit.closeTab(0);
    dec(i);
  end;
end;

function Tfunction_unit.chengtab(i1:integer):boolean;
  {function edittypeset(s:string):boolean;
    begin
      if s = '' then begin
        MainForm.Menu_C.Checked:= false;
        MainForm.Menu_Delphi.Checked:= false;
        MainForm.Menu_Pascal.Checked:= false;
        MainForm.Menu_Java.Checked:= false;
        MainForm.MenuI_UnixShell.Checked:= false;
        MainForm.Menu_VBScript.Checked:= false;
        MainForm.Menu_BAT.Checked:= false;
        MainForm.Menu_HTML.Checked:= false;
        MainForm.Menu_XML.Checked:= false;
        MainForm.Menu_Css.Checked:= false;
        MainForm.Menu_INI.Checked:= false;
        MainForm.Menu_lazarus.Checked:= false;
        MainForm.Menu_PHP.Checked:= false;
        MainForm.Menu_Perl.Checked:= false;
        MainForm.Menu_pyhton.Checked:= false;
        MainForm.Menu_FreeHeightLight.Checked:= false;
        MainForm.Menu_SQL.Checked:= false;
        exit;
      end else if s = 'cpp' then begin
        MainForm.Menu_CClick(MainForm.Menu_C);
      end else if s = 'pas' then begin
        MainForm.Menu_DelphiClick(MainForm.Menu_Delphi);
      end else if s = 'fpas' then begin
        MainForm.Menu_PascalClick(MainForm.Menu_Pascal);
      end else if s = 'java' then begin
        MainForm.Menu_JavaClick(MainForm.Menu_Java);
      end else if s = 'chell' then begin
        MainForm.MenuI_UnixShellClick(MainForm.MenuI_UnixShell);
      end else if s = 'vbs' then begin
        MainForm.Menu_VBScriptClick(MainForm.Menu_VBScript);
      end else if s = 'bat' then begin
        MainForm.Menu_BATClick(MainForm.Menu_BAT);
      end else if s = 'html' then begin
        MainForm.Menu_HTMLClick(MainForm.Menu_HTML);
      end else if s = 'xml' then begin
        MainForm.Menu_XMLClick(MainForm.Menu_XML);
      end else if s = 'css' then begin
        MainForm.Menu_CssClick(MainForm.Menu_Css);
      end else if s = 'ini' then begin
        MainForm.Menu_INIClick(MainForm.Menu_INI);
      end else if s = 'laz' then begin
        MainForm.Menu_lazarusClick(MainForm.Menu_lazarus);
      end else if s = 'php' then begin
        MainForm.Menu_PHPClick(MainForm.Menu_PHP);
      end else if s = 'perl' then begin
        MainForm.Menu_PerlClick(MainForm.Menu_Perl);
      end else if s = 'pyhton' then begin
        MainForm.Menu_pyhtonClick(MainForm.Menu_pyhton)
      end else if s = 'any' then begin
        MainForm.Menu_FreeHeightLightClick(MainForm.Menu_FreeHeightLight);
      end else if s = 'sql' then begin
        MainForm.Menu_SQLClick(MainForm.Menu_SQL);
      end else if s = 'tex' then begin

      end else if s = 'lfm' then begin

      end;
    end;}
var
  i:integer;
  {function checks(i1:integer):boolean;
  begin
    if not editfrm[i1].Memo.Visible then begin
      MainForm.Menu_MemoMode.Checked:= false;
      MainForm.Menu_RootHeightLight.Visible:= true;
      //MainForm.Menu_RootSupport.Visible := true;
    end else begin
      MainForm.Menu_MemoMode.Checked:= true;
      MainForm.Menu_RootHeightLight.Visible:= not true;
      //MainForm.Menu_RootSupport.Visible := not true;
    end;
  end;}
begin
  {if  MainForm.T_W_sw then begin
      exit;
  end;
  if editfrm[i1].charsets = 'Ansi' then begin
      mainform.Menu_Ansiclick(mainform.Menu_Ansi);
    end else if editfrm[i1].charsets = 'UTF8' then begin
      mainform.Menu_UTF8_Ansiclick(mainform.Menu_UTF8_Ansi);
    end else if editfrm[i1].charsets = 'UTF16' then begin
      mainform.Menu_UTF16click(mainform.Menu_UTF16)
  end;}
  //if not MainForm.Menu_MultWindow.Checked then
  begin
    for i := 0 to function_unit.editlist.Count -1 do begin
      function_unit.editlist.Items[i].Visible:= false;
    end;
      function_unit.editlist.Items[i1].Visible:=true;
    //checks(i1);
  end;{ else begin
    if editfrm[i1] = nil then
      exit;
    checks(i1);
    function_unit.memopadmode;
    if not editfrm[i1].Memo.Visible then begin
      MainForm.Menu_MemoMode.Checked:= false;
    end else begin
      MainForm.Menu_MemoMode.Checked:= true;
    end;
    //editfrm[i1].memos.Text := editfrm[i1].SynMemo1.Text;
    setActiveWindow(editfrm[i1].Handle);
    editfrm[i1].SynMemo1.Text := editfrm[i1].memos.Text;

    try
      //editfrm[i].SynMemo1.SelStart:= editfrm[i].keepselstart;
    except

    end;
  end;}
  function_unit.resizedocwindow(mainform.TabControl1.TabIndex);
  //form3.OpenDialog1.FileName:= function_unit.coll_filename(i1);
  //form3.SaveDialog1.FileName:= function_unit.coll_filename(i1);
  //MainForm.caption := editname + function_unit.coll_filename(i1) + ']';
  {if editfrm[i1].Memo.Visible then begin
    if not mainform.Menu_MemoMode.Checked then begin

      if not MainForm.Menu_MultWindow.Checked then begin
        MainForm.Menu_RootHeightLight.Visible:= false;
        //MainForm.Menu_RootSupport.Visible := false;
      end;
      mainform.Menu_MemoMode.Checked := true;
      function_unit.memopadmode;
    end;
  end else begin
    if mainform.Menu_MemoMode.Checked then begin

      if not MainForm.Menu_MultWindow.Checked then begin
        MainForm.Menu_RootHeightLight.Visible:= true;
        //MainForm.Menu_RootSupport.Visible := true;
      end;
      mainform.Menu_MemoMode.Checked := false;
      function_unit.memopadmode;
    end;
  end;}
  //edittypeset(editfrm[i1].edittype);
end;

function Tfunction_unit.chengingtab(i:integer):boolean;
begin
  try
    //editfrm[i].memos.Text := editfrm[i].SynMemo1.Text;
    try
      //editfrm[i].keepselstart := editfrm[i].SynMemo1.SelStart;
    except
      //editfrm[i].keepselstart := 0;
    end;
  except

  end;
end;








end.
