unit Db_Penjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractConnection, ZConnection, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls;

type
  TForm4 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl10: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dbgrd1: TDBGrid;
    edt10: TEdit;
    edt3: TEdit;
    edt2: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    btn4: TButton;
    btn5: TButton;
    cbb1: TComboBox;
    cbb2: TComboBox;
    cbb3: TComboBox;
    cbb4: TComboBox;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure edt10Change(Sender: TObject);
    procedure cbb2Change(Sender: TObject);
    procedure cbb3Change(Sender: TObject);
    procedure cbb4Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  a: string;

implementation

uses
  Zdb_penjualan;

{$R *.dfm}

procedure TForm4.btn1Click(Sender: TObject);
begin
if edt1.Text='' then
begin
  ShowMessage('Barkode Tidak Boleh Kosong!');
end else
if DataModule1.zBarang.Locate('barkode',edt1.Text,[])then
begin
  ShowMessage('Barkode '+edt1.Text+' Sudah Ada Didalam Sistem');
end else
begin
  with DataModule1.zBarang do
  begin
    SQL.Clear;
    SQL.Add('insert into barang values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+cbb1.Text+'","'+cbb2.Text+'","'+cbb3.Text+'","'+cbb4.Text+'")');
    ExecSQL;
    SQL.Clear;
    SQL.Add('select*from barang');
    Open;
  end;
  ShowMessage('Data Berhasil Disimpan!');
posisiawal;
end;
end;


procedure TForm4.btn2Click(Sender: TObject);
begin
DataModule1.zBarang.SQL.Clear;
DataModule1.zBarang.SQL.Add ('UPDATE barang set barkode="'+edt1.Text+'",name="'+edt2.Text+'",harga_jual="'+edt3.Text+'",harga_beli="'+edt4.Text+'",stok="'+edt5.Text+'",kategori_id="'+cbb1.Text+'",satuan_id="'+cbb2.Text+'",user_id="'+cbb3.Text+'",supplier_id="'+cbb4.Text+'" where id= "'+a+'"');
DataModule1.zBarang.ExecSQL;

DataModule1.zBarang.SQL.Clear;
DataModule1.zBarang.SQL.Add ('Select*From barang');
DataModule1.zBarang.Open;
ShowMessage('Data Berhasil Diupdate!');
end;

procedure TForm4.dbgrd1CellClick(Column: TColumn);
begin
  edt1.Text := DataModule1.zBarang.Fields[1].AsString;
  edt2.Text := DataModule1.zBarang.Fields[2].AsString;
  edt3.Text := DataModule1.zBarang.Fields[3].AsString;
  edt4.Text := DataModule1.zBarang.Fields[4].AsString;
  edt5.Text := DataModule1.zBarang.Fields[5].AsString;
  cbb1.Text := DataModule1.zBarang.Fields[6].AsString;
  cbb2.Text := DataModule1.zBarang.Fields[7].AsString;
  cbb3.Text := DataModule1.zBarang.Fields[8].AsString;
  cbb4.Text := DataModule1.zBarang.Fields[9].AsString;
  a := DataModule1.zBarang.Fields[0].AsString;

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
cbb1.Enabled := True;
cbb2.Enabled := True;
cbb3.Enabled := True;
cbb4.Enabled := True;
end;

procedure TForm4.btn3Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda Yakin Menghapus ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
   with DataModule1.zBarang do
   begin
     SQL.Clear;
     SQL.Add('delete from barang where id="'+a+'"');
     ExecSQL;

     SQL.Clear;
     SQL.Add('select*from barang');
     Open;
   end;
   ShowMessage('Data Berhasil Dihapus!');
end else
begin
  ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;


procedure TForm4.btn4Click(Sender: TObject);
begin
edt1.Enabled := True;
edt2.Enabled := True;
edt3.Enabled := True;
edt4.Enabled := True;
edt5.Enabled := True;
cbb1.Enabled := True;
cbb2.Enabled := True;
cbb3.Enabled := True;
cbb4.Enabled := True;
btn1.Enabled := True;
btn2.Enabled := False;
btn3.Enabled := False;
btn5.Enabled := True;
btn4.Enabled := False;

end;

procedure TForm4.bersih;
begin
   edt1.Clear;
   edt2.Clear;
   edt3.Clear;
   edt4.Clear;
   edt5.Clear;
   edt5.Clear;
   cbb1.Clear;
   cbb2.Clear;
   cbb3.Clear;
   cbb4.Clear;
   edt10.Clear;
end;

procedure TForm4.posisiawal;
begin
 bersih;
edt1.Enabled := False;
edt2.Enabled := False;
edt3.Enabled := False;
edt4.Enabled := False;
edt5.Enabled := False;
cbb1.Enabled := False;
cbb2.Enabled := False;
cbb3.Enabled := False;
cbb4.Enabled := False;
 btn4.Enabled:=True;
 btn1.Enabled:=False;
 btn2.Enabled:=False;
 btn3.Enabled:=False;
 btn5.Enabled:=False;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
   posisiawal;
end;

procedure TForm4.btn5Click(Sender: TObject);
begin
edt1.Enabled := False;
edt2.Enabled := False;
edt3.Enabled := False;
edt4.Enabled := False;
edt5.Enabled := False;
cbb1.Enabled := False;
cbb2.Enabled := False;
cbb3.Enabled := False;
cbb4.Enabled := False;
btn1.Enabled := False;
btn2.Enabled := False;
btn3.Enabled := False;
btn5.Enabled := False;
btn4.Enabled := True;

end;

procedure TForm4.edt10Change(Sender: TObject);
begin
with DataModule1.zBarang do
  begin
    SQL.Clear;
    SQL.Add('select*from barang where name like "%'+edt10.Text+'%"');
    Open;
end;
end;
procedure TForm4.cbb2Change(Sender: TObject);
begin
cbb2.Items.Add('1');
cbb2.Items.Add('2');
cbb2.Items.Add('3');
cbb2.Items.Add('4');
cbb2.Items.Add('5');
end;

procedure TForm4.cbb3Change(Sender: TObject);
begin
cbb3.Items.Add('1');
cbb3.Items.Add('2');
cbb3.Items.Add('3');
cbb3.Items.Add('4');
cbb3.Items.Add('5');
end;

procedure TForm4.cbb4Change(Sender: TObject);
begin
cbb4.Items.Add('1');
cbb4.Items.Add('2');
cbb4.Items.Add('3');
cbb4.Items.Add('4');
cbb4.Items.Add('5');
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
cbb1.Items.Add('kopi');
cbb1.Items.Add('2');
cbb1.Items.Add('3');
cbb1.Items.Add('4');
cbb1.Items.Add('5');
cbb1.Items.Add('6');
end;

procedure TForm4.cbb1Change(Sender: TObject);
begin
cbb1.Items.Add('1');
cbb1.Items.Add('2');
cbb1.Items.Add('3');
cbb1.Items.Add('4');
cbb1.Items.Add('5');
cbb1.Items.Add('6');
end;

end.
