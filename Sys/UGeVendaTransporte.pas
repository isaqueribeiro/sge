unit UGeVendaTransporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask,
  rxToolEdit, RXDBCtrl, DB, IBCustomDataSet, IBUpdateSQL, Grids, DBGrids,
  IBQuery;

type
  TfrmGeVendaTransporte = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDataHora: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblDataEmissao: TLabel;
    lblHoraEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbDataHora: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbDataEmissao: TDBEdit;
    dbHoraEmissao: TDBEdit;
    Bevel1: TBevel;
    GrpBxFormaPagto: TGroupBox;
    lblModalidadeFrete: TLabel;
    dbModalidadeFrete: TDBLookupComboBox;
    Bevel2: TBevel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    lblTransportadora: TLabel;
    dbTransportadora: TRxDBComboEdit;
    lblPlacaVeiculo: TLabel;
    dbPlacaVeiculo: TDBEdit;
    lblPlacaUF: TLabel;
    dbPlacaUF: TRxDBComboEdit;
    lblPlacaRNTC: TLabel;
    dbPlacaRNTC: TDBEdit;
    GrpBxDadosProduto: TGroupBox;
    lblVolumeQtde: TLabel;
    lblVolumeNumero: TLabel;
    Bevel7: TBevel;
    dbVolumeNumero: TDBEdit;
    pnlBotoesVolume: TPanel;
    btnVolumeInserir: TBitBtn;
    btnVolumeEditar: TBitBtn;
    btnVolumeExcluir: TBitBtn;
    btnVolumeSalvar: TBitBtn;
    dbVolumeQtde: TDBEdit;
    lblVolumeEspecie: TLabel;
    dbVolumeEspecie: TDBEdit;
    dbVolumeMarca: TDBEdit;
    lblVolumeMarca: TLabel;
    lblVolumePBruto: TLabel;
    dbVolumePBruto: TDBEdit;
    dbVolumePLiquido: TDBEdit;
    lblVolumePLiquido: TLabel;
    dbgVolumes: TDBGrid;
    dtsVendaVolume: TDataSource;
    btnVolumeCancelar: TBitBtn;
    qryVolume: TIBQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbTransportadoraButtonClick(Sender: TObject);
    procedure dbPlacaUFButtonClick(Sender: TObject);
    procedure dbgVolumesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dtsVendaVolumeStateChange(Sender: TObject);
    procedure btnVolumeInserirClick(Sender: TObject);
    procedure dbVolumePLiquidoExit(Sender: TObject);
    procedure btnVolumeEditarClick(Sender: TObject);
    procedure btnVolumeExcluirClick(Sender: TObject);
    procedure btnVolumeCancelarClick(Sender: TObject);
    procedure btnVolumeSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarValorPadrao;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function EditarDadosTransportadora(const AOnwer : TComponent) : Boolean;

implementation

uses UDMBusiness, UDMNFe, UGeVenda, UGrCampoRequisitado, UGeFornecedor, UGeEstado;

{$R *.dfm}

function EditarDadosTransportadora(const AOnwer : TComponent) : Boolean;
var
  AForm : TfrmGeVendaTransporte;
begin
  AForm := TfrmGeVendaTransporte.Create(AOnwer);
  try
    AForm.dbModalidadeFrete.DataSource.DataSet.Edit;
    Result := (AForm.ShowModal = mrOk);
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeVendaTransporte.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeVendaTransporte.btnConfirmarClick(Sender: TObject);
begin
  if ( Trim(dbModalidadeFrete.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informa a Modalidade do Frete');
    Exit;
  end;
(* 18/09/2013 - Isaque: Obrigatoriedade removida dos campos.

  with dbTransportadora.DataSource.DataSet do
  begin
    FieldByName('NFE_TRANSPORTADORA').Required := ( FieldByName('NFE_MODALIDADE_FRETE').AsInteger <> MODALIDADE_FRETE_SEMFRETE );
    FieldByName('NFE_PLACA_VEICULO').Required  := ( FieldByName('NFE_TRANSPORTADORA').AsInteger > 0 );
    FieldByName('NFE_PLACA_UF').Required       := ( FieldByName('NFE_TRANSPORTADORA').AsInteger > 0 );
  end;
*)
  if not CamposRequiridos(Self, TIBDataSet(dbCodigo.DataSource.DataSet), 'Dados Transportadora') then
    try
      if ShowConfirm('Confirma os dados de transporte informados?', 'Transporte') then
        ModalResult := mrOk;
    except
      On E : Exception do
        ShowError('Erro ao tentar inserir e/ou editar dados referentes ao transporte!' + #13#13 + E.Message);
    end;
end;

procedure TfrmGeVendaTransporte.dbTransportadoraButtonClick(
  Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sNome : String;
begin
  if dbModalidadeFrete.Field.AsInteger = MODALIDADE_FRETE_SEMFRETE then
  begin
    ShowWarning('A Modalidade de Frete selecionada não permite a inserção de dados de transportadora!');
    Exit;
  end;

  with dbTransportadora.DataSource.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarTransportadora(Self, iCodigo, sCNPJ, sNome) ) then
      begin
        FieldByName('NFE_TRANSPORTADORA').AsInteger := iCodigo;
        FieldByName('TRANSP_CNPJ').AsString         := sCNPJ;
        FieldByName('TRANSP_NOME').AsString         := sNome;
      end;
end;

procedure TfrmGeVendaTransporte.dbPlacaUFButtonClick(Sender: TObject);
var
  iEstado : Integer;
  sEstado ,
  sUF     : String;
begin
  with dbTransportadora.DataSource.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarEstado(Self, iEstado, sEstado, sUF) ) then
        FieldByName('NFE_PLACA_UF').AsString := sUF;
end;

procedure TfrmGeVendaTransporte.dbgVolumesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(TDbGrid(Sender).DataSource.DataSet.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color:= clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color:= clCream;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmGeVendaTransporte.dtsVendaVolumeStateChange(Sender: TObject);
begin
  btnVolumeInserir.Enabled  := (dtsVendaVolume.DataSet.State in [dsBrowse]);
  btnVolumeEditar.Enabled   := (dtsVendaVolume.DataSet.State in [dsBrowse]) and (not dtsVendaVolume.DataSet.IsEmpty);
  btnVolumeExcluir.Enabled  := (dtsVendaVolume.DataSet.State in [dsBrowse]) and (not dtsVendaVolume.DataSet.IsEmpty);
  btnVolumeCancelar.Enabled := (dtsVendaVolume.DataSet.State in [dsEdit, dsInsert]);
  btnVolumeSalvar.Enabled   := (dtsVendaVolume.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TfrmGeVendaTransporte.btnVolumeInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := dtsVendaVolume.DataSet.RecordCount + 1;
    if ( dtsVendaVolume.DataSet.Locate('SEQUENCIAL', Seq, []) ) then
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  GerarSequencial(Sequencial);

  dtsVendaVolume.DataSet.Append;
  dtsVendaVolume.DataSet.FieldByName('SEQUENCIAL').Value := Sequencial;
  dtsVendaVolume.DataSet.FieldByName('NUMERO').Value     := FormatFloat('00', Sequencial);
  dbVolumeNumero.SetFocus;

  CarregarValorPadrao;
  if ( qryVolume.FieldByName('quantidade').AsCurrency > 0 ) then
    dbVolumeQtde.Field.Value := qryVolume.FieldByName('quantidade').AsCurrency;

  if ( qryVolume.FieldByName('peso_bruto').AsCurrency > 0 ) then
    dbVolumePBruto.Field.Value := qryVolume.FieldByName('peso_bruto').AsCurrency;

  if ( qryVolume.FieldByName('peso_liquido').AsCurrency > 0 ) then
    dbVolumePLiquido.Field.Value := qryVolume.FieldByName('peso_liquido').AsCurrency;
end;

procedure TfrmGeVendaTransporte.dbVolumePLiquidoExit(Sender: TObject);
begin
  if (btnVolumeSalvar.Visible and btnVolumeSalvar.Enabled) then
    btnVolumeSalvar.SetFocus;
end;

procedure TfrmGeVendaTransporte.btnVolumeEditarClick(Sender: TObject);
begin
  dtsVendaVolume.DataSet.Edit;
  dbVolumeNumero.SetFocus;
end;

procedure TfrmGeVendaTransporte.btnVolumeExcluirClick(Sender: TObject);
begin
  if ShowConfirm('Excluir volume selecionado?') then
    dtsVendaVolume.DataSet.Delete;
end;

procedure TfrmGeVendaTransporte.btnVolumeCancelarClick(Sender: TObject);
begin
  if ( dtsVendaVolume.DataSet.State in [dsEdit, dsInsert] ) then
  begin
    dtsVendaVolume.DataSet.Cancel;
    if ( btnVolumeInserir.Visible and btnVolumeInserir.Enabled ) then
      btnVolumeInserir.SetFocus;
  end;
end;

procedure TfrmGeVendaTransporte.btnVolumeSalvarClick(Sender: TObject);
begin
  if ( dtsVendaVolume.DataSet.State in [dsEdit, dsInsert] ) then
  begin
    dtsVendaVolume.DataSet.Post;
    if ( btnVolumeInserir.Visible and btnVolumeInserir.Enabled ) then
      btnVolumeInserir.SetFocus;
  end;
end;

procedure TfrmGeVendaTransporte.CarregarValorPadrao;
begin
  with qryVolume do
  begin
    Close;
    ParamByName('ano_venda').AsInteger := dtsVendaVolume.DataSet.FieldByName('ANO_VENDA').AsInteger;
    ParamByName('num_venda').AsInteger := dtsVendaVolume.DataSet.FieldByName('CONTROLE_VENDA').AsInteger;
    Open;
  end;
end;

procedure TfrmGeVendaTransporte.RegistrarRotinaSistema;
begin
  ;
end;

end.
