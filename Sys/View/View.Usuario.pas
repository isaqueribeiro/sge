unit View.Usuario;

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
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsDefaultPainters,
  dxSkinsCore,

  UObserverInterface,
  UConstantesDGE,
  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela,
  SGE.Controller.Impressao.AutorizacaoCompra,

  IdCoder,
  IdCoder3to4,
  IdCoderMIME,
  IdBaseComponent,

  UGrPadraoCadastro, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet, IBX.IBCustomDataSet, IBX.IBUpdateSQL;

type
  TViewUsuario = class(TViewPadraoCadastro)
    lblLogin: TLabel;
    dbLogin: TDBEdit;
    lblSenha: TLabel;
    dbSenha: TDBEdit;
    dbAlterarSenha: TDBCheckBox;
    GrpBxDadosGerais: TGroupBox;
    lblNomeCompleto: TLabel;
    lblFuncao: TLabel;
    dbNomeCompleto: TDBEdit;
    dbUsuarioAtivo: TDBCheckBox;
    dbFuncao: TDBLookupComboBox;
    DtsFuncao: TDataSource;
    Bevel5: TBevel;
    DtsVendedor: TDataSource;
    dtsTipoAlteraValor: TDataSource;
    fdQryTipoAlteraValor: TFDQuery;
    fdQryVendedor: TFDQuery;
    fdQryFuncao: TFDQuery;
    pgcParametros: TPageControl;
    tbsVendas: TTabSheet;
    tbsControleInterno: TTabSheet;
    GrpBxParametrosAlmox: TGroupBox;
    dbAlmoxManifestoAuto: TDBCheckBox;
    GrpBxParametrosVenda: TGroupBox;
    lblPercentualDesc: TLabel;
    lblVendedor: TLabel;
    dbPercentualDesc: TDBEdit;
    dbAlterarValorVendaItem: TDBCheckBox;
    dbVendedor: TDBLookupComboBox;
    dbTipoAlteraValorVendaItem: TDBLookupComboBox;    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbTipoAlteraValorVendaItemClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FControllerPerfil : IControllerCustom;
    function GetLoginExiste(const Login : String) : Boolean;
  public
    { Public declarations }
  end;

  function SelecionarUsuarioRequisitante(const AOnwer : TComponent; var Login, Nome : String) : Boolean;

  function EncriptSenha(const Value, Key : String) : String;
  function DecriptarSenha(const Value, Key : String) : String;
  function GetSenhaFormatada(const Value : String; const WithKey : Boolean) : String;

(*
  Tabelas:
  - TBUSERS
  - TBFUNCAO
  - TBVENDEDOR

  Views:
  - VW_TIPO_ALTERA_VALOR_VENDA

  Procedures:

*)

implementation

uses
  UDMBusiness,
  UDMRecursos,
  UConstantesDGE,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper;

{$R *.dfm}

function SelecionarUsuarioRequisitante(const AOnwer : TComponent; var Login, Nome : String) : Boolean;
var
  AForm : TViewUsuario;
begin
  AForm := TViewUsuario.Create(AOnwer);
  try
    with AForm do
    begin
      dbgDados.Columns[1].Visible := False; // Login

      btbtnIncluir.Visible  := False;
      btbtnAlterar.Visible  := False;
      btbtnExcluir.Visible  := False;
      btbtnCancelar.Visible := False;
      btbtnSalvar.Visible   := False;

      btbtnSelecionar.Visible := True;
      AbrirTabelaAuto         := True;

      tbsCadastro.TabVisible  := False;

      WhereAdditional := '(u.ativo = 1)';

      FController.DAO.ClearWhere;
      FController.DAO.Where(WhereAdditional);
      FController.DAO.Open;

      Result := AForm.SelecionarRegistro(Login, Nome, AForm.WhereAdditional);
    end;
  finally
    FreeAndNil(AForm);
  end;
end;

function EncriptSenha(const Value, Key : String) : String;
var
  sKeyChar    ,
  sStrEncode  ,
  sResult     : String;
  iTamanhoStr ,
  iPosicaoKey : Integer;
  IdEncoder   : TIdEncoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  try
    sKeyChar    := IdEncoder.EncodeString(Key);
    sStrEncode  := IdEncoder.EncodeString(Value);
    iTamanhoStr := Length(sStrEncode);

    iPosicaoKey := -1;
    while (iPosicaoKey < 0) do
      iPosicaoKey := Random(iTamanhoStr);

    sResult := Copy(sStrEncode, 1, iPosicaoKey) + sKeyChar + Copy(sStrEncode, iPosicaoKey + 1, iTamanhoStr);

    Result := sResult;
  finally
    IdEncoder.Free;
  end;
end;

function DecriptarSenha(const Value, Key : String) : String;
var
  sKeyChar   ,
  sStrEncode : String;
  IdEncoder  : TIdEncoderMIME;
  IdDecoder  : TIdDecoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  IdDecoder := TIdDecoderMIME.Create(nil);
  try
    sKeyChar   := IdEncoder.EncodeString(Key);
    sStrEncode := Value;

    if (Pos(sKeyChar, sStrEncode) = 0)  then
      raise Exception.Create('Criptografia corrompida!!!')
    else
      sStrEncode := StringReplace(sStrEncode, sKeyChar, EmptyStr, [rfReplaceAll]);

    Result := IdDecoder.DecodeString(sStrEncode);
  finally
    IdEncoder.Free;
    IdDecoder.Free;
  end;
end;

function GetSenhaFormatada(const Value : String; const WithKey : Boolean) : String;
begin
  if WithKey then
    Result := USER_PASSWD_ENCRIPT + Copy(EncriptSenha(Value, USER_PASSWD_KEY), 1, USER_PASSWD_LIMITE - 2)
  else
    Result := USER_PASSWD_ENCRIPT + Copy(EncriptSenha(Value, EmptyStr), 1, USER_PASSWD_LIMITE - 2);
end;

procedure TViewUsuario.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Usuario;
  FControllerPerfil := TControllerFactory.New.Perfil;

  inherited;
  RotinaID            := ROTINA_CAD_USUARIO_ID;
  ControlFirstEdit    := dbLogin;
  DisplayFormatCodigo := '000';

  NomeTabela     := 'TBUSERS';
  CampoCodigo    := 'u.coigo';
  CampoDescricao := 'u.nome';
  CampoOrdenacao := 'u.nomecompleto';
  CampoCadastroAtivo := 'u.ativo';

  Tabela
    .Display('COD',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('NOME', 'Login', True)
    .Display('NOMECOMPLETO', 'Primeiro e Último Nome', True)
    .Display('CODFUNCAO', 'Perfil de Acesso', True)
    .Display('PERFIL',    'Perfil de Acesso', False)
    .Display('LIMIDESC',  '% Desconto', ',0.00', TAlignment.taRightJustify, False);

  AbrirTabelaAuto := True;





  fdQryFuncao.Close;
  fdQryVendedor.Close;

  if ( GetUserFunctionID = FUNCTION_USER_ID_SYSTEM_ADM ) then
    fdQryFuncao.ParamByName('perfil').AsInteger := 99
  else
  begin
    WhereAdditional := '(u.codfuncao <> ' + IntToStr(FUNCTION_USER_ID_SYSTEM_ADM) + ')';
    fdQryFuncao.ParamByName('perfil').AsInteger := FUNCTION_USER_ID_SYSTEM_ADM;
  end;

  CarregarLista(fdQryFuncao);
  CarregarLista(fdQryVendedor);
  CarregarLista(fdQryTipoAlteraValor);



  dbAlterarValorVendaItem.Visible    := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  dbTipoAlteraValorVendaItem.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]);

  pgcParametros.ActivePage      := tbsVendas;
  tbsControleInterno.TabVisible := (gSistema.Codigo = SISTEMA_GESTAO_IND);
end;

procedure TViewUsuario.DtSrcTabelaDataChange(Sender: TObject; Field: TField);
begin
  if ( Field = DtSrcTabela.DataSet.FieldByName('PERM_ALTERAR_VALOR_VENDA') ) then
    dbTipoAlteraValorVendaItem.Enabled := (DtSrcTabela.DataSet.FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1);
end;

procedure TViewUsuario.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( DtSrcTabela.DataSet.State = dsInsert ) then
  begin
    dbLogin.ReadOnly := False;
    dbLogin.Color    := dbSenha.Color;
  end
  else
  if ( DtSrcTabela.DataSet.State = dsEdit ) then
  begin
    dbLogin.ReadOnly := True;
    dbLogin.Color    := dbCodigo.Color;
  end;
end;

procedure TViewUsuario.fdQryTabelaBeforePost(DataSet: TDataSet);
var
  sSenha : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( Trim(FieldByName('SENHA').AsString) <> EmptyStr ) then
      if ( Copy(FieldByName('SENHA').AsString, 1, 2) <> USER_PASSWD_ENCRIPT ) then
      begin
        sSenha := Trim(FieldByName('SENHA').AsString);
        FieldByName('SENHA').AsString := GetSenhaFormatada(sSenha, False);
      end;

    if (FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 0) then
      FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger := 0;

    if (FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1) and (FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger = 0) then
      FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger := 1;

    inherited;
  end;
end;

procedure TViewUsuario.fdQryTabelaCalcFields(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
    FieldByName('ATV').AsString := IfThen(FieldByName('ATIVO').AsInteger = 1, 'X', '');
end;

function TViewUsuario.GetLoginExiste(const Login: String): Boolean;
begin
  if ( Trim(Login) = EmptyStr ) then
    Result := False
  else
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select nome as login from TBUSERS where nome = ' + QuotedStr(Trim(Login)));
      Open;

      Result := (RecordCount > 0);

      Close;
    end;
end;

procedure TViewUsuario.btbtnSalvarClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State = dsInsert ) then
      if GetLoginExiste(FieldByName('NOME').AsString) then
      begin
        ShowWarning('Login informado já existe!');
        Exit;
      end;

    if ( (FieldByName('LIMIDESC').AsCurrency < 0) or (FieldByName('LIMIDESC').AsCurrency > 100) ) then
    begin
      ShowWarning('O Percentual de desconto informado é inválido!');
    end
    else
    begin

      FieldByName('PERFIL').AsString := dbFuncao.Text;
      inherited;

    end;
  end;
end;

procedure TViewUsuario.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    dbTipoAlteraValorVendaItem.Enabled := (FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1);
end;

procedure TViewUsuario.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if ( DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := clRed;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TViewUsuario.dbTipoAlteraValorVendaItemClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
    dbTipoAlteraValorVendaItem.Enabled := (FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1);
end;

initialization
  FormFunction.RegisterForm('ViewUsuario', TViewUsuario);

end.

