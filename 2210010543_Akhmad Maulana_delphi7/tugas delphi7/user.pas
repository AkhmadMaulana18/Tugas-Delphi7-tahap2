unit user;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm8 = class(TForm)
    dbUser: TDBGrid;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    cbb1: TComboBox;
    edt5: TEdit;
    edt6: TEdit;
    edt7: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn5: TButton;
    lbl9: TLabel;
    edt1: TEdit;
    edt8: TEdit;
    btn4: TButton;
    procedure bersih;
    procedure posisiawal;
    procedure FormShow (Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure edt8Change(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure dbUserCellClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  a: string;

implementation

uses
  Zdb_penjualan;

{$R *.dfm}

procedure TForm8.bersih;
begin
  edt1.Clear;
  edt2.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  edt7.Clear;
  edt8.Clear;
  cbb1.Clear;
end;

procedure TForm8.posisiawal;
begin
 bersih;
 btn4.Enabled:=False;
 btn1.Enabled:=True;
 btn2.Enabled:=False;
 btn3.Enabled:=False;
 btn5.Enabled:=False;
 edt1.Enabled:=False;
 edt2.Enabled:=False;
 edt3.Enabled:=False;
 edt4.Enabled:=False;
 edt5.Enabled:=False;
 edt6.Enabled:=False;
 edt7.Enabled:=False;
 cbb1.Enabled:=False;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
  posisiawal;
end;


procedure TForm8.cbb1Change(Sender: TObject);
begin
cbb1.Items.Add('Kasir');
cbb1.Items.Add('Admin');
end;

procedure TForm8.btn1Click(Sender: TObject);
begin
btn1.Enabled := False;
btn2.Enabled := True;
btn3.Enabled := False;
btn4.Enabled := False;
btn5.Enabled := True;
edt1.Enabled := True;
edt2.Enabled := True;
edt3.Enabled := True;
edt4.Enabled := True;
edt5.Enabled := True;
edt6.Enabled := True;
edt7.Enabled := True;
edt8.Enabled := True;
cbb1.Enabled := True;
end;

procedure TForm8.btn2Click(Sender: TObject);
begin
if edt1.Text='' then
begin
  ShowMessage('Nama NIK Tidak Boleh Kosong!');
end else
if DataModule1.ZUser.Locate('NIK',edt1.Text,[])then
begin
  ShowMessage('NIK '+edt1.Text+' Sudah Ada Didalam Sistem');
end else
begin
  with DataModule1.ZUser do
  begin
    SQL.Clear;
    SQL.Add('insert into user values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+cbb1.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+edt7.Text+'","")');
    ExecSQL;
    SQL.Clear;
    SQL.Add('select*from user');
    Open;
  end;
  ShowMessage('Data Berhasil Disimpan!');
posisiawal;
end;
end;

procedure TForm8.btn5Click(Sender: TObject);
begin
btn1.Enabled := True;
btn2.Enabled := False;
btn3.Enabled := False;
btn4.Enabled := False;
btn5.Enabled := False;
edt1.Enabled := False;
edt2.Enabled := False;
edt3.Enabled := False;
edt4.Enabled := False;
edt5.Enabled := False;
edt6.Enabled := False;
edt7.Enabled := False;
edt8.Enabled := False;
cbb1.Enabled := False;
end;

procedure TForm8.edt8Change(Sender: TObject);
begin
with DataModule1.ZUser do
  begin
    SQL.Clear;
    SQL.Add('select*from user where full_name like "%'+edt3.Text+'%"');
    Open;
end;
end;

procedure TForm8.btn4Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda Yakin Menghapus ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
   with DataModule1.ZUser do
   begin
     SQL.Clear;
     SQL.Add('delete from user where id="'+a+'"');
     ExecSQL;

     SQL.Clear;
     SQL.Add('select*from user');
     Open;
   end;
   ShowMessage('Data Berhasil Dihapus!');
end else
begin
  ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;

procedure TForm8.btn3Click(Sender: TObject);
begin
DataModule1.ZUser.SQL.Clear;
DataModule1.ZUser.SQL.Add ('UPDATE user set nik="'+edt1.Text+'",username="'+edt2.Text+'",full_name="'+edt3.Text+'",password="'+edt4.Text+'",tipe="'+cbb1.Text+'",email="'+edt5.Text+'",telp="'+edt6.Text+'",address="'+edt7.Text+'",is_active="" where id= "'+a+'"');
DataModule1.ZUser.ExecSQL;

DataModule1.ZUser.SQL.Clear;
DataModule1.ZUser.SQL.Add ('Select*From user');
DataModule1.ZUser.Open;
ShowMessage('Data Berhasil Diupdate!');
end;

procedure TForm8.dbUserCellClick(Column: TColumn);
begin
edt1.Text := DataModule1.ZUser.Fields[1].AsString;
edt2.Text := DataModule1.ZUser.Fields[2].AsString;
edt3.Text := DataModule1.ZUser.Fields[3].AsString;
edt4.Text := DataModule1.ZUser.Fields[4].AsString;
cbb1.Text := DataModule1.ZUser.Fields[5].AsString;
edt5.Text := DataModule1.ZUser.Fields[6].AsString;
edt6.Text := DataModule1.ZUser.Fields[7].AsString;
edt7.Text := DataModule1.ZUser.Fields[8].AsString;
a := DataModule1.ZUser.Fields[0].AsString;

btn1.Enabled := False;
btn2.Enabled := False;
btn3.Enabled := True;
btn4.Enabled := True;
btn5.Enabled := True;
edt1.Enabled := True;
edt2.Enabled := True;
edt3.Enabled := True;
edt4.Enabled := True;
edt5.Enabled := True;
edt6.Enabled := True;
edt7.Enabled := True;
edt8.Enabled := True;
cbb1.Enabled := True;
end;

end.
