object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 192
  Top = 137
  Height = 283
  Width = 461
  object ZKategori: TZQuery
    Connection = ZConnetion1
    Active = True
    SQL.Strings = (
      'select * from kategori')
    Params = <>
    Left = 56
    Top = 72
  end
  object ZConnetion1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\User\Downloads\libmysql.dll'
    Left = 200
  end
  object dsKategori: TDataSource
    DataSet = ZKategori
    Left = 56
    Top = 144
  end
  object ZSatuan: TZQuery
    Connection = ZConnetion1
    Active = True
    SQL.Strings = (
      'select*from satuan')
    Params = <>
    Left = 120
    Top = 72
  end
  object DsSatuan: TDataSource
    DataSet = ZSatuan
    Left = 128
    Top = 136
  end
  object ZSupplier: TZQuery
    Connection = ZConnetion1
    Active = True
    SQL.Strings = (
      'select*from supplier')
    Params = <>
    Left = 184
    Top = 72
  end
  object DsSupplier: TDataSource
    DataSet = ZSupplier
    Left = 192
    Top = 136
  end
  object ZKustomer: TZQuery
    Connection = ZConnetion1
    Active = True
    SQL.Strings = (
      'SELECT*FROM kustomer')
    Params = <>
    Left = 312
    Top = 72
  end
  object DsKustomer: TDataSource
    DataSet = ZKustomer
    Left = 312
    Top = 136
  end
  object zBarang: TZQuery
    Connection = ZConnetion1
    Active = True
    SQL.Strings = (
      'SELECT*FROM barang')
    Params = <>
    Left = 248
    Top = 72
  end
  object DsBarang: TDataSource
    DataSet = zBarang
    Left = 240
    Top = 144
  end
  object dsUser: TDataSource
    DataSet = ZUser
    Left = 368
    Top = 144
  end
  object ZUser: TZQuery
    Connection = ZConnetion1
    Active = True
    SQL.Strings = (
      'select*from user')
    Params = <>
    Left = 376
    Top = 72
  end
end
