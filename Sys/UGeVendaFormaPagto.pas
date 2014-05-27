unit UGeVendaFormaPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, DB, IBCustomDataSet, IBTable, StdCtrls, Mask, DBCtrls,
  IBUpdateSQL, ExtCtrls, Buttons;

type
  TfrmGeVendaFormaPagto = class(TfrmGrPadrao)
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
    GrpBxFormaPagto: TGroupBox;
    Bevel1: TBevel;
    lblPrazo01: TLabel;
    lblPrazo02: TLabel;
    lblPrazo03: TLabel;
    lblPrazo04: TLabel;
    lblPrazo05: TLabel;
    lblPrazo06: TLabel;
    lblPrazo07: TLabel;
    lblPrazo08: TLabel;
    lblPrazo09: TLabel;
    lblPrazo10: TLabel;
    lblPrazo11: TLabel;
    lblPrazo12: TLabel;
    dbPrazo01: TDBEdit;
    dbPrazo02: TDBEdit;
    dbPrazo03: TDBEdit;
    dbPrazo04: TDBEdit;
    dbPrazo05: TDBEdit;
    dbPrazo06: TDBEdit;
    dbPrazo07: TDBEdit;
    dbPrazo08: TDBEdit;
    dbPrazo09: TDBEdit;
    dbPrazo10: TDBEdit;
    dbPrazo11: TDBEdit;
    dbPrazo12: TDBEdit;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dbCondicaoPagto: TDBLookupComboBox;
    dbValorFormaPagto: TDBEdit;
    Label2: TLabel;
    Bevel2: TBevel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure dbFormaPagtoClick(Sender: TObject);
    procedure dbCondicaoPagtoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FTotalAPagar : Currency;
    function GetValorTotalVenda : Currency;
  public
    { Public declarations }
    property ValorTotalVenda : Currency read GetValorTotalVenda;
    property TotalAPagar : Currency read FTotalAPagar;

    procedure RegistrarRotinaSistema; override;
  end;

  function InserirFormaPagto(const AOnwer : TComponent; APagar : Currency) : Boolean;

implementation

uses UDMBusiness, UDMNFe, UGeVenda, UGeCondicaoPagto, UGrCampoRequisitado;

{$R *.dfm}

function InserirFormaPagto(const AOnwer : TComponent; APagar : Currency) : Boolean;
var
  AForm : TfrmGeVendaFormaPagto;
begin
  AForm := TfrmGeVendaFormaPagto.Create(AOnwer);
  try
    AForm.FTotalAPagar := APagar;

    Result := (AForm.ShowModal = mrOk)
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeVendaFormaPagto.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeVendaFormaPagto.dbFormaPagtoClick(Sender: TObject);
begin
  with TIBDataSet(dbCodigo.DataSource.DataSet) do
  begin

    if (  State in [dsEdit, dsInsert] ) then
      if ( dbFormaPagto.ListSource.DataSet.Locate('cod', dbFormaPagto.Field.AsInteger, []) ) then
        FieldByName('FORMAPAG').AsString := dbFormaPagto.ListSource.DataSet.FieldByName('descri').AsString;

  end;
end;

procedure TfrmGeVendaFormaPagto.dbCondicaoPagtoClick(Sender: TObject);
var
  I : Integer;
begin
  with TIBDataSet(dbFormaPagto.DataSource.DataSet) do
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
      end;

  end;
end;

function TfrmGeVendaFormaPagto.GetValorTotalVenda: Currency;
begin
  Result := frmGeVenda.dbValorTotal.Field.AsCurrency;
end;

procedure TfrmGeVendaFormaPagto.FormCreate(Sender: TObject);
begin
  inherited;
  FTotalAPagar := 0.0;
end;

procedure TfrmGeVendaFormaPagto.btnConfirmarClick(Sender: TObject);
begin
  if ( Trim(dbFormaPagto.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informa uma Forma de Pagamento');
    Exit;
  end;

  if ( Trim(dbCondicaoPagto.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informa uma Condição de Pagamento');
    Exit;
  end;

  if not CamposRequiridos(Self, TIBDataSet(dbCodigo.DataSource.DataSet), 'Forma/Condição de Pagamento') then
    try
      if dbValorFormaPagto.Field.AsCurrency <= 0 then
      begin
        ShowWarning('Favor informar uma Valor Válido para a forma/condição de pagamento!');
        dbValorFormaPagto.SetFocus;
      end
      else
      if dbValorFormaPagto.Field.AsCurrency > TotalAPagar then
        ShowWarning('Valor A Pagar para a forma/condição é maior que o permitido!')
      else
        ModalResult := mrOk;
    except
      On E : Exception do
        ShowError('Erro ao tentar inserir e/ou edição Forma/Condição de Pagamento!' + #13#13 + E.Message);
    end;
end;

procedure TfrmGeVendaFormaPagto.RegistrarRotinaSistema;
begin
  ;
end;

end.
