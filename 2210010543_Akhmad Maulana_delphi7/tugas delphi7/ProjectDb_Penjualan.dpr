program ProjectDb_Penjualan;

uses
  Forms,
  mainMenu in 'mainMenu.pas' {Form1},
  Login in 'Login.pas' {Form2},
  kategori in 'kategori.pas' {Form3},
  Db_Penjualan in 'Db_Penjualan.pas' {Form4},
  satuan in 'satuan.pas' {Form5},
  supplier in 'supplier.pas' {Form6},
  kustomer in 'kustomer.pas' {Form7},
  Zdb_penjualan in 'Zdb_penjualan.pas' {DataModule1: TDataModule},
  barang in 'barang.pas',
  user in 'user.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
