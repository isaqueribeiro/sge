object fAtualizadorAutomatico: TfAtualizadorAutomatico
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Atualizador Autom'#225'tico'
  ClientHeight = 118
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbStatus: TLabel
    Left = 14
    Top = 64
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  object btnAtualizacao: TBitBtn
    Left = 62
    Top = 25
    Width = 201
    Height = 25
    Caption = 'Procurar atualiza'#231#245'es'
    TabOrder = 1
    OnClick = btnAtualizacaoClick
  end
  object pbDownload: TProgressBar
    Left = 14
    Top = 78
    Width = 297
    Height = 17
    TabOrder = 2
  end
  object Button1: TButton
    Left = 385
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object IdFTP: TIdFTP
    OnWork = IdFTPWork
    OnWorkBegin = IdFTPWorkBegin
    IPVersion = Id_IPv4
    Host = 'exemplo-artigo.orgfree.com'
    Passive = True
    ConnectTimeout = 0
    Password = 'exemplo2015'
    TransferType = ftBinary
    Username = 'exemplo-artigo.orgfree.com'
    UseExtensionDataPort = True
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 8
    Top = 8
  end
end
