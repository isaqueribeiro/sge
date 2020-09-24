unit Classe.DistribuicaoDFe.DocumentoRetornado;

interface

uses
  System.SysUtils;

type
  TSituacaoDocumentoDFe = (snDFeAutorizado, snDFeDenegado, snDFeCancelado);
  TTipoNFe     = (tnNFeEntrada, tnNFeSaida);
  TDistribuicaoDFeDocumentoRetornado = class
    private
      FCNPJ: String;
      FUF  : String;
      FValor: Currency;
      FIEst: String;
      FSerie: String;
      FNumero: String;
      FEmissao: TDateTime;
      FSituacao: TSituacaoDocumentoDFe;
      FTipoNFe: TTipoNFe;
      FNSU: String;
      FNome: String;
      FChave: String;
      FProtocolo: String;
      procedure SetCNPJ(const Value: String);
      procedure SetEmissao(const Value: TDateTime);
      procedure SetIEst(const Value: String);
      procedure SetNome(const Value: String);
      procedure SetNSU(const Value: String);
      procedure SetNumero(const Value: String);
      procedure SetSerie(const Value: String);
      procedure SetSituacao(const Value: TSituacaoDocumentoDFe);
      procedure SetTipoNFe(const Value: TTipoNFe);
      procedure SetValor(const Value: Currency);
      procedure SetChave(const Value: String);
      procedure SetProtocolo(const Value: String);
      procedure SetUF(const Value: String);
    public
      constructor Create;
      destructor Destroy; override;

      property Chave     : String read FChave write SetChave;
      property Serie     : String read FSerie write SetSerie;
      property Numero    : String read FNumero write SetNumero;
      property Protocolo : String read FProtocolo write SetProtocolo;
      property CNPJ      : String read FCNPJ write SetCNPJ;
      property Nome      : String read FNome write SetNome;
      property IEst      : String read FIEst write SetIEst;
      property UF        : String read FUF write SetUF;
      property NSU       : String read FNSU write SetNSU;
      property Emissao   : TDateTime read FEmissao write SetEmissao;
      property TipoNFe   : TTipoNFe read FTipoNFe write SetTipoNFe;
      property Valor     : Currency read FValor write SetValor;
      property Situacao  : TSituacaoDocumentoDFe read FSituacao write SetSituacao;
    end;

implementation

{ TDistribuicaoDFeDocumentoRetornado }

constructor TDistribuicaoDFeDocumentoRetornado.Create;
begin
  FCNPJ      := EmptyStr;
  FValor     := 0.0;
  FIEst      := EmptyStr;
  FUF        := EmptyStr;
  FChave     := EmptyStr;
  FSerie     := EmptyStr;
  FNumero    := EmptyStr;
  FProtocolo := EmptyStr;
  FNSU       := EmptyStr;
  FNome      := EmptyStr;
  FEmissao   := Date;
  FSituacao  := TSituacaoDocumentoDFe.snDFeAutorizado;
  FTipoNFe   := TTipoNFe.tnNFeEntrada;
end;

destructor TDistribuicaoDFeDocumentoRetornado.Destroy;
begin
  inherited;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetChave(const Value: String);
begin
  FChave := Value.Trim;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetCNPJ(const Value: String);
begin
  FCNPJ := Value.Trim;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetEmissao(const Value: TDateTime);
begin
  FEmissao := Value;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetIEst(const Value: String);
begin
  FIEst := Value.Trim;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetNome(const Value: String);
begin
  FNome := Value.Trim;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetNSU(const Value: String);
begin
  FNSU := Value.Trim;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetNumero(const Value: String);
begin
  FNumero := Value.Trim;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetProtocolo(const Value: String);
begin
  FProtocolo := Value.Trim;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetSerie(const Value: String);
begin
  FSerie := Value.Trim;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetSituacao(const Value: TSituacaoDocumentoDFe);
begin
  FSituacao := Value;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetTipoNFe(const Value: TTipoNFe);
begin
  FTipoNFe := Value;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetUF(const Value: String);
begin
  FUF := Value.Trim.ToUpper;
end;

procedure TDistribuicaoDFeDocumentoRetornado.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
