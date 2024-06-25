unit supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm6 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dbgrd1: TDBGrid;
    edt10: TEdit;
    lbl3: TLabel;
    edt3: TEdit;
    lbl4: TLabel;
    edt2: TEdit;
    Label1: TLabel;
    edt4: TEdit;
    lbl5: TLabel;
    edt5: TEdit;
    lbl6: TLabel;
    edt6: TEdit;
    lbl7: TLabel;
    edt7: TEdit;
    lbl8: TLabel;
    edt8: TEdit;
    lbl9: TLabel;
    edt9: TEdit;
    btn4: TButton;
    btn5: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure edt10Change(Sender: TObject);
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
  Form6: TForm6;
  a: string;

implementation

uses
  Zdb_penjualan;

{$R *.dfm}

procedure TForm6.bersih;
begin
   edt1.Clear;
   edt2.Clear;
   edt3.Clear;
   edt4.Clear;
   edt5.Clear;
   edt5.Clear;
   edt6.Clear;
   edt7.Clear;
   edt8.Clear;
   edt9.Clear;
   edt10.Clear;
end;

procedure TForm6.posisiawal;
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
 edt6.Enabled:=False;
 edt7.Enabled:=False;
 edt8.Enabled:=False;
 edt9.Enabled:=False;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  posisiawal;
end;


procedure TForm6.btn1Click(Sender: TObject);
begin
if edt1.Text='' then
begin
  ShowMessage('NIK Tidak Boleh Kosong!');
end else
if DataModule1.ZSupplier.Locate('nik',edt1.Text,[])then
begin
  ShowMessage('NIK '+edt1.Text+' Sudah Ada Didalam Sistem');
end else
begin
  with DataModule1.ZSupplier do
  begin
    SQL.Clear;
    SQL.Add('insert into supplier values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+edt7.Text+'","'+edt8.Text+'","'+edt9.Text+'")');
    ExecSQL;
    SQL.Clear;
    SQL.Add('select*from supplier');
    Open;
  end;
  ShowMessage('Data Berhasil Disimpan!');
posisiawal;
end;
end;


procedure TForm6.btn2Click(Sender: TObject);
begin
DataModule1.ZSupplier.SQL.Clear;
DataModule1.ZSupplier.SQL.Add ('UPDATE supplier set nik="'+edt1.Text+'",name="'+edt2.Text+'",telp="'+edt3.Text+'",alamat="'+edt4.Text+'",email="'+edt5.Text+'",perusahaan="'+edt6.Text+'",nama_bank="'+edt7.Text+'",akun_bank="'+edt8.Text+'",no_akun_bank="'+edt9.Text+'" where id= "'+a+'"');
DataModule1.ZSupplier.ExecSQL;

DataModule1.ZSupplier.SQL.Clear;
DataModule1.ZSupplier.SQL.Add ('Select*From supplier');
DataModule1.ZSupplier.Open;
ShowMessage('Data Berhasil Diupdate!');
end;

procedure TForm6.dbgrd1CellClick(Column: TColumn);
begin
  edt1.Text := DataModule1.ZSupplier.Fields[1].AsString;
  edt2.Text := DataModule1.ZSupplier.Fields[2].AsString;
  edt3.Text := DataModule1.ZSupplier.Fields[3].AsString;
  edt4.Text := DataModule1.ZSupplier.Fields[4].AsString;
  edt5.Text := DataModule1.ZSupplier.Fields[5].AsString;
  edt6.Text := DataModule1.ZSupplier.Fields[6].AsString;
  edt7.Text := DataModule1.ZSupplier.Fields[7].AsString;
  edt8.Text := DataModule1.ZSupplier.Fields[8].AsString;
  edt9.Text := DataModule1.ZSupplier.Fields[9].AsString;
  a := DataModule1.ZSupplier.Fields[0].AsString;

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
edt6.Enabled := True;
edt7.Enabled := True;
edt8.Enabled := True;
edt9.Enabled := True;
end;


procedure TForm6.btn3Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda Yakin Menghapus ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
   with DataModule1.ZSupplier do
   begin
     SQL.Clear;
     SQL.Add('delete from supplier where id="'+a+'"');
     ExecSQL;

     SQL.Clear;
     SQL.Add('select*from supplier');
     Open;
   end;
   ShowMessage('Data Berhasil Dihapus!');
end else
begin
  ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;


procedure TForm6.btn4Click(Sender: TObject);
begin
edt1.Enabled := True;
edt2.Enabled := True;
edt3.Enabled := True;
edt4.Enabled := True;
edt5.Enabled := True;
edt6.Enabled := True;
edt7.Enabled := True;
edt8.Enabled := True;
edt9.Enabled := True;
btn1.Enabled := True;
btn2.Enabled := False;
btn3.Enabled := False;
btn5.Enabled := True;
btn4.Enabled := False;
end;

procedure TForm6.edt10Change(Sender: TObject);
begin
with DataModule1.ZSupplier do
  begin
    SQL.Clear;
    SQL.Add('select*from supplier where name like "%'+edt10.Text+'%"');
    Open;
end;
end;

procedure TForm6.btn5Click(Sender: TObject);
begin
edt1.Enabled := False;
edt2.Enabled := False;
edt3.Enabled := False;
edt4.Enabled := False;
edt5.Enabled := False;
edt6.Enabled := False;
edt7.Enabled := False;
edt8.Enabled := False;
edt9.Enabled := False;
btn1.Enabled := False;
btn2.Enabled := False;
btn3.Enabled := False;
btn5.Enabled := False;
btn4.Enabled := True;
end;

end.
