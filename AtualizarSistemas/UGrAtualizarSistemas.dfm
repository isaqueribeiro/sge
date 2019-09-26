object FrmAtualizarSistemas: TFrmAtualizarSistemas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualizar Sistemas '#193'gil'
  ClientHeight = 216
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Teste: TButton
    Left = 256
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Teste'
    TabOrder = 0
    OnClick = TesteClick
  end
  object ACBrDownload: TACBrDownload
    SizeRecvBuffer = 0
    Proxy.ProxyTimeout = 90000
    FTP.FtpTimeout = 300000
    Protocolo = protHTTP
    Left = 416
    Top = 40
  end
end
