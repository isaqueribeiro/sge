object DMDados: TDMDados
  OldCreateOrder = False
  Height = 425
  Width = 894
  object FConn: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=AGIL_COMERCIO'
      'Protocol=TCPIP'
      'CharacterSet=ISO8859_2'
      'Port=3050'
      'Server=localhost'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = FTransaction
    UpdateTransaction = FTransaction
    Left = 136
    Top = 72
  end
  object FIBDriverLink: TFDPhysIBDriverLink
    Left = 168
    Top = 72
  end
  object FBDriverLink: TFDPhysFBDriverLink
    Left = 200
    Top = 72
  end
  object FTransaction: TFDTransaction
    Connection = FConn
    Left = 136
    Top = 120
  end
  object FWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 232
    Top = 72
  end
  object FScripts: TFDScript
    SQLScripts = <>
    Connection = FConn
    Transaction = FTransaction
    Params = <>
    Macros = <>
    Left = 136
    Top = 168
  end
end
