unit UGeTabelaIBPTImportar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinMcSkin,
  dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, Vcl.ExtCtrls, Vcl.StdCtrls, cxButtons, ACBrBase,
  ACBrSocket, ACBrIBPTax, Data.DB, Datasnap.DBClient, ACBrNCMs, Vcl.ComCtrls,
  Vcl.OleCtrls, SHDocVw, IBX.IBCustomDataSet, IBX.IBUpdateSQL, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGeTabelaIBPTImportar = class(TfrmGrPadrao)
    pnlConfirmacao: TPanel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    bvlConfirmacao: TBevel;
    GrpBxDownload: TGroupBox;
    ACBrIBPT: TACBrIBPTax;
    lblURL: TLabel;
    tmpCadastro: TClientDataSet;
    tmpCadastroNCM: TStringField;
    tmpCadastroEx: TIntegerField;
    tmpCadastroTabela: TIntegerField;
    tmpCadastroDescricao: TStringField;
    tmpCadastroAliqFedNacional: TFloatField;
    tmpCadastroAliqFedImportado: TFloatField;
    tmpCadastroAliqEstadual: TFloatField;
    tmpCadastroAliqMunicipal: TFloatField;
    dtsCadastro: TDataSource;
    btnDownload: TcxButton;
    lblInformacaoDownload: TLabel;
    ACBrNcms: TACBrNCMs;
    Bevel8: TBevel;
    GrpBxImportacao: TGroupBox;
    lblArquivo: TLabel;
    lblInformacaoImportacao: TLabel;
    edArquivo: TEdit;
    btnImportar: TcxButton;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    Bevel2: TBevel;
    lblVigencia: TLabel;
    lblFonte: TLabel;
    lblChave: TLabel;
    lblQtdeItem: TLabel;
    lblVersao: TLabel;
    opdImportar: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    prgImportacao: TProgressBar;
    WebBrowser: TWebBrowser;
    qryTabelaIBPT: TIBDataSet;
    updTabelaIBPT: TIBUpdateSQL;
    qryTabelaIBPTID_IBPT: TIntegerField;
    qryTabelaIBPTNCM_IBPT: TIBStringField;
    qryTabelaIBPTEX_IBPT: TIBStringField;
    qryTabelaIBPTTABELA_IBPT: TIBStringField;
    qryTabelaIBPTDESCRICAO_IBPT: TWideMemoField;
    qryTabelaIBPTALIQNACIONAL_IBPT: TIBBCDField;
    qryTabelaIBPTALIQINTERNACIONAL_IBPT: TIBBCDField;
    qryTabelaIBPTALIQESTADUAL_IBPT: TIBBCDField;
    qryTabelaIBPTALIQMUNICIPAL_IBPT: TIBBCDField;
    edURL: TComboBox;
    procedure btnDownloadClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure ACBrIBPTErroImportacao(const ALinha, AErro: string);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GravarRegistros : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function ImportarTabelaIBPT(const AOnwer : TComponent) : Boolean;

implementation

{$R *.dfm}

uses
  UConstantesDGE, UDMRecursos, UDMBusiness;

function ImportarTabelaIBPT(const AOnwer : TComponent) : Boolean;
var
  AForm : TfrmGeTabelaIBPTImportar;
begin
  AForm := TfrmGeTabelaIBPTImportar.Create(AOnwer);
  try
    Result := (AForm.ShowModal = mrOk);
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeTabelaIBPTImportar.ACBrIBPTErroImportacao(const ALinha,
  AErro: string);
begin
  lblInformacaoDownload.Caption    := ALinha + ' - ' + AErro;
  lblInformacaoDownload.Font.Color := clRed;
end;

procedure TfrmGeTabelaIBPTImportar.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeTabelaIBPTImportar.btnConfirmarClick(Sender: TObject);
begin
  if ShowConfirmation('Confirma a importação dos registros do arquivo?') then
    if GravarRegistros then
      ModalResult := mrOk;
end;

procedure TfrmGeTabelaIBPTImportar.btnDownloadClick(Sender: TObject);
var
  sArquivo : String;
begin
  if Trim(edURL.Text) = EmptyStr then
  begin
    ShowWarning('Favor informar a URL para download do arquivo.');
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try
    lblInformacaoDownload.Font.Color := clNavy;
    lblInformacaoDownload.Caption := 'Download em execução.... Aguarde!';
    lblInformacaoDownload.Visible := True;

    ACBrIBPT.Arquivo.Clear;

    if Pos('drive.google', edURL.Text) > 0 then
    begin
      WebBrowser.Height := 1;
      WebBrowser.Width  := 1;
      WebBrowser.Navigate(Trim(edURL.Text));
    end
    else
    begin
      btnDownload.Enabled := False;
      Application.ProcessMessages;

      ACBrIBPT.URLDownload := Trim(edURL.Text);
      if ACBrIBPT.DownloadTabela then
        btnImportar.Click;
    end;
  finally
    Screen.Cursor := crDefault;
    lblInformacaoDownload.Visible := False;
    btnDownload.Enabled := True;
  end;
end;

procedure TfrmGeTabelaIBPTImportar.btnImportarClick(Sender: TObject);
var
  I  : Integer;
  ok : Boolean;
  s  : String;
begin
  ok := (ACBrIBPT.Arquivo.Count > 0);
  s  := EmptyStr;

  if not ok then
  begin
    ok := opdImportar.Execute;
    if ok then
      s := Trim(opdImportar.FileName);
  end;

  with ACBrIBPT do
    if ok then
    begin
      edArquivo.Text := s;
      if AbrirTabela(edArquivo.Text) then
      begin
        lblInformacaoImportacao.Font.Color := clNavy;
        lblInformacaoImportacao.Caption    := 'Importação em execução.... Aguarde!';
        lblInformacaoImportacao.Visible    := True;

        lblVersao.Visible   := True;
        lblVigencia.Visible := True;
        lblChave.Visible    := True;
        lblFonte.Visible    := True;
        lblQtdeItem.Visible := True;

        lblVersao.Caption   := VersaoArquivo;
        lblVigencia.Caption := Format('%s a %s', [DateToStr(VigenciaInicio), DateToStr(VigenciaFim)]);
        lblChave.Caption    := ChaveArquivo;
        lblFonte.Caption    := Fonte;

        if tmpCadastro.Active then
          while not tmpCadastro.Eof do
            tmpCadastro.Delete;

        tmpCadastro.Close;
        tmpCadastro.CreateDataSet;
        tmpCadastro.DisableControls;
        try
          lblQtdeItem.Caption    := '0';
          prgImportacao.Position := 0;
          prgImportacao.Max      := ACBrIBPT.Itens.Count;
          prgImportacao.Visible  := True;

          for I := 0 to ACBrIBPT.Itens.Count - 1 do
          begin
            lblInformacaoImportacao.Caption := 'Importando ' + QuotedStr(Itens[I].NCM) + '.... Aguarde!';

            tmpCadastro.Append;
            tmpCadastroNCM.AsString             := Itens[I].NCM;
            tmpCadastroDescricao.AsString       := Itens[I].Descricao;
            tmpCadastroEx.AsString              := Itens[I].Excecao;
            tmpCadastroTabela.AsInteger         := Integer(Itens[I].Tabela);
            tmpCadastroAliqFedNacional.AsFloat  := Itens[I].FederalNacional;
            tmpCadastroAliqFedImportado.AsFloat := Itens[I].FederalImportado;
            tmpCadastroAliqEstadual.AsFloat     := Itens[I].Estadual;
            tmpCadastroAliqMunicipal.AsFloat    := Itens[I].Municipal;
            tmpCadastro.Post;

            prgImportacao.Position := I + 1;
            Application.ProcessMessages;
          end;
        finally
          tmpCadastro.First;
          tmpCadastro.EnableControls;
          lblInformacaoImportacao.Visible := False;

          lblQtdeItem.Caption    := FormatFloat(',0', tmpCadastro.RecordCount);
          btnConfirmar.Enabled   := (tmpCadastro.RecordCount > 0);
          prgImportacao.Position := 0;
          prgImportacao.Max      := tmpCadastro.RecordCount;
          prgImportacao.Visible  := True;
        end;
      end;
    end;
end;

procedure TfrmGeTabelaIBPTImportar.FormCreate(Sender: TObject);
begin
  inherited;
  with edURL do
  begin
    Items.Clear;
    Items.Add(Format(DOWNLOAD_URL_GOOGLE_DRIVE,  [DOWNLOAD_IDFILE_TABELA_IBPT]));
    Items.Add(Format(DOWNLOAD_URL_COMPANY,       [DOWNLOAD_NMFILE_TABELA_IBPT]));

    ItemIndex := Items.Count - 1;
  end;
end;

function TfrmGeTabelaIBPTImportar.GravarRegistros: Boolean;
var
  I : Integer;
begin
  if (tmpCadastro.RecordCount = 0) then
    Exit;

  Screen.Cursor := crSQLWait;
  try
    I := 0;
    btnConfirmar.Enabled := False;

    tmpCadastro.First;
    while not tmpCadastro.Eof do
    begin
      with qryTabelaIBPT do
      begin
        Close;
        ParamByName('ncm_ibpt').AsString := tmpCadastroNCM.AsString;
        ParamByName('ex_ibpt').AsString  := IntToStr(StrToIntDef(Trim(tmpCadastroEx.AsString), 0));
        Open;

        if IsEmpty then
          Append
        else
          Edit;

        qryTabelaIBPTNCM_IBPT.AsString       := tmpCadastroNCM.AsString;
        qryTabelaIBPTEX_IBPT.AsString        := IntToStr(StrToIntDef(Trim(tmpCadastroEx.AsString), 0));
        qryTabelaIBPTTABELA_IBPT.AsString    := IntToStr(StrToIntDef(Trim(tmpCadastroTabela.AsString), 0));
        qryTabelaIBPTDESCRICAO_IBPT.AsString := tmpCadastroDescricao.AsString;
        qryTabelaIBPTALIQNACIONAL_IBPT.AsCurrency      := tmpCadastroAliqFedNacional.AsCurrency;
        qryTabelaIBPTALIQINTERNACIONAL_IBPT.AsCurrency := tmpCadastroAliqFedImportado.AsCurrency;
        qryTabelaIBPTALIQESTADUAL_IBPT.AsCurrency      := tmpCadastroAliqEstadual.AsCurrency;
        qryTabelaIBPTALIQMUNICIPAL_IBPT.AsCurrency     := tmpCadastroAliqMunicipal.AsCurrency;

        Post;
        ApplyUpdates;
      end;

      prgImportacao.Position := I + 1;
      tmpCadastro.Next;
      Inc(I);
    end;

    CommitTransaction;
  finally
    btnConfirmar.Enabled := True;
    Screen.Cursor        := crDefault;
    Result := (I > 0);
  end;
end;

procedure TfrmGeTabelaIBPTImportar.RegistrarRotinaSistema;
begin
  ;
end;

end.
