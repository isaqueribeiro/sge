unit UGeOSFormaPagto;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, StdCtrls, Mask, DBCtrls,
  IBUpdateSQL, ExtCtrls, Buttons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeOSFormaPagto = class(TfrmGrPadrao)
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
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure dbCondicaoPagtoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FTotalAPagar : Currency;
    function GetValorTotalOS : Currency;
  public
    { Public declarations }
    property ValorTotalOS : Currency read GetValorTotalOS;
    property TotalAPagar : Currency read FTotalAPagar;

    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:

  Views:

  Procedures:

*)

  function InserirFormaPagto(const AOnwer : TComponent; APagar : Currency) : Boolean;

implementation

uses
  UConstantesDGE, UDMRecursos, UDMBusiness, UDMNFe, UGeOS, View.CondicaoPagto, UGrCampoRequisitado;

{$R *.dfm}

function InserirFormaPagto(const AOnwer : TComponent; APagar : Currency) : Boolean;
var
  AForm : TfrmGeOSFormaPagto;
begin
  AForm := TfrmGeOSFormaPagto.Create(AOnwer);
  try
    AForm.FTotalAPagar := APagar;

    Result := (AForm.ShowModal = mrOk)
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeOSFormaPagto.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeOSFormaPagto.dbCondicaoPagtoClick(Sender: TObject);
var
  I : Integer;
begin
  with TIBDataSet(dbFormaPagto.DataSource.DataSet) do
  begin

    if ( State in [dsEdit, dsInsert] ) then
      if ( dbCondicaoPagto.ListSource.DataSet.Locate('cond_cod', dbCondicaoPagto.Field.AsInteger, []) ) then
      begin
        FieldByName('PAGTO_PRAZO').AsInteger := dbCondicaoPagto.ListSource.DataSet.FieldByName('Cond_prazo').AsInteger;
        for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
        begin
          FieldByName('PRAZO_' + FormatFloat('00', I)).Clear;
          if ( not dbCondicaoPagto.ListSource.DataSet.FieldByName('Cond_prazo_' + FormatFloat('00', I)).IsNull ) then
            FieldByName('PRAZO_' + FormatFloat('00', I)).AsInteger := dbCondicaoPagto.ListSource.DataSet.FieldByName('Cond_prazo_' + FormatFloat('00', I)).AsInteger;
        end;
      end;

  end;
end;

function TfrmGeOSFormaPagto.GetValorTotalOS: Currency;
begin
  Result := frmGeOS.dbValorTotalLiquido.Field.AsCurrency;
end;

procedure TfrmGeOSFormaPagto.FormCreate(Sender: TObject);
begin
  inherited;
  FTotalAPagar := 0.0;
end;

procedure TfrmGeOSFormaPagto.btnConfirmarClick(Sender: TObject);
begin
  if ( Trim(dbFormaPagto.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informa uma Forma de Pagamento');
    Exit;
  end;

  if ( Trim(dbCondicaoPagto.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informa uma Condi��o de Pagamento');
    Exit;
  end;

  if not CamposRequiridos(Self, TIBDataSet(dbCodigo.DataSource.DataSet), 'Forma/Condi��o de Pagamento') then
    try
      if dbValorFormaPagto.Field.AsCurrency < 0 then
      begin
        ShowWarning('Favor informar uma Valor V�lido para a forma/condi��o de pagamento!');
        dbValorFormaPagto.SetFocus;
      end
      else
      if dbValorFormaPagto.Field.AsCurrency > TotalAPagar then
        ShowWarning('Valor A Pagar para a forma/condi��o � maior que o permitido!')
      else
        ModalResult := mrOk;
    except
      On E : Exception do
        ShowError('Erro ao tentar inserir e/ou edi��o Forma/Condi��o de Pagamento!' + #13#13 + E.Message);
    end;
end;

procedure TfrmGeOSFormaPagto.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeOSFormaPagto.FormShow(Sender: TObject);
begin
  inherited;
  if (dbCondicaoPagto.Field.AsInteger > 0) then
    dbCondicaoPagtoClick( dbCondicaoPagto );
end;

end.
