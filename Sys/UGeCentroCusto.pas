unit UGeCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, RXDBCtrl, DBClient, Provider;

type
  TfrmGeCentroCusto = class(TfrmGrPadraoCadastro)
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaDESCRICAO: TIBStringField;
    IbDtstTabelaATIVO: TSmallintField;
    IbDtstTabelaCODCLIENTE: TIntegerField;
    IbDtstTabelaNOME: TIBStringField;
    lblDesricao: TLabel;
    dbDesricao: TDBEdit;
    IbDtstTabelaATIVO_TEMP: TStringField;
    lblCliente: TLabel;
    dbCliente: TRxDBComboEdit;
    dbAtivo: TDBCheckBox;
    qryEmpresaLista: TIBDataSet;
    dspEmpresaLista: TDataSetProvider;
    cdsEmpresaLista: TClientDataSet;
    dtsEmpresaLista: TDataSource;
    dbgEmpresaLista: TDBGrid;
    cdsEmpresaListaSELECIONAR: TIntegerField;
    cdsEmpresaListaRZSOC: TStringField;
    cdsEmpresaListaCENTRO_CUSTO: TIntegerField;
    cdsEmpresaListaEMPRESA: TStringField;
    cdsEmpresaListaCNPJ: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaCalcFields(DataSet: TDataSet);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbgEmpresaListaDblClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure cdsEmpresaListaSELECIONARGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbgEmpresaListaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    fCodigoCliente : Integer;
    fEmpresaDepartamento : String;
    procedure CarregarEmpresa;
    procedure GravarRelacaoCentroCustoEmpresa;
  public
    { Public declarations }
  end;

var
  frmGeCentroCusto: TfrmGeCentroCusto;

  function SelecionarDepartamento(const AOwner : TComponent;
    const ClienteID : Integer; const EmpresaID : String; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE, UGeCliente;

{$R *.dfm}

function SelecionarDepartamento(const AOwner : TComponent;
  const ClienteID : Integer; const EmpresaID : String; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeCentroCusto;
begin
  frm := TfrmGeCentroCusto.Create(AOwner);
  try
    frm.fCodigoCliente       := ClienteID;
    frm.fEmpresaDepartamento := Trim(EmpresaID);
    frm.AbrirTabelaAuto      := True;

    if ( frm.fCodigoCliente > 0 ) then
      frm.WhereAdditional := '(c.codcliente = ' + IntToStr(frm.fCodigoCliente) + ')'
    else
    if ( Trim(frm.fEmpresaDepartamento) <> EmptyStr ) then
      frm.WhereAdditional := '(c.codigo in (Select ce.centro_custo from TBCENTRO_CUSTO_EMPRESA ce where ce.empresa = ' +
        QuotedStr(frm.fEmpresaDepartamento) + '))'
    else
      frm.WhereAdditional := EmptyStr;

    frm.IbDtstTabela.SelectSQL.Add('where 1=1 ' + IfThen(frm.WhereAdditional = EmptyStr, '', ' and ' + frm.WhereAdditional));

    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeCentroCusto.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_CENTRO_CUSTO_ID;
  ControlFirstEdit := dbDesricao;
  AbrirTabelaAuto  := True;

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBCENTRO_CUSTO';
  CampoCodigo    := 'c.codigo';
  CampoDescricao := 'c.descricao';

  fEmpresaDepartamento := EmptyStr;

  UpdateGenerator;
end;

procedure TfrmGeCentroCusto.IbDtstTabelaCalcFields(DataSet: TDataSet);
begin
  IbDtstTabelaATIVO_TEMP.AsString := IfThen(IbDtstTabelaATIVO.AsInteger = 1, 'X', '.');
end;

procedure TfrmGeCentroCusto.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCliente(Self, iCodigo, sNome) ) then
    begin
      IbDtstTabelaCODCLIENTE.AsInteger := iCodigo;
      IbDtstTabelaNOME.AsString        := sNome;
    end;
end;

procedure TfrmGeCentroCusto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      if ( dbCliente.Focused ) then
      begin
        IbDtstTabelaCODCLIENTE.Clear;
        IbDtstTabelaNOME.Clear;
      end
  end
  else
    inherited;
end;

procedure TfrmGeCentroCusto.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaATIVO.AsInteger := 1;
end;

procedure TfrmGeCentroCusto.CarregarEmpresa;
begin
  with cdsEmpresaLista, Params do
  begin
    Close;
    ParamByName('centro_custo').AsInteger := IbDtstTabelaCODIGO.AsInteger;
    Open;
  end;
end;

procedure TfrmGeCentroCusto.GravarRelacaoCentroCustoEmpresa;
var
  sSQL : String;
const
  SQL_INSERT = 'Insert Into TBCENTRO_CUSTO_EMPRESA (centro_custo, empresa) values (%s, %s)';
  SQL_DELETE = 'Delete from TBCENTRO_CUSTO_EMPRESA where centro_custo = %s and empresa = %s';
begin
  cdsEmpresaLista.First;
  while not cdsEmpresaLista.Eof do
  begin
    if cdsEmpresaListaSELECIONAR.AsInteger = 1 then
      sSQL := SQL_INSERT
    else
      sSQL := SQL_DELETE;

    with DMBusiness, qryBusca do
    begin
      SQL.Clear;
      SQL.Add( Format(SQL_DELETE, [IbDtstTabelaCODIGO.AsString, QuotedStr(cdsEmpresaListaCNPJ.AsString)]) );
      ExecSQL;

      SQL.Clear;
      SQL.Add( Format(sSQL, [IbDtstTabelaCODIGO.AsString, QuotedStr(cdsEmpresaListaCNPJ.AsString)]) );
      ExecSQL;

      CommitTransaction;
    end;

    cdsEmpresaLista.Next;
  end;
end;

procedure TfrmGeCentroCusto.IbDtstTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarEmpresa;
end;

procedure TfrmGeCentroCusto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarEmpresa;
end;

procedure TfrmGeCentroCusto.btbtnSalvarClick(Sender: TObject);
begin
(*
  IMR - 19/11/2014 :
    Rotina que permite a gravação de várias Empresas para o mesmo Centro de Custo.
*)
  IbDtstTabela.AfterScroll := nil;
  inherited;
  IbDtstTabela.AfterScroll := IbDtstTabelaAfterScroll;

  if ( not OcorreuErro ) then
    GravarRelacaoCentroCustoEmpresa;
end;

procedure TfrmGeCentroCusto.dbgEmpresaListaDblClick(Sender: TObject);
begin
  if dtsEmpresaLista.AutoEdit then
    if ( not cdsEmpresaLista.IsEmpty ) then
    begin
      cdsEmpresaLista.Edit;
      if ( cdsEmpresaListaSELECIONAR.AsInteger = 0 ) then
        cdsEmpresaListaSELECIONAR.AsInteger := 1
      else
        cdsEmpresaListaSELECIONAR.AsInteger := 0;
      cdsEmpresaLista.Post;
    end;
end;

procedure TfrmGeCentroCusto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dtsEmpresaLista.AutoEdit := (IbDtstTabela.State in [dsEdit, dsInsert]);
end;

procedure TfrmGeCentroCusto.cdsEmpresaListaSELECIONARGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

procedure TfrmGeCentroCusto.dbgEmpresaListaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgEmpresaListaDblClick(Sender);
end;

procedure TfrmGeCentroCusto.btnFiltrarClick(Sender: TObject);
begin
  if ( fCodigoCliente > 0 ) then
    WhereAdditional := '(c.codcliente = ' + IntToStr(fCodigoCliente) + ')'
  else
  if ( Trim(fEmpresaDepartamento) <> EmptyStr ) then
    WhereAdditional := '(c.codigo in (Select ce.centro_custo from TBCENTRO_CUSTO_EMPRESA ce where ce.empresa = ' +
      QuotedStr(fEmpresaDepartamento) + '))'
  else
    WhereAdditional := EmptyStr;

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeCentroCusto', TfrmGeCentroCusto);

end.
