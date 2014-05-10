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
    TitleName:string;
    charset_new:string;
    function set_char(i:integer;s:string):string;
    function window_off(i:integer):boolean;
    function newwindow(count:integer):boolean;
    function newedit(i:integer):boolean;

    function filesOpen:boolean;
    function open(i:integer;s:string):boolean;
    function save(i:integer):boolean;
    function saveas(i:integer):boolean;
    function AllSave:boolean;
    function AllSaveAs:boolean;

    function edit_contlorl(s:String;tab:integer):boolean;

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

uses Main,compunit;

{$R *.lfm}

{ Tfunction_unit }
function UTF8ToUTF16(const S: AnsiString):WIdeString;
begin
  UTF8ToUTF16 := s;
end;

function UTF16ToUTF8(const S: WIdeString):AnsiString;
begin
  UTF16ToUTF8 := s;
end;

function Tfunction_unit.set_char(i:integer;s:string):string;
begin
  function_unit.charset_new:= s;
  if  s = 'Ansi' then begin
    mainform.Menu_Ansi.Checked:=true;
    mainform.Menu_UTF8_Ansi.Checked:=false;
    mainform.Menu_UTF16.Checked:=false;
  end else if s = 'Utf8' then begin
    mainform.Menu_Ansi.Checked:=false;
    mainform.Menu_UTF8_Ansi.Checked:=true;
    mainform.Menu_UTF16.Checked:=false;
  end else if s = 'Utf8' then begin
    mainform.Menu_Ansi.Checked:=false;
    mainform.Menu_UTF8_Ansi.Checked:=false;
    mainform.Menu_UTF16.Checked:=true;
  end;
  if i = -1 then begin
    exit;
  end;
  if s = '?' then begin
    set_char := function_unit.editlist.Items[i].charset
  end;
  function_unit.editlist.Items[i].charset:= s;
end;

procedure Tfunction_unit.FormCreate(Sender: TObject);
begin
  editlist := TeditList.Create;
  editlist.clear;
  TitleName := 'fEdit 0.10 ';
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
  editlist.Items[count].filename_path:= 'new' + inttostr(count);
  mainform.TabControl1.Tabs.Insert(count,'');
  mainform.TabControl1.Tabs[count] := editlist.Items[count].filename_path;

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

function Tfunction_unit.filesOpen:boolean;
var
  i,i1:integer;
begin
  if not comp_unit.OpenDialog1.Execute then
    exit;

  for i1 := 0 to comp_unit.OpenDialog1.Files.Count -1 do begin;
    i := function_unit.editlist.Count;
    function_unit.newedit( i );
    function_unit.editlist[ i ].filename_path:= comp_unit.OpenDialog1.Files[i1];
    mainform.TabControl1.Tabs[ i ] :=  ExtractFileName( function_unit.editlist.Items[ i ].filename_path );
    mainform.Caption:= function_unit.TitleName + '[' + function_unit.editlist.Items[ i ].filename_path + ']';
    function_unit.open( i, comp_unit.OpenDialog1.Files[i1]);
  end;
end;

function Tfunction_unit.open(i:integer;s:string):boolean;
begin
  function_unit.editlist[ i ].lines_tmp.LoadFromFile( s );
  if function_unit.editlist.Items[i].charset = '' then begin
    function_unit.editlist.Items[i].charset := function_unit.charset_new;
  end;
  if function_unit.editlist.Items[i].charset = 'Ansi' then begin
    function_unit.editlist.Items[ i ].SynMemo1.Lines.Text:= utf8toansi(function_unit.editlist[ i ].lines_tmp.Text);
  end else if function_unit.editlist.Items[i].charset = 'Utf8' then begin
    function_unit.editlist.Items[ i ].SynMemo1.Lines.Text:= (function_unit.editlist[ i ].lines_tmp.Text);
  end else if function_unit.editlist.Items[i].charset = 'Utf16' then begin
    function_unit.editlist.Items[ i ].SynMemo1.Lines.Text:= Utf8toUtf16(function_unit.editlist[ i ].lines_tmp.Text);
  end;
end;

function Tfunction_unit.save(i:integer):boolean;
var
  s:string;
begin
  s := function_unit.set_char(i,'?');
  if s = 'Ansi' then begin
    function_unit.editlist.Items[i].lines_tmp.Text := Utf8toAnsi(function_unit.editlist.Items[i].SynMemo1.Text);
  end else if s = 'Utf8' then begin
    function_unit.editlist.Items[i].lines_tmp.Text := (function_unit.editlist.Items[i].SynMemo1.Text);
  end else if s = 'Utf16' then begin
    function_unit.editlist.Items[i].lines_tmp.Text := Utf8toUtf16(function_unit.editlist.Items[i].SynMemo1.Text);
  end;
  function_unit.editlist.Items[i].lines_tmp.SaveToFile(
    function_unit.editlist.Items[i].filename_path
  );

end;

function Tfunction_unit.saveas(i:integer):boolean;
begin
  if not comp_unit.SaveDialog1.Execute then
     exit;
  function_unit.editlist.Items[i].filename_path:= comp_unit.SaveDialog1.FileName;
  function_unit.save(i);
end;

function Tfunction_unit.AllSave:boolean;
var
  i:integer;
begin
  for i :=0 to function_unit.editlist.Count -1 do begin
    function_unit.save(i);
  end;
end;

function Tfunction_unit.AllSaveAs:boolean;
var
  i:integer;
begin
  for i :=0 to function_unit.editlist.Count -1 do begin
    function_unit.saveas(i);
  end;
end;

function Tfunction_unit.edit_contlorl(s:String;tab:integer):boolean;
var
  i,i1:integer;
begin
  if tab = -1 then
    exit;
  if s = 'undo' then begin
    i := 0;
  end else if s = 'redo' then begin
    i := 1;
  end else if s = 'cut' then begin
    i := 2;
  end else if s = 'copy' then begin
    i := 3;
  end else if s = 'past' then begin
    i := 4;
  end else if s = 'all' then begin
    i := 5;
  end else if s = 'day' then begin
    i := 6;
  end else if s = 'time' then begin
    i := 7;
  end else if s = 'calac' then begin
    i := 8;
  end else
   i := 99;
  with function_unit.editlist.Items[tab] do begin
    case i of
      0:begin
        if memo1.Visible then begin
          memo1.Undo;
        end else begin
          SynMemo1.Undo;
        end;
      end;
      1:begin
        if memo1.Visible then begin
          memo1.Undo;
        end else begin
          SynMemo1.Redo;
        end;
      end;
      2:begin
        if memo1.Visible then begin
          memo1.CutToClipboard;
        end else begin
          SynMemo1.CutToClipboard;
        end;
      end;
      3:begin
        if memo1.Visible then begin
          memo1.CopyToClipboard;
        end else begin
          SynMemo1.CopyToClipboard;
        end;
      end;
      4:begin
        if memo1.Visible then begin
          memo1.PasteFromClipboard;
        end else begin
          SynMemo1.PasteFromClipboard;
        end;
      end;
      5:begin
        if memo1.Visible then begin
          memo1.SelectAll;
        end else begin
          SynMemo1.SelectAll;
        end;
      end;
      6:begin
        if memo1.Visible then begin
          i1 := Memo1.CaretPos.Y -1;
          Memo1.Lines.Insert(i1,datetostr(now));
        end else begin
          i1 := SynMemo1.CaretY -1;
          SynMemo1.Lines.Insert(i1,datetostr(now));
        end;
      end;
      7:begin
        if memo1.Visible then begin
          i1 := Memo1.CaretPos.Y -1;
            //SendMessage(editfrm[i].Memo.Handle, EM_LINEFROMCHAR, editfrm[i].Memo.SelStart, 0);
          Memo1.Lines.Insert(i1,timetostr(now));
        end else begin
          i1 := SynMemo1.CaretY -1;
          SynMemo1.Lines.Insert(i1,timetostr(now));
        end;
      end;

      8:begin
        if not comp_unit.CalculatorDialog1.Execute then
          exit;
          if memo1.Visible then begin
            i1 := Memo1.CaretPos.Y -1;
            //SendMessage(editfrm[i].Memo.Handle, EM_LINEFROMCHAR, editfrm[i].Memo.SelStart, 0);
            Memo1.Lines.Insert(i1,floattostr(comp_unit.CalculatorDialog1.Value));

          end else begin
            i1 := SynMemo1.CaretY -1;
            SynMemo1.Lines.Insert(i1,floattostr(comp_unit.CalculatorDialog1.Value));
          end;
      end;
      99:begin
        showmessage('this command is not faund ' + '"'+ s +'"');
      end;
    end;
  end;
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
   mainform.Caption:= function_unit.TitleName + '[' + function_unit.editlist.Items[ i ].filename_path + ']';
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

