unit View.Certificado;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TViewCertificado = class(TForm)
    pnlControle: TPanel;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    stgCertificado: TStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCertificado: TViewCertificado;

implementation

{$R *.dfm}

end.
