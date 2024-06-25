unit Zdb_penjualan;

interface

uses
  SysUtils, Classes, DB, ZAbstractConnection, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDataModule1 = class(TDataModule)
    ZKategori: TZQuery;
    ZConnetion1: TZConnection;
    dsKategori: TDataSource;
    ZSatuan: TZQuery;
    DsSatuan: TDataSource;
    ZSupplier: TZQuery;
    DsSupplier: TDataSource;
    ZKustomer: TZQuery;
    DsKustomer: TDataSource;
    zBarang: TZQuery;
    DsBarang: TDataSource;
    dsUser: TDataSource;
    ZUser: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
