unit View.PadraoCadastro;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.DateUtils,
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

  JvToolEdit,
  JvDBControls,
  JvExMask,

  Data.DB,
  Datasnap.DBClient,

  UGrPadrao,
  Interacao.Versao,
  Interacao.Tabela,
  Controller.Versao,
  SGE.Controller.Interfaces,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,

  dxSkinsCore,
  dxSkinsDefaultPainters;

type
  TViewPadraoCadastro = class(TfrmGrPadrao)
    Bevel1: TBevel;
    Bevel3: TBevel;
    pgcGuias: TPageControl;
    tbsTabela: TTabSheet;
    Bevel4: TBevel;
    dbgDados: TDBGrid;
    pnlFiltros: TPanel;
    grpBxFiltro: TGroupBox;
    lbltFiltrar: TLabel;
    edtFiltrar: TEdit;
    tbsCadastro: TTabSheet;
    DtSrcTabela: TDataSource;
    GrpBxDadosNominais: TGroupBox;
    Bevel8: TBevel;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    ImgList: TImageList;
    btnFiltrar: TcxButton;
    tlbBotoes: TPanel;
    Bevel2: TBevel;
    btbtnIncluir: TcxButton;
    btbtnAlterar: TcxButton;
    btbtnExcluir: TcxButton;
    bvlTool1: TBevel;
    btbtnCancelar: TcxButton;
    btbtnSalvar: TcxButton;
    bvlTool2: TBevel;
    btbtnLista: TcxButton;
    bvlTool3: TBevel;
    btbtnFechar: TcxButton;
    btbtnSelecionar: TcxButton;
    bvlTool4: TBevel;
    procedure dbgDadosKeyPressENTER(Sender: TObject; var Key: Char);
    procedure dbgDadosKeyPressNO_ENTER(Sender: TObject; var Key: Char);
    procedure btbtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btbtnSelecionarClick(Sender: TObject);
    procedure dbgDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnListaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FTabela     : ITabela;

    fDisplayFormat  ,
    fWhereAdditional: String;
    fManterDados    ,
    fLiberarUso     ,
    fOcorreuErro    ,
    fAbrirTabelaAuto: Boolean;
    sSQL : TStringList;
    fControlFirst : TWinControl;

    _ver : IVersao;
    _frReport: TfrxReport;
    _SubTituloRelario : String;
    _Todos ,
    _ApenasConsolidado  ,
    _ClearFieldEmptyStr : Boolean;

    procedure SetWhereAdditional(Value : String);
    procedure SetManterDados(Value : Boolean);
    procedure ClearFieldEmptyStr;

    function GetManterDados : Boolean;
    function GetRotinaInserirID   : String;
    function GetRotinaEditarID    : String;
    function GetRotinaExcluirID   : String;
    function GetRotinaImprimirID  : String;
    function GetRotinaPesquisarID : String;
    function ExecutarRefreshRecord : Boolean;
  protected
    FController : IControllerCustom;
  public
    { Public declarations }
    property ver : IVersao read _ver;
    property Tabela : ITabela read FTabela;

    property DisplayFormatCodigo : String read fDisplayFormat write fDisplayFormat;
    property WhereAdditional : String read fWhereAdditional write SetWhereAdditional;
    property OcorreuErro : Boolean read fOcorreuErro;
    property AbrirTabelaAuto : Boolean read fAbrirTabelaAuto write fAbrirTabelaAuto;
    property SQLTabela : TStringList read sSQL;
    property ControlFirstEdit : TWinControl read fControlFirst write fControlFirst;
    property frReport : TfrxReport read _frReport write _frReport;
    property ManterDados : Boolean read GetManterDados write SetManterDados;
    property IsClearFieldEmptyStr : Boolean read _ClearFieldEmptyStr write _ClearFieldEmptyStr;
    property LiberarUso : Boolean read fLiberarUso;

    property RotinaInserirID   : String read GetRotinaInserirID;
    property RotinaEditarID    : String read GetRotinaEditarID;
    property RotinaExcluirID   : String read GetRotinaExcluirID;
    property RotinaImprimirID  : String read GetRotinaImprimirID;
    property RotinaPesquisarID : String read GetRotinaPesquisarID;

    procedure RedimencionarBevel(const ToolBar : TToolBar; const bvl : TBevel);
    procedure RegistrarRotinaSistema; override;
    procedure pgcGuiasOnChange; virtual;
    procedure CarregarLista(const pDataSet : TDataSet);
    procedure DisableCadastro;
  protected
    procedure CentralizarCodigo;
    procedure SetVariablesDefault(const pFastReport : TfrxReport);
    procedure FiltarDados; overload;
    procedure FecharAbrirTabela(const Tabela : TDataSet; const Vazia : Boolean = FALSE);
    procedure GerarSequencial(const pDataSet : TDataSet; const pCampo : String; var pSequencial : Integer);

    function SelecionarRegistro(var Codigo : Integer; var Descricao : String; const FiltroAdicional : String = '') : Boolean; overload;
    function SelecionarRegistro(var Codigo, Descricao : String; const FiltroAdicional : String = '') : Boolean; overload;
    function GetCampoCodigoLimpo : String;
    function GetCampoDescricaoLimpo : String;
  end;

var
  ViewPadraoCadastro: TViewPadraoCadastro;

const
  CATEGORY_VAR = 'Local';
  VAR_TITLE    = 'Titulo';
  VAR_SUBTITLE = 'SubTitulo';
  VAR_PERIODO  = 'Periodo';
  VAR_TODOS    = 'Todos';
  VAR_APENASCONSOLIDADO = 'ApenasConsolidado';
  VAR_SYSTEM            = 'Sistema';
  VAR_USER              = 'Usuario';
  VAR_EMPRESA           = 'Entidade';
  VAR_DEPARTAMENTO      = 'Depto';
  CAMPO_USUARIO         = 'USUARIO';

implementation

uses
    Controller.Tabela
  , UConstantesDGE
  , UFuncoes
  , View.CampoRequisitado
  , UDMBusiness
  , UDMRecursos
  , UDMNFe;

{$R *.dfm}

procedure TViewPadraoCadastro.btbtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TViewPadraoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  fLiberarUso := DMBusiness.LiberarUsoLicenca(GetDateDB);

  _ver := TVersaoController.GetInstance();

  DisplayFormatCodigo := '00000';
  NomeTabela      := EmptyStr;
  CampoCodigo     := EmptyStr;
  CampoDescricao  := EmptyStr;
  CampoOrdenacao  := EmptyStr;
  fManterDados    := True;
  fOcorreuErro    := False;
  AbrirTabelaAuto := False;

  IsClearFieldEmptyStr := True;

  sSQL := TStringList.Create;
  sSQL.BeginUpdate;
  sSQL.Add( FController.DAO.SelectSQL );
  sSQL.EndUpdate;

  DtSrcTabela.DataSet := FController.DAO.DataSet;

  dbCodigo.TabStop    := not dbCodigo.ReadOnly;
  pgcGuias.ActivePage := tbsTabela;

  ControlFirstEdit := nil;

  // Abrir a tabela vazio para carregar os campos
  FController.DAO.OpenEmpty;

  // Preparar DataSet para a configuração dos campos
  FTabela := TTabelaController.New.Tabela(DtSrcTabela.DataSet);
  FController.DAO.CloseEmpty;
end;

procedure TViewPadraoCadastro.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  sComponentName  : TComponentName;
  cComponentLabel : TComponent;
  fComponentField : TField;
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(TDbGrid(Sender).DataSource.DataSet.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color:= clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color:= clCream;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;

  // Destacar os registros desativados
  sComponentName  := 'lblRegistroDesativado';
  cComponentLabel := Self.FindComponent(sComponentName);
  fComponentField := TDbGrid(Sender).DataSource.DataSet.Fields.FindField(CampoCadastroAtivo);
  if Assigned(cComponentLabel) and Assigned(fComponentField) then
  begin
    if ( TDbGrid(Sender).DataSource.DataSet.FieldByName(CampoCadastroAtivo).AsInteger = 0 ) then
    begin
      dbgDados.Canvas.Font.Color := TLabel(cComponentLabel).Font.Color;
      dbgDados.Canvas.Font.Style := TLabel(cComponentLabel).Font.Style;
    end;
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TViewPadraoCadastro.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    if not tbsCadastro.TabVisible then
      Exit;
      
    Key := #0;
    pgcGuias.ActivePage := tbsCadastro;

    if Assigned(pgcGuias.OnChange) then
      pgcGuias.OnChange(pgcGuias);
  end
  else
  if ( Key in ['0'..'9', ' ', 'a'..'z', 'A'..'Z'] ) then
  begin
    edtFiltrar.Text := Trim(Key);
    edtFiltrar.SetFocus;
    edtFiltrar.SelStart := Length(edtFiltrar.Text);
  end;
end;

procedure TViewPadraoCadastro.dbgDadosDblClick(Sender: TObject);
begin
  if tbsCadastro.TabVisible then
  begin
    pgcGuias.ActivePage := tbsCadastro;
    if Assigned(pgcGuias.OnChange) then
      pgcGuias.OnChange(pgcGuias);
  end;
end;

procedure TViewPadraoCadastro.DisableCadastro;
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
    pgcGuias.ActivePage := tbsTabela;

  tbsCadastro.TabVisible := False;
  btbtnIncluir.Visible   := False;
  btbtnAlterar.Visible   := False;
  btbtnExcluir.Visible   := False;
  btbtnCancelar.Visible  := False;
  btbtnSalvar.Visible    := False;
  btbtnLista.Visible     := False;
end;

procedure TViewPadraoCadastro.DtSrcTabelaStateChange(Sender: TObject);
begin
  dbgDados.Enabled    := not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  grpBxFiltro.Enabled := not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);

  btbtnIncluir.Enabled    := (DtSrcTabela.DataSet.State in [dsBrowse]) and fLiberarUso;
  btbtnAlterar.Enabled    := (DtSrcTabela.DataSet.State in [dsBrowse]) and (not DtSrcTabela.DataSet.IsEmpty) and fLiberarUso;
  btbtnExcluir.Enabled    := (DtSrcTabela.DataSet.State in [dsBrowse]) and (not DtSrcTabela.DataSet.IsEmpty) and fLiberarUso;
  btbtnCancelar.Enabled   := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  btbtnSalvar.Enabled     := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  btbtnLista.Enabled      := (DtSrcTabela.DataSet.State in [dsBrowse]);
  btbtnFechar.Enabled     := (DtSrcTabela.DataSet.State in [dsBrowse]) or (not DtSrcTabela.DataSet.Active);
  btbtnSelecionar.Enabled := (DtSrcTabela.DataSet.State in [dsBrowse]) and (not DtSrcTabela.DataSet.IsEmpty);

  DtSrcTabela.AutoEdit   := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  if ( DtSrcTabela.AutoEdit ) then
  begin
    fOcorreuErro        := False;
    pgcGuias.ActivePage := tbsCadastro;
    if ( Assigned(ControlFirstEdit) ) then
      ControlFirstEdit.SetFocus;
  end;
end;

procedure TViewPadraoCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (not Assigned(DtSrcTabela.DataSet)) then
    Exit;

  if DtSrcTabela.DataSet.Active then
    if (not btbtnFechar.Enabled) then
    begin
      CanClose := False;
      ShowWarning('Existe registro em edição');
    end;
end;

procedure TViewPadraoCadastro.btbtnIncluirClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if not TBitBtn(Sender).Visible then
    Exit;

  if ( (pgcGuias.ActivePage = tbsTabela) and edtFiltrar.Visible and edtFiltrar.Enabled ) then
    edtFiltrar.SetFocus;

  WaitAMoment(WAIT_AMOMENT_TextoLivre, 'Preparando inserção, aguarde!');
  try
    FController.DAO.PrepareInsert(True);
    DtSrcTabela.DataSet.Append;
    FTabela.Configurar;
  finally
    WaitAMomentFree;
  end;
end;

procedure TViewPadraoCadastro.btbtnAlterarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;
    
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not DtSrcTabela.DataSet.Active ) then
    Exit;
    
  if ( (pgcGuias.ActivePage = tbsTabela) and edtFiltrar.Visible and edtFiltrar.Enabled ) then
    edtFiltrar.SetFocus;
    
  DtSrcTabela.DataSet.Edit;
end;

procedure TViewPadraoCadastro.btbtnExcluirClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;
    
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not DtSrcTabela.DataSet.Active ) then
    Exit;

  try
    fOcorreuErro := False;
    if ShowConfirmation('Excluir', 'Deseja excluir o registro selecionado?') then
    begin
      DtSrcTabela.DataSet.Delete;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;

      FController.DAO.CommitTransaction;
      FController.DAO.RefreshRecord;
    end;
  except
    On E : Exception do
    begin
      fOcorreuErro := True;
      ShowError('Erro ao tentar excluir o registro selecionado.' + #13#13 + E.Message);
    end;
  end;
end;

procedure TViewPadraoCadastro.btbtnCancelarClick(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    if ShowConfirmation('Cancelar', 'Deseja cancelar a inserção/edição do registro?') then
    begin
      DtSrcTabela.DataSet.Cancel;

      if FController.DAO.PrepareInsert then
      begin
        FController.DAO.PrepareInsert(False);
        FTabela.Configurar;
      end;
    end;
end;

procedure TViewPadraoCadastro.btbtnSalvarClick(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    try
      if IsClearFieldEmptyStr then
        ClearFieldEmptyStr;

      if ( CamposRequiridos(Self, TClientDataSet(DtSrcTabela.DataSet), Self.Caption) ) then
        fOcorreuErro := True
      else
      begin
        if ShowConfirmation('Salvar', 'Deseja salvar a inserção/edição do registro?') then
        begin
          if (Trim(GetCampoDescricaoLimpo) <> EmptyStr) then
            if Assigned( DtSrcTabela.DataSet.Fields.FindField(GetCampoDescricaoLimpo) ) then
              if not DtSrcTabela.DataSet.FieldByName(GetCampoDescricaoLimpo).IsNull then
                DtSrcTabela.DataSet.FieldByName(GetCampoDescricaoLimpo).AsString := Trim(DtSrcTabela.DataSet.FieldByName(GetCampoDescricaoLimpo).AsString);

          if Assigned( DtSrcTabela.DataSet.Fields.FindField(CAMPO_USUARIO) ) then
            DtSrcTabela.DataSet.FieldByName(CAMPO_USUARIO).AsString := gUsuarioLogado.Login;

          DtSrcTabela.DataSet.Post;

          FController.DAO.ApplyUpdates;
          FController.DAO.CommitUpdates;
          FController.DAO.CommitTransaction;

          if ExecutarRefreshRecord then
            FController.DAO.RefreshRecord;

          fOcorreuErro := False;
        end;
      end;
    except
      On E : Exception do
      begin
        fOcorreuErro := True;
        ShowWarning('Erro ao tentar salvar registro.' + #13#13 + E.Message);
      end;
    end;
end;

procedure TViewPadraoCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  function GetPriorPage : Integer;
  var
    I : Integer;
  begin
    I := (pgcGuias.ActivePageIndex - 1);
    if (I = 0) then
    begin
      if pgcGuias.Pages[I].TabVisible then
        Result := I;
    end
    else
    begin
      while not pgcGuias.Pages[I].TabVisible do
        I := I - 1;

      Result := I;  
    end;
  end;

var
  iPage : Integer;
begin
  Case Key of
    VK_F2 : if ( btbtnSelecionar.Visible and btbtnSelecionar.Enabled ) then
              btbtnSelecionar.Click;

    VK_F5 : if ( (pgcGuias.ActivePage = tbsTabela) and DtSrcTabela.DataSet.Active ) then
            begin
              DtSrcTabela.DataSet.Close;
              DtSrcTabela.DataSet.Open;
            end;

    VK_ESCAPE : if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
                  btbtnCancelar.Click
                else
                if ( pgcGuias.ActivePageIndex <> 0 ) then
                begin
                  if not tbsTabela.TabVisible then
                    Exit;

                  iPage := GetPriorPage;
                  if ( iPage > -1 ) then
                    pgcGuias.ActivePageIndex := iPage;
                  if ( pgcGuias.ActivePageIndex = 0 ) then
                    dbgDados.SetFocus;

                  if Assigned(pgcGuias.OnChange) then
                    pgcGuiasOnChange;
                end
                else
                if ( pgcGuias.ActivePageIndex = 0 ) then
                  if ( btbtnFechar.Enabled ) then
                    btbtnFechar.Click;

    VK_UP : if ( (DtSrcTabela.DataSet.Active) and (ActiveControl = edtFiltrar) ) then
              DtSrcTabela.DataSet.Prior;

    VK_DOWN : if ( (DtSrcTabela.DataSet.Active) and (ActiveControl = edtFiltrar) ) then
                DtSrcTabela.DataSet.Next;
    else
    begin
      if (Key = VK_RETURN) and (ActiveControl = edtFiltrar) then
        btnFiltrar.Click
      else
      if not (ActiveControl is TDBGrid) then
        CustomKeyDown(Self, Key, Shift);
    end;
  end;
end;

procedure TViewPadraoCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      Exit;
    end;
  end;
end;

procedure TViewPadraoCadastro.btnFiltrarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  WaitAMoment(WAIT_AMOMENT_LoadData);
  try
    FiltarDados;
    CentralizarCodigo;
  finally
    WaitAMomentFree;
  end;
end;

function TViewPadraoCadastro.ExecutarRefreshRecord: Boolean;
//var
//  aScriptSelect  ,
//  aScriptFetchRow,
//  aRetorno       : Boolean;
begin
//  aRetorno := False;
//  try
//    // Buscar junção entre tabelas nos scripts de consulta dos objetos
//    aScriptSelect   := (Pos('JOIN', AnsiUpperCase(fdQryTabela.SQL.Text)) > 0);
//    aScriptFetchRow := (Pos('JOIN', AnsiUpperCase(fdUpdTabela.FetchRowSQL.Text)) > 0);
//
//    aRetorno := (aScriptSelect = aScriptFetchRow);
//  finally
//    Result := aRetorno;
//  end;
  Result := False;
end;

procedure TViewPadraoCadastro.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    if (Fields.FindField('DTCAD') <> nil) then
      if FieldByName('DTCAD').IsNull then
        FieldByName('DTCAD').AsDateTime := GetDateTimeDB;

    if (Fields.FindField('DATA_CADASTRO') <> nil) then
      if FieldByName('DATA_CADASTRO').IsNull then
        FieldByName('DATA_CADASTRO').AsDateTime := GetDateTimeDB;

    if (Fields.FindField('DT_CADASTRO') <> nil) then
      if FieldByName('DT_CADASTRO').IsNull then
        FieldByName('DT_CADASTRO').AsDateTime := GetDateTimeDB;

    if (Fields.FindField('USUARIO') <> nil) then
      if (Trim(FieldByName('USUARIO').AsString) = EmptyStr) then
        FieldByName('USUARIO').AsString := gUsuarioLogado.Login;
  end;
end;

procedure TViewPadraoCadastro.FiltarDados;
var
  aExpressionOr : String;
begin
  Screen.Cursor   := crSQLWait;
  edtFiltrar.Text := Trim(edtFiltrar.Text).Replace(' ', '%');

  try
    try
      fOcorreuErro := False;
      if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
      begin
        ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
        Abort;
      end;

      FController.DAO.ClearWhere;

      if (edtFiltrar.Text <> EmptyStr) and (Pos(',', edtFiltrar.Text) = 0) then
      begin
        if (StrToIntDef(edtFiltrar.Text, 0) > 0) then
          FController.DAO.Where(CampoCodigo, StrToIntDef(edtFiltrar.Text, 0))
        else
        if (StrToInt64Def(edtFiltrar.Text, 0) > 0) then
          FController.DAO.Where(CampoCodigo, StrToInt64Def(edtFiltrar.Text, 0))
        else
        begin
          aExpressionOr :=
            '    (upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') +
            '  or upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + ')';

          FController.DAO.Where(aExpressionOr);
        end;
      end;

      if (not fWhereAdditional.IsEmpty) then
        FController.DAO.Where('(' + WhereAdditional + ')');

      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      if (not CampoOrdenacao.IsEmpty) then
        FController.DAO.OrderBy(CampoOrdenacao);

      //ShowError(FController.DAO.SelectSQL);

      FController.DAO.Open;
      FTabela.Configurar;

      try
        if Showing and (pgcGuias.ActivePage = tbsTabela) then
          if (not DtSrcTabela.DataSet.IsEmpty) then
            dbgDados.SetFocus
          else
          begin
            ShowWarning('Não existem registros na tabela para este tipo de pesquisa');

            edtFiltrar.SetFocus;
            edtFiltrar.SelectAll;
          end;
      except
      end;
    except
      On E : Exception do
      begin
        fOcorreuErro := True;
        ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13#13 + E.Message);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TViewPadraoCadastro.FecharAbrirTabela(const Tabela : TDataSet; const Vazia : Boolean = FALSE);
begin
  Tabela.Close;
  Tabela.Filtered := Vazia;

  if Tabela.Filtered then
    Tabela.Filter := Format('(%s is null)', [GetCampoCodigoLimpo]);

  Tabela.Open;
end;

function TViewPadraoCadastro.SelecionarRegistro(var Codigo : Integer; var Descricao : String; const FiltroAdicional : String = '') : Boolean;
begin
  try
    fOcorreuErro     := False;
    fWhereAdditional := Trim(FiltroAdicional);

    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
      Abort;
    end;

    Self.btbtnSelecionar.Visible := True;

    Result := (ShowModal = mrOk) and (not DtSrcTabela.DataSet.IsEmpty);

    if ( Result ) then
    begin
      Codigo    := DtSrcTabela.DataSet.FieldByName(GetCampoCodigoLimpo).AsInteger;
      Descricao := DtSrcTabela.DataSet.FieldByName(GetCampoDescricaoLimpo).AsString;
    end
    else
    begin
      Codigo    := 0;
      Descricao := EmptyStr;
    end;
  except
    On E : Exception do
    begin
      fOcorreuErro := True;
      ShowWarning('Erro ao tentar selecionar o registros da tabela.' + #13#13 + E.Message);
    end;
  end;
end;

function TViewPadraoCadastro.SelecionarRegistro(var Codigo, Descricao: String;
  const FiltroAdicional: String): Boolean;
var
 sCampoCodigo    ,
 sCampoDescricao : String;
begin
  try
    fOcorreuErro     := False;
    fWhereAdditional := Trim(FiltroAdicional);

    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
      Abort;
    end;

    if ( pos('.', CampoCodigo) > 0 ) then
      sCampoCodigo := Copy(CampoCodigo, pos('.', CampoCodigo) + 1, Length(CampoCodigo))
    else
      sCampoCodigo := Trim(CampoCodigo);

    if ( pos('.', CampoDescricao) > 0 ) then
      sCampoDescricao := Copy(CampoDescricao, pos('.', CampoDescricao) + 1, Length(CampoDescricao))
    else
      sCampoDescricao := Trim(CampoDescricao);

    Self.btbtnSelecionar.Visible := True;

    Result := (ShowModal = mrOk) and (not DtSrcTabela.DataSet.IsEmpty);

    if ( Result ) then
    begin
      Codigo    := Trim(DtSrcTabela.DataSet.FieldByName(sCampoCodigo).AsString);
      Descricao := Trim(DtSrcTabela.DataSet.FieldByName(sCampoDescricao).AsString);
    end
    else
    begin
      Codigo    := EmptyStr;
      Descricao := EmptyStr;
    end;
  except
    On E : Exception do
    begin
      fOcorreuErro := True;
      ShowWarning('Erro ao tentar selecionar o registros da tabela.' + #13#13 + E.Message);
    end;
  end;
end;

procedure TViewPadraoCadastro.FormShow(Sender: TObject);
begin
  inherited;
  if Assigned(DtSrcTabela.DataSet) then
  begin
    CentralizarCodigo;

    if (not DtSrcTabela.DataSet.Active) then
    begin
      if ( AbrirTabelaAuto ) then
      begin
        DtSrcTabela.DataSet.Close;
        FController.DAO.ClearWhere;

        if (not WhereAdditional.IsEmpty) then
          FController.DAO.Where('(' + WhereAdditional + ')');

        if ( Trim(CampoOrdenacao) = EmptyStr ) then
          CampoOrdenacao := CampoDescricao;

        if (not CampoOrdenacao.IsEmpty) then
          FController.DAO.OrderBy(CampoOrdenacao);

        FController.DAO.Open;
      end;

      DtSrcTabelaStateChange( DtSrcTabela );
      if Trim(DisplayFormatCodigo) <> EmptyStr then
        CentralizarCodigo;
    end;

    FTabela.Configurar;
  end;

  if (tbsTabela.TabVisible and (pgcGuias.ActivePage = tbsTabela) and (edtFiltrar.Visible) and (edtFiltrar.Enabled)) then
    edtFiltrar.SetFocus;
end;

procedure TViewPadraoCadastro.RedimencionarBevel(const ToolBar : TToolBar; const bvl: TBevel);
var
  I ,
  T : Integer;
begin
  T := 0;
  if  Assigned(ToolBar) and Assigned(bvl) then
  begin
    for I := 0 to ComponentCount - 1 do
    begin
      if ( TControl(Components[I]).Parent = ToolBar ) then
      begin
        {$IFDEF DGE}
        if ( Components[I] is TBitBtn ) then
          if ( TBitBtn(Components[I]).Visible ) then
            T := T + TBitBtn(Components[I]).Width;
        {$ENDIF}
        if ( Components[I] is TcxButton ) then
          if ( TcxButton(Components[I]).Visible ) then
            T := T + TcxButton(Components[I]).Width;

        if ( Components[I] is TBevel ) then
          if ( TBevel(Components[I]).Visible ) then
            T := T + TBevel(Components[I]).Width;
      end;
    end;

    T := ToolBar.Width - (T - bvl.Width);
    bvl.Width := T;
  end;
end;

procedure TViewPadraoCadastro.CentralizarCodigo;
var
  aFechar : Boolean;
  sCampoCodigo : String;
begin
  if (Trim(DisplayFormatCodigo) = EmptyStr) then
    Exit;

  if ( Trim(CampoCodigo) = EmptyStr ) then
    Exit;

  if ( dbgDados.Columns.Count > 0 ) then
  begin
    if ( pos('.', CampoCodigo) > 0 ) then
      sCampoCodigo := Copy(CampoCodigo, pos('.', CampoCodigo) + 1, Length(CampoCodigo))
    else
      sCampoCodigo := Trim(CampoCodigo);

    // Testar se o valor do campo código é do tipo numérico
    if (not Assigned(DtSrcTabela.DataSet.Fields.FindField(sCampoCodigo)))  then
      Exit
    else
    if (StrToCurrDef(DtSrcTabela.DataSet.FieldByName(sCampoCodigo).AsString, -1) = -1) then
      Exit;

    dbgDados.Columns[0].Alignment       := taCenter;
    dbgDados.Columns[0].Title.Alignment := taCenter;

    DtSrcTabela.DataSet.FieldByName(sCampoCodigo).Alignment := taCenter;
    DtSrcTabela.DataSet.FieldByName(sCampoCodigo).Required  := False;

    if (DtSrcTabela.DataSet.FieldByName(sCampoCodigo).Size < 10) then
      TCurrencyField(DtSrcTabela.DataSet.FieldByName(sCampoCodigo)).DisplayFormat := DisplayFormatCodigo;
  end;
end;

procedure TViewPadraoCadastro.SetWhereAdditional(Value : String);
begin
  fWhereAdditional := Trim(Value);
end;

procedure TViewPadraoCadastro.btbtnSelecionarClick(Sender: TObject);
var
  sCampoCadastroAtivo : String;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not DtSrcTabela.DataSet.Active ) then
    Exit;

  if Trim(CampoCadastroAtivo) <> EmptyStr then
  begin
    if ( pos('.', CampoCadastroAtivo) > 0 ) then
      sCampoCadastroAtivo := Copy(CampoCadastroAtivo, pos('.', CampoCadastroAtivo) + 1, Length(CampoCadastroAtivo))
    else
      sCampoCadastroAtivo := Trim(CampoCadastroAtivo);

    if Assigned(DtSrcTabela.DataSet.Fields.FindField(sCampoCadastroAtivo)) then
      if (DtSrcTabela.DataSet.FieldByName(sCampoCadastroAtivo).AsInteger = FLAG_NAO) then
      begin
        ShowWarning('O Cadastro selecionado não está ativo!');
        Exit;
      end;
  end;

  ModalResult := mrOk;
end;

procedure TViewPadraoCadastro.dbgDadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Impede a exclusão de um registro em um DBGRID através das teclas CTRL+DEL
  if (Shift = [ssCtrl]) and (Key = 46) Then
    Key := 0;
end;

procedure TViewPadraoCadastro.ClearFieldEmptyStr;
var
  I : Integer;
begin
  for I := 0 to DtSrcTabela.DataSet.Fields.Count - 1 do
  begin
    if (DtSrcTabela.DataSet.Fields[I] is TStringField)     or
       (DtSrcTabela.DataSet.Fields[I] is TMemoField)       or
       (DtSrcTabela.DataSet.Fields[I] is TWideStringField) or
       (DtSrcTabela.DataSet.Fields[I] is TWideMemoField) then
      DtSrcTabela.DataSet.Fields[I].AsString := Trim(DtSrcTabela.DataSet.Fields[I].AsString);

    if ( DtSrcTabela.DataSet.Fields[I].Required ) then
      if ( Trim(DtSrcTabela.DataSet.Fields[I].AsString) = EmptyStr ) then
        DtSrcTabela.DataSet.Fields[I].Clear;

    if (DtSrcTabela.DataSet.Fields[I] is TNumericField) then
      if (DtSrcTabela.DataSet.Fields[I].Value = -1) then
        DtSrcTabela.DataSet.Fields[I].Clear;
  end;
end;

procedure TViewPadraoCadastro.CarregarLista(const pDataSet: TDataSet);
begin
  if pDataSet.Active then
    pDataSet.Close;

  pDataSet.Open;

  pDataSet.Last;
  pDataSet.First;
end;

procedure TViewPadraoCadastro.SetVariablesDefault(
  const pFastReport: TfrxReport);

  function VariableExist(VariableName : String) : Boolean;
  begin
    Result := (frReport.Variables.IndexOf(VariableName) > -1);
  end;

begin
  if Assigned(frReport) then
  begin
    if (frReport.ReportOptions.Name) = EmptyStr then
      frReport.ReportOptions.Name := Application.Title;

    if (frReport.ReportOptions.Author) = EmptyStr then
      frReport.ReportOptions.Author := gUsuarioLogado.Login;

    if ( not VariableExist(CATEGORY_VAR) ) then
      frReport.Variables.AddVariable(EmptyStr, CATEGORY_VAR, null);

    if ( not VariableExist(VAR_TITLE) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_TITLE, EmptyStr);

    if ( not VariableExist(VAR_SUBTITLE) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_SUBTITLE, EmptyStr);

    if ( not VariableExist(VAR_PERIODO) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_PERIODO, EmptyStr);

    if ( not VariableExist(VAR_EMPRESA) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_EMPRESA, GetEmpresaNomeDefault);

    if ( not VariableExist(VAR_USER) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_USER, gUsuarioLogado.Login);

    if ( not VariableExist(VAR_DEPARTAMENTO) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_DEPARTAMENTO, EmptyStr);

    if ( not VariableExist(VAR_TODOS) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_TODOS, 1);

    if ( not VariableExist(VAR_APENASCONSOLIDADO) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_APENASCONSOLIDADO, 0);

    if ( not VariableExist(VAR_SYSTEM) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_SYSTEM, Application.Title + ' - versão ' + ver.FileVersion);
  end;
end;

procedure TViewPadraoCadastro.dbgDadosKeyPressENTER(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    pgcGuias.ActivePage := tbsCadastro;
  end
  else
  if ( Key in ['0'..'9', ' ', 'a'..'z', 'A'..'Z'] ) then
  begin
    edtFiltrar.Text := Trim(Key);
    edtFiltrar.SetFocus;
    edtFiltrar.SelStart := Length(edtFiltrar.Text);
  end;
end;

procedure TViewPadraoCadastro.dbgDadosKeyPressNO_ENTER(Sender: TObject;
  var Key: Char);
begin
  if ( Key in ['0'..'9', ' ', 'a'..'z', 'A'..'Z'] ) then
  begin
    edtFiltrar.Text := Trim(Key);
    edtFiltrar.SetFocus;
    edtFiltrar.SelStart := Length(edtFiltrar.Text);
  end;
end;

procedure TViewPadraoCadastro.RegistrarRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    SetRotinaSistema(ROTINA_TIPO_TELA, RotinaID, Trim(Self.Caption), RotinaPaiID);

    if btbtnIncluir.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaInserirID, 'Inserir', RotinaID);

    if btbtnAlterar.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEditarID,  'Alterar', RotinaID);

    if btbtnExcluir.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaExcluirID, 'Excluir', RotinaID);

    if btbtnLista.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaImprimirID,  'Listar/Imprimir', RotinaID);

    if btnFiltrar.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaPesquisarID, 'Pesquisar/Selecionar', RotinaID);
  end;
end;

function TViewPadraoCadastro.GetRotinaEditarID: String;
begin
  Result := GetRotinaInternaID(btbtnAlterar);
end;

function TViewPadraoCadastro.GetRotinaExcluirID: String;
begin
  Result := GetRotinaInternaID(btbtnExcluir);
end;

function TViewPadraoCadastro.GetRotinaImprimirID: String;
begin
  Result := GetRotinaInternaID(btbtnLista);
end;

function TViewPadraoCadastro.GetRotinaInserirID: String;
begin
  Result := GetRotinaInternaID(btbtnIncluir);
end;

function TViewPadraoCadastro.GetRotinaPesquisarID: String;
begin
  Result := GetRotinaInternaID(btnFiltrar);
end;

procedure TViewPadraoCadastro.btbtnListaClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
  begin
    fOcorreuErro := True;
    Abort;
  end;
end;

procedure TViewPadraoCadastro.GerarSequencial(const pDataSet: TDataSet;
  const pCampo: String; var pSequencial: Integer);
begin
  pSequencial := pDataSet.RecordCount + 1;

  if (pDataSet.RecordCount > 0) then
    if ( Trim(pCampo) <> EmptyStr ) then
      while pDataSet.Locate(pCampo, pSequencial, []) do
        pSequencial := pSequencial + 1;
end;

function TViewPadraoCadastro.GetCampoCodigoLimpo: String;
begin
  if ( pos('.', CampoCodigo) > 0 ) then
    Result := Copy(CampoCodigo, pos('.', CampoCodigo) + 1, Length(CampoCodigo))
  else
    Result := Trim(CampoCodigo);
end;

function TViewPadraoCadastro.GetCampoDescricaoLimpo: String;
begin
  if ( pos('.', CampoDescricao) > 0 ) then
    Result := Copy(CampoDescricao, pos('.', CampoDescricao) + 1, Length(CampoDescricao))
  else
    Result := Trim(CampoDescricao);
end;

procedure TViewPadraoCadastro.pgcGuiasOnChange;
begin
  ;
end;

procedure TViewPadraoCadastro.FormActivate(Sender: TObject);
begin
  inherited;
  SetEmpresaIDDefault( gUsuarioLogado.Empresa );
end;

function TViewPadraoCadastro.GetManterDados: Boolean;
begin
  if ( Trim(RotinaID) = EmptyStr ) then
    Result := fManterDados
  else
    Result := fManterDados and (GetPermissaoRotinaInterna(btbtnIncluir, False) or GetPermissaoRotinaInterna(btbtnAlterar, False));
end;

procedure TViewPadraoCadastro.SetManterDados(Value: Boolean);
begin
  fManterDados := Value;
end;

end.
