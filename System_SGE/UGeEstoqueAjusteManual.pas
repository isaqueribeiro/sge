unit UGeEstoqueAjusteManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls,
  Buttons, ExtCtrls, Mask, DBCtrls, rxToolEdit, RXDBCtrl, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGeEstoqueAjusteManual = class(TfrmGrPadrao)
    GrpBxEmpresa: TGroupBox;
    lblCNPJ: TLabel;
    lblRazaoSocial: TLabel;
    dbCNPJ: TDBEdit;
    dbRazaoSocial: TDBEdit;
    Bevel1: TBevel;
    GrpBxDadosAjuste: TGroupBox;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    Bevel2: TBevel;
    qryEmpresa: TIBQuery;
    qryAjuste: TIBDataSet;
    updAjuste: TIBUpdateSQL;
    qryProduto: TIBDataSet;
    updProduto: TIBUpdateSQL;
    lblProduto: TLabel;
    dbProduto: TRxDBComboEdit;
    lblProdutoDesc: TLabel;
    dbProdutoDesc: TDBEdit;
    lblEstoque: TLabel;
    dbEstoque: TDBEdit;
    lblFornecedor: TLabel;
    dbFornecedor: TRxDBComboEdit;
    lblDocumento: TLabel;
    dbDocumento: TDBEdit;
    lblQuantidade: TLabel;
    dbQuantidade: TDBEdit;
    lblEstoqueNovo: TLabel;
    dbEstoqueNovo: TDBEdit;
    lblDataAjuste: TLabel;
    dbDataAjuste: TDBEdit;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    qryAjusteCONTROLE: TIntegerField;
    qryAjusteCODPROD: TIBStringField;
    qryAjusteCODEMPRESA: TIBStringField;
    qryAjusteCODFORN: TIntegerField;
    qryAjusteDOC: TIBStringField;
    qryAjusteMOTIVO: TIBStringField;
    qryAjusteDTAJUST: TDateTimeField;
    qryAjusteUSUARIO: TIBStringField;
    dtsAjuste: TDataSource;
    dtsEmpresa: TDataSource;
    qryEmpresaCNPJ: TIBStringField;
    qryEmpresaRZSOC: TIBStringField;
    qryEmpresaNMFANT: TIBStringField;
    dtsProduto: TDataSource;
    qryProdutoCOD: TIBStringField;
    qryProdutoDESCRI: TIBStringField;
    qryProdutoAPRESENTACAO: TIBStringField;
    qryProdutoDESCRI_APRESENTACAO: TIBStringField;
    qryProdutoUNP_SIGLA: TIBStringField;
    qryAjusteNOMEFORN: TIBStringField;
    qryAjusteQTDEATUAL: TIBBCDField;
    qryAjusteQTDENOVA: TIBBCDField;
    qryAjusteQTDEFINAL: TIBBCDField;
    qryProdutoQTDE: TIBBCDField;
    btnNovoAjuste: TcxButton;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    procedure ControlEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryEmpresaCNPJGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtsAjusteStateChange(Sender: TObject);
    procedure qryAjusteNewRecord(DataSet: TDataSet);
    procedure btnNovoAjusteClick(Sender: TObject);
    procedure qryProdutoQTDEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
  private
    { Private declarations }
    FSQLProduto : TStringList;
    procedure CarregarDadosProduto(const Codigo : String);
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeEstoqueAjusteManual: TfrmGeEstoqueAjusteManual;

implementation

uses
  UConstantesDGE, UDMBusiness, UGeProduto, UGeFornecedor;

{$R *.dfm}

procedure TfrmGeEstoqueAjusteManual.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID := ROTINA_ENT_AJUSTE_ID;

  with qryEmpresa do
  begin
    Close;
    SQL.Add('where e.cnpj = ' + QuotedStr(GetEmpresaIDDefault));
    Open;
  end;

  qryAjuste.Open;

  FSQLProduto := TStringList.Create;
  FSQLProduto.AddStrings( qryProduto.SelectSQL );
end;

procedure TfrmGeEstoqueAjusteManual.qryEmpresaCNPJGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := StrFormatarCnpj(Sender.AsString);
end;

procedure TfrmGeEstoqueAjusteManual.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_ESCAPE ) then
    Self.Close;
end;

procedure TfrmGeEstoqueAjusteManual.dtsAjusteStateChange(Sender: TObject);
begin
  dtsAjuste.AutoEdit    := ( qryAjuste.State in [dsEdit, dsInsert] );
  dbMotivo.ReadOnly     := not ( qryAjuste.State in [dsEdit, dsInsert] );

  btnNovoAjuste.Enabled := ( qryAjuste.Active and (qryAjuste.State = dsBrowse) );
  btnConfirmar.Enabled  := ( qryAjuste.State in [dsEdit, dsInsert] );
  btnCancelar.Enabled   := ( qryAjuste.State in [dsEdit, dsInsert] );
end;

procedure TfrmGeEstoqueAjusteManual.qryAjusteNewRecord(DataSet: TDataSet);
begin
  qryAjusteCODEMPRESA.Assign( qryEmpresaCNPJ );
  qryAjusteDTAJUST.AsDateTime := GetDateTimeDB;
  qryAjusteUSUARIO.AsString   := GetUserApp;
  qryAjusteCODPROD.Clear;
  qryAjusteCODFORN.Clear;
  qryAjusteQTDEATUAL.Clear;
  qryAjusteQTDENOVA.Clear;
  qryAjusteQTDEFINAL.Clear;
  qryAjusteMOTIVO.Clear;

  dbProduto.SetFocus;
end;

procedure TfrmGeEstoqueAjusteManual.btnNovoAjusteClick(Sender: TObject);
begin
  qryAjuste.Append;
end;

procedure TfrmGeEstoqueAjusteManual.CarregarDadosProduto(
  const Codigo: String);
var
  sCodigo : String;
begin
  if not StrIsInteger(Codigo) then
    raise Exception.Create('Código do produto inválido!');

  sCodigo := FormatFloat('0000000', StrToInt(Codigo));

  with qryProduto, SelectSQL do
  begin
    Close;

    Clear;
    AddStrings( FSQLProduto );
    Add('where p.codemp = ' + QuotedStr(GetEmpresaIDDefault));
    Add('  and p.cod    = ' + QuotedStr(sCodigo));

    Open;

    if (not IsEmpty) and (qryAjuste.State in [dsEdit, dsInsert]) then
    begin
      qryAjusteCODPROD.AsString     := qryProdutoCOD.AsString;
      qryAjusteQTDEATUAL.AsCurrency := qryProdutoQTDE.AsCurrency;
    end;
  end;

end;

procedure TfrmGeEstoqueAjusteManual.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbProduto ) then
    CarregarDadosProduto( IntToStr(StrToIntDef(dbProduto.Field.AsString, 0)) );

  if ( Sender = dbQuantidade ) then
    if ( qryAjuste.State in [dsEdit, dsInsert] ) then
      qryAjusteQTDEFINAL.AsCurrency := qryAjusteQTDEATUAL.AsCurrency + qryAjusteQTDENOVA.AsCurrency;
end;

procedure TfrmGeEstoqueAjusteManual.qryProdutoQTDEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Text := FormatFloat(',0.###', Sender.AsCurrency) + ' ' + AnsiUpperCase(qryProdutoUNP_SIGLA.AsString);
end;

procedure TfrmGeEstoqueAjusteManual.btnCancelarClick(Sender: TObject);
begin
  if ( qryAjuste.State in [dsEdit, dsInsert] ) then
    if ShowConfirm('Deseja cancelar o lançamento do novo estoque para o produto?', 'Ajuste de Estoque') then
    begin
      qryAjuste.Cancel;
      qryProduto.Close;
    end;
end;

procedure TfrmGeEstoqueAjusteManual.btnConfirmarClick(Sender: TObject);
begin
  if ( qryAjuste.State in [dsEdit, dsInsert] ) then
    if Trim(dbMotivo.Lines.Text) = EmptyStr then
      ShowWarning('Favor informar o motivo do ajuste manual de estoque do produto selecionado.')
    else
    if ( dbQuantidade.Field.AsInteger = 0 ) then
      ShowWarning('Favor informar a quantidade do ajuste manual de estoque para produto selecionado.')
    else  
    if ShowConfirm('Confirma o lançamento do novo estoque para o produto?', 'Ajuste de Estoque') then
    begin
      qryAjusteCONTROLE.AsInteger := GetNextID('TBAJUSTESTOQ', 'CONTROLE');
      qryAjusteMOTIVO.AsString    := AnsiUpperCase( (dbMotivo.Lines.Text) );
      qryAjuste.Post;
      qryAjuste.ApplyUpdates;

      qryProduto.Edit;
      qryProdutoQTDE.AsCurrency := qryAjusteQTDEFINAL.AsCurrency;
      qryProduto.Post;
      qryProduto.ApplyUpdates;

      CommitTransaction;
    end;
end;

procedure TfrmGeEstoqueAjusteManual.dbProdutoButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCodigoAlfa,
  sNome      : String;
begin
  if ( qryAjuste.State in [dsEdit, dsInsert] ) then
    if SelecionarProdutoParaAjuste(Self, iCodigo, sCodigoAlfa, sNome) then
      CarregarDadosProduto( sCodigoAlfa );
end;

procedure TfrmGeEstoqueAjusteManual.dbFornecedorButtonClick(
  Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  if ( qryAjuste.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      qryAjusteCODFORN.AsInteger := iCodigo;
      qryAjusteNOMEFORN.AsString := sNome;
    end;
end;

procedure TfrmGeEstoqueAjusteManual.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeEstoqueAjusteManual', TfrmGeEstoqueAjusteManual);

end.
