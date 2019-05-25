unit UGeCartaCorrecao;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, Mask, DBCtrls, cxTextEdit, cxEdit,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, IBQuery, cxMemo, cxRichEdit,
  IBTable, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls, System.ImageList, cxControls, cxContainer,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeCartaCorrecao = class(TfrmGrPadraoCadastro)
    lblNFe: TLabel;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblCorrecao: TLabel;
    dbCorrecao: TDBMemo;
    lblProtocolo: TLabel;
    dbProtocolo: TDBEdit;
    dbEnviada: TDBCheckBox;
    mmCondicaoUso: TMemo;
    lblCartaPendente: TLabel;
    Bevel5: TBevel;
    BtnEnviarCCe: TcxButton;
    dbNFe: TJvDBComboEdit;
    fdQryEmpresa: TFDQuery;
    fdQryTabelaCCE_NUMERO: TIntegerField;
    fdQryTabelaCCE_EMPRESA: TStringField;
    fdQryTabelaCCE_DATA: TDateField;
    fdQryTabelaCCE_HORA: TTimeField;
    fdQryTabelaCCE_ENVIADA: TSmallintField;
    fdQryTabelaCCE_TEXTO: TMemoField;
    fdQryTabelaNFE_SERIE: TStringField;
    fdQryTabelaNFE_NUMERO: TIntegerField;
    fdQryTabelaNFE_MODELO: TSmallintField;
    fdQryTabelaNUMERO: TIntegerField;
    fdQryTabelaPROTOCOLO: TStringField;
    fdQryTabelaXML: TMemoField;
    fdQryTabelaNFE_DESTINATARIO: TStringField;
    fdQryTabelaNFE_DESTINATARIO_RAZAO: TStringField;
    fdQryTabelaNFE_DESTINATARIO_CNPJ: TStringField;
    fdQryTabelaNotaFiscalEletronica: TStringField;
    fdQryTabelaDataHora: TDateTimeField;
    reInformacao: TcxRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbNFeButtonClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure BtnEnviarCCeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaBeforeDelete(DataSet: TDataSet);
    procedure fdQryTabelaBeforeEdit(DataSet: TDataSet);
    procedure fdQryTabelaCalcFields(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure RegistrarNovaRotinaSistema;

    function GetRotinaEnviarCCeID : String;
  public
    { Public declarations }
    property RotinaEnviarCCeID : String read GetRotinaEnviarCCeID;
  end;

(*
  Tabelas:
    - TBNFE_CARTA_CORRECAO
    - TBNFE_ENVIADA
    - TBVENDAS
    - TBCLIENTE
    - TBCOMPRAS
    - TBFORNECEDOR
    - TBEMPRESA

  Views:

  Procedures:

*)

var
  frmGeCartaCorrecao: TfrmGeCartaCorrecao;

implementation

uses
  UDMBusiness, UConstantesDGE, UDMNFe, UGeNFEmitida, UDMRecursos;

{$R *.dfm}

procedure TfrmGeCartaCorrecao.FormCreate(Sender: TObject);
var
  aFileInforme : String;
begin
  inherited;
  WhereAdditional  := 'c.cce_empresa = ' + QuotedStr(gUsuarioLogado.Empresa);

  RotinaID         := ROTINA_NFE_CARTA_CORRECAO_ID;
  ControlFirstEdit := dbEmpresa;

  DisplayFormatCodigo := '000';
  NomeTabela      := 'TBNFE_CARTA_CORRECAO';
  CampoCodigo     := 'CCE_NUMERO';
  CampoDescricao  := 'PROTOCOLO';
  CampoOrdenacao  := 'c.nfe_numero, c.nfe_serie';
  AbrirTabelaAuto := True;

  UpdateGenerator('GEN_CARTA_CORRECAO');

  CarregarLista(fdQryEmpresa);

  BtnEnviarCCe.Visible := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) and (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  aFileInforme := ExtractFilePath(ParamStr(0)) + 'cce_informe.rtf';
  if FileExists(aFileInforme) then
  begin
    mmCondicaoUso.Visible := False;
    reInformacao.Visible  := True;
    reInformacao.Lines.LoadFromFile(aFileInforme);
  end;
end;

procedure TfrmGeCartaCorrecao.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeCartaCorrecao.dbNFeButtonClick(Sender: TObject);
var
  iAno      ,
  iControle : Integer;
  sEmpresa ,
  sSerie   ,
  sChave   : String;
  iNumero  ,
  iModelo  : Integer;
  dEmissao : TDateTime;
  aDestinatario : TDestinatarioNF;
begin
  with DtSrcTabela.DataSet do
  begin
    iAno      := 0;
    iControle := 0;
    sEmpresa  := FieldByName('CCE_EMPRESA').AsString;
    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
      if ( SelecionarNFe(Self, sEmpresa, sSerie, sChave, iNumero, iModelo, dEmissao, aDestinatario, iAno, iControle) ) then
      begin
        FieldByName('NFE_SERIE').AsString   := sSerie;
        FieldByName('NFE_NUMERO').AsInteger := iNumero;
        FieldByName('NFE_MODELO').AsInteger := iModelo;
        FieldByName('NFE_DESTINATARIO').AsString       := FormatFloat('0000000', iNumero) + '-' + sSerie;
        FieldByName('NFE_DESTINATARIO_RAZAO').AsString := aDestinatario.RazaoSocial;
        FieldByName('NFE_DESTINATARIO_CNPJ').AsString  := aDestinatario.CpfCnpj;
      end;
  end;
end;

procedure TfrmGeCartaCorrecao.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar CC-e não enviada
    if ( DtSrcTabela.DataSet.FieldByName('CCE_ENVIADA').AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := lblCartaPendente.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeCartaCorrecao.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      BtnEnviarCCe.Enabled := (FieldByName('CCE_ENVIADA').AsInteger = 0) and (not IsEmpty) and (not (State in [dsEdit, dsInsert]));
      btbtnLista.Enabled   := (FieldByName('CCE_ENVIADA').AsInteger = 1) and (not IsEmpty) and (Trim(FieldByName('PROTOCOLO').AsString) <> EmptyStr);
    end
    else
    begin
      BtnEnviarCCe.Enabled := False;
      btbtnLista.Enabled   := False;
    end;
  end;
end;

procedure TfrmGeCartaCorrecao.btbtnListaClick(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    DMNFe.ImprimirCCeACBr(FieldByName('CCE_EMPRESA').AsString, FieldByName('CCE_NUMERO').AsInteger);
end;

procedure TfrmGeCartaCorrecao.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCartaCorrecao.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCartaCorrecao.BtnEnviarCCeClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;

    if not DMNFe.GetValidadeCertificado(FieldByName('CCE_EMPRESA').AsString) then
      Exit;

    if DMNFe.ConfigurarParamentoNFE(FieldByName('CCE_EMPRESA').AsString) then
    begin
      ShowInformation('A emissão da CC-e exige a configuração dos parâmetros da empresa.' + #13 + 'Favor entrar em contrato com suporte.');
      Exit;
    end;

    if DMNFe.GerarEnviarCCeACBr(FieldByName('CCE_EMPRESA').AsString, FieldByName('CCE_NUMERO').AsInteger, Trim(mmCondicaoUso.Lines.Text)) then
    begin
      ExecuteScriptSQL(
        'Update TBNFE_CARTA_CORRECAO Set ' +
        '  CCE_ENVIADA     = 1 ' +
        'where CCE_EMPRESA = ' + QuotedStr(FieldByName('CCE_EMPRESA').AsString) +
        '  and CCE_NUMERO  = ' + FieldByName('CCE_NUMERO').AsString
      );
      RecarregarRegistro;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeCartaCorrecao.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCartaCorrecao.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbEmpresa.ReadOnly := (IbDtstTabela.State = dsEdit);
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCartaCorrecao.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCartaCorrecao.fdQryTabelaBeforeDelete(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('CCE_ENVIADA').AsInteger = 1 ) then
    begin
      ShowWarning('Esta Carta de Correção já foi enviada para a SEFA e por isso não poderá ser excluída!');
      Abort;
    end
    else
      inherited;
  end;
end;

procedure TfrmGeCartaCorrecao.fdQryTabelaBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    if ( FieldByName('CCE_ENVIADA').AsInteger = 1 ) then
    begin
      ShowWarning('Esta Carta de Correção já foi enviada para a SEFA e por isso não poderá ser alterada!');
      Abort;
    end;
end;

procedure TfrmGeCartaCorrecao.fdQryTabelaCalcFields(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
  begin
    FieldByName('DataHora').AsDateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy', FieldByName('CCE_DATA').AsDateTime) + ' ' +
      FormatDateTime('hh:mm:ss', FieldByName('CCE_HORA').AsDateTime));

    if Trim(FieldByName('NFE_DESTINATARIO').AsString) <> EmptyStr then
      FieldByName('NotaFiscalEletronica').AsString := FieldByName('NFE_DESTINATARIO').AsString + ' - ' + FieldByName('NFE_DESTINATARIO_RAZAO').AsString +
        IfThen(StrIsCNPJ(FieldByName('NFE_DESTINATARIO_CNPJ').AsString),
          ' - CNPJ ' + StrFormatarCnpj(FieldByName('NFE_DESTINATARIO_CNPJ').AsString),
          ' - CPF '  + StrFormatarCpf (FieldByName('NFE_DESTINATARIO_CNPJ').AsString));
  end;
end;

procedure TfrmGeCartaCorrecao.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('CCE_EMPRESA').AsString  := gUsuarioLogado.Empresa;
    FieldByName('CCE_DATA').AsDateTime   := GetDateDB;
    FieldByName('CCE_HORA').AsDateTime   := GetTimeDB;
    FieldByName('CCE_ENVIADA').AsInteger := 0;
    FieldByName('CCE_TEXTO').Clear;
    FieldByName('XML').Clear;
  end;
end;

procedure TfrmGeCartaCorrecao.RecarregarRegistro;
var
  sID : String;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    Exit;

  fdQryTabela.RefreshRecord;
end;

procedure TfrmGeCartaCorrecao.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if BtnEnviarCCe.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEnviarCCeID, BtnEnviarCCe.Caption, RotinaID);
  end;
end;

function TfrmGeCartaCorrecao.GetRotinaEnviarCCeID: String;
begin
  Result := GetRotinaInternaID(BtnEnviarCCe);
end;

initialization
  FormFunction.RegisterForm('frmGeCartaCorrecao', TfrmGeCartaCorrecao);

end.
