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
    procedure ListarTipos;
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
  , Service.PrevisaoTempo
  , Classe.Gerenciador.View
  , System.TypInfo;

{ TViewVendaMobileConfigurarChave }

procedure TViewVendaMobileConfigurarChave.FormCreate(Sender: TObject);
begin
  inherited;
  ListarTipos;
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
  _GerenciadorView.ExecuteEvento('FrameVendaMobileConfigurarMenu.LimparSelecaoBotao');
  Close;
end;

procedure TViewVendaMobileConfigurarChave.lblSalvarClick(Sender: TObject);
begin
  ShowMessage('Teste de execução de evento!');
end;

procedure TViewVendaMobileConfigurarChave.ListarTipos;
var
 I : TTipoServicePrevisaoTempo;
begin
  cmbTipoChave.Items.Clear ;

  For I := Low(TTipoServicePrevisaoTempo) to High(TTipoServicePrevisaoTempo) do
     cmbTipoChave.Items.Add( GetEnumName(TypeInfo(TTipoServicePrevisaoTempo), Integer(I) ).Replace('spt', '') ) ;

  cmbTipoChave.ItemIndex := 0 ;
end;

procedure TViewVendaMobileConfigurarChave.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  _GerenciadorView.RegistrarView('ViewVendaMobileConfigurarChave', TViewVendaMobileConfigurarChave);

end.

