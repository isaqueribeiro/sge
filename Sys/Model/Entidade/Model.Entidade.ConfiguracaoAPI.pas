unit Model.Entidade.ConfiguracaoAPI;

interface

uses
  System.SysUtils; //, SimpleAttributes, SimpleEntity;

type
  [Tabela('SYS_CONFIG')]
  TConfiguracaoAPI = class
    private
      FChave    ,
      FValor    : String;
      FDataHora : TDateTime;
      procedure SetChave(const Value: String);
      procedure SetDataHora(const Value: TDateTime);
      procedure SetValor(const Value: String);
      protected
    protected
      constructor Create;
    public
      destructor Destroy; override;

      [Campo('ky_config'), Display('Chave'), NotNull, PK]
      property Chave    : String read FChave write SetChave;
      [Campo('vl_config'), Display('Valor')]
      property Valor    : String read FValor write SetValor;
      [Campo('dh_config'), Display('Data/Hora'), Format('dd/mm/yyyy')]
      property DataHora : TDateTime read FDataHora write SetDataHora;

      class function New : TConfiguracaoAPI;
  end;

implementation

{ TConfiguracaoAPI }

constructor TConfiguracaoAPI.Create;
begin
  FChave    := EmptyStr;
  FValor    := EmptyStr;
  FDataHora := Now;
end;

destructor TConfiguracaoAPI.Destroy;
begin
  inherited;
end;

class function TConfiguracaoAPI.New: TConfiguracaoAPI;
begin
  Result := Self.Create;
end;

procedure TConfiguracaoAPI.SetChave(const Value: String);
begin
  FChave := Value.Trim;
end;

procedure TConfiguracaoAPI.SetDataHora(const Value: TDateTime);
begin
  FDataHora := Value;
end;

procedure TConfiguracaoAPI.SetValor(const Value: String);
begin
  FValor := Value.Trim;
end;

end.
