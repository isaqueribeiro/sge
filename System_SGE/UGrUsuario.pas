unit UGrUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBQuery, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxButtons, IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent,
  dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver;

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
    QryFuncao: TIBQuery;
    dbFuncao: TDBLookupComboBox;
    DtsFuncao: TDataSource;
    Bevel5: TBevel;
    GrpBxParametros: TGroupBox;
    lblPercentualDesc: TLabel;
    dbPercentualDesc: TDBEdit;
    dbAlterarValorVendaItem: TDBCheckBox;
    IbDtstTabelaVENDEDOR: TIntegerField;
    lblVendedor: TLabel;
    dbVendedor: TDBLookupComboBox;
    QryVendedor: TIBQuery;
    DtsVendedor: TDataSource;
    IbDtstTabelaATV: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IbDtstTabelaCalcFields(DataSet: TDataSet);
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
  QryFuncao.Close;
  QryVendedor.Close;

  if ( GetUserFunctionID = FUNCTION_USER_ID_SYSTEM_ADM ) then
    QryFuncao.ParamByName('perfil').AsInteger := 99
  else
  begin
    WhereAdditional := '(u.codfuncao <> ' + IntToStr(FUNCTION_USER_ID_SYSTEM_ADM) + ')';
    QryFuncao.ParamByName('perfil').AsInteger := FUNCTION_USER_ID_SYSTEM_ADM;
  end;

  QryFuncao.Open;
  QryVendedor.Open;

  inherited;

  RotinaID         := ROTINA_CAD_USUARIO_ID;
  ControlFirstEdit := dbLogin;

  DisplayFormatCodigo := EmptyStr;

  NomeTabela     := 'TBUSERS';
  CampoCodigo    := 'CODFUNCAO';
  CampoDescricao := 'nome';
  CampoOrdenacao := 'nomecompleto';
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
    with DMBusiness, qryBusca do
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
  IbDtstTabelaALTERAR_SENHA.AsInteger            := 1; // Sim
  IbDtstTabelaPERM_ALTERAR_VALOR_VENDA.AsInteger := 0; // Não
  IbDtstTabelaATIVO.AsInteger                    := 1; // Sim
  IbDtstTabelaLIMIDESC.AsCurrency                := 0.0;
  IbDtstTabelaSENHA.AsString                     := USER_PASSWD_DEFAULT;
  IbDtstTabelaNOME.Clear;
  IbDtstTabelaNOMECOMPLETO.Clear;
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

initialization
  FormFunction.RegisterForm('frmGrUsuario', TfrmGrUsuario);

end.
