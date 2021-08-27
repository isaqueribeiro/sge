unit SGE.Model.DAO.Helper;

interface

uses
  System.SysUtils,

  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TControllerHelper = class Helper for TModelDAO
    private
    public
      procedure SetCompetencia(const aDataMovimento : TDateTime);
      function GetCompetenciaID(const aDataMovimento : TDateTime) : Integer;
  end;

implementation

{ TControllerHelper }

function TControllerHelper.GetCompetenciaID(const aDataMovimento: TDateTime): Integer;
var
  aCodigo    : Integer;
  aDescricao : String;
begin
  aCodigo    := FormatDateTime('yyyymm', aDataMovimento).ToInteger;
  aDescricao := FormatDateTime('mmm/yyyy', aDataMovimento);

  try
    Self.ExecuteScriptSQL('Execute Procedure SET_COMPETENCIA(' + aCodigo.ToString + ', ' + aDescricao.QuotedString + ')');
  finally
    Result := aCodigo;
  end;
end;

procedure TControllerHelper.SetCompetencia(const aDataMovimento: TDateTime);
var
  aCodigo    : Integer;
  aDescricao : String;
begin
  aCodigo    := FormatDateTime('yyyymm', aDataMovimento).ToInteger;
  aDescricao := FormatDateTime('mmm/yyyy', aDataMovimento);

  try
    Self.ExecuteScriptSQL('Execute Procedure SET_COMPETENCIA(' + aCodigo.ToString + ', ' + aDescricao.QuotedString + ')');
  finally
    Self.CommitTransaction;
  end;
end;

end.
