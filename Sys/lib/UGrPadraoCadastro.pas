unit UGrPadraoCadastro;

interface

uses
  UGrPadrao,
  Interacao.Versao,
  Interacao.Tabela,
  Controller.Versao,

  System.ImageList,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, IBUpdateSQL, ImgList, TypInfo,
  DBClient, frxClass, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinsDefaultPainters;

type
  TfrmGrPadraoCadastro = class(TfrmGrPadrao)
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
    IbDtstTabela: TIBDataSet;
    DtSrcTabela: TDataSource;
    GrpBxDadosNominais: TGroupBox;
    Bevel8: TBevel;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    IbUpdTabela: TIBUpdateSQL;
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
    fdQryTabela: TFDQuery;
    fdUpdTabela: TFDUpdateSQL;
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
    procedure FormActivate(Sender: TObject);
    procedure fdQryTabelaUpdateError(ASender: TDataSet; AException: EFDException; ARow: TFDDatSRow;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FTabela : ITabela;

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
    procedure CarregarControleAcesso;

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
    procedure FecharAbrirTabela(const Tabela : TIBDataSet; const Vazia : Boolean = FALSE); overload;
    procedure FecharAbrirTabela(const Tabela : TFDQuery; const Vazia : Boolean = FALSE); overload;
    procedure GerarSequencial(const pDataSet : TIBDataSet; const pCampo : String; var pSequencial : Integer);

    function SelecionarRegistro(var Codigo : Integer; var Descricao : String; const FiltroAdicional : String = '') : Boolean; overload;
    function SelecionarRegistro(var Codigo, Descricao : String; const FiltroAdicional : String = '') : Boolean; overload;
    function GetCampoCodigoLimpo : String;
    function GetCampoDescricaoLimpo : String;
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
    Inser��o da property "LiberarUso" que corresponder� a libera��o de uso da
    aplica��o de acordo com a pol�tica da Licen�a de Uso do Sistema.
*)

procedure TfrmGrPadraoCadastro.btbtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGrPadraoCadastro.FormCreate(Sender: TObject);
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
  AbrirTabelaAuto := False;    //True; alterado em 11-01-2013 Dorivaldo

  IsClearFieldEmptyStr := True;

  if ( IbDtstTabela.Database = nil ) then
    IbDtstTabela.Database := DMBusiness.ibdtbsBusiness;

  sSQL := TStringList.Create;
  if (DtSrcTabela.DataSet = IbDtstTabela) then
    sSQL.AddStrings( IbDtstTabela.SelectSQL )
  else
    sSQL.AddStrings( fdQryTabela.SQL );

  dbCodigo.TabStop    := not dbCodigo.ReadOnly;
  pgcGuias.ActivePage := tbsTabela;

  ControlFirstEdit := nil;

  CarregarControleAcesso;

  if ( fdQryTabela.Connection = nil ) then
  begin
    fdQryTabela.Connection  := DMBusiness.fdConexao;
    fdQryTabela.Transaction := DMBusiness.fdTransacao;
    fdUpdTabela.Connection  := DMBusiness.fdConexao;
  end;

  // Remover a obrigatoriedade de informar c�digo quando o GENERATOR � respons�vel por sua gera��o
  if (DtSrcTabela.DataSet = IbDtstTabela) then
  begin
    with IbDtstTabela.GeneratorField do
    begin
      if (Generator <> EmptyStr) and (Field <> EmptyStr) then
        IbDtstTabela.FieldByName(Field).Required := False;
    end;
  end
  else
  begin
    with fdQryTabela.UpdateOptions do
    begin
      if (GeneratorName <> EmptyStr) and (KeyFields <> EmptyStr) then
        if (Pos(';', KeyFields) = 0) then
          fdQryTabela.FieldByName(KeyFields).Required := False
        else
          ;
    end;

    FTabela := TTabelaController.New.Tabela(fdQryTabela as TFDDataSet);
  end;
end;

procedure TfrmGrPadraoCadastro.dbgDadosDrawColumnCell(Sender: TObject;
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
  // -- Label
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

procedure TfrmGrPadraoCadastro.dbgDadosKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmGrPadraoCadastro.dbgDadosDblClick(Sender: TObject);
begin
  if tbsCadastro.TabVisible then
  begin
    pgcGuias.ActivePage := tbsCadastro;
    if Assigned(pgcGuias.OnChange) then
      pgcGuias.OnChange(pgcGuias);
  end;
end;

procedure TfrmGrPadraoCadastro.DisableCadastro;
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

procedure TfrmGrPadraoCadastro.DtSrcTabelaStateChange(Sender: TObject);
begin
//  dbgDados.Enabled    := not (IbDtstTabela.State in [dsEdit, dsInsert]);
//  grpBxFiltro.Enabled := not (IbDtstTabela.State in [dsEdit, dsInsert]);
//
//  btbtnIncluir.Enabled    := (IbDtstTabela.State in [dsBrowse]) and fLiberarUso;
//  btbtnAlterar.Enabled    := (IbDtstTabela.State in [dsBrowse]) and (not IbDtstTabela.IsEmpty) and fLiberarUso;
//  btbtnExcluir.Enabled    := (IbDtstTabela.State in [dsBrowse]) and (not IbDtstTabela.IsEmpty) and fLiberarUso;
//  btbtnCancelar.Enabled   := (IbDtstTabela.State in [dsEdit, dsInsert]);
//  btbtnSalvar.Enabled     := (IbDtstTabela.State in [dsEdit, dsInsert]);
//  btbtnLista.Enabled      := (IbDtstTabela.State in [dsBrowse]);
//  btbtnFechar.Enabled     := (IbDtstTabela.State in [dsBrowse]) or (not IbDtstTabela.Active);
//  btbtnSelecionar.Enabled := (IbDtstTabela.State in [dsBrowse]) and (not IbDtstTabela.IsEmpty);
//
//  DtSrcTabela.AutoEdit   := (IbDtstTabela.State in [dsEdit, dsInsert]);
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

procedure TfrmGrPadraoCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ( DtSrcTabela.DataSet.Active ) then
    if ( not btbtnFechar.Enabled ) then
    begin
      CanClose := False;
      ShowWarning('Existe registro em edi��o');
    end;
end;

procedure TfrmGrPadraoCadastro.btbtnIncluirClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not DtSrcTabela.DataSet.Active ) then
    if (DtSrcTabela.DataSet is TIBDataSet) then
      FecharAbrirTabela(IbDtstTabela, True)
    else
    if (DtSrcTabela.DataSet is TFDQuery) then
      FecharAbrirTabela(fdQryTabela, True);

  if ( (pgcGuias.ActivePage = tbsTabela) and (Sender <> btbtnIncluir) and (Sender <> btbtnAlterar) and edtFiltrar.Visible and edtFiltrar.Enabled ) then
    edtFiltrar.SetFocus;

  DtSrcTabela.DataSet.Append;
end;

procedure TfrmGrPadraoCadastro.btbtnAlterarClick(Sender: TObject);
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

procedure TfrmGrPadraoCadastro.btbtnExcluirClick(Sender: TObject);
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
      if (DtSrcTabela.DataSet = IbDtstTabela) then
      begin
        IbDtstTabela.Delete;
        IbDtstTabela.ApplyUpdates;

        CommitTransaction;
      end
      else
      begin
        fdQryTabela.Delete;
        fdQryTabela.ApplyUpdates(0);
        fdQryTabela.CommitUpdates;

        CommitTransaction;
        fdQryTabela.RefreshRecord();
      end;

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

  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ShowConfirmation('Cancelar', 'Deseja cancelar a inser��o/edi��o do registro?') then
      DtSrcTabela.DataSet.Cancel;
end;

procedure TfrmGrPadraoCadastro.btbtnSalvarClick(Sender: TObject);
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
        if ShowConfirmation('Salvar', 'Deseja salvar a inser��o/edi��o do registro?') then
        begin
          if (Trim(GetCampoDescricaoLimpo) <> EmptyStr) then
            if Assigned( DtSrcTabela.DataSet.Fields.FindField(GetCampoDescricaoLimpo) ) then
              DtSrcTabela.DataSet.FieldByName(GetCampoDescricaoLimpo).AsString := Trim(DtSrcTabela.DataSet.FieldByName(GetCampoDescricaoLimpo).AsString);

          if Assigned( DtSrcTabela.DataSet.Fields.FindField(CAMPO_USUARIO) ) then
            DtSrcTabela.DataSet.FieldByName(CAMPO_USUARIO).AsString := gUsuarioLogado.Login;

          if (DtSrcTabela.DataSet = IbDtstTabela) then
          begin
            IbDtstTabela.Post;
            IbDtstTabela.ApplyUpdates;

            CommitTransaction;
          end
          else
          begin
            fdQryTabela.Post;
            fdQryTabela.ApplyUpdates(0);
            fdQryTabela.CommitUpdates;

            CommitTransaction;

            if ExecutarRefreshRecord then
              fdQryTabela.RefreshRecord();
          end;
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

procedure TfrmGrPadraoCadastro.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmGrPadraoCadastro.btnFiltrarClick(Sender: TObject);
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

procedure TfrmGrPadraoCadastro.edtFiltrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = 13 ) then
    btnFiltrar.Click;
end;

function TfrmGrPadraoCadastro.ExecutarRefreshRecord: Boolean;
var
  aScriptSelect  ,
  aScriptFetchRow,
  aRetorno       : Boolean;
begin
  aRetorno := False;
  try
    // Buscar jun��o entre tabelas nos scripts de consulta dos objetos
    aScriptSelect   := (Pos('JOIN', AnsiUpperCase(fdQryTabela.SQL.Text)) > 0);
    aScriptFetchRow := (Pos('JOIN', AnsiUpperCase(fdUpdTabela.FetchRowSQL.Text)) > 0);

    aRetorno := (aScriptSelect = aScriptFetchRow);
  finally
    Result := aRetorno;
  end;
end;

procedure TfrmGrPadraoCadastro.fdQryTabelaNewRecord(DataSet: TDataSet);
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

procedure TfrmGrPadraoCadastro.fdQryTabelaUpdateError(ASender: TDataSet; AException: EFDException;
  ARow: TFDDatSRow; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction);
begin
  Case ARequest of
    arUpdate:
      ShowError('Erro ao tentar gravar atualiza��o do registro.' + #13#13 + AException.Message);

    arInsert:
      ShowError('Erro ao tentar gravar novo registro.' + #13#13 + AException.Message);

    arDelete:
      ShowError('Erro ao tentar gravar excluir registro.' + #13#13 + AException.Message);
  end;
end;

procedure TfrmGrPadraoCadastro.FiltarDados;
begin
  Screen.Cursor := crSQLWait;

  try

    try

      fOcorreuErro := False;
      if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
      begin
        ShowWarning('O nome do campo chave e/ou de descri��o n�o foram informados');
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
                ShowWarning('N�o existe registros na tabela para este tipo de pesquisa');

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
                ShowWarning('N�o existe registros na tabela para este tipo de pesquisa');

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

procedure TfrmGrPadraoCadastro.FecharAbrirTabela(const Tabela : TFDQuery; const Vazia : Boolean = FALSE);
begin
  with Tabela do
  begin
    Close;
    if ( Vazia ) then
      if ( Pos('where', LowerCase(SQL.Text)) = 0 ) then
        SQL.Add('where 1=0');
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
      ShowWarning('O nome do campo chave e/ou de descri��o n�o foram informados');
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

function TfrmGrPadraoCadastro.SelecionarRegistro(var Codigo, Descricao: String;
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
      ShowWarning('O nome do campo chave e/ou de descri��o n�o foram informados');
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

procedure TfrmGrPadraoCadastro.FormShow(Sender: TObject);
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

      // Inserir ORDER BY na script caso n�o exista
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

    // Testar se o valor do campo c�digo � do tipo num�rico
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

procedure TfrmGrPadraoCadastro.SetWhereAdditional(Value : String);
begin
  fWhereAdditional := Trim(Value);
end;

procedure TfrmGrPadraoCadastro.btbtnSelecionarClick(Sender: TObject);
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
        ShowWarning('O Cadastro selecionado n�o est� ativo!');
        Exit;
      end;
  end;

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

    // Gerar o c�digo com o GENERATOR imediatamente ao comando de APPEND no DataSet
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

procedure TfrmGrPadraoCadastro.dbgDadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Impede a exclus�o de um registro em um DBGRID atrav�s das teclas CTRL+DEL
  if (Shift = [ssCtrl]) and (Key = 46) Then
    Key := 0;
end;

procedure TfrmGrPadraoCadastro.ClearFieldEmptyStr;
var
  I : Integer;
begin

  if (DtSrcTabela.DataSet = IbDtstTabela) then
    for I := 0 to IbDtstTabela.Fields.Count - 1 do
    begin
      if (IbDtstTabela.Fields[I] is TStringField)     or
         (IbDtstTabela.Fields[I] is TMemoField)       or
         (IbDtstTabela.Fields[I] is TWideStringField) or
         (IbDtstTabela.Fields[I] is TWideMemoField) then
        IbDtstTabela.Fields[I].AsString := Trim(IbDtstTabela.Fields[I].AsString);

      if ( IbDtstTabela.Fields[I].Required ) then
        if ( Trim(IbDtstTabela.Fields[I].AsString) = EmptyStr ) then
          IbDtstTabela.Fields[I].Clear;
    end
  else
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

procedure TfrmGrPadraoCadastro.IbDtstTabelaUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TIBUpdateAction);
begin
  Case UpdateKind of
    ukModify:
      ShowError('Erro ao tentar gravar atualiza��o do registro.' + #13#13 + E.Message);

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

procedure TfrmGrPadraoCadastro.CarregarLista(const pDataSet: TDataSet);
begin
  if pDataSet.Active then
    pDataSet.Close;

  pDataSet.Open;

  pDataSet.Last;
  pDataSet.First;
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
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_SYSTEM, Application.Title + ' - vers�o ' + ver.FileVersion);
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

procedure TfrmGrPadraoCadastro.btbtnListaClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;
end;

procedure TfrmGrPadraoCadastro.GerarSequencial(const pDataSet: TIBDataSet;
  const pCampo: String; var pSequencial: Integer);
begin
  pSequencial := pDataSet.RecordCount + 1;

  if (pDataSet.RecordCount > 0) then
    if ( Trim(pCampo) <> EmptyStr ) then
      while pDataSet.Locate(pCampo, pSequencial, []) do
        pSequencial := pSequencial + 1;
end;

function TfrmGrPadraoCadastro.GetCampoCodigoLimpo: String;
begin
  if ( pos('.', CampoCodigo) > 0 ) then
    Result := Copy(CampoCodigo, pos('.', CampoCodigo) + 1, Length(CampoCodigo))
  else
    Result := Trim(CampoCodigo);
end;

function TfrmGrPadraoCadastro.GetCampoDescricaoLimpo: String;
begin
  if ( pos('.', CampoDescricao) > 0 ) then
    Result := Copy(CampoDescricao, pos('.', CampoDescricao) + 1, Length(CampoDescricao))
  else
    Result := Trim(CampoDescricao);
end;

procedure TfrmGrPadraoCadastro.pgcGuiasOnChange;
begin
  ;
end;

procedure TfrmGrPadraoCadastro.FormActivate(Sender: TObject);
begin
  inherited;
  SetEmpresaIDDefault( gUsuarioLogado.Empresa );
end;

function TfrmGrPadraoCadastro.GetManterDados: Boolean;
begin
  if ( Trim(RotinaID) = EmptyStr ) then
    Result := fManterDados
  else
    Result := fManterDados and (GetPermissaoRotinaInterna(btbtnIncluir, False) or GetPermissaoRotinaInterna(btbtnAlterar, False));
end;

procedure TfrmGrPadraoCadastro.SetManterDados(Value: Boolean);
begin
  fManterDados := Value;
end;

end.
