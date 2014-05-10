unit edit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynMemo, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { Teditfrm }

  Teditfrm = class(TForm)
    Memo1: TMemo;
    SynMemo1: TSynMemo;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    lines_tmp:TStringList;
    filename_path:string;
    charset:string;
  end;

var
  editfrm: Teditfrm;

implementation

{$R *.lfm}

{ Teditfrm }

procedure Teditfrm.FormCreate(Sender: TObject);
begin
  lines_tmp := TStringList.Create;
  lines_tmp.Clear;
end;

end.

