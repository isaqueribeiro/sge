unit UGeCartaCorrecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, dblookup, IBQuery, rxToolEdit, RXDBCtrl, IBTable;

type
  TfrmGeCartaCorrecao = class(TfrmGrPadraoCadastro)
    lblNFe: TLabel;
    dbNFe: TRxDBComboEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    IbDtstTabelaCCE_NUMERO: TIntegerField;
    IbDtstTabelaCCE_EMPRESA: TIBStringField;
    IbDtstTabelaCCE_DATA: TDateField;
    IbDtstTabelaCCE_HORA: TTimeField;
    IbDtstTabelaCCE_ENVIADA: TSmallintField;
    IbDtstTabelaCCE_TEXTO: TMemoField;
    IbDtstTabelaNFE_SERIE: TIBStringField;
    IbDtstTabelaNFE_NUMERO: TIntegerField;
    IbDtstTabelaNFE_MODELO: TSmallintField;
    IbDtstTabelaNUMERO: TIntegerField;
    IbDtstTabelaPROTOCOLO: TIBStringField;
    IbDtstTabelaXML: TMemoField;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    IbDtstTabelaNFE_DESTINATARIO_RAZAO: TIBStringField;
    IbDtstTabelaNFE_DESTINATARIO_CNPJ: TIBStringField;
    lblCorrecao: TLabel;
    dbCorrecao: TDBMemo;
    lblProtocolo: TLabel;
    dbProtocolo: TDBEdit;
    dbEnviada: TDBCheckBox;
    mmCondicaoUso: TMemo;
    BtnEnviarCCe: TBitBtn;
    IbDtstTabelaDataHora: TDateTimeField;
    IbDtstTabelaNotaFiscalEletronica: TStringField;
    IbDtstTabelaNFE_DESTINATARIO: TIBStringField;
    lblCartaPendente: TLabel;
    Bevel5: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure dbNFeButtonClick(Sender: TObject);
    procedure IbDtstTabelaCalcFields(DataSet: TDataSet);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforeEdit(DataSet: TDataSet);
    procedure IbDtstTabelaBeforeDelete(DataSet: TDataSet);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure BtnEnviarCCeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure DtSrcTabelaStateChange(Sender: TObject);
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

var
  frmGeCartaCorrecao: TfrmGeCartaCorrecao;

implementation

uses
  UDMBusiness, UConstantesDGE, UDMNFe, UGeNFEmitida;

{$R *.dfm}

procedure TfrmGeCartaCorrecao.FormCreate(Sender: TObject);
begin
  inherited;
  WhereAdditional  := 'c.cce_empresa = ' + QuotedStr(GetEmpresaIDDefault);

  RotinaID         := ROTINA_NFE_CARTA_CORRECAO_ID;
  ControlFirstEdit := dbEmpresa;

  DisplayFormatCodigo := '000';
  NomeTabela      := 'TBNFE_CARTA_CORRECAO';
  CampoCodigo     := 'CCE_NUMERO';
  CampoDescricao  := 'PROTOCOLO';
  AbrirTabelaAuto := True;

  UpdateGenerator('GEN_CARTA_CORRECAO');
  
  tblEmpresa.Open;

  BtnEnviarCCe.Visible := GetEstacaoEmitiNFe and (gSistema.Codigo = SISTEMA_GESTAO);
end;

procedure TfrmGeCartaCorrecao.dbNFeButtonClick(Sender: TObject);
var
  sEmpresa,
  sSerie  : String;
  iNumero ,
  iModelo : Integer;
  aDestinatario : TDestinatarioNF;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarNFe(Self, sEmpresa, sSerie, iNumero, iModelo, aDestinatario) ) then
    begin
      IbDtstTabelaNFE_SERIE.Value  := sSerie;
      IbDtstTabelaNFE_NUMERO.Value := iNumero;
      IbDtstTabelaNFE_MODELO.Value := iModelo;
      IbDtstTabelaNFE_DESTINATARIO.Value       := FormatFloat('0000000', iNumero) + '-' + sSerie;
      IbDtstTabelaNFE_DESTINATARIO_RAZAO.Value := aDestinatario.RazaoSocial;
      IbDtstTabelaNFE_DESTINATARIO_CNPJ.Value  := aDestinatario.CpfCnpj;
    end;
end;

procedure TfrmGeCartaCorrecao.IbDtstTabelaCalcFields(DataSet: TDataSet);
begin
  IbDtstTabelaDataHora.AsDateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy', IbDtstTabelaCCE_DATA.Value) + ' ' +
    FormatDateTime('hh:mm:ss', IbDtstTabelaCCE_HORA.Value));

  if Trim(IbDtstTabelaNFE_DESTINATARIO.AsString) <> EmptyStr then
    IbDtstTabelaNotaFiscalEletronica.AsString := IbDtstTabelaNFE_DESTINATARIO.AsString + ' - ' + IbDtstTabelaNFE_DESTINATARIO_RAZAO.AsString +
      IfThen(StrIsCNPJ(IbDtstTabelaNFE_DESTINATARIO_CNPJ.AsString),
        ' - CNPJ ' + StrFormatarCnpj(IbDtstTabelaNFE_DESTINATARIO_CNPJ.AsString),
        ' - CPF '  + StrFormatarCpf (IbDtstTabelaNFE_DESTINATARIO_CNPJ.AsString));
end;

procedure TfrmGeCartaCorrecao.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCCE_EMPRESA.Value := GetEmpresaIDDefault;
  IbDtstTabelaCCE_DATA.Value    := GetDateDB;
  IbDtstTabelaCCE_HORA.Value    := GetTimeDB;
  IbDtstTabelaCCE_ENVIADA.Value := 0;
  IbDtstTabelaCCE_TEXTO.Clear;
  IbDtstTabelaXML.Clear;
end;

procedure TfrmGeCartaCorrecao.IbDtstTabelaBeforeEdit(DataSet: TDataSet);
begin
  if ( IbDtstTabelaCCE_ENVIADA.AsInteger = 1 ) then
  begin
    ShowWarning('Esta Carta de Correção já foi enviada para a SEFA e por isso não poderá ser alterada!');
    Abort;
  end;
end;

procedure TfrmGeCartaCorrecao.IbDtstTabelaBeforeDelete(DataSet: TDataSet);
begin
  if ( IbDtstTabelaCCE_ENVIADA.AsInteger = 1 ) then
  begin
    ShowWarning('Esta Carta de Correção já foi enviada para a SEFA e por isso não poderá ser excluída!');
    Abort;
  end
  else
    inherited;
end;

procedure TfrmGeCartaCorrecao.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar CC-e não enviada
    if ( IbDtstTabelaCCE_ENVIADA.AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := lblCartaPendente.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeCartaCorrecao.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
    BtnEnviarCCe.Enabled := (IbDtstTabelaCCE_ENVIADA.AsInteger = 0) and (not IbDtstTabela.IsEmpty) and (not (IbDtstTabela.State in [dsEdit, dsInsert]))
  else
    BtnEnviarCCe.Enabled := False;
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
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  if ( not DelphiIsRunning ) then
    if not DMNFe.GetValidadeCertificado then
      Exit;

  if DMNFe.GerarEnviarCCeACBr(IbDtstTabelaCCE_EMPRESA.AsString, IbDtstTabelaCCE_NUMERO.AsInteger, mmCondicaoUso.Lines.Text) then
    RecarregarRegistro;
    
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCartaCorrecao.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCartaCorrecao.IbDtstTabelaAfterScroll(DataSet: TDataSet);
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

procedure TfrmGeCartaCorrecao.RecarregarRegistro;
var
  sID : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if IbDtstTabela.IsEmpty then
    sID := EmptyStr
  else
    sID := IbDtstTabelaCCE_NUMERO.AsString;

  if ( sID <> EmptyStr ) then
  begin
    IbDtstTabela.Close;
    IbDtstTabela.Open;
    IbDtstTabela.Locate('CCE_NUMERO', sID, []);
  end;
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
