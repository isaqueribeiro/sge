object ModelConexaoDataSet: TModelConexaoDataSet
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 273
  Width = 467
  object FDataSet: TFDQuery
    UpdateObject = FUpdateSQL
    Left = 160
    Top = 80
  end
  object FUpdateSQL: TFDUpdateSQL
    Left = 160
    Top = 128
  end
end
