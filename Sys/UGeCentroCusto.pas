unit UGeCentroCusto;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, DBClient,
  Provider, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeCentroCusto = class(TfrmGrPadraoCadastro)
    lblDesricao: TLabel;
    dbDesricao: TDBEdit;
    lblCliente: TLabel;
    dbAtivo: TDBCheckBox;
    dspEmpresaLista: TDataSetProvider;
    cdsEmpresaLista: TClientDataSet;
    dtsEmpresaLista: TDataSource;
    dbgEmpresaLista: TDBGrid;
    dbCliente: TJvDBComboEdit;
    qryEmpresaLista: TFDQuery;
    qryEmpresaListaSELECIONAR: TIntegerField;
    qryEmpresaListaCNPJ: TStringField;
    qryEmpresaListaRZSOC: TStringField;
    qryEmpresaListaCENTRO_CUSTO: TIntegerField;
    qryEmpresaListaEMPRESA: TStringField;
    cdsEmpresaListaSELECIONAR: TIntegerField;
    cdsEmpresaListaCNPJ: TStringField;
    cdsEmpresaListaRZSOC: TStringField;
    cdsEmpresaListaCENTRO_CUSTO: TIntegerField;
    cdsEmpresaListaEMPRESA: TStringField;
    fdQryTabelaCODIGO: TIntegerField;
    fdQryTabelaDESCRICAO: TStringField;
    fdQryTabelaATIVO: TSmallintField;
    fdQryTabelaCODCLIENTE: TIntegerField;
    fdQryTabelaNOME: TStringField;
    fdQryTabelaATIVO_TEMP: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbgEmpresaListaDblClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure cdsEmpresaListaSELECIONARGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbgEmpresaListaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaCalcFields(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    fCodigoCliente : Integer;
    fEmpresaDepartamento : String;
    procedure CarregarEmpresa;
    procedure GravarRelacaoCentroCustoEmpresa;

    function EmpresaSelecionada : Boolean;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCENTRO_CUSTO
  - TBCLIENTE
  - TBEMPRESA
  - TBCENTRO_CUSTO_EMPRESA

  Views:

  Procedures:

*)

var
  frmGeCentroCusto: TfrmGeCentroCusto;

  function SelecionarDepartamento(const AOwner : TComponent;
    const ClienteID : Integer; const EmpresaID : String; var Codigo : Integer; var Nome : String;
    var ClienteIDRetorno : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMRecursos, UConstantesDGE, View.Cliente;

{$R *.dfm}

function SelecionarDepartamento(const AOwner : TComponent;
  const ClienteID : Integer; const EmpresaID : String; var Codigo : Integer; var Nome : String;
  var ClienteIDRetorno : Integer) : Boolean;
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
        QuotedStr(frm.fEmpresaDepartamento) + ')) or (c.codcliente is not null)'
    else
      frm.WhereAdditional := EmptyStr;

    frm.fdQryTabela.SQL.Add('where 1=1 ' + IfThen(frm.WhereAdditional = EmptyStr, '', ' and ' + frm.WhereAdditional));

    Result := frm.SelecionarRegistro(Codigo, Nome);

    if Result then
      ClienteIDRetorno := frm.DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger;
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
  CampoOrdenacao := CampoDescricao;

  fEmpresaDepartamento := EmptyStr;

  UpdateGenerator;
end;

procedure TfrmGeCentroCusto.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarCliente(Self, iCodigo, sNome) ) then
      begin
        FieldByName('CODCLIENTE').AsInteger := iCodigo;
        FieldByName('NOME').AsString        := sNome;
      end;
  end;
end;

procedure TfrmGeCentroCusto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin
    with DtSrcTabela.DataSet do
    begin
      if ( State in [dsEdit, dsInsert] ) then
        if ( dbCliente.Focused ) then
        begin
          FieldByName('CODCLIENTE').Clear;
          FieldByName('NOME').Clear;
        end
    end;
  end
  else
    inherited;
end;

procedure TfrmGeCentroCusto.CarregarEmpresa;
begin
  with cdsEmpresaLista, Params do
  begin
    Close;
    ParamByName('centro_custo').AsInteger := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
    Open;
  end;
end;

procedure TfrmGeCentroCusto.GravarRelacaoCentroCustoEmpresa;
var
  sSQL : String;
const
  SQL_INSERT = 'Insert Into TBCENTRO_CUSTO_EMPRESA (centro_custo, empresa, selecionar) values (%s, %s, 1)';
  SQL_DELETE = 'Delete from TBCENTRO_CUSTO_EMPRESA where centro_custo = %s and empresa = %s';
begin
  cdsEmpresaLista.First;
  cdsEmpresaLista.DisableControls;
  while not cdsEmpresaLista.Eof do
  begin
    if cdsEmpresaListaSELECIONAR.AsInteger = 1 then
      sSQL := SQL_INSERT
    else
      sSQL := SQL_DELETE;

    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add( Format(SQL_DELETE, [DtSrcTabela.DataSet.FieldByName('CODIGO').AsString, QuotedStr(cdsEmpresaListaCNPJ.AsString)]) );
      ExecSQL;

      SQL.Clear;
      SQL.Add( Format(sSQL, [DtSrcTabela.DataSet.FieldByName('CODIGO').AsString, QuotedStr(cdsEmpresaListaCNPJ.AsString)]) );
      ExecSQL;

      CommitTransaction;
    end;

    cdsEmpresaLista.Next;
  end;
  cdsEmpresaLista.First;
  cdsEmpresaLista.EnableControls;
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
  if (DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger = 0) then
    if not EmpresaSelecionada then
    begin
      ShowWarning('Favor selecionar a empresa, caso o Departamento/Centro de Custo seja interno.');
      Exit;
    end;

  fdQryTabela.AfterScroll := nil;
  inherited;
  fdQryTabela.AfterScroll := fdQryTabelaAfterScroll;

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
  dtsEmpresaLista.AutoEdit := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

function TfrmGeCentroCusto.EmpresaSelecionada: Boolean;
var
  bRetorno : Boolean;
begin
  bRetorno := False;
  try
    if cdsEmpresaLista.Active then
    begin
      cdsEmpresaLista.First;
      while not cdsEmpresaLista.Eof do
      begin
        bRetorno := (cdsEmpresaListaSELECIONAR.AsInteger = 1);
        if bRetorno then
          Break;

        cdsEmpresaLista.Next;
      end;
    end;
  finally
    if cdsEmpresaLista.Active then
      cdsEmpresaLista.First;

    Result := bRetorno;
  end;
end;

procedure TfrmGeCentroCusto.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarEmpresa;
end;

procedure TfrmGeCentroCusto.fdQryTabelaCalcFields(DataSet: TDataSet);
begin
  inherited;
  DtSrcTabela.DataSet.FieldByName('ATIVO_TEMP').AsString := IfThen(DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger = 1, 'X', '.');
end;

procedure TfrmGeCentroCusto.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger := 1;
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
      QuotedStr(fEmpresaDepartamento) + ')) or (c.codcliente is not null)'
  else
    WhereAdditional := EmptyStr;

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeCentroCusto', TfrmGeCentroCusto);

end.
