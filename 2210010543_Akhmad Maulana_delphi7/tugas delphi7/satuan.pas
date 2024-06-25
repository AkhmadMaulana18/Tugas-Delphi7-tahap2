unit satuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm5 = class(TForm)
    lbl3: TLabel;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dbgrd1: TDBGrid;
    lbl2: TLabel;
    edt3: TEdit;
    lbl1: TLabel;
    edt2: TEdit;
    btn4: TButton;
    btn5: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure edt3Change(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure FormShow (Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  a: string;

implementation

uses
  Zdb_penjualan;

{$R *.dfm}

procedure TForm5.bersih;
begin
  edt1.Clear;
  edt2.Clear;
end;

procedure TForm5.posisiawal;
begin
 bersih;
 btn4.Enabled:=True;
 btn1.Enabled:=False;
 btn2.Enabled:=False;
 btn3.Enabled:=False;
 btn5.Enabled:=False;
 edt1.Enabled:=False;
 edt2.Enabled:=False;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  posisiawal;
end;


procedure TForm5.btn1Click(Sender: TObject);
begin
if edt1.Text='' then
begin
  ShowMessage('Nama Satuan Tidak Boleh Kosong!');
end else
if DataModule1.ZSatuan.Locate('name',edt1.Text,[])then
begin
  ShowMessage('Nama Satun '+edt1.Text+' Sudah Ada Didalam Sistem');
end else
begin
  with DataModule1.ZSatuan do
  begin
    SQL.Clear;
    SQL.Add('insert into satuan values(null,"'+edt1.Text+'","'+edt2.Text+'")');
    ExecSQL;
    SQL.Clear;
    SQL.Add('select*from satuan');
    Open;
  end;
  ShowMessage('Data Berhasil Disimpan!');
posisiawal;
end;
end;


procedure TForm5.btn2Click(Sender: TObject);
begin
DataModule1.ZSatuan.SQL.Clear;
DataModule1.ZSatuan.SQL.Add ('UPDATE satuan set name="'+edt1.Text+'", diskripsi="'+edt2.Text+'" where id= "'+a+'"');
DataModule1.ZSatuan.ExecSQL;

DataModule1.ZSatuan.SQL.Clear;
DataModule1.ZSatuan.SQL.Add ('Select*From satuan');
DataModule1.ZSatuan.Open;
ShowMessage('Data Berhasil Diupdate!');
end;

procedure TForm5.dbgrd1CellClick(Column: TColumn);
begin
  edt1.Text := DataModule1.ZSatuan.Fields[1].AsString;
  edt2.Text := DataModule1.ZSatuan.Fields[2].AsString;
  a := DataModule1.ZSatuan.Fields[0].AsString;

 btn4.Enabled:=False;
 btn1.Enabled:=False;
 btn2.Enabled:=True;
 btn3.Enabled:=True;
 btn5.Enabled:=True;
edt1.Enabled:=True;
edt2.Enabled := True;
end;

procedure TForm5.btn3Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda Yakin Menghapus ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
   with DataModule1.ZSatuan do
   begin
     SQL.Clear;
     SQL.Add('delete from satuan where id="'+a+'"');
     ExecSQL;

     SQL.Clear;
     SQL.Add('select*from satuan');
     Open;
   end;
   ShowMessage('Data Berhasil Dihapus!');
end else
begin
  ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;


procedure TForm5.btn4Click(Sender: TObject);
begin
edt1.Enabled := True;
edt2.Enabled := True;
btn1.Enabled := True;
btn2.Enabled := False;
btn3.Enabled := False;
btn5.Enabled := True;
btn4.Enabled := False;
end;

procedure TForm5.edt3Change(Sender: TObject);
begin
with DataModule1.ZSatuan do
  begin
    SQL.Clear;
    SQL.Add('select*from satuan where name like "%'+edt3.Text+'%"');
    Open;
end;
end;

procedure TForm5.btn5Click(Sender: TObject);
begin
edt1.Enabled := False;
edt2.Enabled := False;
btn1.Enabled := False;
btn2.Enabled := False;
btn3.Enabled := False;
btn5.Enabled := False;
btn4.Enabled := True;
end;

end.
