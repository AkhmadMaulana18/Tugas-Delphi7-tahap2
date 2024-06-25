unit kustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm7 = class(TForm)
    lbl3: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dbgrd1: TDBGrid;
    edt2: TEdit;
    lbl1: TLabel;
    edt3: TEdit;
    lbl4: TLabel;
    edt4: TEdit;
    lbl5: TLabel;
    edt5: TEdit;
    lbl6: TLabel;
    edt6: TEdit;
    btn4: TButton;
    btn5: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn4Click(Sender: TObject);
    procedure edt6Change(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  a: string;

implementation

uses
  Zdb_penjualan;

{$R *.dfm}

procedure TForm7.bersih;
begin
   edt1.Clear;
   edt2.Clear;
   edt3.Clear;
   edt4.Clear;
   edt5.Clear;
   edt6.Clear;
end;

procedure TForm7.posisiawal;
begin
 bersih;
 btn4.Enabled:=True;
 btn1.Enabled:=False;
 btn2.Enabled:=False;
 btn3.Enabled:=False;
 btn5.Enabled:=False;
 edt1.Enabled:=False;
 edt2.Enabled:=False;
 edt3.Enabled:=False;
 edt4.Enabled:=False;
 edt5.Enabled:=False;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
  posisiawal;
end;


procedure TForm7.btn1Click(Sender: TObject);
begin
if edt1.Text='' then
begin
  ShowMessage('NIK Tidak Boleh Kosong!');
end else
if DataModule1.ZKustomer.Locate('nik',edt1.Text,[])then
begin
  ShowMessage('NIK '+edt1.Text+' Sudah Ada Didalam Sistem');
end else
begin
  with DataModule1.ZKustomer do
  begin
    SQL.Clear;
    SQL.Add('insert into kustomer values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'")');
    ExecSQL;
    SQL.Clear;
    SQL.Add('select*from kustomer');
    Open;
  end;
  ShowMessage('Data Berhasil Disimpan!');
posisiawal;
end;
end;

procedure TForm7.btn3Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda Yakin Menghapus ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
   with DataModule1.ZKustomer do
   begin
     SQL.Clear;
     SQL.Add('delete from kustomer where id="'+a+'"');
     ExecSQL;

     SQL.Clear;
     SQL.Add('select*from kustomer');
     Open;
   end;
   ShowMessage('Data Berhasil Dihapus!');
end else
begin
  ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;


procedure TForm7.btn2Click(Sender: TObject);
begin
DataModule1.ZKustomer.SQL.Clear;
DataModule1.ZKustomer.SQL.Add ('UPDATE kustomer set nik="'+edt1.Text+'",name="'+edt2.Text+'",telp="'+edt3.Text+'",email="'+edt4.Text+'",alamat="'+edt5.Text+'" where id= "'+a+'"');
DataModule1.ZKustomer.ExecSQL;

DataModule1.ZKustomer.SQL.Clear;
DataModule1.ZKustomer.SQL.Add ('Select*From kustomer');
DataModule1.ZKustomer.Open;
ShowMessage('Data Berhasil Diupdate!');
end;

procedure TForm7.dbgrd1CellClick(Column: TColumn);
begin
  edt1.Text := DataModule1.ZKustomer.Fields[1].AsString;
  edt2.Text := DataModule1.ZKustomer.Fields[2].AsString;
  edt3.Text := DataModule1.ZKustomer.Fields[3].AsString;
  edt4.Text := DataModule1.ZKustomer.Fields[4].AsString;
  edt5.Text := DataModule1.ZKustomer.Fields[5].AsString;
  a := DataModule1.ZKustomer.Fields[0].AsString;

  btn4.Enabled:=False;
 btn1.Enabled:=False;
 btn2.Enabled:=True;
 btn3.Enabled:=True;
 btn5.Enabled:=True;
edt1.Enabled:=True;
edt2.Enabled := True;
edt3.Enabled := True;
edt4.Enabled := True;
edt5.Enabled := True;
end;


procedure TForm7.btn4Click(Sender: TObject);
begin
edt1.Enabled := True;
edt2.Enabled := True;
edt3.Enabled := True;
edt4.Enabled := True;
edt5.Enabled := True;
btn1.Enabled := True;
btn2.Enabled := False;
btn3.Enabled := False;
btn5.Enabled := True;
btn4.Enabled := False;
end;

procedure TForm7.edt6Change(Sender: TObject);
begin
with DataModule1.ZKustomer do
  begin
    SQL.Clear;
    SQL.Add('select*from kustomer where name like "%'+edt6.Text+'%"');
    Open;
end;
end;


procedure TForm7.btn5Click(Sender: TObject);
begin
edt1.Enabled := False;
edt2.Enabled := False;
edt3.Enabled := False;
edt4.Enabled := False;
edt5.Enabled := False;
btn1.Enabled := False;
btn2.Enabled := False;
btn3.Enabled := False;
btn5.Enabled := False;
btn4.Enabled := True;
end;

end.
