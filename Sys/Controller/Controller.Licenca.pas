unit Controller.Licenca;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IniFiles,
  Classe.Licenca,
  Interacao.Licenca,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Licenca;

type
  TLicencaController = class(TInterfacedObject, ILicenca)
    strict private
      class var _instance : ILicenca;
    private
      [weak]
      FModel : ILicencaModel;
      FFile  : TStringList;
      FCnpjArquivo : String;
      procedure CarregarDados;

      function LicencaValida(aFileName : TFileName) : Boolean;
    public
      constructor Create;
      destructor Destroy; override;

      procedure LimparLicenca;

      function Carregar(aFileName : TFileName) : ILicenca; overload;
      function Carregar : ILicenca; overload;

      function Model : ILicencaModel;
      function Empresa : String;
      function NomeFantasia : String;
      function CNPJ : String;
      function DataBloqueio : TDateTime;
      function Competencia : Integer;
      function UsarSGE : Boolean;
      function UsarSGI : Boolean;
      function UsarSGF : Boolean;
      function UsarSGO : Boolean;
      function GetCNPJArquivo(aFileName : TFileName) : String;

      class function GetInstance() : ILicenca;
  end;

implementation

uses
  Service.Encript;

{ TLicencaController }

function TLicencaController.GetCNPJArquivo(aFileName: TFileName): String;
begin
  Self.LicencaValida(aFileName);
  Result := FCnpjArquivo;
end;

class function TLicencaController.GetInstance: ILicenca;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TLicencaController.Carregar: ILicenca;
begin
  Result := Self;
  Self.CarregarDados();
end;

procedure TLicencaController.CarregarDados;
var
  aIni : TIniFile;
  aDao : IModelDAOCustom;
  I : Integer;
  aData ,
  aUUID : String;
begin
  aIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '_temp.ini');
  try
    // Recuperar arquivo criptografado da base de dados
    FFile.BeginUpdate;
    FFile.Clear;
    FFile.Add('[Licenca]');

    aDao := TModelDAOLicencaSystem.New;
    aDao.Open;

    while (not aDao.DataSet.Eof) do
    begin
      // Descriptografar dado
      aData := TServiceEncript.Decript(aDao.DataSet.FieldByName('linha_controle').AsString, SYS_PASSWD_KEY);

      if (aData.Trim.ToUpper <> FFile.Strings[0].Trim.ToUpper) then
        FFile.Add(aData);

      aDao.DataSet.Next;
    end;

    FFile.EndUpdate;
    FFile.SaveToFile(ExtractFilePath(ParamStr(0)) + '_temp.ini');

    // Recuperar dados
    aUUID := aIni.ReadString('Licenca', 'edUUID', TGUID.Empty.ToString);

    FModel
      .doc( aIni.ReadString('Licenca', 'doc',  '') )
      .UUID( StringToGUID(aUUID) )
      .Empresa( aIni.ReadString('Licenca', 'edEmpresa',  '') )
      .NomeFantasia( aIni.ReadString('Licenca', 'edFantasia',  '') )
      .CNPJ( aIni.ReadString('Licenca', 'edCGC',      '') )
      .Endereco( aIni.ReadString('Licenca', 'edEndereco', '') )
      .Numero( aIni.ReadString('Licenca', 'edNumero', 'S/N') )
      .Bairro( aIni.ReadString('Licenca', 'edBairro',   '') )
      .Cidade( aIni.ReadString('Licenca', 'edCidade',   '') )
      .UF( aIni.ReadString('Licenca', 'edUF',       '') )
      .CEP( aIni.ReadString('Licenca', 'edCEP',      '') )
      .Competencia( StrToIntDef(aIni.ReadString('Licenca', 'edCompetencia', FormatDateTime('yyyymm', Date + 30)), 0) )
      .DataBloqueio( aIni.ReadDateTime('Licenca', 'edDataBloqueio', Date + 45) )
      .UsarSGE( aIni.ReadBool('Licenca', 'chkSGE', False) )
      .UsarSGI( aIni.ReadBool('Licenca', 'chkSGI', False) )
      .UsarSGF( aIni.ReadBool('Licenca', 'chkSGF', False) )
      .UsarSGO( aIni.ReadBool('Licenca', 'chkSGO', False) );

    // Buscar dados atualizados da licença no FireBase RealTime através do "FModel.doc"
    if (not FModel.doc.IsEmpty) then
    begin

      // ... IMPLEMENTAR

    end;
  finally
    aDao.Close;
    aIni.DisposeOf;

    DeleteFile(ExtractFilePath(ParamStr(0)) + '_temp.ini');
  end;
end;

function TLicencaController.CNPJ: String;
begin
  Result := FModel.CNPJ;
end;

function TLicencaController.Competencia: Integer;
begin
  Result := FModel.Competencia;
end;

function TLicencaController.Carregar(aFileName: TFileName): ILicenca;
var
  aDao : IModelDAOCustom;
  I : Integer;
begin
  Result := Self;
  Self.CarregarDados();

  if (not FModel.IsEmpty) and FileExists(aFileName) then
    if (not LicencaValida(aFileName)) then
      raise Exception.Create('Licença inválida!');

  // Carregar novos dados da licença a partir do arqivo informado
  if FileExists(aFileName) then
  begin
    Self.LimparLicenca;

    FFile.Clear;
    FFile.LoadFromFile(aFileName);

    aDao := TModelDAOLicencaSystem.New;
    aDao.Open;

    for I := 0 to FFile.Count - 1 do
    begin
      aDao.DataSet.Append;
      aDao.DataSet.FieldByName('linha_controle').AsString := FFile.Strings[I];
      aDao.DataSet.Post;
    end;

    aDao.ApplyUpdates;
    aDao.CommitTransaction;
    aDao.Close;

    Self.CarregarDados();
  end;
end;

constructor TLicencaController.Create;
begin
  FModel := TLicenca.New;
  FFile  := TStringList.Create;
  FCnpjArquivo := EmptyStr;
end;

function TLicencaController.DataBloqueio: TDateTime;
begin
  Result := FModel.DataBloqueio;
end;

destructor TLicencaController.Destroy;
begin
  FFile.DisposeOf;
  inherited;
end;

function TLicencaController.Empresa: String;
begin
  Result := FModel.Empresa;
end;

function TLicencaController.LicencaValida(aFileName: TFileName): Boolean;
var
  aFile : TSTringList;
  aIni  : TIniFile;
  I : Integer;
begin
  if FileExists(aFileName) then
  begin
    aFile := TSTringList.Create;
    aIni  := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '_temp.ini');
    FCnpjArquivo := EmptyStr;
    try
      aFile.Clear;
      aFile.LoadFromFile(aFileName);

      for I := 0 to aFile.Count - 1 do
        aFile.Strings[I] := TServiceEncript.Decript(aFile.Strings[I], SYS_PASSWD_KEY);

      aFile.SaveToFile(ExtractFilePath(ParamStr(0)) + '_temp.ini');


      FCnpjArquivo := Trim(aIni.ReadString('Licenca', 'edCGC', EmptyStr));
    finally
      aIni.DisposeOf;
      aFile.DisposeOf;

      DeleteFile(ExtractFilePath(ParamStr(0)) + '_temp.ini');
    end;

    Result := (FCnpjArquivo = Self.CNPJ);
  end
  else
    Result := True;
end;

procedure TLicencaController.LimparLicenca;
begin
  TModelDAOLicencaSystem.New.ExecuteScriptSQL('Delete from SYS_LICENCA');
end;

function TLicencaController.Model: ILicencaModel;
begin
  Result := FModel;
end;

function TLicencaController.NomeFantasia: String;
begin
  Result := FModel.NomeFantasia;
end;

function TLicencaController.UsarSGE: Boolean;
begin
  Result := FModel.UsarSGE;
end;

function TLicencaController.UsarSGF: Boolean;
begin
  Result := FModel.UsarSGF;
end;

function TLicencaController.UsarSGI: Boolean;
begin
  Result := FModel.UsarSGI;
end;

function TLicencaController.UsarSGO: Boolean;
begin
  Result := FModel.UsarSGO;
end;

end.
