unit UGrUsuario;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBQuery, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxButtons, IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent,
  dxBarBuiltInMenu, cxPC, IBX.IBTable, cxControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, System.ImageList;

type
  TfrmGrUsuario = class(TfrmGrPadraoCadastro)
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
    dbTipoAlteraValorVendaItem: TDBLookupComboBox;
    fdQryTabelaNOME: TStringField;
    fdQryTabelaSENHA: TStringField;
    fdQryTabelaNOMECOMPLETO: TStringField;
    fdQryTabelaCODFUNCAO: TSmallintField;
    fdQryTabelaLIMIDESC: TCurrencyField;
    fdQryTabelaATIVO: TSmallintField;
    fdQryTabelaALTERAR_SENHA: TSmallintField;
    fdQryTabelaPERM_ALTERAR_VALOR_VENDA: TSmallintField;
    fdQryTabelaTIPO_ALTERAR_VALOR_VENDA: TSmallintField;
    fdQryTabelaVENDEDOR: TIntegerField;
    fdQryTabelaALMOX_MANIFESTO_AUTOMATICO: TSmallintField;
    fdQryTabelaPERFIL: TStringField;
    fdQryTabelaATV: TStringField;    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbTipoAlteraValorVendaItemClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaCalcFields(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    function GetLoginExiste(const Login : String) : Boolean;
  public
    { Public declarations }
  end;

const
  USER_PASSWD_LIMITE  = 16;
  USER_PASSWD_ENCRIPT = 'x|';
  USER_PASSWD_DEFAULT = 'ABC123';
  USER_PASSWD_KEY     = 'ADONAI';


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
  UConstantesDGE, UDMBusiness;

{$R *.dfm}

function SelecionarUsuarioRequisitante(const AOnwer : TComponent; var Login, Nome : String) : Boolean;
var
  AForm : TfrmGrUsuario;
begin
  AForm := TfrmGrUsuario.Create(AOnwer);
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

      Result := (AForm.ShowModal = mrOk);
      if Result then
      begin
        Login := DtSrcTabela.DataSet.FieldByName('NOME').AsString;
        Nome  := DtSrcTabela.DataSet.FieldByName('NOMECOMPLETO').AsString;
      end;
    end;
  finally
    AForm.Free;
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

procedure TfrmGrUsuario.FormCreate(Sender: TObject);
begin
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

  inherited;

  RotinaID         := ROTINA_CAD_USUARIO_ID;
  ControlFirstEdit := dbLogin;

  DisplayFormatCodigo := EmptyStr;

  NomeTabela     := 'TBUSERS';
  CampoCodigo    := 'CODFUNCAO';
  CampoDescricao := 'nome';
  CampoOrdenacao := 'nomecompleto';

  dbAlterarValorVendaItem.Visible    := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  dbTipoAlteraValorVendaItem.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]);

  pgcParametros.ActivePage      := tbsVendas;
  tbsControleInterno.TabVisible := (gSistema.Codigo = SISTEMA_GESTAO_IND);
end;

procedure TfrmGrUsuario.DtSrcTabelaDataChange(Sender: TObject; Field: TField);
begin
  if ( Field = DtSrcTabela.DataSet.FieldByName('PERM_ALTERAR_VALOR_VENDA') ) then
    dbTipoAlteraValorVendaItem.Enabled := (DtSrcTabela.DataSet.FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1);
end;

procedure TfrmGrUsuario.DtSrcTabelaStateChange(Sender: TObject);
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

procedure TfrmGrUsuario.fdQryTabelaBeforePost(DataSet: TDataSet);
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

procedure TfrmGrUsuario.fdQryTabelaCalcFields(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
    FieldByName('ATV').AsString := IfThen(FieldByName('ATIVO').AsInteger = 1, 'X', '');
end;

procedure TfrmGrUsuario.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('ALTERAR_SENHA').AsInteger              := 1; // Sim
    FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger   := 0; // Não
    FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger   := 0; // Nenhum
    FieldByName('ATIVO').AsInteger                      := 1; // Sim
    FieldByName('LIMIDESC').AsCurrency                  := 0.0;
    FieldByName('SENHA').AsString                       := USER_PASSWD_DEFAULT;
    FieldByName('ALMOX_MANIFESTO_AUTOMATICO').AsInteger := 0; // Não
    FieldByName('NOME').Clear;
    FieldByName('NOMECOMPLETO').Clear;
  end;
end;

function TfrmGrUsuario.GetLoginExiste(const Login: String): Boolean;
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

procedure TfrmGrUsuario.btbtnSalvarClick(Sender: TObject);
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

procedure TfrmGrUsuario.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    dbTipoAlteraValorVendaItem.Enabled := (FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1);
end;

procedure TfrmGrUsuario.dbgDadosDrawColumnCell(Sender: TObject;
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

procedure TfrmGrUsuario.dbTipoAlteraValorVendaItemClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
    dbTipoAlteraValorVendaItem.Enabled := (FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1);
end;

initialization
  FormFunction.RegisterForm('frmGrUsuario', TfrmGrUsuario);

end.

