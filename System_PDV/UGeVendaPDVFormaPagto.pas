unit UGeVendaPDVFormaPagto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, Vcl.DBCtrls, Vcl.StdCtrls, Data.DB, Vcl.ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxButtons, Vcl.Mask,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TfrmGeVendaPDVFormaPagto = class(TfrmGrPadrao)
    Bevel4: TBevel;
    dtsFormaPagto: TDataSource;
    ImgConsulta: TImage;
    dtsFormaPagtoLista: TDataSource;
    dtsCondicaoPagtoLista: TDataSource;
    grpFormaCondicaoPagto: TGroupBox;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dbCondicaoPagto: TDBLookupComboBox;
    lblValorFormaPagto: TLabel;
    dbValorFormaPagto: TDBEdit;
    dbgDados: TDBGrid;
    dbTotalTroco: TDBEdit;
    lblTotalTroco: TLabel;
    dbTotalRecebido: TDBEdit;
    lblTotalRecebido: TLabel;
    dbTotalAReceber: TDBEdit;
    lblTotalAReceber: TLabel;
    pnlTotalizador: TPanel;
    cdsTotal: TClientDataSet;
    dtsTotal: TDataSource;
    cdsTotalAReceber: TCurrencyField;
    cdsTotalRecebido: TCurrencyField;
    cdsTotalTroco: TCurrencyField;
    btnOk: TcxButton;
    btnNao: TcxButton;
    btnSalvar: TcxButton;
    dtsVenda: TDataSource;
    qryFormaPagto: TFDQuery;
    qryCondicaoPagto: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbCondicaoPagtoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure InciarNovaFormaPagto;
    procedure TotalizarRecebimentos;
    procedure SetValorRecebido(pValor : Currency);

    function DataSetVenda : TDataSet;
    function DataSetFormaPagto : TDataSet;
  public
    { Public declarations }
    procedure SetValorAPagar(pValor : Currency);
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBFORMPAGTO

  Views:
  - VW_CONDICAOPAGTO

  Procedures:

*)

var
  frmGeVendaPDVFormaPagto: TfrmGeVendaPDVFormaPagto;

implementation

uses
  UConstantesDGE, UDMCupom, UDMBusiness, UGrCampoRequisitado, UDMRecursos;

{$R *.dfm}

{ TfrmGeVendaPDVFormaPagto }

procedure TfrmGeVendaPDVFormaPagto.btnOkClick(Sender: TObject);
var
  cRestoAPagar   : Currency;
begin
  cRestoAPagar := cdsTotalAReceber.AsCurrency - (cdsTotalRecebido.AsCurrency - cdsTotalTroco.AsCurrency);
  if (cRestoAPagar <> 0.0) then
  begin
    ShowWarning('Favor refazer processo para informar as Formas/Condições de Pagamentos!');
    dbgDados.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TfrmGeVendaPDVFormaPagto.btnSalvarClick(Sender: TObject);
var
  sFormaPagto    ,
  sCondicaoPagto : String;
  cRestoAPagar   : Currency;
const
  DINHEIRO = 'DINHEIRO,DNH,MONEY,REAL,R$,MOEDA,MOEDA CORRENTE';
begin
  qryCondicaoPagto.Locate('cond_cod', dbCondicaoPagto.Field.AsInteger, []);

  cRestoAPagar   := cdsTotalAReceber.AsCurrency - (cdsTotalRecebido.AsCurrency - cdsTotalTroco.AsCurrency);
  sFormaPagto    := AnsiUpperCase(Trim(dbFormaPagto.Text));
  sCondicaoPagto := AnsiUpperCase(Trim(dbCondicaoPagto.Text));

  if ( sFormaPagto = EmptyStr ) then
  begin
    ShowWarning('Favor informa uma Forma de Pagamento');
    Exit;
  end;

  if ( sCondicaoPagto = EmptyStr ) then
  begin
    ShowWarning('Favor informa uma Condição de Pagamento');
    Exit;
  end;

  if not GetFormaPagtoCondicaoPagto(dbFormaPagto.Field.AsInteger, dbCondicaoPagto.Field.AsInteger) then
  begin
    ShowWarning('Forma de Pagamento não liberada para ser usada com a Condição de Pagamento selecionada!');
    Exit;
  end;

  if not CamposRequiridos(Self, TClientDataSet(dbFormaPagto.DataSource.DataSet), 'Forma/Condição de Pagamento') then
    try
      if dbValorFormaPagto.Field.AsCurrency <= 0 then
      begin
        ShowWarning('Favor informar uma Valor Válido para a forma/condição de pagamento!');
        dbValorFormaPagto.SetFocus;
      end
      else
      if (Pos(sFormaPagto, DINHEIRO) = 0) and (dbValorFormaPagto.Field.AsCurrency > cRestoAPagar) then
      begin
        ShowWarning('Forma de Pagamento selecionada não permite o recebimento de valores acima do calculado!');
        dbFormaPagto.SetFocus;
      end
      else
      if (qryCondicaoPagto.FieldByName('cond_prazo').AsInteger = 1) and (dbValorFormaPagto.Field.AsCurrency > cRestoAPagar) then
      begin
        ShowWarning('Condição de Pagamento selecionada não permite o recebimento de valores acima do calculado!');
        dbFormaPagto.SetFocus;
      end
      else
      begin
        if (DataSetFormaPagto.State in [dsEdit, dsInsert]) then
        begin
          if ( dbValorFormaPagto.Field.AsCurrency <= cRestoAPagar ) then
            DataSetFormaPagto.FieldByName('VALOR_FPAGTO').AsCurrency := dbValorFormaPagto.Field.AsCurrency;

          DataSetFormaPagto.FieldByName('FORMAPAGTO_DESCRICAO').AsString    := dbFormaPagto.Text;
          DataSetFormaPagto.FieldByName('CONDICAOPAGTO_DESCRICAO').AsString := dbCondicaoPagto.Text;
          DataSetFormaPagto.Post;
        end;

        TotalizarRecebimentos;
        InciarNovaFormaPagto;
      end;
    except
      On E : Exception do
        ShowError('Erro ao tentar inserir e/ou edição Forma/Condição de Pagamento!' + #13#13 + E.Message);
    end;
end;

function TfrmGeVendaPDVFormaPagto.DataSetFormaPagto: TDataSet;
begin
  Result := dtsFormaPagto.DataSet;
end;

function TfrmGeVendaPDVFormaPagto.DataSetVenda: TDataSet;
begin
  Result := dtsVenda.DataSet;
end;

procedure TfrmGeVendaPDVFormaPagto.dbCondicaoPagtoClick(Sender: TObject);
var
  I : Integer;
begin
  with TFDQuery(DataSetFormaPagto) do
  begin

    if ( State in [dsEdit, dsInsert] ) then
      if ( dbCondicaoPagto.ListSource.DataSet.Locate('cond_cod', dbCondicaoPagto.Field.AsInteger, []) ) then
      begin
        FieldByName('VENDA_PRAZO').AsInteger := dbCondicaoPagto.ListSource.DataSet.FieldByName('Cond_prazo').AsInteger;
        for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
        begin
          FieldByName('PRAZO_' + FormatFloat('00', I)).Clear;
          if ( not dbCondicaoPagto.ListSource.DataSet.FieldByName('Cond_prazo_' + FormatFloat('00', I)).IsNull ) then
            FieldByName('PRAZO_' + FormatFloat('00', I)).AsInteger := dbCondicaoPagto.ListSource.DataSet.FieldByName('Cond_prazo_' + FormatFloat('00', I)).AsInteger;
        end;

        // Sinalizar no registro principal da Venda quando esta for A Prazo
        if ( FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
        begin
          if not (DataSetVenda.State in [dsEdit, dsInsert]) then
            DataSetVenda.Edit;

          DataSetVenda.FieldByName('VENDA_PRAZO').AsInteger := 1;
        end;
      end;

  end;
end;

procedure TfrmGeVendaPDVFormaPagto.FormCreate(Sender: TObject);
begin
  inherited;
  dtsVenda.DataSet      := DMCupom.cdsVenda;
  dtsFormaPagto.DataSet := DMCupom.cdsVendaFormaPagto;

  qryFormaPagto.Open;
  qryFormaPagto.Last;
  qryFormaPagto.First;

  qryCondicaoPagto.Open;
  qryCondicaoPagto.Last;
  qryCondicaoPagto.First;

  cdsTotal.CreateDataSet;
end;

procedure TfrmGeVendaPDVFormaPagto.InciarNovaFormaPagto;
var
  I : Integer;
  cRestante : Currency;
begin
  cRestante := cdsTotalAReceber.AsCurrency - (cdsTotalRecebido.AsCurrency - cdsTotalTroco.AsCurrency);
  if (cRestante > 0) then
  begin
    with DataSetFormaPagto do
    begin
      Append;

      FieldByName('ANO_VENDA').Value      := DataSetVenda.FieldByName('ANO').Value;
      FieldByName('CONTROLE_VENDA').Value := DataSetVenda.FieldByName('CODCONTROL').Value;

      FieldByName('FORMAPAGTO_COD').Clear;
      FieldByName('CONDICAOPAGTO_COD').Clear;

      FieldByName('VALOR_FPAGTO').Value   := cRestante;
      FieldByName('VALOR_RECEBIDO').Value := cRestante;
      FieldByName('VENDA_PRAZO').Value    := 0;

      FieldByName('FORMAPAGTO_DESCRICAO').AsString    := EmptyStr;
      FieldByName('CONDICAOPAGTO_DESCRICAO').AsString := EmptyStr;

      for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
        FieldByName('PRAZO_' + FormatFloat('00', I)).Clear;

      Post;
      Edit;

      dbFormaPagto.SetFocus;
    end;
  end
  else
  if (cRestante = 0) then
    btnOk.SetFocus;
end;

procedure TfrmGeVendaPDVFormaPagto.SetValorAPagar(pValor: Currency);
begin
  cdsTotal.Append;
  cdsTotalAReceber.AsCurrency := pValor;
  cdsTotalRecebido.AsCurrency := 0.0;
  cdsTotalTroco.AsCurrency    := 0.0;
  cdsTotal.Post;
end;

procedure TfrmGeVendaPDVFormaPagto.SetValorRecebido(pValor: Currency);
begin
  cdsTotal.Edit;
  cdsTotalRecebido.AsCurrency := pValor;
  if ( cdsTotalRecebido.AsCurrency > cdsTotalAReceber.AsCurrency ) then
    cdsTotalTroco.AsCurrency  := cdsTotalRecebido.AsCurrency - cdsTotalAReceber.AsCurrency
  else
    cdsTotalTroco.AsCurrency  := 0.0;
  cdsTotal.Post;
end;

procedure TfrmGeVendaPDVFormaPagto.TotalizarRecebimentos;
var
  iFormaPgto : Integer;
  cRecebido  : Currency;
begin
  iFormaPgto := DataSetFormaPagto.FieldByName('FORMAPAGTO_COD').AsInteger;
  DataSetFormaPagto.DisableControls;
  try
    cRecebido := 0.0;

    DataSetFormaPagto.First;
    while not DataSetFormaPagto.Eof do
    begin
      cRecebido := cRecebido + DataSetFormaPagto.FieldByName('VALOR_RECEBIDO').AsCurrency;
      DataSetFormaPagto.Next;
    end;
  finally
    DataSetFormaPagto.Locate('FORMAPAGTO_COD', iFormaPgto, []);
    DataSetFormaPagto.EnableControls;
  end;
  SetValorRecebido(cRecebido);
end;

procedure TfrmGeVendaPDVFormaPagto.RegistrarRotinaSistema;
begin
  ;
end;

end.
