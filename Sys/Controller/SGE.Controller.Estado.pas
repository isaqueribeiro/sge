unit SGE.Controller.Estado;

interface

uses
  SGE.Model.Interacao.DataSet, System.Classes;

type
  TControllerEstado = class
    private
      FSQL : TStrings;
      FDataSet : IModelConexaoDataSet;
    public
      constructor Create;
      destructor Destroy; override;

      function Conexao : IModelConexaoDataSet;
  end;

implementation

uses
  SGE.Model.Factory;

{ TControllerEstado }

constructor TControllerEstado.Create;
var
  aSQL : TStrings;
begin
  FDataSet := TModelConexaoFactory.Create.DataSet;
  FSQL := TStringList.Create;

  try
    // SELECT
    FSQL.BeginUpdate;
    FSQL.Clear;
    FSQL.Add('Select');
    FSQL.Add('    e.est_cod   ');
    FSQL.Add('  , e.est_nome  ');
    FSQL.Add('  , e.est_sigla ');
    FSQL.Add('  , e.est_siafi ');
    FSQL.Add('  , e.aliquota_icms');
    FSQL.Add('  , e.aliquota_fcp ');
    FSQL.Add('from TBESTADO e');
    FSQL.EndUpdate;

    FDataSet.SelectSQL( FSQL );

    // REFRESH
    aSQL := TStringList.Create;

    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.AddStrings( FSQL );
    aSQL.Add('where (e.Est_cod = :old_est_cod)');
    aSQL.EndUpdate;

    FDataSet.FetchRowSQL( aSQL );

    // INSERT
    aSQL := TStringList.Create;

    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Insert Into TBESTADO (');
    aSQL.Add('    est_cod   ');
    aSQL.Add('  , est_nome  ');
    aSQL.Add('  , est_sigla ');
    aSQL.Add('  , est_siafi ');
    aSQL.Add('  , aliquota_icms');
    aSQL.Add('  , aliquota_fcp ');
    aSQL.Add(') values (');
    aSQL.Add('    :new_est_cod   ');
    aSQL.Add('  , :new_est_nome  ');
    aSQL.Add('  , :new_est_sigla ');
    aSQL.Add('  , :new_est_siafi ');
    aSQL.Add('  , :new_aliquota_icms');
    aSQL.Add('  , :new_aliquota_fcp ');
    aSQL.Add(')');
    aSQL.EndUpdate;

    FDataSet.InsertSQL( aSQL );

    // UPDATE



    // DELETE



  finally
    aSQL.DisposeOf;
    aSQL := nil;
  end;
end;

function TControllerEstado.Conexao : IModelConexaoDataSet;
begin
  Result := FDataSet;
end;

destructor TControllerEstado.Destroy;
begin
  FSQL.DisposeOf;
  FSQL := nil;

  inherited;
end;

end.
