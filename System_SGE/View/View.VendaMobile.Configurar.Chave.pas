unit View.VendaMobile.Configurar.Chave;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TViewVendaMobileConfigurarChave = class(TfrmGrPadrao)
    pnlContent: TPanel;
    pnlHeader: TPanel;
    lblTitle: TLabel;
    pnlBody: TPanel;
    lblTipoChave: TLabel;
    cmbTipoChave: TComboBox;
    lblValorChave: TLabel;
    edtValorChave: TEdit;
    pnlSalvar: TPanel;
    shpSalvar: TShape;
    lblSalvar: TLabel;
    pnlFechar: TPanel;
    shpFechar: TShape;
    lblFechar: TLabel;
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure lblSalvarClick(Sender: TObject);
    procedure lblFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

implementation

{$R *.dfm}

uses
    UConstantesDGE
  , UDMRecursos
  , UDMBusiness
  , Service.Utils
  , Classe.Gerenciador.View;

{ TViewVendaMobileConfigurarChave }

procedure TViewVendaMobileConfigurarChave.FormCreate(Sender: TObject);
begin
  inherited;
  // Provisório
  pnlSalvar.Left := pnlFechar.Left;
  pnlFechar.Visible := False;
end;

procedure TViewVendaMobileConfigurarChave.LabelMouseEnter(Sender: TObject);
var
  aStr : String;
begin
  aStr := TLabel(Sender).Name;

  with TLabel(Sender) do
  begin
    Font.Style  := [TFontStyle.fsBold];
    Font.Color  := $001C340A;
  end;

  with TShape(Self.FindComponent(aStr.Replace('lbl', 'shp'))) do
  begin
    Brush.Color := clWhite;
    Pen.Width   := 2;
  end;

  TPanel(Self.FindComponent(aStr.Replace('lbl', 'pnl'))).Color := clWhite;
end;

procedure TViewVendaMobileConfigurarChave.LabelMouseLeave(Sender: TObject);
var
  aStr : String;
begin
  aStr := TLabel(Sender).Name;

  with TLabel(Sender) do
  begin
    Font.Style  := [];
    Font.Color  := clWhite;
  end;

  with TShape(Self.FindComponent(aStr.Replace('lbl', 'shp'))) do
  begin
    Brush.Color := $001C340A;
    Pen.Width   := 1;
  end;

  TPanel(Self.FindComponent(aStr.Replace('lbl', 'pnl'))).Color := $001C340A;
end;

procedure TViewVendaMobileConfigurarChave.lblFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TViewVendaMobileConfigurarChave.lblSalvarClick(Sender: TObject);
begin
  ShowMessage('Teste de execução de evento!');
end;

procedure TViewVendaMobileConfigurarChave.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  _GerenciadorView.RegistrarView('ViewVendaMobileConfigurarChave', TViewVendaMobileConfigurarChave);

end.

