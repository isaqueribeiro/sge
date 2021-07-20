object RDWService: TRDWService
  OldCreateOrder = False
  OnCreate = ServerMethodDataModuleCreate
  Encoding = esUtf8
  Height = 624
  Width = 687
  object DWServerEventsTest: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crGet]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'test'
        EventName = 'test'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWServerEventsTestEventstestReplyEventByType
      end>
    Left = 160
    Top = 40
  end
  object conn: TFDConnection
    Params.Strings = (
      'Database=agil_comercio'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=UNICODE_FSS'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object RDWDriverFD: TRESTDWDriverFD
    CommitRecords = 100
    OnPrepareConnection = RDWDriverFDPrepareConnection
    Connection = conn
    Left = 48
    Top = 88
  end
  object RDWPoolerDB: TRESTDWPoolerDB
    RESTDriver = RDWDriverFD
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Active = True
    PoolerOffMessage = 'RESTPooler n'#227'o est'#225' ativo.'
    ParamCreate = True
    Left = 48
    Top = 136
  end
end
