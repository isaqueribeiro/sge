unit View.IBPT;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,

  Data.DB,
  Datasnap.DBClient,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  UConstantesDGE;

type
  TViewIBPT = class(TViewPadraoCadastro)
    lblCodigoNCM: TLabel;
    dbCodigoNCM: TDBEdit;
    dbDescricao: TDBMemo;
    lblDescricao: TLabel;
    dtsNivelIBPT: TDataSource;
    lblExcecao: TLabel;
    dbExcecao: TDBLookupComboBox;
    lblTabela: TLabel;
    dbTabela: TDBLookupComboBox;
    dtsTabelaIBPT: TDataSource;
    GrpBxAliquotas: TGroupBox;
    lblAliquotaNAC: TLabel;
    dbAliquotaNAC: TDBEdit;
    lblAliquotaINT: TLabel;
    dbAliquotaINT: TDBEdit;
    dbAliquotaEST: TDBEdit;
    lblAliquotaEST: TLabel;
    dbAliquotaMUN: TDBEdit;
    lblAliquotaMUN: TLabel;
    btnImportar: TcxButton;
    Bevel5: TBevel;
    dbAtivo: TDBCheckBox;
    lblRegistroDesativado: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    FTipoTabela : TTipoTabelaIBPT;
    FControllerTabelaIBPT,
    FControllerNivelIBPT : IControllerCustom;
  public
    { Public declarations }
    procedure FiltarDadosCustom;
  end;

(*
  Tabelas:
  - SYS_IBPT

  Views:

  Procedures:

*)

var
  ViewIBPT: TViewIBPT;

  function SelecionarCodigoIBPT(const AOwner : TComponent; const aTipoTabela : TTipoTabelaIBPT;
    var aIndice : Integer; var aCodigo : String; var aDescricao : String) : Boolean;

implementation

uses
  UDMRecursos,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.IBPT.Importar,
  Service.Message;

{$R *.dfm}

function SelecionarCodigoIBPT(const AOwner : TComponent; const aTipoTabela : TTipoTabelaIBPT;
  var aIndice : Integer; var aCodigo : String; var aDescricao : String) : Boolean;
var
  frm : TViewIBPT;
begin
  frm := TViewIBPT.Create(AOwner);
  try
    frm.FTipoTabela := aTipoTabela;

    Result := frm.SelecionarRegistro(aIndice, aDescricao);

    if Result then
      aCodigo := frm.DtSrcTabela.DataSet.FieldByName('NCM_IBPT').AsString;
  finally
    frm.Destroy;
  end;
end;

procedure TViewIBPT.btnFiltrarClick(Sender: TObject);
begin
  Case FTipoTabela of
    tIbptProdutos: WhereAdditional := 't.tabela_ibpt in (''0'')';
    tIbptServicos: WhereAdditional := 't.tabela_ibpt in (''1'', ''2'')';
  end;

  //inherited;
  FiltarDadosCustom;
  CentralizarCodigo;
end;

procedure TViewIBPT.btnImportarClick(Sender: TObject);
begin
  if ImportarTabelaIBPT(Self) then
    btnFiltrar.Click;
end;

procedure TViewIBPT.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
//  // Destacar códigos NCM desativados
//  if ( DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger = 0 ) then
//    dbgDados.Canvas.Font.Color := lblNCMDesativado.Font.Color;
//
//  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TViewIBPT.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  btnImportar.Enabled := btbtnIncluir.Enabled;
end;

procedure TViewIBPT.FiltarDadosCustom;
var
  aExpressionOr : String;
begin
  Screen.Cursor   := crSQLWait;
  edtFiltrar.Text := Trim(edtFiltrar.Text);

  try
    try
      if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
      begin
        TServiceMessage.ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
        Abort;
      end;

      FController.DAO.ClearWhere;

      if (edtFiltrar.Text <> EmptyStr) then
      begin
        if (StrToInt64Def(edtFiltrar.Text, 0) > 0) then
        begin
          aExpressionOr :=
              '((t.id_ibpt = ' + Trim(edtFiltrar.Text) +') or (t.ncm_ibpt like ' + QuotedStr('%' + edtFiltrar.Text + '%') + '))';
          FController.DAO.Where(aExpressionOr);
        end
        else
        begin
          aExpressionOr :=
            '    (upper(t.descricao_ibpt) like ' + QuotedStr('%' + UpperCase(edtFiltrar.Text) + '%') +
            '  or upper(t.descricao_ibpt) like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(edtFiltrar.Text)) + '%') + ')';

          FController.DAO.Where(aExpressionOr);
        end;
      end;

      FController.DAO.WhereAdditional(WhereAdditional);

      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      if (not CampoOrdenacao.IsEmpty) then
        FController.DAO.OrderBy(CampoOrdenacao);

      FController.DAO.Open;
      Tabela.Configurar;

      try
        if Showing and (pgcGuias.ActivePage = tbsTabela) then
          if ( not DtSrcTabela.DataSet.IsEmpty ) then
            dbgDados.SetFocus
          else
          begin
            TServiceMessage.ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

            edtFiltrar.SetFocus;
            edtFiltrar.SelectAll;
          end;
      except
      end;
    except
      On E : Exception do
        TServiceMessage.ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13#13 + E.Message);
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TViewIBPT.FormCreate(Sender: TObject);
begin
  FControllerTabelaIBPT := TControllerFactory.New.TabelaIBPT;
  FControllerNivelIBPT  := TControllerFactory.New.NivelIBPT;
  FController := TControllerFactory.New.IBPT;

  inherited;
  RotinaID         := ROTINA_CAD_TABELA_IBPT_ID;
  ControlFirstEdit := dbCodigoNCM;
  FTipoTabela      := tIbptGeral;

  DisplayFormatCodigo := '0000000';

  NomeTabela         := 'SYS_IBPT';
  CampoCodigo        := 't.id_ibpt';
  CampoDescricao     := 't.descricao_ibpt';
  CampoOrdenacao     := 't.ex_ibpt, t.ncm_ibpt, t.descricao_ibpt';
  CampoCadastroAtivo := 't.ativo';

  Tabela
    .Display('ID_IBPT',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('NCM_IBPT', 'Código NCM', True)
    .Display('EX_IBPT',  'Exceção', True)
    .Display('TABELA_IBPT',    'Tabela', True)
    .Display('descricao_ibpt', 'Descrição', True)
    .Display('ALIQNACIONAL_IBPT',      'Tributação Nacional',      '0.00#', TAlignment.taRightJustify, True)
    .Display('ALIQINTERNACIONAL_IBPT', 'Tributação Internacional', '0.00#', TAlignment.taRightJustify, True)
    .Display('ALIQESTADUAL_IBPT',      'Tributação Estadual',      '0.00#', TAlignment.taRightJustify, True)
    .Display('ALIQMUNICIPAL_IBPT',     'Tributação Municipal',     '0.00#', TAlignment.taRightJustify, True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);

  TController(FControllerNivelIBPT).LookupComboBox(dbExcecao, dtsNivelIBPT, 'ex_ibpt', 'codigo', 'descricao');
  TController(FControllerTabelaIBPT).LookupComboBox(dbTabela, dtsTabelaIBPT, 'tabela_ibpt', 'codigo', 'descricao');
end;

initialization
  FormFunction.RegisterForm('ViewIBPT', TViewIBPT);

end.
