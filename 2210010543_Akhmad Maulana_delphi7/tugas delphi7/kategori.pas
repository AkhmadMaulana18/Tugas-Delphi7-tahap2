unit kategori;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dbgrd1: TDBGrid;
    lbl2: TLabel;
    edt2: TEdit;
    btn5: TButton;
    btn6: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn3Click(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure FormShow (Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure edt2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a : string;

implementation

uses
  mainMenu, Zdb_penjualan, ZAbstractRODataset, DB;

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
begin
if edt1.Text='' then
begin
  ShowMessage('Nama Kategori Tidak Boleh Kosong!');
end else
if DataModule1.ZKategori.Locate('name',edt1.Text,[])then
begin
  ShowMessage('Nama Kategori '+edt1.Text+' Sudah Ada Didalam Sistem');
end else
begin
  with DataModule1.ZKategori do
  begin
    SQL.Clear;
    SQL.Add('insert into kategori values(null,"'+edt1.Text+'")');
    ExecSQL;
    SQL.Clear;
    SQL.Add('select*from kategori');
    Open;
  end;
  ShowMessage('Data Berhasil Disimpan!');
posisiawal;
end;
end;

procedure TForm3.btn2Click(Sender: TObject);
begin
if edt1.Text='' then
begin
  ShowMessage('Nama Kategori Tidak Boleh Kosong!');
end else
if edt1.Text = DataModule1.ZKategori.Fields[1].AsString then
begin
  ShowMessage('Nama Kategori '+edt1.Text+' Tidak Ada Perubahan');
end else
begin
  with DataModule1.ZKategori do
  begin
    SQL.Clear;
    SQL.Add('update kategori set name="'+edt1.Text+'" where id="'+a+'"');
    ExecSQL;
    SQL.Clear;
    SQL.Add('select*from kategori');
    Open;
  end;
  ShowMessage('Data Berhasil Disimpan!');
posisiawal;
end;
end;

procedure TForm3.dbgrd1CellClick(Column: TColumn);
begin
  edt1.Text := DataModule1.ZKategori.Fields[1].AsString;
  a := DataModule1.ZKategori.Fields[0].AsString;

 btn6.Enabled:=False;
 btn1.Enabled:=False;
 btn2.Enabled:=True;
 btn3.Enabled:=True;
 btn5.Enabled:=True;
 edt1.Enabled:=True;
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda Yakin Menghapus ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
   with DataModule1.ZKategori do
   begin
     SQL.Clear;
     SQL.Add('delete from kategori where id="'+a+'"');
     ExecSQL;

     SQL.Clear;
     SQL.Add('select*from kategori');
     Open;
   end;
   ShowMessage('Data Berhasil Dihapus!');
end else
begin
  ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;

procedure TForm3.bersih;
begin
  edt1.Clear;
  edt2.Clear;
end;

procedure TForm3.posisiawal;
begin
 bersih;
 btn6.Enabled:=True;
 btn1.Enabled:=False;
 btn2.Enabled:=False;
 btn3.Enabled:=False;
 btn5.Enabled:=False;
 edt1.Enabled:=False;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  posisiawal;
end;

procedure TForm3.btn6Click(Sender: TObject);
begin
edt1.Enabled := True;
btn1.Enabled := True;
btn2.Enabled := False;
btn3.Enabled := False;
btn5.Enabled := True;
btn6.Enabled := False;
end;

procedure TForm3.btn5Click(Sender: TObject);
begin
edt1.Enabled := False;
btn1.Enabled := False;
btn2.Enabled := False;
btn3.Enabled := False;
btn5.Enabled := False;
btn6.Enabled := True;

end;

procedure TForm3.edt2Change(Sender: TObject);
begin
  with DataModule1.ZKategori do
  begin
    SQL.Clear;
    SQL.Add('select*from kategori where name like "%'+edt2.Text+'%"');
    Open;
  end;
end;

end.
