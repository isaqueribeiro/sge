unit SGE.Model.Conexao.DataSet;

interface

uses
  SGE.Model.Interacao.DataSet,
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TModelConexaoDataSet = class(TDataModule, IModelConexaoDataSet)
    FDataSet: TFDQuery;
    FUpdateSQL: TFDUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;

    procedure SelectSQL(ASQL : TStrings);
    procedure FetchRowSQL(ASQL : TStrings);
    procedure InsertSQL(ASQL : TStrings);

    function DataSet : TFDQuery;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  SGE.Model.Dados;

{$R *.dfm}

{ TModelConexaoDataSet }

procedure TModelConexaoDataSet.DataModuleCreate(Sender: TObject);
begin
  with DMDados, FUpdateSQL do
  begin
    Connection := FConn;

    InsertSQL.Clear;
    ModifySQL.Clear;
    DeleteSQL.Clear;
    FetchRowSQL.Clear;

    LockSQL.Clear;
    UnlockSQL.Clear;
  end;

  with DMDados, FDataSet do
  begin
    Connection  := FConn;
    Transaction := FTransaction;
    UpdateObject      := FUpdateSQL;
    UpdateTransaction := FTransaction;

    SQL.Clear;
  end;
end;

function TModelConexaoDataSet.DataSet: TFDQuery;
begin
  Result := FDataSet;
end;

destructor TModelConexaoDataSet.Destroy;
begin
  FreeAndNil(FDataSet);
  FreeAndNil(FUpdateSQL);

  inherited;
end;

procedure TModelConexaoDataSet.FetchRowSQL(ASQL: TStrings);
begin
  FUpdateSQL.ModifySQL := ASQL;
end;

procedure TModelConexaoDataSet.InsertSQL(ASQL: TStrings);
begin
  FUpdateSQL.InsertSQL := ASQL;
end;

procedure TModelConexaoDataSet.SelectSQL(ASQL: TStrings);
begin
  FDataSet.SQL := ASQL;
end;

end.
