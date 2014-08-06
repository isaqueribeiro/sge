unit UGeVendaPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, dxGDIPlusClasses, StdCtrls, DBCtrls, Grids,
  DBGrids, DB, ActnList;

type
  TfrmGeVendaPDV = class(TfrmGrPadrao)
    PnlInformeGeral: TPanel;
    imgEmpresa: TImage;
    PnlVendaCabecalho: TPanel;
    lblNomeVendedor: TLabel;
    imgNomeVendedor: TImage;
    imgNomeCliente: TImage;
    lblNomeCliente: TLabel;
    imgNomeFormaPagto: TImage;
    lblNomeFormaPagto: TLabel;
    PnlVendaProduto: TPanel;
    lblData: TLabel;
    lblHora: TLabel;
    tmrContador: TTimer;
    lblProdutoCodigo: TLabel;
    edProdutoCodigo: TEdit;
    edProdutoQtde: TEdit;
    Label2: TLabel;
    dbNomeProduto: TDBText;
    dbValorProduto: TDBText;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbgDados: TDBGrid;
    Label6: TLabel;
    DBText1: TDBText;
    Bevel1: TBevel;
    Label7: TLabel;
    DBText2: TDBText;
    Bevel2: TBevel;
    Label8: TLabel;
    DBText3: TDBText;
    dbQuantidade: TDBText;
    dbUnidade: TDBText;
    dbTotalProduto: TDBText;
    Label9: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    dtsVenda: TDataSource;
    edNomeVendedor: TLabel;
    edNomeCliente: TLabel;
    edNomeFormaPagto: TLabel;
    actVenda: TActionList;
    actCarregarVendedor: TAction;
    actCarregarCliente: TAction;
    actCarregarFormaPagto: TAction;
    procedure tmrContadorTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure IniciarCupomCabecalho;
    procedure IniciarCupomProduto;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeVendaPDV: TfrmGeVendaPDV;

implementation

uses
  UFuncoes, DateUtils, UDMBusiness, UDMNFe;

{$R *.dfm}

{ TfrmGeVendaPDV }

procedure TfrmGeVendaPDV.IniciarCupomCabecalho;
begin
  edNomeVendedor.Tag     := GetVendedorIDDefault;
  edNomeVendedor.Caption := GetVendedorNomeDefault;

  edNomeCliente.Tag     := GetClienteIDDefault;
  edNomeCliente.Caption := GetClienteNomeDefault;

  edNomeFormaPagto.Tag     := GetFormaPagtoIDDefault;
  edNomeFormaPagto.Caption := GetFormaPagtoNomeDefault;
end;

procedure TfrmGeVendaPDV.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeVendaPDV.tmrContadorTimer(Sender: TObject);
begin
  lblData.Caption := FormatDateTime('dd/mm/yyyy', Date);
  lblHora.Caption := FormatDateTime('hh:mm:ss', Time);
end;

procedure TfrmGeVendaPDV.IniciarCupomProduto;
begin
  edProdutoQtde.Text   := '01';
  edProdutoCodigo.Text := EmptyStr;

  if edProdutoCodigo.Visible and edProdutoCodigo.Enabled then
    edProdutoCodigo.SetFocus;
end;

procedure TfrmGeVendaPDV.FormShow(Sender: TObject);
begin
  inherited;
  IniciarCupomCabecalho;
  IniciarCupomProduto;
end;

initialization
  FormFunction.RegisterForm('frmGeVendaPDV', TfrmGeVendaPDV);

end.
