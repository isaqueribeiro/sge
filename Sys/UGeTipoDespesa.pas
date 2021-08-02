unit UGeTipoDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient, Datasnap.Provider,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeTipoDespesa = class(TfrmGrPadraoCadastro)
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    GrpBxDadosClassificacao: TGroupBox;
    lblPlanoContas: TLabel;
    dbPlanoContas: TJvDBComboEdit;
    GrpBxParametros: TGroupBox;
    Bevel5: TBevel;
    dbTipoParticular: TDBCheckBox;
    dbAtivo: TDBCheckBox;
    lblClassificacao: TLabel;
    dbClassificacao: TDBLookupComboBox;
    fdQryClassificacao: TFDQuery;
    DtsClassificacao: TDataSource;
    fdQryPlanoConta: TFDQuery;
    dtsPlanoConta: TDataSource;
    Bevel6: TBevel;
    GrpBxPlanoConta: TGroupBox;
    PnlPlanoContaBtn: TPanel;
    BtnPlanoAdicionar: TcxButton;
    BtnPlanoExcluir: TcxButton;
    Bevel7: TBevel;
    dbgPlanoContas: TDBGrid;
    dspPlanoConta: TDataSetProvider;
    cdsPlanoConta: TClientDataSet;
    cdsPlanoContaDESPESA: TSmallintField;
    cdsPlanoContaPLANO: TIntegerField;
    cdsPlanoContaEMPRESA: TStringField;
    cdsPlanoContaSELECIONAR: TSmallintField;
    cdsPlanoContaCODIGO_CONTABIL: TStringField;
    cdsPlanoContaDESCRICAO_RESUMIDA: TStringField;
    cdsPlanoContaPLANO_CONTA: TStringField;
    cdsPlanoContaEMPRESA_RAZAO: TStringField;
    cdsPlanoContaEMPRESA_FANTASIA: TStringField;
    lblRegistroDesativado: TLabel;
    fdQryTabelaCOD: TSmallintField;
    fdQryTabelaTIPODESP: TStringField;
    fdQryTabelaTIPO_PARTICULAR: TSmallintField;
    fdQryTabelaCLASSIFICACAO: TSmallintField;
    fdQryTabelaPLANO_CONTA: TIntegerField;
    fdQryTabelaATIVO: TSmallintField;
    fdQryTabelaTIPO_PARTICULAR_DESC: TStringField;
    fdQryTabelaDESCRICAO_RESUMIDA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnListaClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure dbgPlanoContasDblClick(Sender: TObject);
    procedure dbgPlanoContasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure BtnPlanoAdicionarClick(Sender: TObject);
    procedure cdsPlanoContaSELECIONARGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CarregarPlanoConta;
    procedure GravarRelacaoPlanoConta;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBTPDESPESA
  - TBTPDESPESA_PLANO
  - TBPLANO_CONTA
  - TBEMPRESA

  Views:
  - VW_CLASSIFICAO_DESPESA

  Procedures:

*)

var
  frmGeTipoDespesa: TfrmGeTipoDespesa;

  procedure MostrarTipoDespesas(const AOwner : TComponent);

  function SelecionarTipoDespesa(const AOwner : TComponent; const aEmpresa : String;
    var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE, View.PlanoConta, UDMNFe;

{$R *.dfm}

procedure MostrarTipoDespesas(const AOwner : TComponent);
var
  frm : TfrmGeTipoDespesa;
begin
  frm := TfrmGeTipoDespesa.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarTipoDespesa(const AOwner : TComponent; const aEmpresa : String;
  var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeTipoDespesa;
begin
  frm := TfrmGeTipoDespesa.Create(AOwner);
  try
    frm.fdQryTabela.ParamByName('empresa').AsString := aEmpresa;
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTipoDespesa.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID            := ROTINA_CAD_TIPO_DESPESA_ID;
  ControlFirstEdit    := dbDescricao;
  DisplayFormatCodigo := '##000';
  NomeTabela          := 'TBTPDESPESA';
  CampoCodigo         := 'COD';
  CampoDescricao      := 'TIPODESP';
  CampoOrdenacao      := 'TIPODESP';
  CampoCadastroAtivo  := 'ATIVO';

  CarregarLista(fdQryClassificacao);
  fdQryTabela.ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
end;

procedure TfrmGeTipoDespesa.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarPlanoConta;
end;

procedure TfrmGeTipoDespesa.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarPlanoConta;
end;

procedure TfrmGeTipoDespesa.btbtnListaClick(Sender: TObject);
begin
  inherited;
  DMNFe.fdQryListaTipoDespesa.ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
  DMNFe.frrListaTipoDespesa.ShowReport;
end;

procedure TfrmGeTipoDespesa.btbtnSalvarClick(Sender: TObject);
begin
  try
    fdQryTabela.AfterScroll := nil;
    inherited;
    if (not OcorreuErro) then
      GravarRelacaoPlanoConta;
  finally
    fdQryTabela.AfterScroll := fdQryTabelaAfterScroll;
  end;
end;

procedure TfrmGeTipoDespesa.BtnPlanoAdicionarClick(Sender: TObject);
var
  aPlanoConta : TPlanoConta;
begin
  aPlanoConta.Codigo := 0;
  aPlanoConta.CodigoContabil := EmptyStr;
  aPlanoConta.Descricao      := EmptyStr;
  aPlanoConta.Empresa        := EmptyStr;
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarPlanoConta(Self, tpLancamento, 0, EmptyStr, aPlanoConta) ) then
    begin
      if CdsPlanoConta.Locate('plano;empresa', VarArrayOf([aPlanoConta.Codigo, aPlanoConta.Empresa]), []) then
        ShowWarning('Plano de Contas já associado ao Tipo de Despesa')
      else
      if CdsPlanoConta.Locate('empresa', aPlanoConta.Empresa, []) then
        ShowWarning('Não é permitido mais de um Plano de Contas por empresa para o mesmo Tipo de Despesa')
      else
        with CdsPlanoConta do
        begin
          Append;
          FieldByName('despesa').AsInteger    := DtSrcTabela.DataSet.FieldByName('COD').AsInteger;
          FieldByName('selecionar').AsInteger := 1;
          FieldByName('plano').AsInteger      := aPlanoConta.Codigo;
          FieldByName('plano_conta').AsString := aPlanoConta.CodigoContabil + ' - ' + aPlanoConta.Descricao;
          FieldByName('empresa_razao').AsString    := aPlanoConta.RazaoSocial;
          FieldByName('empresa_fantasia').AsString := aPlanoConta.Fantasia;

          if (Trim(aPlanoConta.Empresa) = EmptyStr) then
            FieldByName('empresa').Clear
          else
            FieldByName('empresa').AsString := aPlanoConta.Empresa;

          Post;
        end;
    end;
end;

procedure TfrmGeTipoDespesa.CarregarPlanoConta;
begin
  with CdsPlanoConta do
  begin
    Close;
    ParamByName('despesa').AsInteger := DtSrcTabela.DataSet.FieldByName('cod').AsInteger;
    Open;
  end;
end;

procedure TfrmGeTipoDespesa.cdsPlanoContaSELECIONARGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

procedure TfrmGeTipoDespesa.dbgPlanoContasDblClick(Sender: TObject);
begin
  if dtsPlanoConta.AutoEdit then
    if ( not cdsPlanoConta.IsEmpty ) then
    begin
      cdsPlanoConta.Edit;
      if ( cdsPlanoConta.FieldByName('selecionar').AsInteger = 0 ) then
        cdsPlanoConta.FieldByName('selecionar').AsInteger := 1
      else
        cdsPlanoConta.FieldByName('selecionar').AsInteger := 0;
      cdsPlanoConta.Post;
    end;
end;

procedure TfrmGeTipoDespesa.dbgPlanoContasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgPlanoContasDblClick(Sender);
end;

procedure TfrmGeTipoDespesa.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  BtnPlanoAdicionar.Enabled := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  BtnPlanoExcluir.Enabled   := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  dtsPlanoConta.AutoEdit    := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TfrmGeTipoDespesa.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarPlanoConta;
end;

procedure TfrmGeTipoDespesa.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('TIPODESP').AsString             := Trim(FieldByName('TIPODESP').AsString);
    FieldByName('TIPO_PARTICULAR_DESC').AsString := IfThen(FieldByName('TIPO_PARTICULAR').AsInteger = 1, 'S', EmptyStr);
  end;
end;

procedure TfrmGeTipoDespesa.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('COD').AsInteger             := GetNextID(NomeTabela, 'COD');
    FieldByName('CLASSIFICACAO').AsInteger   := 0; // A Definir
    FieldByName('TIPO_PARTICULAR').AsInteger := 0;
    FieldByName('ATIVO').AsInteger           := 1;
    FieldByName('PLANO_CONTA').Clear;
  end;
  CarregarPlanoConta;
end;

procedure TfrmGeTipoDespesa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
//  begin
//
//    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
//      if ( dbPlanoContas.Focused ) then
//      begin
//        DtSrcTabela.DataSet.FieldByName('PLANO_CONTA').Clear;
//        DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMIDA').Clear;
//      end;
//
//  end;
//
  if (Shift = [ssCtrl]) and (Key = VK_INSERT) Then
    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
      BtnPlanoAdicionar.Click;

  inherited;
end;

procedure TfrmGeTipoDespesa.GravarRelacaoPlanoConta;
const
  SQL_INSERT = 'Insert Into TBTPDESPESA_PLANO (DESPESA, PLANO, EMPRESA, SELECIONAR) values (%s, %s, %s, 1)';
  SQL_DELETE = 'Delete from TBTPDESPESA_PLANO where DESPESA = %s and PLANO = %s';
begin
  cdsPlanoConta.First;
  cdsPlanoConta.DisableControls;
  while not cdsPlanoConta.Eof do
  begin
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add( Format(SQL_DELETE,
        [cdsPlanoContaDESPESA.AsString, cdsPlanoContaPLANO.AsString]) );
      ExecSQL;

      if (cdsPlanoContaSELECIONAR.AsInteger = 1) then
      begin
        SQL.Clear;
        SQL.Add( Format(SQL_INSERT,
          [cdsPlanoContaDESPESA.AsString, cdsPlanoContaPLANO.AsString, QuotedStr(cdsPlanoContaEMPRESA.AsString)]) );
        ExecSQL;
      end;

      CommitTransaction;
    end;

    cdsPlanoConta.Next;
  end;
  cdsPlanoConta.First;
  cdsPlanoConta.EnableControls;
end;

initialization
  FormFunction.RegisterForm('frmGeTipoDespesa', TfrmGeTipoDespesa);

end.
