unit View.CentroCusto;

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

  JvExMask,
  JvToolEdit,
  JvDBControls,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela;

type
  TViewCentroCusto = class(TViewPadraoCadastro)
    lblDesricao: TLabel;
    dbDesricao: TDBEdit;
    lblCliente: TLabel;
    dbAtivo: TDBCheckBox;
    dtsEmpresa: TDataSource;
    dbCliente: TJvDBComboEdit;
    pnlEmpresa: TPanel;
    dbgEmpresaLista: TDBGrid;
    pnlDicas: TPanel;
    lblDicasTitulo: TLabel;
    lblDicasTexto: TLabel;
    cdsEmpresa: TClientDataSet;
    imgGrid: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbgEmpresaListaDblClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure cdsEmpresaSelecionarGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbgEmpresaListaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DtSrcTabelaAfterScroll(DataSet: TDataSet);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    FControllerCentroCustoEmpresa : IControllerCustom;
    fCodigoCliente : Integer;
    fEmpresaDepartamento : String;
    procedure CarregarEmpresa;
    procedure GravarRelacaoCentroCustoEmpresa;

    function EmpresaSelecionada : Boolean;
    function Controller : IControllerCentroCusto;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCENTRO_CUSTO
  - TBCLIENTE
  - TBEMPRESA
  - TBCENTRO_CUSTO_EMPRESA

  Views:

  Procedures:

*)

var
  ViewCentroCusto: TViewCentroCusto;

  function SelecionarDepartamento(const AOwner : TComponent;
    const ClienteID : Integer; const EmpresaID : String; var Codigo : Integer; var Nome : String;
    var ClienteIDRetorno : Integer) : Boolean;

implementation

uses
  UDMBusiness,
  UConstantesDGE,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.Cliente;

{$R *.dfm}

function SelecionarDepartamento(const AOwner : TComponent;
  const ClienteID : Integer; const EmpresaID : String; var Codigo : Integer; var Nome : String;
  var ClienteIDRetorno : Integer) : Boolean;
var
  frm : TViewCentroCusto;
begin
  frm := TViewCentroCusto.Create(AOwner);
  try
    frm.fCodigoCliente       := ClienteID;
    frm.fEmpresaDepartamento := Trim(EmpresaID);
    frm.AbrirTabelaAuto      := True;

    if ( frm.fCodigoCliente > 0 ) then
      frm.WhereAdditional := '(c.codcliente = ' + IntToStr(frm.fCodigoCliente) + ')'
    else
    if ( Trim(frm.fEmpresaDepartamento) <> EmptyStr ) then
      frm.WhereAdditional := '(c.codigo in (Select ce.centro_custo from TBCENTRO_CUSTO_EMPRESA ce where ce.empresa = ' +
        QuotedStr(frm.fEmpresaDepartamento) + ')) or (c.codcliente is not null)'
    else
      frm.WhereAdditional := EmptyStr;

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(frm.WhereAdditional);
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);

    if Result then
      ClienteIDRetorno := frm.DtSrcTabela.DataSet.FieldByName('codcliente').AsInteger;
  finally
    frm.Destroy;
  end;
end;

procedure TViewCentroCusto.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.CentroCusto;
  FControllerCentroCustoEmpresa := TControllerFactory.New.CentroCustoEmpresa;

  Controller.SetCentroCustoGeral(gUsuarioLogado.Empresa);

  inherited;
  RotinaID         := ROTINA_CAD_CENTRO_CUSTO_ID;
  ControlFirstEdit := dbDesricao;
  AbrirTabelaAuto  := True;

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBCENTRO_CUSTO';
  CampoCodigo    := 'c.codigo';
  CampoDescricao := 'c.descricao';
  CampoOrdenacao := CampoDescricao;

  fEmpresaDepartamento := EmptyStr;

  Tabela
    .Display('CODIGO', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('DESCRICAO', 'Descrição', True)
    .Display('CODCLIENTE', 'Cliente', False)
    .Display('ativo_temp', 'Ativo', TAlignment.taCenter, False);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);
end;

procedure TViewCentroCusto.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarCliente(Self, iCodigo, sNome) ) then
      begin
        FieldByName('CODCLIENTE').AsInteger := iCodigo;
        FieldByName('NOME').AsString        := sNome;
      end;
  end;
end;

procedure TViewCentroCusto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin
    with DtSrcTabela.DataSet do
    begin
      if ( State in [dsEdit, dsInsert] ) then
        if ( dbCliente.Focused ) then
        begin
          FieldByName('CODCLIENTE').Clear;
          FieldByName('NOME').Clear;
        end
    end;
  end
  else
    inherited;
end;

procedure TViewCentroCusto.CarregarEmpresa;
begin
  FControllerCentroCustoEmpresa.DAO.DataSet.Close;

  FControllerCentroCustoEmpresa.DAO
    .ParamsByName('centro_custo', DtSrcTabela.DataSet.FieldByName('codigo').AsInteger)
    .Open;

  if not cdsEmpresa.Active then
  begin
    cdsEmpresa.CreateDataSet;
    cdsEmpresa.FieldByName('selecionar').OnGetText := cdsEmpresaSelecionarGetText;

    // Preparar DataSet para a configuração dos campos
    TTabelaController.New
      .Tabela(cdsEmpresa)
      .Display('selecionar', 'S', TAlignment.taCenter)
      .Display('centro_custo', 'Código', '00', TAlignment.taCenter)
      .Display('razao', 'Empresa')
      .Configurar;
  end
  else
    cdsEmpresa.EmptyDataSet;

  with FControllerCentroCustoEmpresa do
  begin
    cdsEmpresa.DisableControls;
    DAO.DataSet.DisableControls;
    try
      while not DAO.DataSet.Eof do
      begin
        cdsEmpresa.Append;
        cdsEmpresa.FieldByName('centro_custo').Assign( DAO.DataSet.FieldByName('centro_custo') );
        cdsEmpresa.FieldByName('empresa').Assign( DAO.DataSet.FieldByName('empresa') );
        cdsEmpresa.FieldByName('selecionar').Assign( DAO.DataSet.FieldByName('selecionar') );
        cdsEmpresa.FieldByName('razao').Assign( DAO.DataSet.FieldByName('razao') );
        cdsEmpresa.Post;

        DAO.DataSet.Next;
      end;
    finally
      cdsEmpresa.First;
      cdsEmpresa.EnableControls;
      DAO.DataSet.EnableControls;
    end;
  end;
end;

procedure TViewCentroCusto.GravarRelacaoCentroCustoEmpresa;
var
  sSQL : String;
const
  SQL_INSERT = 'Insert Into TBCENTRO_CUSTO_EMPRESA (centro_custo, empresa, selecionar) values (%s, %s, 1)';
  SQL_DELETE = 'Delete from TBCENTRO_CUSTO_EMPRESA where centro_custo = %s and empresa = %s';
begin
  dtsEmpresa.DataSet.First;
  dtsEmpresa.DataSet.DisableControls;
  try
    while not dtsEmpresa.DataSet.Eof do
    begin
      if dtsEmpresa.DataSet.FieldByName('selecionar').AsInteger = 1 then
        sSQL := SQL_INSERT
      else
        sSQL := SQL_DELETE;

      FController.DAO.ExecuteScriptSQL(
        Format(SQL_DELETE,
          [DtSrcTabela.DataSet.FieldByName('codigo').AsString, dtsEmpresa.DataSet.FieldByName('empresa').AsString])
      );

      FController.DAO.ExecuteScriptSQL(
        Format(sSQL,
          [DtSrcTabela.DataSet.FieldByName('codigo').AsString, dtsEmpresa.DataSet.FieldByName('empresa').AsString])
      );

      dtsEmpresa.DataSet.Next;
    end;

    FController.DAO.CommitTransaction;
  finally
    dtsEmpresa.DataSet.First;
    dtsEmpresa.DataSet.EnableControls;
  end;
end;

procedure TViewCentroCusto.pgcGuiasChange(Sender: TObject);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
    CarregarEmpresa;
end;

procedure TViewCentroCusto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarEmpresa;
end;

procedure TViewCentroCusto.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    CarregarEmpresa;
end;

procedure TViewCentroCusto.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    CarregarEmpresa;
end;

procedure TViewCentroCusto.btbtnSalvarClick(Sender: TObject);
begin
  if (DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger = 0) then
    if not EmpresaSelecionada then
    begin
      ShowWarning('Favor selecionar a empresa, caso o Departamento/Centro de Custo seja interno.');
      Exit;
    end;

  DtSrcTabela.DataSet.AfterScroll := nil;
  inherited;
  DtSrcTabela.DataSet.AfterScroll := DtSrcTabelaAfterScroll;

  if (not OcorreuErro) then
    GravarRelacaoCentroCustoEmpresa;
end;

procedure TViewCentroCusto.dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  aImage : Byte;
begin
  inherited;
  if (Sender = dbgEmpresaLista) then
  begin

    if (AnsiUpperCase(Column.Field.FieldName) = 'SELECIONAR') then
    begin
      aImage := Column.Field.AsInteger;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + 5, Rect.Top + 1, aImage);
    end
    else
    if (AnsiUpperCase(Column.Field.FieldName) = 'SELECIONAR') then
    begin
      aImage := Column.Field.AsInteger;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + 5, Rect.Top + 1, aImage);
    end
    else
    if (AnsiUpperCase(Column.Field.FieldName) = 'SELECIONAR') then
    begin
      aImage := Column.Field.AsInteger;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + 5, Rect.Top + 1, aImage);
    end;

  end;
end;

procedure TViewCentroCusto.dbgEmpresaListaDblClick(Sender: TObject);
begin
  if dtsEmpresa.AutoEdit then
    if ( not dtsEmpresa.DataSet.IsEmpty ) then
    begin
      dtsEmpresa.DataSet.Edit;
      if ( dtsEmpresa.DataSet.FieldByName('selecionar').AsInteger = 0 ) then
        dtsEmpresa.DataSet.FieldByName('selecionar').AsInteger := 1
      else
        dtsEmpresa.DataSet.FieldByName('selecionar').AsInteger := 0;
      dtsEmpresa.DataSet.Post;
    end;
end;

procedure TViewCentroCusto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dtsEmpresa.AutoEdit := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

function TViewCentroCusto.EmpresaSelecionada: Boolean;
var
  bRetorno : Boolean;
begin
  bRetorno := False;
  try
    if dtsEmpresa.DataSet.Active then
    begin
      dtsEmpresa.DataSet.First;
      while not dtsEmpresa.DataSet.Eof do
      begin
        bRetorno := (dtsEmpresa.DataSet.FieldByName('selecionar').AsInteger = 1);
        if bRetorno then
          Break;

        dtsEmpresa.DataSet.Next;
      end;
    end;
  finally
    if dtsEmpresa.DataSet.Active then
      dtsEmpresa.DataSet.First;

    Result := bRetorno;
  end;
end;

procedure TViewCentroCusto.DtSrcTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarEmpresa;
end;

procedure TViewCentroCusto.cdsEmpresaSelecionarGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

function TViewCentroCusto.Controller: IControllerCentroCusto;
begin
  Result := (FController as IControllerCentroCusto);
end;

procedure TViewCentroCusto.dbgEmpresaListaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgEmpresaListaDblClick(Sender);
end;

procedure TViewCentroCusto.btnFiltrarClick(Sender: TObject);
begin
  if ( fCodigoCliente > 0 ) then
    WhereAdditional := '(c.codcliente = ' + IntToStr(fCodigoCliente) + ')'
  else
  if ( Trim(fEmpresaDepartamento) <> EmptyStr ) then
    WhereAdditional := '(c.codigo in (Select ce.centro_custo from TBCENTRO_CUSTO_EMPRESA ce where ce.empresa = ' +
      QuotedStr(fEmpresaDepartamento) + ')) or (c.codcliente is not null)'
  else
    WhereAdditional := EmptyStr;

  inherited;
end;

initialization
  FormFunction.RegisterForm('ViewCentroCusto', TViewCentroCusto);

end.
