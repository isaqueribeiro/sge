unit View.Abertura;

interface

uses
  View.PadraoAbertura,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TFrmAbertura = class(TFrmPadraoAbertura)
    imgLogo: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbertura: TFrmAbertura;

implementation

{$R *.dfm}

procedure TFrmAbertura.FormCreate(Sender: TObject);
begin
  CirculoSolido := False;
  TamanhoPadrao := True;
  CriarMoldura  := True;
  CriarLinhasInferiores := True;

  inherited;
end;

end.
