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
    procedure FormChangeBounds(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Menu_NewClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure TabControl1ChangeBounds(Sender: TObject);
    procedure TabControl1Changing(Sender: TObject; var AllowChange: Boolean);
   private
    { private declarations }

  public
    { public declarations }

  end;

var
  MainForm: TMainForm;

implementation

uses edit,function_unit;

{ TMainForm }

procedure TMainForm.Menu_NewClick(Sender: TObject);
var
  i:integer;
begin
  //mainform.TabControl1.Tabs.Add('new' + inttostr(mainform.TabControl1.Tabs.Count));
  i := functionunit.editlist.Count;
  functionunit.newwindow(i);
  functionunit.window_off(i);
  mainform.TabControl1.TabIndex:= i;
  //functionunit.chengtab(i);
   //mainform.tabclicks := true;
   functionunit.resizewindow2;
end;

procedure TMainForm.TabControl1Change(Sender: TObject);
var
  i:integer;
begin
  i := MainForm.TabControl1.TabIndex;
  //if MainForm.T_W_sw then begin
    //exit;
  //end;
  //if MainForm.TabControl1.Tabs[i] = 'ADD' then begin
    //Menu_NewClick(Sender);
   // exit;
  //end;
   functionunit.chengtab(i);
   //mainform.tabclicks := true;
   functionunit.resizewindow2;
end;

procedure TMainForm.TabControl1ChangeBounds(Sender: TObject);
begin

end;

procedure TMainForm.TabControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
var
  i:integer;
begin


end;



procedure TMainForm.FormChangeBounds(Sender: TObject);
begin
  if MainForm.Height <> screen.Height then
    if MainForm.Width <> screen.Width then
      functionunit.frmpsnset(mainform.TabControl1.TabIndex);
  functionunit.resizewindow2;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin

end;



{ TMainForm }

//ここからプロコドル

{$R *.lfm}

end.
