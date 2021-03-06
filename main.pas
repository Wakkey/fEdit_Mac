unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics,
  Dialogs, ComCtrls, Menus, ExtCtrls;

type

  { TForm1 }

  { TMainForm }

  TMainForm = class(TForm)
    cpy: TMenuItem;
    cut: TMenuItem;
    EditDockPanel: TPanel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    Menu_urlset: TMenuItem;
    Menu_Utf16: TMenuItem;
    Menu_Ansi: TMenuItem;
    Menu_repraceMcro: TMenuItem;
    Menu_Custom: TMenuItem;
    mnu_SelectORline: TMenuItem;
    Menu_URL: TMenuItem;
    Menu_Macro_codeRun: TMenuItem;
    Menu_helpgoogle7: TMenuItem;
    Menu_helpgoogle2: TMenuItem;
    Menu_helpgoogle3: TMenuItem;
    Menu_helpgoogle4: TMenuItem;
    Menu_helpgoogle5: TMenuItem;
    Menu_helpgoogle6: TMenuItem;
    Menu_helpgoogle1: TMenuItem;
    Menu_lazarus: TMenuItem;
    Menu_FInds: TMenuItem;
    Menu_SetMnu: TMenuItem;
    Menu_RootFile: TMenuItem;
    Menu_Exit: TMenuItem;
    Menu_Insert_Calac: TMenuItem;
    Menu_AllClose: TMenuItem;
    MenuItem102: TMenuItem;
    Menu_ToolBarTAB: TMenuItem;
    Menu_ToolButtonSet: TMenuItem;
    barleft: TMenuItem;
    barright: TMenuItem;
    bartop: TMenuItem;
    barbottom: TMenuItem;
    Menu_RootSupport: TMenuItem;
    Menu_code_support: TMenuItem;
    Menu_CodeInsert: TMenuItem;
    Menu_RootEdit: TMenuItem;
    Menu_TemplatCode: TMenuItem;
    MenuItem12: TMenuItem;
    Menu_BAT: TMenuItem;
    MenuItem14: TMenuItem;
    Menu_INI: TMenuItem;
    Menu_XML: TMenuItem;
    Menu_VBScript: TMenuItem;
    MenuItem18: TMenuItem;
    MenuI_UnixShell: TMenuItem;
    Menu_New: TMenuItem;
    MenuItem20: TMenuItem;
    Menu_RootHelp: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    Menu_Vershon: TMenuItem;
    Menu_RootOption: TMenuItem;
    Menu_TEMP_Save: TMenuItem;
    Menu_TEMP_Load: TMenuItem;
    Menu_OLD_Load: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    Menu_MultWindow: TMenuItem;
    MenuItem32: TMenuItem;
    Menu_RootHeightLight: TMenuItem;
    Menu_RootTAB: TMenuItem;
    Menu_C: TMenuItem;
    Menu_TabCheng: TMenuItem;
    Menu_Css: TMenuItem;
    MenuItem38: TMenuItem;
    Menu_Pascal: TMenuItem;
    Menu_Open: TMenuItem;
    Menu_HTML: TMenuItem;
    Menu_Java: TMenuItem;
    MenuItem42: TMenuItem;
    Menu_Delphi: TMenuItem;
    Menu_Perl: TMenuItem;
    Menu_PHP: TMenuItem;
    Menu_pyhton: TMenuItem;
    Menu_RootWindow: TMenuItem;
    Menu_WindowAllMin: TMenuItem;
    Menu_WindowAllMax: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem50: TMenuItem;
    Menu_SQL: TMenuItem;
    Menu_FontColor: TMenuItem;
    Menu_BackColor: TMenuItem;
    MenuItem54: TMenuItem;
    Menu_LibOpen: TMenuItem;
    Menu_SetFont: TMenuItem;
    Menu_RootMacro: TMenuItem;
    Menu_MacroRun: TMenuItem;
    Menu_WIndow_AllNomalSize: TMenuItem;
    menu_save: TMenuItem;
    Menu_WindowLeft: TMenuItem;
    Menu_WindowRight: TMenuItem;
    MenuWindowTop: TMenuItem;
    Menu_WindowBottom: TMenuItem;
    Menu_WindowMin: TMenuItem;
    Menu_WindowMax: TMenuItem;
    Menu_WIndowNomalSize: TMenuItem;
    MenuItem67: TMenuItem;
    Menu_ReOpen: TMenuItem;
    Menu_WindowLock: TMenuItem;
    Menu_SaveAs: TMenuItem;
    Menu_Find: TMenuItem;
    MenuItem71: TMenuItem;
    Menu_SelctAll: TMenuItem;
    Menu_Paste: TMenuItem;
    Menu_Copy: TMenuItem;
    Menu_cut: TMenuItem;
    MenuItem76: TMenuItem;
    Menu_Redo: TMenuItem;
    Menu_HilightColor: TMenuItem;
    MenuItem79: TMenuItem;
    Menu_Close: TMenuItem;
    Menu_FreeHeightLight: TMenuItem;
    MenuItem81: TMenuItem;
    Menu_EditColor: TMenuItem;
    Menu_Option: TMenuItem;
    MenuItem85: TMenuItem;
    MenuItem86: TMenuItem;
    MenuItem87: TMenuItem;
    Menu_UTF8_Ansi: TMenuItem;
    MenuItem88: TMenuItem;
    Menu_MacroSetUp: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem90: TMenuItem;
    MenuItem91: TMenuItem;
    Menu_All_Save: TMenuItem;
    Menu_AllSaveAs: TMenuItem;
    Menu_MacroElse: TMenuItem;
    MenuItem95: TMenuItem;
    Menu_MemoMode: TMenuItem;
    Menu_Insert_Day: TMenuItem;
    Menu_Insert_Time: TMenuItem;
    PageControl1: TPageControl;
    peast: TMenuItem;
    popundo: TMenuItem;
    PopupMenu1: TPopupMenu;
    redo: TMenuItem;
    selctall: TMenuItem;
    StatusBar1: TStatusBar;
    TabControl1: TTabControl;
    ToolBar2: TToolBar;
    undo: TMenuItem;
    procedure cpyClick(Sender: TObject);
    procedure cutClick(Sender: TObject);
    procedure FormChangeBounds(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure Menu_AllCloseClick(Sender: TObject);
    procedure Menu_AllSaveAsClick(Sender: TObject);
    procedure Menu_All_SaveClick(Sender: TObject);
    procedure Menu_AnsiClick(Sender: TObject);
    procedure Menu_CloseClick(Sender: TObject);
    procedure Menu_FIndsClick(Sender: TObject);
    procedure Menu_helpgoogle1Click(Sender: TObject);
    procedure Menu_helpgoogle2Click(Sender: TObject);
    procedure Menu_helpgoogle3Click(Sender: TObject);
    procedure Menu_helpgoogle4Click(Sender: TObject);
    procedure Menu_helpgoogle5Click(Sender: TObject);
    procedure Menu_helpgoogle6Click(Sender: TObject);
    procedure Menu_helpgoogle7Click(Sender: TObject);
    procedure Menu_Insert_CalacClick(Sender: TObject);
    procedure Menu_Insert_DayClick(Sender: TObject);
    procedure Menu_Insert_TimeClick(Sender: TObject);
    procedure Menu_MemoModeClick(Sender: TObject);
    procedure Menu_NewClick(Sender: TObject);
    procedure Menu_OpenClick(Sender: TObject);
    procedure Menu_ReOpenClick(Sender: TObject);
    procedure Menu_SaveAsClick(Sender: TObject);
    procedure menu_saveClick(Sender: TObject);
    procedure Menu_URLClick(Sender: TObject);
    procedure Menu_urlsetClick(Sender: TObject);
    procedure Menu_Utf16Click(Sender: TObject);
    procedure Menu_UTF8_AnsiClick(Sender: TObject);
    procedure mnu_SelectORlineClick(Sender: TObject);
    procedure peastClick(Sender: TObject);
    procedure redoClick(Sender: TObject);
    procedure selctallClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure TabControl1ChangeBounds(Sender: TObject);
    procedure TabControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure undoClick(Sender: TObject);
   private
    { private declarations }

  public
    { public declarations }

  end;

var
  MainForm: TMainForm;

implementation

uses edit,functionunit,find;

{ TMainForm }
{$R *.lfm}

procedure TMainForm.Menu_NewClick(Sender: TObject);
begin
  function_unit.newedit( function_unit.editlist.Count );
end;

procedure TMainForm.Menu_OpenClick(Sender: TObject);
begin
  function_unit.filesOpen;

end;

procedure TMainForm.Menu_ReOpenClick(Sender: TObject);
var
  i:integer;
begin
  i := mainform.TabControl1.TabIndex;
  function_unit.open(i,function_unit.editlist.Items[i].filename_path);
end;

procedure TMainForm.Menu_SaveAsClick(Sender: TObject);
begin
  function_unit.saveas(mainform.TabControl1.TabIndex);
end;

procedure TMainForm.menu_saveClick(Sender: TObject);
begin
  function_unit.save(mainform.TabControl1.TabIndex);
end;

procedure TMainForm.Menu_URLClick(Sender: TObject);
var
  s:string;
begin
  s := function_unit.find_internet_word;
  function_unit.find_internet_word := '';
  function_unit.find_internet(mainform.TabControl1.TabIndex,'');
  function_unit.find_internet_word:= s;
end;

procedure TMainForm.Menu_urlsetClick(Sender: TObject);
begin
  function_unit.find_internet_word:=
  InputBox('検索エンジン指定', '検索エンジンのURLを入力してください。', 'https://www.google.co.jp/search?q=');
end;

procedure TMainForm.Menu_AnsiClick(Sender: TObject);
begin
  function_unit.set_char(mainform.TabControl1.TabIndex,'Ansi');
end;

procedure TMainForm.Menu_Utf16Click(Sender: TObject);
begin
  function_unit.set_char(mainform.TabControl1.TabIndex,'Utf16');
end;

procedure TMainForm.Menu_UTF8_AnsiClick(Sender: TObject);
begin
  function_unit.set_char(mainform.TabControl1.TabIndex,'Utf8');
end;

procedure TMainForm.mnu_SelectORlineClick(Sender: TObject);
begin
  if mnu_SelectORLine.Caption= '行選択' then begin
    mnu_SelectORLine.Caption := '範囲選択';
  end else begin
    mnu_SelectORLine.Caption := '行選択';
  end;
end;

procedure TMainForm.peastClick(Sender: TObject);
begin
  function_unit.edit_contlorl('past',mainform.TabControl1.TabIndex);
end;

procedure TMainForm.redoClick(Sender: TObject);
begin
  function_unit.edit_contlorl('redo',mainform.TabControl1.TabIndex);
end;

procedure TMainForm.selctallClick(Sender: TObject);
begin
  function_unit.edit_contlorl('all',mainform.TabControl1.TabIndex);
end;

procedure TMainForm.TabControl1Change(Sender: TObject);
begin
  function_unit.changtabset(MainForm.TabControl1.TabIndex);
end;

procedure TMainForm.TabControl1ChangeBounds(Sender: TObject);
begin
  function_unit.chingSize(mainform.TabControl1.TabIndex);
end;

procedure TMainForm.TabControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin


end;

procedure TMainForm.undoClick(Sender: TObject);
begin
  function_unit.edit_contlorl('undo',mainform.TabControl1.TabIndex);
end;



procedure TMainForm.FormChangeBounds(Sender: TObject);
begin
 function_unit.chingSize(mainform.TabControl1.TabIndex);
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  function_unit.closeAllTab;
end;

procedure TMainForm.cutClick(Sender: TObject);
begin
  function_unit.edit_contlorl('cut',mainform.TabControl1.TabIndex);
end;

procedure TMainForm.cpyClick(Sender: TObject);
begin
  function_unit.edit_contlorl('copy',mainform.TabControl1.TabIndex);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin

end;

procedure TMainForm.Menu_AllCloseClick(Sender: TObject);
begin
 function_unit.closeAllTab;
end;

procedure TMainForm.Menu_AllSaveAsClick(Sender: TObject);
begin
  function_unit.AllSaveas;
end;

procedure TMainForm.Menu_All_SaveClick(Sender: TObject);
begin
  function_unit.AllSave;
end;

procedure TMainForm.Menu_CloseClick(Sender: TObject);
var
  i:integer;
begin
  function_unit.closeTab( mainform.TabControl1.TabIndex );
end;

procedure TMainForm.Menu_FIndsClick(Sender: TObject);
begin
  find_form.Show;
end;

procedure TMainForm.Menu_helpgoogle1Click(Sender: TObject);
begin
  function_unit.find_internet(mainform.TabControl1.TabIndex,'');
end;

procedure TMainForm.Menu_helpgoogle2Click(Sender: TObject);
begin
   function_unit.find_internet(mainform.TabControl1.TabIndex,'document');
end;

procedure TMainForm.Menu_helpgoogle3Click(Sender: TObject);
begin
   function_unit.find_internet(mainform.TabControl1.TabIndex,'Manual');
end;

procedure TMainForm.Menu_helpgoogle4Click(Sender: TObject);
begin
   function_unit.find_internet(mainform.TabControl1.TabIndex,'biginer');
end;

procedure TMainForm.Menu_helpgoogle5Click(Sender: TObject);
begin
   function_unit.find_internet(mainform.TabControl1.TabIndex,'sample');
end;

procedure TMainForm.Menu_helpgoogle6Click(Sender: TObject);
begin
   function_unit.find_internet(mainform.TabControl1.TabIndex,'Templete');
end;

procedure TMainForm.Menu_helpgoogle7Click(Sender: TObject);
begin
   function_unit.find_internet(mainform.TabControl1.TabIndex,'refalence');
end;

procedure TMainForm.Menu_Insert_CalacClick(Sender: TObject);
begin
  function_unit.edit_contlorl('calac',mainform.TabControl1.TabIndex);
end;

procedure TMainForm.Menu_Insert_DayClick(Sender: TObject);
begin
  function_unit.edit_contlorl('day',mainform.TabControl1.TabIndex);
end;

procedure TMainForm.Menu_Insert_TimeClick(Sender: TObject);
begin
  function_unit.edit_contlorl('time',mainform.TabControl1.TabIndex);
end;

procedure TMainForm.Menu_MemoModeClick(Sender: TObject);
begin
  with function_unit.editlist.Items[mainform.TabControl1.TabIndex] do begin
    if not memo1.Visible then begin
      memo1.Lines.Text := synmemo1.Lines.Text;
    end else begin
      synmemo1.Lines.Text := memo1.Lines.Text;
    end;
    Memo1.Visible:= not memo1.Visible;
    synmemo1.Visible:= not synmemo1.Visible;
  end;
end;

end.

