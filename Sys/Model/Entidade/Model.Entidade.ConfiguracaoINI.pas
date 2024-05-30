unit Model.Entidade.ConfiguracaoINI;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IniFiles;

type
  TConfiguracaoSecaoDefault = class
    private
      FCfopEntradaID : Integer;
      FCfopID    : Integer;
      FCidadeID  : Integer;
      FClienteID : Integer;
      FCondicaoPagtoID : Integer;
      FEmpresaID : String;
      FEstadoID  : Integer;
      FFormaPagtoID : Integer;
      FLicenseFile  : TFileName;
      FPaisID       : String;
      FVendedorID   : Integer;
      procedure SetCfopEntradaID(const Value: Integer);
      procedure SetCfopID(const Value: Integer);
      procedure SetCidadeID(const Value: Integer);
      procedure SetClienteID(const Value: Integer);
      procedure SetCondicaoPagtoID(const Value: Integer);
      procedure SetEmpresaID(const Value: String);
      procedure SetEstadoID(const Value: Integer);
      procedure SetFormaPagtoID(const Value: Integer);
      procedure SetLicenseFile(const Value: TFileName);
      procedure SetPaisID(const Value: String);
      procedure SetVendedorID(const Value: Integer);
    protected
      constructor Create;
    public
      destructor Destroy; override;

      property EmpresaID : String read FEmpresaID write SetEmpresaID;
      property CfopID    : Integer read FCfopID write SetCfopID;
      property CfopEntradaID : Integer read FCfopEntradaID write SetCfopEntradaID;
      property PaisID    : String read FPaisID write SetPaisID;
      property EstadoID  : Integer read FEstadoID write SetEstadoID;
      property CidadeID  : Integer read FCidadeID write SetCidadeID;
      property FormaPagtoID    : Integer read FFormaPagtoID write SetFormaPagtoID;
      property CondicaoPagtoID : Integer read FCondicaoPagtoID write SetCondicaoPagtoID;
      property VendedorID  : Integer read FVendedorID write SetVendedorID;
      property ClienteID   : Integer read FClienteID write SetClienteID;
      property LicenseFile : TFileName read FLicenseFile write SetLicenseFile;
  end;

  TConfiguracaoSecaoVenda = class
    private
      FAjustarDataHora       : Boolean;
      FCarregarPapelDeParede : Boolean;
      FCarregarPeloCodigoEAN : Boolean;
      FNumeroCaixa : Integer ;
      procedure SetAjustarDataHora(const Value: Boolean);
      procedure SetCarregarPapelDeParede(const Value: Boolean);
      procedure SetCarregarPeloCodigoEAN(const Value: Boolean);
      procedure SetNumeroCaixa(const Value: Integer);
    protected
      constructor Create;
    public
      destructor Destroy; override;

      property CarregarPeloCodigoEAN : Boolean read FCarregarPeloCodigoEAN write SetCarregarPeloCodigoEAN;
      property CarregarPapelDeParede : Boolean read FCarregarPapelDeParede write SetCarregarPapelDeParede;
      property AjustarDataHora : Boolean read FAjustarDataHora write SetAjustarDataHora;
      property NumeroCaixa     : Integer read FNumeroCaixa write SetNumeroCaixa;
  end;

  TConfiguracaoSecaoCupomPDV = class
    private
      FEmitirApenasOrcamento : Boolean;
      FEmitirCupom           : Boolean;
      FCupomAutomatico       : Boolean;
      FEmitirCupomNaoFiscal  : Boolean;
      FEmitirCupomNaoFiscalFonteNome : String;
      FEmitirCupomNaoFiscalFonteTamanho : Integer;
      FEmitirCupomFiscal    : Boolean;
      FPortaCupomNaoFiscal  : String;
      FModeloCupomNaoFiscal : Integer;
      FPortaCupomFiscal     : Integer;
      FModeloEmissaoCupom   : Integer;
      FCupomNaoFiscalQtde   : Integer;
      procedure SetCupomAutomatico(const Value: Boolean);
      procedure SetCupomNaoFiscalQtde(const Value: Integer);
      procedure SetEmitirApenasOrcamento(const Value: Boolean);
      procedure SetEmitirCupom(const Value: Boolean);
      procedure SetEmitirCupomFiscal(const Value: Boolean);
      procedure SetEmitirCupomNaoFiscal(const Value: Boolean);
      procedure SetEmitirCupomNaoFiscalFonteNome(const Value: String);
      procedure SetEmitirCupomNaoFiscalFonteTamanho(const Value: Integer);
      procedure SetModeloCupomNaoFiscal(const Value: Integer);
      procedure SetModeloEmissaoCupom(const Value: Integer);
      procedure SetPortaCupomFiscal(const Value: Integer);
      procedure SetPortaCupomNaoFiscal(const Value: String);
    protected
      constructor Create;
    public
      destructor Destroy; override;

      property EmitirApenasOrcamento : Boolean read FEmitirApenasOrcamento write SetEmitirApenasOrcamento;
      property EmitirCupom           : Boolean read FEmitirCupom write SetEmitirCupom;
      property CupomAutomatico       : Boolean read FCupomAutomatico write SetCupomAutomatico;
      property EmitirCupomNaoFiscal  : Boolean read FEmitirCupomNaoFiscal write SetEmitirCupomNaoFiscal;
      property EmitirCupomNaoFiscalFonteNome : String read FEmitirCupomNaoFiscalFonteNome write SetEmitirCupomNaoFiscalFonteNome;
      property EmitirCupomNaoFiscalFonteTamanho : Integer read FEmitirCupomNaoFiscalFonteTamanho write SetEmitirCupomNaoFiscalFonteTamanho;
      property EmitirCupomFiscal    : Boolean read FEmitirCupomFiscal write SetEmitirCupomFiscal;
      property PortaCupomNaoFiscal  : String read FPortaCupomNaoFiscal write SetPortaCupomNaoFiscal;
      property ModeloCupomNaoFiscal : Integer read FModeloCupomNaoFiscal write SetModeloCupomNaoFiscal;
      property PortaCupomFiscal     : Integer read FPortaCupomFiscal write SetPortaCupomFiscal;
      property ModeloEmissaoCupom   : Integer read FModeloEmissaoCupom write SetModeloEmissaoCupom;
      property CupomNaoFiscalQtde   : Integer read FCupomNaoFiscalQtde write SetCupomNaoFiscalQtde;
  end;

  TConfiguracaoSecaoCertificado = class
    private
      FCaminhho,
      FSenha   ,
      FURL     ,
      FNumeroSerie : String;
    protected
      constructor Create;
    public
      destructor Destroy; override;

      function Caminho : String;
      function Senha : String;
      function URL : String;
      function NumeroSerie : String;
      function Instalado : Boolean;
  end;

  // Interface
  IConfiguracaoIni = interface
    ['{476F103A-B5C8-4063-A30A-DE1506723062}']
    function Load : IConfiguracaoIni;
    function Save : IConfiguracaoIni;
    function Secoes : Integer;
    function ConfigurarAmbiente : Boolean;

    function Padrao   : TConfiguracaoSecaoDefault;
    function Venda    : TConfiguracaoSecaoVenda;
    function CupomPDV : TConfiguracaoSecaoCupomPDV;
    function Certificado(aCNPJ : String) : TConfiguracaoSecaoCertificado;
    function Carregado : Boolean;
  end;

  // Classe
  TConfiguracaoIni = class(TInterfacedObject, IConfiguracaoIni)
    strict private
      class var _instance : IConfiguracaoIni;
    private
      FINI : TIniFile;
      FPadrao    : TConfiguracaoSecaoDefault;
      FVenda     : TConfiguracaoSecaoVenda;
      FCupomPDV  : TConfiguracaoSecaoCupomPDV;
      FCertificado : TConfiguracaoSecaoCertificado;
      FCarregado : Boolean;
    protected
      constructor Create(aFileName : String);
    public
      destructor Destroy; override;
      class function New(aFileName : String) : IConfiguracaoIni;

      function Load : IConfiguracaoIni;
      function Save : IConfiguracaoIni;
      function Secoes : Integer;
      function ConfigurarAmbiente : Boolean;

      function Padrao   : TConfiguracaoSecaoDefault;
      function Venda    : TConfiguracaoSecaoVenda;
      function CupomPDV : TConfiguracaoSecaoCupomPDV;
      function Certificado(aCNPJ : String) : TConfiguracaoSecaoCertificado;
      function Carregado : Boolean;
  end;

implementation

{ TConfiguracaoSecaoDefault }

uses
  System.StrUtils,
  UConstantesDGE;

constructor TConfiguracaoSecaoDefault.Create;
begin
  FCfopEntradaID   := StrToInt(INI_KEY_CFOP_ENT_VALUE);
  FCfopID          := StrToInt(INI_KEY_CFOP_SAI_VALUE);
  FCidadeID        := StrToInt(INI_KEY_CIDADE_VALUE);
  FClienteID       := 1;
  FCondicaoPagtoID := StrToInt(INI_KEY_COND_PGTO_VALUE);
  FEmpresaID       := EmpresaID;
  FEstadoID        := INI_KEY_ESTADO_VALUE.ToInteger;
  FFormaPagtoID    := StrToInt(INI_KEY_FORMA_PGTO_VALUE);
  FLicenseFile     := EmptyStr;
  FPaisID          := INI_KEY_PAIS_VALUE;
  FVendedorID      := StrToInt(INI_KEY_VENDEDOR_VALUE);
end;

destructor TConfiguracaoSecaoDefault.Destroy;
begin
  inherited;
end;

procedure TConfiguracaoSecaoDefault.SetCfopEntradaID(const Value: Integer);
begin
  FCfopEntradaID := Value;
end;

procedure TConfiguracaoSecaoDefault.SetCfopID(const Value: Integer);
begin
  FCfopID := Value;
end;

procedure TConfiguracaoSecaoDefault.SetCidadeID(const Value: Integer);
begin
  FCidadeID := Value;
end;

procedure TConfiguracaoSecaoDefault.SetClienteID(const Value: Integer);
begin
  FClienteID := Value;
end;

procedure TConfiguracaoSecaoDefault.SetCondicaoPagtoID(const Value: Integer);
begin
  FCondicaoPagtoID := Value;
end;

procedure TConfiguracaoSecaoDefault.SetEmpresaID(const Value: String);
begin
  FEmpresaID := Value.Trim;
end;

procedure TConfiguracaoSecaoDefault.SetEstadoID(const Value: Integer);
begin
  FEstadoID := Value;
end;

procedure TConfiguracaoSecaoDefault.SetFormaPagtoID(const Value: Integer);
begin
  FFormaPagtoID := Value;
end;

procedure TConfiguracaoSecaoDefault.SetLicenseFile(const Value: TFileName);
begin
  FLicenseFile := Value;
end;

procedure TConfiguracaoSecaoDefault.SetPaisID(const Value: String);
begin
  FPaisID := Value.Trim;
end;

procedure TConfiguracaoSecaoDefault.SetVendedorID(const Value: Integer);
begin
  FVendedorID := Value;
end;

{ TConfiguracaoSecaoVenda }

constructor TConfiguracaoSecaoVenda.Create;
begin
  FAjustarDataHora       := False;
  FCarregarPapelDeParede := False;
  FCarregarPeloCodigoEAN := False;
  FNumeroCaixa := 0;
end;

destructor TConfiguracaoSecaoVenda.Destroy;
begin
  inherited;
end;

procedure TConfiguracaoSecaoVenda.SetAjustarDataHora(const Value: Boolean);
begin
  FAjustarDataHora := Value;
end;

procedure TConfiguracaoSecaoVenda.SetCarregarPapelDeParede(const Value: Boolean);
begin
  FCarregarPapelDeParede := Value;
end;

procedure TConfiguracaoSecaoVenda.SetCarregarPeloCodigoEAN(const Value: Boolean);
begin
  FCarregarPeloCodigoEAN := Value;
end;

procedure TConfiguracaoSecaoVenda.SetNumeroCaixa(const Value: Integer);
begin
  FNumeroCaixa := Value;
end;

{ TConfiguracaoSecaoCupomPDV }

constructor TConfiguracaoSecaoCupomPDV.Create;
begin
  FEmitirApenasOrcamento := False;
  FEmitirCupom           := False;
  FCupomAutomatico       := False;
  FEmitirCupomNaoFiscal  := True;
  FEmitirCupomNaoFiscalFonteNome    := 'Courier New';
  FEmitirCupomNaoFiscalFonteTamanho := 6;
  FEmitirCupomFiscal    := False;
  FPortaCupomNaoFiscal  := 'C:\CUPOM.TXT';
  FModeloCupomNaoFiscal := 0;
  FPortaCupomFiscal     := 0;
  FModeloEmissaoCupom   := 0;
  FCupomNaoFiscalQtde   := 1;
end;

destructor TConfiguracaoSecaoCupomPDV.Destroy;
begin
  inherited;
end;

procedure TConfiguracaoSecaoCupomPDV.SetCupomAutomatico(const Value: Boolean);
begin
  FCupomAutomatico := Value;
end;

procedure TConfiguracaoSecaoCupomPDV.SetCupomNaoFiscalQtde(const Value: Integer);
begin
  FCupomNaoFiscalQtde := Value;
end;

procedure TConfiguracaoSecaoCupomPDV.SetEmitirApenasOrcamento(const Value: Boolean);
begin
  FEmitirApenasOrcamento := Value;
end;

procedure TConfiguracaoSecaoCupomPDV.SetEmitirCupom(const Value: Boolean);
begin
  FEmitirCupom := Value;
end;

procedure TConfiguracaoSecaoCupomPDV.SetEmitirCupomFiscal(const Value: Boolean);
begin
  FEmitirCupomFiscal := Value;
end;

procedure TConfiguracaoSecaoCupomPDV.SetEmitirCupomNaoFiscal(const Value: Boolean);
begin
  FEmitirCupomNaoFiscal := Value;
end;

procedure TConfiguracaoSecaoCupomPDV.SetEmitirCupomNaoFiscalFonteNome(const Value: String);
begin
  FEmitirCupomNaoFiscalFonteNome := Value.Trim;
end;

procedure TConfiguracaoSecaoCupomPDV.SetEmitirCupomNaoFiscalFonteTamanho(const Value: Integer);
begin
  FEmitirCupomNaoFiscalFonteTamanho := Value;
end;

procedure TConfiguracaoSecaoCupomPDV.SetModeloCupomNaoFiscal(const Value: Integer);
begin
  FModeloCupomNaoFiscal := Value;
end;

procedure TConfiguracaoSecaoCupomPDV.SetModeloEmissaoCupom(const Value: Integer);
begin
  FModeloEmissaoCupom := Value;
end;

procedure TConfiguracaoSecaoCupomPDV.SetPortaCupomFiscal(const Value: Integer);
begin
  FPortaCupomFiscal := Value;
end;

procedure TConfiguracaoSecaoCupomPDV.SetPortaCupomNaoFiscal(const Value: String);
begin
  FPortaCupomNaoFiscal := Value.Trim;
end;

{ TConfiguracaoSecaoCertificado }

function TConfiguracaoSecaoCertificado.Caminho: String;
begin
  Result := FCaminhho;
end;

constructor TConfiguracaoSecaoCertificado.Create;
begin
  FNumeroSerie := EmptyStr;
end;

destructor TConfiguracaoSecaoCertificado.Destroy;
begin
  inherited;
end;

function TConfiguracaoSecaoCertificado.Instalado: Boolean;
begin
  Result := not FNumeroSerie.IsEmpty;
end;

function TConfiguracaoSecaoCertificado.NumeroSerie : String;
begin
  Result := FNumeroSerie;
end;

function TConfiguracaoSecaoCertificado.Senha: String;
begin
  Result := FSenha;
end;

function TConfiguracaoSecaoCertificado.URL: String;
begin
  Result := FURL;
end;

{ TConfiguracaoIni }

function TConfiguracaoIni.Certificado(aCNPJ: String): TConfiguracaoSecaoCertificado;
Var
  aSecao : String;
begin
  aSecao := IfThen(aCNPJ.Trim.IsEmpty, EmptyStr, aCNPJ.Trim + '_') + INI_SECAO_CERTIFICADO;
  if (not FINI.SectionExists(aSecao)) then
    aSecao := INI_SECAO_CERTIFICADO;

  FCertificado.FCaminhho := FINI.ReadString(aSecao, INI_KEY_CERTIFICADO_CAMINHO, EmptyStr);
  FCertificado.FSenha    := FINI.ReadString(aSecao, INI_KEY_CERTIFICADO_SENHA, EmptyStr);
  FCertificado.FURL      := FINI.ReadString(aSecao, INI_KEY_CERTIFICADO_URL, EmptyStr);
  FCertificado.FNumeroSerie := FINI.ReadString(aSecao, INI_KEY_CERTIFICADO_NUMERO_SERIE, EmptyStr);

  Result := FCertificado;
end;

function TConfiguracaoIni.ConfigurarAmbiente: Boolean;
begin
  Result := (not FINI.SectionExists(INI_SECAO_DEFAULT))
         or (not FINI.SectionExists(INI_SECAO_VENDA))
         or (not FINI.SectionExists(INI_SECAO_CUMPO_PDV));
end;

constructor TConfiguracaoIni.Create(aFileName : String);
begin
  FINI := TIniFile.Create(aFileName);

  FPadrao      := TConfiguracaoSecaoDefault.Create;
  FVenda       := TConfiguracaoSecaoVenda.Create;
  FCupomPDV    := TConfiguracaoSecaoCupomPDV.Create;
  FCertificado := TConfiguracaoSecaoCertificado.Create;
  FCarregado   := False;
end;

destructor TConfiguracaoIni.Destroy;
begin
  FINI.DisposeOf;
  FPadrao.DisposeOf;
  FVenda.DisposeOf;
  FCupomPDV.DisposeOf;
  FCertificado.DisposeOf;
  inherited;
end;

class function TConfiguracaoIni.New(aFileName : String) : IConfiguracaoIni;
begin
  if not Assigned(_instance) then
    _instance := Self.Create(aFileName);

  Result := _instance;
end;

function TConfiguracaoIni.Load : IConfiguracaoIni;
begin
  Result     := Self;
  FCarregado := True;

  FPadrao.PaisID   := FINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_PAIS, INI_KEY_PAIS_VALUE);
  FPadrao.EstadoID := FINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_ESTADO, StrToInt(INI_KEY_ESTADO_VALUE));
  FPadrao.CidadeID := FINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_CIDADE, StrToInt(INI_KEY_CIDADE_VALUE));

  FPadrao.FormaPagtoID    := FINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_FORMA_PGTO, 1);
  FPadrao.CondicaoPagtoID := FINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_COND_PGTO, 1);
  FPadrao.CfopID          := FINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_CFOP_SAI, StrToInt(INI_KEY_CFOP_SAI_VALUE));
  FPadrao.CfopEntradaID   := FINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_CFOP_ENT, StrToInt(INI_KEY_CFOP_ENT_VALUE));

  FPadrao.EmpresaID  := FINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_EMPRESA, EmptyStr);
  FPadrao.ClienteID  := StrToIntDef( FINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_CLIENTE, EmptyStr), CONSUMIDOR_FINAL_CODIGO);
  FPadrao.VendedorID := FINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_VENDEDOR, 1);
end;

function TConfiguracaoIni.Save : IConfiguracaoIni;
begin
  Result := Self;
end;

function TConfiguracaoIni.Secoes: Integer;
var
  aSecoes : TStringList;
begin
  aSecoes := TStringList.Create;
  Result  := 0;
  try
    FINI.ReadSections(aSecoes);
    Result := aSecoes.Count;
  finally
    aSecoes.DisposeOf;
  end;
end;

function TConfiguracaoIni.CupomPDV: TConfiguracaoSecaoCupomPDV;
begin
  Result := FCupomPDV;
end;

function TConfiguracaoIni.Padrao: TConfiguracaoSecaoDefault;
begin
  Result := FPadrao;
end;

function TConfiguracaoIni.Venda: TConfiguracaoSecaoVenda;
begin
  Result := FVenda;
end;

function TConfiguracaoIni.Carregado: Boolean;
begin
  Result := FCarregado;
end;

end.
