unit UGeVendaPDVFinalizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, StdCtrls, Buttons, DB, IBCustomDataSet,
  IBTable, DBCtrls, Mask, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGeVendaPDVFinalizar = class(TfrmGrPadrao)
    Bevel4: TBevel;
    dtsFormaPagto: TDataSource;
    ImgConsulta: TImage;
    tblCondicaoPagto: TIBTable;
    tblFormaPagto: TIBTable;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    dtsFormaPagtoLista: TDataSource;
    dtsCondicaoPagtoLista: TDataSource;
    lblCondicaoPagto: TLabel;
    dbCondicaoPagto: TDBLookupComboBox;
    Label2: TLabel;
    dbValorFormaPagto: TDBEdit;
    Label1: TLabel;
    dbValorRecebidoFormaPagto: TDBEdit;
    Label3: TLabel;
    dbValorTrocoFormaPagto: TDBEdit;
    btnOk: TcxButton;
    btnNao: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure dbCondicaoPagtoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    fTotalAPagar : Currency;
  public
    { Public declarations }
    property TotalAPagar : Currency read fTotalAPagar write fTotalAPagar;

    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeVendaPDVFinalizar: TfrmGeVendaPDVFinalizar;

implementation

uses
  UConstantesDGE, UDMCupom, UDMBusiness, UGrCampoRequisitado;

{$R *.dfm}

procedure TfrmGeVendaPDVFinalizar.FormCreate(Sender: TObject);
begin
  inherited;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;

  fTotalAPagar := 0.0;
end;

procedure TfrmGeVendaPDVFinalizar.dbCondicaoPagtoClick(Sender: TObject);
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

procedure TfrmGeVendaPDVFinalizar.btnOkClick(Sender: TObject);
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

  if not GetFormaPagtoCondicaoPagto(dbFormaPagto.Field.AsInteger, dbCondicaoPagto.Field.AsInteger) then
  begin
    ShowWarning('Forma de Pagamento não liberada para ser usada com a Condição de Pagamento selecionada!');
    Exit;
  end;

  if not CamposRequiridos(Self, TIBDataSet(dbFormaPagto.DataSource.DataSet), 'Forma/Condição de Pagamento') then
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

procedure TfrmGeVendaPDVFinalizar.RegistrarRotinaSistema;
begin
  ;
end;

end.
