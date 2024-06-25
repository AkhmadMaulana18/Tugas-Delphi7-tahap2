unit mainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    FILE1: TMenuItem;
    LOGIN1: TMenuItem;
    LOGOUT1: TMenuItem;
    DATAMASTER1: TMenuItem;
    KATEGORI1: TMenuItem;
    SATUAN1: TMenuItem;
    SUPPLIER1: TMenuItem;
    KUSTOMER1: TMenuItem;
    RANSAKSI1: TMenuItem;
    PENJUALAN1: TMenuItem;
    PEMBELIAN1: TMenuItem;
    LAPORAN1: TMenuItem;
    LAPORANPENJUALAN1: TMenuItem;
    LAPORANPEMBELIAN1: TMenuItem;
    LAPORANBARANG1: TMenuItem;
    BARANG1: TMenuItem;
    U1: TMenuItem;
    procedure LOGIN1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure KATEGORI1Click(Sender: TObject);
    procedure SATUAN1Click(Sender: TObject);
    procedure SUPPLIER1Click(Sender: TObject);
    procedure KUSTOMER1Click(Sender: TObject);
    procedure BARANG1Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Login, kategori, satuan, supplier, kustomer, Zdb_penjualan,
  Db_Penjualan, user;

{$R *.dfm}

procedure TForm1.LOGIN1Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
mm1.Items[1].Visible := False;
mm1.Items[2].Visible := False;
mm1.Items[3].Visible := False;
end;

procedure TForm1.KATEGORI1Click(Sender: TObject);
begin
Form3.Show;
DataModule1.ZKategori.SQL.Clear;
DataModule1.ZKategori.SQL.Add ('Select*From kategori');
DataModule1.ZKategori.Open;
end;

procedure TForm1.SATUAN1Click(Sender: TObject);
begin
Form5.Show;
DataModule1.ZSatuan.SQL.Clear;
DataModule1.ZSatuan.SQL.Add ('Select*From satuan');
DataModule1.ZSatuan.Open;
end;

procedure TForm1.SUPPLIER1Click(Sender: TObject);
begin
Form6.Show;
DataModule1.ZSupplier.SQL.Clear;
DataModule1.ZSupplier.SQL.Add ('Select*From supplier');
DataModule1.ZSupplier.Open;
end;

procedure TForm1.KUSTOMER1Click(Sender: TObject);
begin
Form7.Show;
DataModule1.ZKustomer.SQL.Clear;
DataModule1.ZKustomer.SQL.Add ('Select*From kustomer');
DataModule1.ZKustomer.Open;
end;

procedure TForm1.BARANG1Click(Sender: TObject);
begin
Form4.Show;
DataModule1.zBarang.SQL.Clear;
DataModule1.zBarang.SQL.Add ('Select*From barang');
DataModule1.zBarang.Open;
end;

procedure TForm1.U1Click(Sender: TObject);
begin
Form8.Show;
DataModule1.ZUser.SQL.Clear;
DataModule1.ZUser.SQL.Add ('Select*From user');
DataModule1.ZUser.Open;
end;

end.
