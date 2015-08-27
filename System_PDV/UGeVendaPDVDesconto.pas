unit UGeVendaPDVDesconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, ExtCtrls, DB, Mask, DBCtrls, Buttons,
  cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, JvExMask, JvToolEdit,
  JvBaseEdits;

type
  TfrmGeVendaPDVDesconto = class(TfrmGrPadrao)
    Bevel4: TBevel;
    dtsVenda: TDataSource;
    ImgConsulta: TImage;
    Label1: TLabel;
    rgDescontoAcrescimo: TRadioGroup;
    btnOk: TcxButton;
    btnNao: TcxButton;
    edDescontoAcrescimo: TJvCalcEdit;
    procedure rgDescontoAcrescimoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    aDescontoCupomOLD  : Currency;
    function GetDescontoAcrestimo : Currency;
  public
    { Public declarations }
    property DescontoCupomOLD : Currency read aDescontoCupomOLD write aDescontoCupomOLD;
    property DescontoAcrestimo : Currency read GetDescontoAcrestimo;

    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeVendaPDVDesconto: TfrmGeVendaPDVDesconto;

implementation

uses
  UDMCupom, UDMBusiness;

{$R *.dfm}

{ TfrmGeVendaPDVDesconto }

function TfrmGeVendaPDVDesconto.GetDescontoAcrestimo: Currency;
var
  iFator : Integer;
begin
  if (rgDescontoAcrescimo.ItemIndex = 0) then
    iFator := 1
  else
    iFator := -1;
  Result := edDescontoAcrescimo.Value * iFator;
end;

procedure TfrmGeVendaPDVDesconto.rgDescontoAcrescimoClick(Sender: TObject);
begin
  edDescontoAcrescimo.SetFocus;
end;

procedure TfrmGeVendaPDVDesconto.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeVendaPDVDesconto.btnOkClick(Sender: TObject);
var
  cPercentualDesconto : Currency;
begin
  if (rgDescontoAcrescimo.ItemIndex = 0) then // Desconto
  begin
    cPercentualDesconto := edDescontoAcrescimo.Value / dtsVenda.DataSet.FieldByName('TOTALVENDA_BRUTA').AsCurrency * 100;

    if ( cPercentualDesconto > GetLimiteDescontoUser ) then
    begin
      ShowWarning('Limite de Desconto = ' + FormatFloat('0.00', GetLimiteDescontoUser) + '%');
      edDescontoAcrescimo.SetFocus;
    end
    else
      ModalResult := mrOk
  end
  else
  if (rgDescontoAcrescimo.ItemIndex = 1) then // Acréscimo
    ModalResult := mrOk
end;

end.
