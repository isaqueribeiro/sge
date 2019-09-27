object FrmAtualizarSistemas: TFrmAtualizarSistemas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualizar Sistemas '#193'gil'
  ClientHeight = 372
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    601
    372)
  PixelsPerInch = 96
  TextHeight = 13
  object lConnectionInfo: TLabel
    Left = 516
    Top = 238
    Width = 77
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Connection Info'
    Color = clBtnFace
    ParentColor = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 328
    Width = 585
    Height = 4
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
    ExplicitTop = 172
    ExplicitWidth = 511
  end
  object LblFileDownload: TLabel
    Left = 564
    Top = 283
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'File(s)'
    Color = clBtnFace
    ParentColor = False
  end
  object PrgBrDownloads: TProgressBar
    Left = 175
    Top = 257
    Width = 418
    Height = 20
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
  end
  object bDownload: TBitBtn
    Left = 282
    Top = 338
    Width = 100
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = 'Atualizar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
      70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
      70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
      70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = bDownloadClick
    ExplicitLeft = 208
    ExplicitTop = 182
  end
  object bPause: TBitBtn
    Left = 387
    Top = 338
    Width = 100
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = 'Pause'
    Enabled = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F33333333337F3E0F33333333370E337F333FF3FF337F3E0F330030033
      70E337F3377F77F337F3E0F33003003370E337F3377F77F337F3E0F330030033
      70E337F3377F77F337F3E0F33003003370E337F3377F77F337F3E0F330030033
      70E337F33773773337F3E0F33333333370E337F33333333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = bPauseClick
    ExplicitLeft = 313
    ExplicitTop = 182
  end
  object bStop: TBitBtn
    Left = 493
    Top = 338
    Width = 100
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = 'Stop'
    Enabled = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F33333333337F3E0F33333333370E337F333FFFFF337F3E0F330000033
      70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
      70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
      70E337F33777773337F3E0F33333333370E337F33333333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = bStopClick
    ExplicitLeft = 419
    ExplicitTop = 182
  end
  object PnlBanner: TPanel
    Left = 8
    Top = 8
    Width = 161
    Height = 314
    Anchors = [akLeft, akTop, akBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 4
  end
  object PrgBrArquivos: TProgressBar
    Left = 175
    Top = 302
    Width = 418
    Height = 20
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 5
  end
  object ACBrDownload: TACBrDownload
    SizeRecvBuffer = 0
    Proxy.ProxyTimeout = 90000
    FTP.FtpTimeout = 300000
    Protocolo = protHTTP
    OnHookStatus = ACBrDownloadHookStatus
    OnHookMonitor = ACBrDownloadHookMonitor
    Left = 488
    Top = 16
  end
end
