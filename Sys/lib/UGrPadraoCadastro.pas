unit UGrPadraoCadastro;

interface

uses
  {$IFDEF DGE}
  EUserAcs,
  {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, UGrPadrao, UInfoVersao, IBCustomDataSet, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, IBUpdateSQL, ImgList, TypInfo,
  DBClient, frxClass;

type
  TfrmGrPadraoCadastro = class(TfrmGrPadrao)
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    bvlTool3: TBevel;
    btbtnLista: TBitBtn;
    bvlTool2: TBevel;
    btbtnFechar: TBitBtn;
    pgcGuias: TPageControl;
    tbsTabela: TTabSheet;
    Bevel4: TBevel;
    dbgDados: TDBGrid;
    pnlFiltros: TPanel;
    grpBxFiltro: TGroupBox;
    lbltFiltrar: TLabel;
    btnFiltrar: TSpeedButton;
    edtFiltrar: TEdit;
    tbsCadastro: TTabSheet;
    IbDtstTabela: TIBDataSet;
    DtSrcTabela: TDataSource;
    btbtnCancelar: TBitBtn;
    btbtnSalvar: TBitBtn;
    bvlTool1: TBevel;
    GrpBxDadosNominais: TGroupBox;
    Bevel8: TBevel;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    IbUpdTabela: TIBUpdateSQL;
    ImgList: TImageList;
    bvlToolExpandir: TBevel;
    btbtnSelecionar: TBitBtn;
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
    procedure IbDtstTabelaUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
    procedure btbtnListaClick(Sender: TObject);
  private
    { Private declarations }
    fDisplayFormat  ,
    fNomeTabela     ,
    fCampoCodigo    ,
    fCampoDescricao ,
    fCampoOrdenacao ,
    fWhereAdditional: String;
    fLiberarUso     ,
    fOcorreuErro    ,
    fAbrirTabelaAuto: Boolean;
    sSQL : TStringList;
    fControlFirst : TWinControl;

    _ver : TInfoVersao;
    _frReport: TfrxReport;
    _SubTituloRelario : String;
    _Todos ,
    _ApenasConsolidado : Boolean;

    procedure SetWhereAdditional(Value : String);
    procedure ClearFieldEmptyStr;
    procedure CarregarControleAcesso;

    function GetRotinaInserirID   : String;
    function GetRotinaEditarID    : String;
    function GetRotinaExcluirID   : String;
    function GetRotinaImprimirID  : String;
    function GetRotinaPesquisarID : String;
  public
    { Public declarations }
    property ver : TInfoVersao read _ver;
    property DisplayFormatCodigo : String read fDisplayFormat write fDisplayFormat;
    property NomeTabela : String read fNomeTabela write fNomeTabela;
    property CampoCodigo : String read fCampoCodigo write fCampoCodigo;
    property CampoDescricao : String read fCampoDescricao write fCampoDescricao;
    property CampoOrdenacao : String read fCampoOrdenacao write fCampoOrdenacao;
    property WhereAdditional : String read fWhereAdditional write SetWhereAdditional;
    property OcorreuErro : Boolean read fOcorreuErro;
    property AbrirTabelaAuto : Boolean read fAbrirTabelaAuto write fAbrirTabelaAuto;
    property SQLTabela : TStringList read sSQL;
    property ControlFirstEdit : TWinControl read fControlFirst write fControlFirst;
    property frReport : TfrxReport read _frReport write _frReport;

    property RotinaInserirID   : String read GetRotinaInserirID;
    property RotinaEditarID    : String read GetRotinaEditarID;
    property RotinaExcluirID   : String read GetRotinaExcluirID;
    property RotinaImprimirID  : String read GetRotinaImprimirID;
    property RotinaPesquisarID : String read GetRotinaPesquisarID;

    procedure UpdateGenerator(const sWhr : String = '');
    procedure RedimencionarBevel(const ToolBar : TToolBar; const bvl : TBevel);
    procedure RegistrarRotinaSistema; override;
  protected
    procedure CentralizarCodigo;
    procedure SetVariablesDefault(const pFastReport : TfrxReport);
    procedure FiltarDados; overload;
    procedure FecharAbrirTabela(const Tabela : TIBDataSet; const Vazia : Boolean = FALSE); overload;

    function SelecionarRegistro(var Codigo : Integer; var Descricao : String; const FiltroAdicional : String = '') : Boolean; overload;
    function GetRotinaInternaID(const Sender : TObject) : String;
    function GetPermissaoRotinaInterna(const Sender : TObject; const Alertar : Boolean = FALSE) : Boolean;
    function GetCampoCodigoLimpo : String;
  end;

var
  frmGrPadraoCadastro: TfrmGrPadraoCadastro;

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
  UDMBusiness, UGrCampoRequisitado, UConstantesDGE;

{$R *.dfm}

procedure TfrmGrPadraoCadastro.btbtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGrPadraoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  fLiberarUso := DMBusiness.LiberarUsoLicenca(GetDateDB);

  _ver := TInfoVersao.GetInstance;

  DisplayFormatCodigo := '00000';
  NomeTabela      := EmptyStr;
  CampoCodigo     := EmptyStr;
  CampoDescricao  := EmptyStr;
  CampoOrdenacao  := EmptyStr;
  fOcorreuErro    := False;
  AbrirTabelaAuto := False;    //True; alterado em 11-01-2013 Dorivaldo

  if ( IbDtstTabela.Database = nil ) then
    IbDtstTabela.Database := DMBusiness.ibdtbsBusiness;

  sSQL := TStringList.Create;
  sSQL.AddStrings( IbDtstTabela.SelectSQL );

  dbCodigo.TabStop    := not dbCodigo.ReadOnly;
  pgcGuias.ActivePage := tbsTabela;

  ControlFirstEdit := nil;

  CarregarControleAcesso;

  // Remover a obrigatoriedade de informar código quando o GENERATOR é responsável por sua geração
  with IbDtstTabela.GeneratorField do
  begin
    if (Generator <> EmptyStr) and (Field <> EmptyStr) then
      IbDtstTabela.FieldByName(Field).Required := False;
  end;
end;

procedure TfrmGrPadraoCadastro.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmGrPadraoCadastro.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
  begin
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

procedure TfrmGrPadraoCadastro.dbgDadosDblClick(Sender: TObject);
begin
  pgcGuias.ActivePage := tbsCadastro;
  if Assigned(pgcGuias.OnChange) then
    pgcGuias.OnChange(pgcGuias);
end;

procedure TfrmGrPadraoCadastro.DtSrcTabelaStateChange(Sender: TObject);
begin
  dbgDados.Enabled    := not (IbDtstTabela.State in [dsEdit, dsInsert]);
  grpBxFiltro.Enabled := not (IbDtstTabela.State in [dsEdit, dsInsert]);

  btbtnIncluir.Enabled    := (IbDtstTabela.State in [dsBrowse]) and fLiberarUso;
  btbtnAlterar.Enabled    := (IbDtstTabela.State in [dsBrowse]) and (not IbDtstTabela.IsEmpty) and fLiberarUso;
  btbtnExcluir.Enabled    := (IbDtstTabela.State in [dsBrowse]) and (not IbDtstTabela.IsEmpty) and fLiberarUso;
  btbtnCancelar.Enabled   := (IbDtstTabela.State in [dsEdit, dsInsert]);
  btbtnSalvar.Enabled     := (IbDtstTabela.State in [dsEdit, dsInsert]);
  btbtnLista.Enabled      := (IbDtstTabela.State in [dsBrowse]);
  btbtnFechar.Enabled     := (IbDtstTabela.State in [dsBrowse]) or (not IbDtstTabela.Active);
  btbtnSelecionar.Enabled := (IbDtstTabela.State in [dsBrowse]) and (not IbDtstTabela.IsEmpty);

  DtSrcTabela.AutoEdit   := (IbDtstTabela.State in [dsEdit, dsInsert]);
  if ( DtSrcTabela.AutoEdit ) then
  begin
    fOcorreuErro        := False;
    pgcGuias.ActivePage := tbsCadastro;
    if ( Assigned(ControlFirstEdit) ) then
      ControlFirstEdit.SetFocus;
  end;
end;

procedure TfrmGrPadraoCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ( IbDtstTabela.Active ) then
    if ( not btbtnFechar.Enabled ) then
    begin
      CanClose := False;
      ShowWarning('Existe registro em edição');
    end;
end;

procedure TfrmGrPadraoCadastro.btbtnIncluirClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;
    
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not IbDtstTabela.Active ) then
    FecharAbrirTabela(IbDtstTabela, True);

  if ( (pgcGuias.ActivePage = tbsTabela) and edtFiltrar.Visible and edtFiltrar.Enabled ) then
    edtFiltrar.SetFocus;
    
  IbDtstTabela.Append;
end;

procedure TfrmGrPadraoCadastro.btbtnAlterarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;
    
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not IbDtstTabela.Active ) then
    Exit;
    
  if ( (pgcGuias.ActivePage = tbsTabela) and edtFiltrar.Visible and edtFiltrar.Enabled ) then
    edtFiltrar.SetFocus;
    
  IbDtstTabela.Edit;
end;

procedure TfrmGrPadraoCadastro.btbtnExcluirClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;
    
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not IbDtstTabela.Active ) then
    Exit;
  try
    fOcorreuErro := False;
    if ShowConfirmation('Excluir', 'Deseja excluir o registro selecionado?') then
    begin
      IbDtstTabela.Delete;
      IbDtstTabela.ApplyUpdates;
      CommitTransaction;
    end;
  except
    On E : Exception do
    begin
      fOcorreuErro := True;
      ShowError('Erro ao tentar excluir o registro selecionado.' + #13#13 + E.Message);
    end;
  end;
end;

procedure TfrmGrPadraoCadastro.btbtnCancelarClick(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ShowConfirmation('Cancelar', 'Deseja cancelar a inserção/edição do registro?') then
      IbDtstTabela.Cancel;
end;

procedure TfrmGrPadraoCadastro.btbtnSalvarClick(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    try
      ClearFieldEmptyStr;
      if ( CamposRequiridos(Self, TClientDataSet(IbDtstTabela), Self.Caption) ) then
      begin
        fOcorreuErro := True;
        Exit;
      end;

      fOcorreuErro := False;
      if ShowConfirmation('Salvar', 'Deseja salvar a inserção/edição do registro?') then
      begin
        if Assigned( IbDtstTabela.Fields.FindField(CAMPO_USUARIO) ) then
          IbDtstTabela.FieldByName(CAMPO_USUARIO).AsString := GetUserApp;
          
        IbDtstTabela.Post;
        IbDtstTabela.ApplyUpdates;
        CommitTransaction;
      end;
    except
      On E : Exception do
      begin
        fOcorreuErro := True;
        ShowWarning('Erro ao tentar salvar registro.' + #13#13 + E.Message);
      end;
    end;
end;

procedure TfrmGrPadraoCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  function GetPriorPage : Integer;
  var
    I : Integer;
  begin
    I := (pgcGuias.ActivePageIndex - 1);
    if (I = 0) then
      Result := I
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

    VK_F5 : if ( (pgcGuias.ActivePage = tbsTabela) and IbDtstTabela.Active ) then
            begin
              DtSrcTabela.DataSet.Close;
              DtSrcTabela.DataSet.Open;
            end;

    VK_ESCAPE : if (IbDtstTabela.State in [dsEdit, dsInsert]) then
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
                end
                else
                if ( pgcGuias.ActivePageIndex = 0 ) then
                  if ( btbtnFechar.Enabled ) then
                    btbtnFechar.Click;
    VK_UP : if ( (IbDtstTabela.Active) and (ActiveControl = edtFiltrar) ) then
              IbDtstTabela.Prior;

    VK_DOWN : if ( (IbDtstTabela.Active) and (ActiveControl = edtFiltrar) ) then
                IbDtstTabela.Next;
    else
      CustomKeyDown(Self, Key, Shift);            
  end;
end;

procedure TfrmGrPadraoCadastro.btnFiltrarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  FiltarDados;
  CentralizarCodigo;  
end;

procedure TfrmGrPadraoCadastro.edtFiltrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = 13 ) then
    btnFiltrar.Click;
end;

procedure TfrmGrPadraoCadastro.FiltarDados;
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

      with IbDtstTabela, SelectSQL do
      begin
        if ( Trim(CampoOrdenacao) = EmptyStr ) then
          CampoOrdenacao := CampoDescricao;

        Close;
        Clear;
        AddStrings( sSQL );

        if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
          if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
            Add( 'where ' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) )
          else
            Add( 'where (upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') +
                 '    or upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + ')');

        if (WhereAdditional <> EmptyStr ) then
          if ( Pos('where', SelectSQL.Text) > 0 ) then
            Add( '  and (' + WhereAdditional + ')' )
          else
            Add( 'where (' + WhereAdditional + ')' );

        Add( 'order by ' + CampoOrdenacao );

        Open;

        try

          if Showing then
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

procedure TfrmGrPadraoCadastro.FecharAbrirTabela(const Tabela : TIBDataSet; const Vazia : Boolean = FALSE);
begin
  with Tabela do
  begin
    Close;
    if ( Vazia ) then
      if ( Pos('where', LowerCase(SelectSQL.Text)) = 0 ) then
        SelectSQL.Add('where 1=0');
    Open;
  end;
end;

function TfrmGrPadraoCadastro.SelecionarRegistro(var Codigo : Integer; var Descricao : String; const FiltroAdicional : String = '') : Boolean;
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

    Result := (ShowModal = mrOk) and (not IbDtstTabela.IsEmpty);

    if ( Result ) then
    begin
      Codigo    := IbDtstTabela.FieldByName(sCampoCodigo).AsInteger;
      Descricao := IbDtstTabela.FieldByName(sCampoDescricao).AsString;
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

procedure TfrmGrPadraoCadastro.FormShow(Sender: TObject);
begin
  inherited;
  RedimencionarBevel(tlbBotoes, bvlToolExpandir);
  CentralizarCodigo;

  if ( not IbDtstTabela.Active ) then
  begin
    if ( AbrirTabelaAuto ) then
    begin
      IbDtstTabela.Close;
      if ( WhereAdditional <> EmptyStr ) then

      if ( Pos('where', IbDtstTabela.SelectSQL.Text) > 0 ) then
        IbDtstTabela.SelectSQL.Add( '  and (' + WhereAdditional + ')' )
      else
        IbDtstTabela.SelectSQL.Add( 'where (' + WhereAdditional + ')' );

      if ( (Pos('order by', IbDtstTabela.SelectSQL.Text) = 0) and (CampoOrdenacao <> EmptyStr) ) then
        IbDtstTabela.SelectSQL.Add( 'order by ' + CampoOrdenacao );

      IbDtstTabela.Open;
    end;

    DtSrcTabelaStateChange( DtSrcTabela );
  end
  else
  if ( not AbrirTabelaAuto ) then
    IbDtstTabela.Close;

  if ( tbsTabela.TabVisible and (pgcGuias.ActivePage = tbsTabela) and (edtFiltrar.Visible) and (edtFiltrar.Enabled) ) then
    edtFiltrar.SetFocus;
end;

procedure TfrmGrPadraoCadastro.RedimencionarBevel(const ToolBar : TToolBar; const bvl: TBevel);
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
        if ( Components[I] is TBitBtn ) then
          if ( TBitBtn(Components[I]).Visible ) then
            T := T + TBitBtn(Components[I]).Width;

        if ( Components[I] is TBevel ) then
          if ( TBevel(Components[I]).Visible ) then
            T := T + TBevel(Components[I]).Width;
      end;
    end;

    T := ToolBar.Width - (T - bvl.Width);
    bvl.Width := T;
  end;
end;

procedure TfrmGrPadraoCadastro.CentralizarCodigo;
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

    if ( StrToCurrDef(IbDtstTabela.FieldByName(sCampoCodigo).AsString, 0) = 0 ) then
      Exit;

    dbgDados.Columns[0].Alignment       := taCenter;
    dbgDados.Columns[0].Title.Alignment := taCenter;

    IbDtstTabela.FieldByName(sCampoCodigo).Alignment := taCenter;
    IbDtstTabela.FieldByName(sCampoCodigo).Required  := False;

    if (IbDtstTabela.FieldByName(sCampoCodigo).Size < 10) then
      TCurrencyField(IbDtstTabela.FieldByName(sCampoCodigo)).DisplayFormat := DisplayFormatCodigo;
  end;
end;

procedure TfrmGrPadraoCadastro.SetWhereAdditional(Value : String);
begin
  fWhereAdditional := Trim(Value);
end;

procedure TfrmGrPadraoCadastro.btbtnSelecionarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not IbDtstTabela.Active ) then
    Exit;
    
  ModalResult := mrOk;
end;

procedure TfrmGrPadraoCadastro.UpdateGenerator(const sWhr : String = '');
var
  sGenerator ,
  sTabela    ,
  sCampoCodigo : String;
begin
  sGenerator   := EmptyStr;
  sTabela      := EmptyStr;
  sCampoCodigo := EmptyStr;

  if ( (CampoCodigo = EmptyStr) and (Trim(IbDtstTabela.GeneratorField.Field) <> EmptyStr) ) then
    CampoCodigo := IbDtstTabela.GeneratorField.Field;

  sGenerator   := IbDtstTabela.GeneratorField.Generator;
  sTabela      := NomeTabela;
  if ( pos('.', CampoCodigo) > 0 ) then
    sCampoCodigo := Copy(CampoCodigo, pos('.', CampoCodigo) + 1, Length(CampoCodigo))
  else
    sCampoCodigo := Trim(CampoCodigo);


  if ( (sGenerator <> EmptyStr) and (sTabela <> EmptyStr) and (sCampoCodigo <> EmptyStr) ) then
    UpdateSequence(sGenerator, sTabela, sCampoCodigo, sWhr);
end;

procedure TfrmGrPadraoCadastro.dbgDadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Impede a exclusão de um registro em um DBGRID através das teclas CTRL+DEL
  if (Shift = [ssCtrl]) and (Key = 46) Then
    Key := 0;
end;

procedure TfrmGrPadraoCadastro.ClearFieldEmptyStr;
var
  I : Integer;
begin

  for I := 0 to IbDtstTabela.Fields.Count - 1 do
    if ( IbDtstTabela.Fields[I].Required ) then
      if ( Trim(IbDtstTabela.Fields[I].AsString) = EmptyStr ) then
        IbDtstTabela.Fields[I].Clear;
        
end;

procedure TfrmGrPadraoCadastro.IbDtstTabelaUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TIBUpdateAction);
begin
  Case UpdateKind of
    ukModify:
      ShowError('Erro ao tentar gravar atualização do registro.' + #13#13 + E.Message);

    ukInsert:
      ShowError('Erro ao tentar gravar novo registro.' + #13#13 + E.Message);
      
    ukDelete:
      ShowError('Erro ao tentar gravar excluir registro.' + #13#13 + E.Message);
  end;
end;

procedure TfrmGrPadraoCadastro.CarregarControleAcesso;
var
  I : Integer;
begin
{$IFDEF DGE}
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TEvUserAccess then
    begin
      RegistrarControleAcesso(Self, TEvUserAccess(Components[I]));
      GetControleAcesso(Self, TEvUserAccess(Components[I]));
    end;
{$ENDIF}
end;

procedure TfrmGrPadraoCadastro.SetVariablesDefault(
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
      frReport.ReportOptions.Author := GetUserApp;

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
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_USER, GetUserApp);

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

procedure TfrmGrPadraoCadastro.dbgDadosKeyPressENTER(Sender: TObject;
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

procedure TfrmGrPadraoCadastro.dbgDadosKeyPressNO_ENTER(Sender: TObject;
  var Key: Char);
begin
  if ( Key in ['0'..'9', ' ', 'a'..'z', 'A'..'Z'] ) then
  begin
    edtFiltrar.Text := Trim(Key);
    edtFiltrar.SetFocus;
    edtFiltrar.SelStart := Length(edtFiltrar.Text);
  end;
end;

procedure TfrmGrPadraoCadastro.RegistrarRotinaSistema;
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

function TfrmGrPadraoCadastro.GetRotinaEditarID: String;
begin
  Result := GetRotinaInternaID(btbtnAlterar);
end;

function TfrmGrPadraoCadastro.GetRotinaExcluirID: String;
begin
  Result := GetRotinaInternaID(btbtnExcluir);
end;

function TfrmGrPadraoCadastro.GetRotinaImprimirID: String;
begin
  Result := GetRotinaInternaID(btbtnLista);
end;

function TfrmGrPadraoCadastro.GetRotinaInserirID: String;
begin
  Result := GetRotinaInternaID(btbtnIncluir);
end;

function TfrmGrPadraoCadastro.GetRotinaPesquisarID: String;
begin
  Result := GetRotinaInternaID(btnFiltrar);
end;

function TfrmGrPadraoCadastro.GetPermissaoRotinaInterna(
  const Sender: TObject; const Alertar : Boolean = FALSE): Boolean;
var
  sRotinaInternaID : String;
begin
  sRotinaInternaID := GetRotinaInternaID(Sender);

  if Trim(sRotinaInternaID) = EmptyStr then
    Result := True
  else
    Result := GetPermissaoRotinaSistema(sRotinaInternaID, Alertar);
end;

procedure TfrmGrPadraoCadastro.btbtnListaClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;
end;

function TfrmGrPadraoCadastro.GetRotinaInternaID(const Sender : TObject): String;
var
  sComplemento : String;
begin
  sComplemento := StringOfChar('0', ROTINA_LENGTH_ID);

  if ( Trim(RotinaID) = EmptyStr ) then
    Result := EmptyStr
  else
    Result := Copy(Copy(RotinaID, 1, 6) + FormatFloat('00', TComponent(Sender).Tag) + sComplemento, 1, ROTINA_LENGTH_ID);
end;

function TfrmGrPadraoCadastro.GetCampoCodigoLimpo: String;
begin
  if ( pos('.', CampoCodigo) > 0 ) then
    Result := Copy(CampoCodigo, pos('.', CampoCodigo) + 1, Length(CampoCodigo))
  else
    Result := Trim(CampoCodigo);
end;

end.
