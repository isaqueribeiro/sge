unit UGeVendaPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, dxGDIPlusClasses, StdCtrls, DBCtrls, Grids,
  DBGrids;

type
  TfrmGeVendaPDV = class(TfrmGrPadrao)
    PnlInformeGeral: TPanel;
    imgEmpresa: TImage;
    PnlVendaCabecalho: TPanel;
    lblNomeVendedor: TLabel;
    imgNomeVendedor: TImage;
    imgNomeCliente: TImage;
    lblNomeCliente: TLabel;
    dbNomeVendedor: TDBText;
    dbNomeCliente: TDBText;
    imgNomeFormaPagto: TImage;
    lblNomeFormaPagto: TLabel;
    PnlVendaProduto: TPanel;
    lblData: TLabel;
    lblHora: TLabel;
    tmrContador: TTimer;
    dbNomeFormaPagto: TDBText;
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
    procedure tmrContadorTimer(Sender: TObject);
  private
    { Private declarations }
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

procedure TfrmGeVendaPDV.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeVendaPDV.tmrContadorTimer(Sender: TObject);
begin
  lblData.Caption := FormatDateTime('dd/mm/yyyy', Date);
  lblHora.Caption := FormatDateTime('hh:mm:ss', Time);
end;

initialization
  FormFunction.RegisterForm('frmGeVendaPDV', TfrmGeVendaPDV);

end.
