unit UGeTipoDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient, Datasnap.Provider,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeTipoDespesa = class(TfrmGrPadraoCadastro)
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    GrpBxDadosClassificacao: TGroupBox;
    IbDtstTabelaCOD: TSmallintField;
    IbDtstTabelaTIPODESP: TIBStringField;
    IbDtstTabelaTIPO_PARTICULAR: TSmallintField;
    IbDtstTabelaTIPO_PARTICULAR_DESC: TIBStringField;
    lblPlanoContas: TLabel;
    IbDtstTabelaPLANO_CONTA: TIntegerField;
    IbDtstTabelaDESCRICAO_RESUMIDA: TIBStringField;
    dbPlanoContas: TJvDBComboEdit;
    GrpBxParametros: TGroupBox;
    Bevel5: TBevel;
    dbTipoParticular: TDBCheckBox;
    dbAtivo: TDBCheckBox;
    IbDtstTabelaATIVO: TSmallintField;
    IbDtstTabelaCLASSIFICACAO: TSmallintField;
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
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnListaClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure dbgPlanoContasDblClick(Sender: TObject);
    procedure dbgPlanoContasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure BtnPlanoAdicionarClick(Sender: TObject);
    procedure cdsPlanoContaSELECIONARGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
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
  UDMBusiness, UConstantesDGE, UGePlanoContas, UDMNFe;

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
    frm.IbDtstTabela.ParamByName('empresa').AsString := aEmpresa;
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
  CampoCadastroAtivo  := 'ATIVO';

  CarregarLista(fdQryClassificacao);
  IbDtstTabela.ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
end;

procedure TfrmGeTipoDespesa.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCOD.Value                 := GetNextID(NomeTabela, CampoCodigo);
  IbDtstTabelaCLASSIFICACAO.AsInteger   := 0; // A Definir
  IbDtstTabelaTIPO_PARTICULAR.AsInteger := 0;
  IbDtstTabelaATIVO.AsInteger           := 1;
  IbDtstTabelaPLANO_CONTA.Clear;
  CarregarPlanoConta;
end;

procedure TfrmGeTipoDespesa.IbDtstTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarPlanoConta;
end;

procedure TfrmGeTipoDespesa.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaTIPODESP.AsString             := Trim(IbDtstTabelaTIPODESP.AsString);
  IbDtstTabelaTIPO_PARTICULAR_DESC.AsString := IfThen(IbDtstTabelaTIPO_PARTICULAR.AsInteger = 1, 'S', EmptyStr);
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
    IbDtstTabela.AfterScroll := nil;
    inherited;
    if (not OcorreuErro) then
      GravarRelacaoPlanoConta;
  finally
    IbDtstTabela.AfterScroll := IbDtstTabelaAfterScroll;
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
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
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
          FieldByName('despesa').AsInteger    := IbDtstTabelaCOD.AsInteger;
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
    ParamByName('despesa').AsInteger := IbDtstTabela.FieldByName('cod').AsInteger;
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

procedure TfrmGeTipoDespesa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
//  begin
//
//    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
//      if ( dbPlanoContas.Focused ) then
//      begin
//        IbDtstTabelaPLANO_CONTA.Clear;
//        IbDtstTabelaDESCRICAO_RESUMIDA.Clear;
//      end;
//
//  end;
//
  if (Shift = [ssCtrl]) and (Key = VK_INSERT) Then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
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
