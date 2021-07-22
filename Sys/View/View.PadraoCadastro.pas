unit View.PadraoCadastro;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
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
  dxSkinsCore;

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
    procedure edtFiltrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btbtnSelecionarClick(Sender: TObject);
    procedure dbgDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnListaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FTabela     : ITabela;
    FController : IControllerCustom;

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

    procedure UpdateGenerator(const sWhr : String = ''); override;
    procedure RedimencionarBevel(const ToolBar : TToolBar; const bvl : TBevel);
    procedure RegistrarRotinaSistema; override;
    procedure pgcGuiasOnChange; virtual;
    procedure CarregarLista(const pDataSet : TDataSet);
    procedure DisableCadastro;
  protected
    procedure CentralizarCodigo;
    procedure SetVariablesDefault(const pFastReport : TfrxReport);
    procedure FiltarDados; overload;
    procedure FecharAbrirTabela(const Tabela : TDataSet; const Vazia : Boolean = FALSE); overload;
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
  , UGrCampoRequisitado
  , UDMBusiness
  , UDMRecursos
  , UDMNFe;

{$R *.dfm}

(*
  IMR - 08/12/2015 :
    Inserção da property "LiberarUso" que corresponderá a liberação de uso da
    aplicação de acordo com a política da Licença de Uso do Sistema.
*)

procedure TViewPadraoCadastro.btbtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TViewPadraoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  //FController := IModelDAOCustom;
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

  FTabela := TTabelaController.New.Tabela(DtSrcTabela.DataSet);
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
  if ( DtSrcTabela.DataSet.Active ) then
    if ( not btbtnFechar.Enabled ) then
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

  if (not DtSrcTabela.DataSet.Active) then
    FecharAbrirTabela(DtSrcTabela.DataSet, True);

  if ( (pgcGuias.ActivePage = tbsTabela) and edtFiltrar.Visible and edtFiltrar.Enabled ) then
    edtFiltrar.SetFocus;

  DtSrcTabela.DataSet.Append;
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

  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ShowConfirmation('Cancelar', 'Deseja cancelar a inserção/edição do registro?') then
      DtSrcTabela.DataSet.Cancel;
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
        fOcorreuErro := False;
        if ShowConfirmation('Salvar', 'Deseja salvar a inserção/edição do registro?') then
        begin
          if (Trim(GetCampoDescricaoLimpo) <> EmptyStr) then
            if Assigned( DtSrcTabela.DataSet.Fields.FindField(GetCampoDescricaoLimpo) ) then
              DtSrcTabela.DataSet.FieldByName(GetCampoDescricaoLimpo).AsString := Trim(DtSrcTabela.DataSet.FieldByName(GetCampoDescricaoLimpo).AsString);

          if Assigned( DtSrcTabela.DataSet.Fields.FindField(CAMPO_USUARIO) ) then
            DtSrcTabela.DataSet.FieldByName(CAMPO_USUARIO).AsString := gUsuarioLogado.Login;


          DtSrcTabela.DataSet.Post;
          FController.DAO.ApplyUpdates;
          FController.DAO.CommitUpdates;
          FController.DAO.CommitTransaction;

          if ExecutarRefreshRecord then
            FController.DAO.RefreshRecord;
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
      CustomKeyDown(Self, Key, Shift);            
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

procedure TViewPadraoCadastro.edtFiltrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = 13 ) then
    btnFiltrar.Click;
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
begin
  Screen.Cursor := crSQLWait;

  try

    try

      fOcorreuErro := False;
      if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
      begin
        ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
        Abort;
      end;

      if (DtSrcTabela.DataSet = IbDtstTabela) then
        with IbDtstTabela, SelectSQL do
        begin
          if ( Trim(CampoOrdenacao) = EmptyStr ) then
            CampoOrdenacao := CampoDescricao;

          Close;
          Clear;
          AddStrings( sSQL );

          if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
            if ( (StrToIntDef(Trim(edtFiltrar.Text), 0) > 0) and (Pos(',', Trim(edtFiltrar.Text)) = 0) ) then
              Add( 'WHERE (' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) + ')' )
            else
            if ( Pos(',', Trim(edtFiltrar.Text)) = 0 ) then
              Add( 'WHERE (upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') +
                   '    or upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + ')');

          if (WhereAdditional <> EmptyStr ) then
            if ( Pos('WHERE', SelectSQL.Text) > 0 ) then
              Add( '  and (' + WhereAdditional + ')' )
            else
              Add( 'WHERE (' + WhereAdditional + ')' );

          Add( 'order by ' + CampoOrdenacao );

          Open;

          try

            if Showing and (pgcGuias.ActivePage = tbsTabela) then
              if ( not IsEmpty ) then
                dbgDados.SetFocus
              else
              begin
                ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

                edtFiltrar.SetFocus;
                edtFiltrar.SelectAll;
              end;

          except
          end;

        end
      else
        with fdQryTabela, SQL do
        begin
          if ( Trim(CampoOrdenacao) = EmptyStr ) then
            CampoOrdenacao := CampoDescricao;

          Close;
          Clear;
          AddStrings( sSQL );

          if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
            if ( (StrToIntDef(Trim(edtFiltrar.Text), 0) > 0) and (Pos(',', Trim(edtFiltrar.Text)) = 0) ) then
              Add( 'WHERE (' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) + ')' )
            else
            if ( Pos(',', Trim(edtFiltrar.Text)) = 0 ) then
              Add( 'WHERE (upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') +
                   '    or upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + ')');

          if (WhereAdditional <> EmptyStr ) then
            if ( Pos('WHERE', SQL.Text) > 0 ) then
              Add( '  and (' + WhereAdditional + ')' )
            else
              Add( 'WHERE (' + WhereAdditional + ')' );

          Add( 'order by ' + CampoOrdenacao );

          Open;

          try

            if Showing and (pgcGuias.ActivePage = tbsTabela) then
              if ( not IsEmpty ) then
                dbgDados.SetFocus
              else
              begin
                ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

                edtFiltrar.SetFocus;
                edtFiltrar.SelectAll;
              end;

          except
          end;

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
  with Tabela do
  begin
    Close;
    if ( Vazia ) then
      if ( Pos('where', LowerCase(FController.DAO.SelectSQL)) = 0 ) then
        SelectSQL.Add('where 1=0');
    Open;
  end;
end;

function TViewPadraoCadastro.SelecionarRegistro(var Codigo : Integer; var Descricao : String; const FiltroAdicional : String = '') : Boolean;
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
      Codigo    := DtSrcTabela.DataSet.FieldByName(sCampoCodigo).AsInteger;
      Descricao := DtSrcTabela.DataSet.FieldByName(sCampoDescricao).AsString;
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
  CentralizarCodigo;

  if ( not DtSrcTabela.DataSet.Active ) then
  begin
    if ( AbrirTabelaAuto ) then
    begin
      DtSrcTabela.DataSet.Close;

      if ( WhereAdditional <> EmptyStr ) then
      begin
        if (DtSrcTabela.DataSet = IbDtstTabela) then
        begin
          if ( Pos('where', IbDtstTabela.SelectSQL.Text) > 0 ) then
            IbDtstTabela.SelectSQL.Add( '  and (' + WhereAdditional + ')' )
          else
            IbDtstTabela.SelectSQL.Add( 'where (' + WhereAdditional + ')' );
        end
        else
        begin
          if ( Pos('where', fdQryTabela.SQL.Text) > 0 ) then
            fdQryTabela.SQL.Add( '  and (' + WhereAdditional + ')' )
          else
            fdQryTabela.SQL.Add( 'where (' + WhereAdditional + ')' );
        end;
      end;

      // Inserir ORDER BY na script caso não exista
      if (DtSrcTabela.DataSet = IbDtstTabela) then
      begin
        if ( (Pos('order by', IbDtstTabela.SelectSQL.Text) = 0) and (CampoOrdenacao <> EmptyStr) ) then
          IbDtstTabela.SelectSQL.Add( 'order by ' + CampoOrdenacao );
      end
      else
      begin
        if ( (Pos('order by', fdQryTabela.SQL.Text) = 0) and (CampoOrdenacao <> EmptyStr) ) then
          fdQryTabela.SQL.Add( 'order by ' + CampoOrdenacao );
      end;

      DtSrcTabela.DataSet.Open;
    end;

    DtSrcTabelaStateChange( DtSrcTabela );
    if Trim(DisplayFormatCodigo) <> EmptyStr then
      CentralizarCodigo;
  end
  else
  if ( not AbrirTabelaAuto ) then
    DtSrcTabela.DataSet.Close;

  if ( tbsTabela.TabVisible and (pgcGuias.ActivePage = tbsTabela) and (edtFiltrar.Visible) and (edtFiltrar.Enabled) ) then
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
    if ( StrToCurrDef(DtSrcTabela.DataSet.FieldByName(sCampoCodigo).AsString, -1) = -1 ) then
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

procedure TViewPadraoCadastro.UpdateGenerator(const sWhr : String = '');
var
  sGenerator ,
  sTabela    ,
  sCampoCodigo : String;
begin
  sGenerator   := EmptyStr;
  sTabela      := EmptyStr;
  sCampoCodigo := EmptyStr;

  if (DtSrcTabela.DataSet = IbDtstTabela) then
  begin
    if ( (CampoCodigo = EmptyStr) and (Trim(IbDtstTabela.GeneratorField.Field) <> EmptyStr) ) then
      CampoCodigo := IbDtstTabela.GeneratorField.Field;

    sGenerator := IbDtstTabela.GeneratorField.Generator;
  end
  else
  begin
    if ( (CampoCodigo = EmptyStr) and (Trim(fdQryTabela.UpdateOptions.AutoIncFields) <> EmptyStr) ) then
      CampoCodigo := fdQryTabela.UpdateOptions.AutoIncFields;

    sGenerator := Trim(fdQryTabela.UpdateOptions.GeneratorName);

    // Gerar o código com o GENERATOR imediatamente ao comando de APPEND no DataSet
    if (sGenerator <> EmptyStr) then
      if (fdQryTabela.UpdateOptions.FetchGeneratorsPoint <> TFDFetchGeneratorsPoint.gpImmediate) then
        fdQryTabela.UpdateOptions.FetchGeneratorsPoint := TFDFetchGeneratorsPoint.gpImmediate;
  end;

  sTabela := NomeTabela;

  if ( pos('.', CampoCodigo) > 0 ) then
    sCampoCodigo := Copy(CampoCodigo, pos('.', CampoCodigo) + 1, Length(CampoCodigo))
  else
    sCampoCodigo := Trim(CampoCodigo);


  if ( (sGenerator <> EmptyStr) and (sTabela <> EmptyStr) and (sCampoCodigo <> EmptyStr) ) then
    UpdateSequence(sGenerator, sTabela, sCampoCodigo, sWhr);
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
    Abort;
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
