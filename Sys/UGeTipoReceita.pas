unit UGeTipoReceita;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls, Datasnap.DBClient, Datasnap.Provider,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeTipoReceita = class(TfrmGrPadraoCadastro)
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    GrpBxDadosClassificacao: TGroupBox;
    lblPlanoContas: TLabel;
    dbPlanoContas: TJvDBComboEdit;
    GrpBxParametros: TGroupBox;
    Bevel5: TBevel;
    dbTipoParticular: TDBCheckBox;
    dbAtivo: TDBCheckBox;
    fdQryClassificacao: TFDQuery;
    DtsClassificacao: TDataSource;
    lblClassificacao: TLabel;
    dbClassificacao: TDBLookupComboBox;
    Bevel6: TBevel;
    fdQryPlanoConta: TFDQuery;
    dspPlanoConta: TDataSetProvider;
    cdsPlanoConta: TClientDataSet;
    cdsPlanoContaPLANO: TIntegerField;
    cdsPlanoContaEMPRESA: TStringField;
    cdsPlanoContaSELECIONAR: TSmallintField;
    cdsPlanoContaCODIGO_CONTABIL: TStringField;
    cdsPlanoContaDESCRICAO_RESUMIDA: TStringField;
    cdsPlanoContaPLANO_CONTA: TStringField;
    cdsPlanoContaEMPRESA_RAZAO: TStringField;
    cdsPlanoContaEMPRESA_FANTASIA: TStringField;
    dtsPlanoConta: TDataSource;
    cdsPlanoContaRECEITA: TSmallintField;
    GrpBxPlanoConta: TGroupBox;
    PnlPlanoContaBtn: TPanel;
    Bevel7: TBevel;
    BtnPlanoAdicionar: TcxButton;
    BtnPlanoExcluir: TcxButton;
    dbgPlanoContas: TDBGrid;
    lblRegistroDesativado: TLabel;
    fdQryTabelaCOD: TSmallintField;
    fdQryTabelaTIPOREC: TStringField;
    fdQryTabelaCLASSIFICACAO: TSmallintField;
    fdQryTabelaTIPO_PARTICULAR: TSmallintField;
    fdQryTabelaPLANO_CONTA: TIntegerField;
    fdQryTabelaATIVO: TSmallintField;
    fdQryTabelaTIPO_PARTICULAR_DESC: TStringField;
    fdQryTabelaDESCRICAO_RESUMIDA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnListaClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure BtnPlanoAdicionarClick(Sender: TObject);
    procedure cdsPlanoContaSELECIONARGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgPlanoContasDblClick(Sender: TObject);
    procedure dbgPlanoContasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
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
  - TBTPRECEITA
  - TBTPRECEITA_PLANO
  - TBPLANO_CONTA
  - TBEMPRESA

  Views:
  - VW_CLASSIFICAO_RECEITA

  Procedures:

*)

var
  frmGeTipoReceita: TfrmGeTipoReceita;

  procedure MostrarTipoReceitas(const AOwner : TComponent);

  function SelecionarTipoReceita(const AOwner : TComponent; const aEmpresa : String;
    var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE, UGePlanoContas, UDMNFe;

{$R *.dfm}

procedure MostrarTipoReceitas(const AOwner : TComponent);
var
  frm : TfrmGeTipoReceita;
begin
  frm := TfrmGeTipoReceita.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarTipoReceita(const AOwner : TComponent; const aEmpresa : String;
  var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeTipoReceita;
begin
  frm := TfrmGeTipoReceita.Create(AOwner);
  try
    frm.fdQryTabela.ParamByName('empresa').AsString := aEmpresa;
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTipoReceita.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID            := ROTINA_CAD_TIPO_RECEITA_ID;
  ControlFirstEdit    := dbDescricao;
  DisplayFormatCodigo := '##000';
  NomeTabela          := 'TBTPRECEITA';
  CampoCodigo         := 'COD';
  CampoDescricao      := 'TIPOREC';
  CampoOrdenacao      := 'TIPOREC';
  CampoCadastroAtivo  := 'ATIVO';

  CarregarLista(fdQryClassificacao);
  fdQryTabela.ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
end;

procedure TfrmGeTipoReceita.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarPlanoConta;
end;

procedure TfrmGeTipoReceita.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarPlanoConta;
end;

procedure TfrmGeTipoReceita.btbtnListaClick(Sender: TObject);
begin
  inherited;
  DMNFe.fdQryListaTipoReceita.ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
  DMNFe.frrListaTipoReceita.ShowReport;
end;

procedure TfrmGeTipoReceita.btbtnSalvarClick(Sender: TObject);
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

procedure TfrmGeTipoReceita.BtnPlanoAdicionarClick(Sender: TObject);
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
        ShowWarning('Plano de Contas já associado ao Tipo de Receita')
      else
      if CdsPlanoConta.Locate('empresa', aPlanoConta.Empresa, []) then
        ShowWarning('Não é permitido mais de um Plano de Contas por empresa para o mesmo Tipo de Despesa')
      else
        with CdsPlanoConta do
        begin
          Append;
          FieldByName('receita').AsInteger    := DtSrcTabela.DataSet.FieldByName('COD').AsInteger;
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

procedure TfrmGeTipoReceita.CarregarPlanoConta;
begin
  with CdsPlanoConta do
  begin
    Close;
    ParamByName('receita').AsInteger := DtSrcTabela.DataSet.FieldByName('cod').AsInteger;
    Open;
  end;
end;

procedure TfrmGeTipoReceita.cdsPlanoContaSELECIONARGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

procedure TfrmGeTipoReceita.dbgPlanoContasDblClick(Sender: TObject);
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

procedure TfrmGeTipoReceita.dbgPlanoContasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgPlanoContasDblClick(Sender);
end;

procedure TfrmGeTipoReceita.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  BtnPlanoAdicionar.Enabled := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  BtnPlanoExcluir.Enabled   := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  dtsPlanoConta.AutoEdit    := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TfrmGeTipoReceita.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarPlanoConta;
end;

procedure TfrmGeTipoReceita.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('TIPOREC').AsString              := Trim(FieldByName('TIPOREC').AsString);
    FieldByName('TIPO_PARTICULAR_DESC').AsString := IfThen(FieldByName('TIPO_PARTICULAR').AsInteger = 1, 'S', EmptyStr);
  end;
end;

procedure TfrmGeTipoReceita.fdQryTabelaNewRecord(DataSet: TDataSet);
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

procedure TfrmGeTipoReceita.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmGeTipoReceita.GravarRelacaoPlanoConta;
const
  SQL_INSERT = 'Insert Into TBTPRECEITA_PLANO (RECEITA, PLANO, EMPRESA, SELECIONAR) values (%s, %s, %s, 1)';
  SQL_DELETE = 'Delete from TBTPRECEITA_PLANO where RECEITA = %s and PLANO = %s';
begin
  cdsPlanoConta.First;
  cdsPlanoConta.DisableControls;
  while not cdsPlanoConta.Eof do
  begin
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add( Format(SQL_DELETE,
        [cdsPlanoContaRECEITA.AsString, cdsPlanoContaPLANO.AsString]) );
      ExecSQL;

      if (cdsPlanoContaSELECIONAR.AsInteger = 1) then
      begin
        SQL.Clear;
        SQL.Add( Format(SQL_INSERT,
          [cdsPlanoContaRECEITA.AsString, cdsPlanoContaPLANO.AsString, QuotedStr(cdsPlanoContaEMPRESA.AsString)]) );
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
  FormFunction.RegisterForm('frmGeTipoReceita', TfrmGeTipoReceita);

end.
