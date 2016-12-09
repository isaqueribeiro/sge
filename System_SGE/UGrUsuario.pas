unit UGrUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBQuery, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxButtons, IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent,
  dxBarBuiltInMenu, cxPC, IBX.IBTable, cxControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGrUsuario = class(TfrmGrPadraoCadastro)
    lblLogin: TLabel;
    dbLogin: TDBEdit;
    IbDtstTabelaNOME: TIBStringField;
    IbDtstTabelaSENHA: TIBStringField;
    IbDtstTabelaNOMECOMPLETO: TIBStringField;
    IbDtstTabelaCODFUNCAO: TSmallintField;
    IbDtstTabelaLIMIDESC: TIBBCDField;
    IbDtstTabelaATIVO: TSmallintField;
    IbDtstTabelaPERM_ALTERAR_VALOR_VENDA: TSmallintField;
    IbDtstTabelaPERFIL: TIBStringField;
    IbDtstTabelaALTERAR_SENHA: TSmallintField;
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
    IbDtstTabelaVENDEDOR: TIntegerField;
    DtsVendedor: TDataSource;
    IbDtstTabelaATV: TStringField;
    dtsTipoAlteraValor: TDataSource;
    IbDtstTabelaTIPO_ALTERAR_VALOR_VENDA: TSmallintField;
    IbDtstTabelaALMOX_MANIFESTO_AUTOMATICO: TSmallintField;
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
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IbDtstTabelaCalcFields(DataSet: TDataSet);
    procedure dbTipoAlteraValorVendaItemClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
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
        Login := IbDtstTabelaNOME.AsString;
        Nome  := IbDtstTabelaNOMECOMPLETO.AsString;
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

  dbAlterarValorVendaItem.Visible    := (gSistema.Codigo = SISTEMA_GESTAO_COM);
  dbTipoAlteraValorVendaItem.Visible := (gSistema.Codigo = SISTEMA_GESTAO_COM);

  pgcParametros.ActivePage      := tbsVendas;
  tbsControleInterno.TabVisible := (gSistema.Codigo = SISTEMA_GESTAO_IND);
end;

procedure TfrmGrUsuario.DtSrcTabelaDataChange(Sender: TObject; Field: TField);
begin
  if ( Field = IbDtstTabelaPERM_ALTERAR_VALOR_VENDA ) then
    dbTipoAlteraValorVendaItem.Enabled := (IbDtstTabelaPERM_ALTERAR_VALOR_VENDA.AsInteger = 1);
end;

procedure TfrmGrUsuario.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( IbDtstTabela.State = dsInsert ) then
  begin
    dbLogin.ReadOnly := False;
    dbLogin.Color    := dbSenha.Color;
  end
  else
  if ( IbDtstTabela.State = dsEdit ) then
  begin
    dbLogin.ReadOnly := True;
    dbLogin.Color    := dbCodigo.Color;
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
  if ( IbDtstTabela.State = dsInsert ) then
    if GetLoginExiste(IbDtstTabelaNOME.AsString) then
    begin
      ShowWarning('Login informado já existe!');
      Exit;
    end;

  if ( (IbDtstTabelaLIMIDESC.AsCurrency < 0) or (IbDtstTabelaLIMIDESC.AsCurrency > 100) ) then
  begin
    ShowWarning('O Percentual de desconto informado é inválido!');
  end
  else
  begin

    IbDtstTabelaPERFIL.AsString := dbFuncao.Text;
    inherited;

  end;
end;

procedure TfrmGrUsuario.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaALTERAR_SENHA.AsInteger              := 1; // Sim
  IbDtstTabelaPERM_ALTERAR_VALOR_VENDA.AsInteger   := 0; // Não
  IbDtstTabelaTIPO_ALTERAR_VALOR_VENDA.AsInteger   := 0; // Nenhum
  IbDtstTabelaATIVO.AsInteger                      := 1; // Sim
  IbDtstTabelaLIMIDESC.AsCurrency                  := 0.0;
  IbDtstTabelaSENHA.AsString                       := USER_PASSWD_DEFAULT;
  IbDtstTabelaALMOX_MANIFESTO_AUTOMATICO.AsInteger := 0; // Não
  IbDtstTabelaNOME.Clear;
  IbDtstTabelaNOMECOMPLETO.Clear;
end;

procedure TfrmGrUsuario.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  dbTipoAlteraValorVendaItem.Enabled := (IbDtstTabelaPERM_ALTERAR_VALOR_VENDA.AsInteger = 1);
end;

procedure TfrmGrUsuario.IbDtstTabelaBeforePost(DataSet: TDataSet);
var
  sSenha : String;
begin
  if ( Trim(IbDtstTabelaSENHA.AsString) <> EmptyStr ) then
    if ( Copy(IbDtstTabelaSENHA.AsString, 1, 2) <> USER_PASSWD_ENCRIPT ) then
    begin
      sSenha := Trim(IbDtstTabelaSENHA.AsString);
      IbDtstTabelaSENHA.AsString := GetSenhaFormatada(sSenha, False);
    end;

  if (IbDtstTabelaPERM_ALTERAR_VALOR_VENDA.AsInteger = 0) then
    IbDtstTabelaTIPO_ALTERAR_VALOR_VENDA.AsInteger := 0;

  if (IbDtstTabelaPERM_ALTERAR_VALOR_VENDA.AsInteger = 1) and (IbDtstTabelaTIPO_ALTERAR_VALOR_VENDA.AsInteger = 0) then
    IbDtstTabelaTIPO_ALTERAR_VALOR_VENDA.AsInteger := 1;

  inherited;
end;

procedure TfrmGrUsuario.IbDtstTabelaCalcFields(DataSet: TDataSet);
begin
  IbDtstTabelaATV.AsString := IfThen(IbDtstTabelaATIVO.AsInteger = 1, 'X', '');
end;

procedure TfrmGrUsuario.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if ( IbDtstTabelaATIVO.AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := clRed;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGrUsuario.dbTipoAlteraValorVendaItemClick(Sender: TObject);
begin
  dbTipoAlteraValorVendaItem.Enabled := (IbDtstTabelaPERM_ALTERAR_VALOR_VENDA.AsInteger = 1);
end;

initialization
  FormFunction.RegisterForm('frmGrUsuario', TfrmGrUsuario);

end.

