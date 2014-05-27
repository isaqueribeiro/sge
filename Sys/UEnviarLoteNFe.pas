unit UEnviarLoteNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, ExtCtrls;

type
  TfrmEnviarLoteNFe = class(TfrmGrPadrao)
    GrpBxEmpresa: TGroupBox;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmEnviarLoteNFe: TfrmEnviarLoteNFe;

implementation

uses UDMBusiness, UDMNFe;

{$R *.dfm}

{ TfrmEnviarLoteNFe }

procedure TfrmEnviarLoteNFe.RegistrarRotinaSistema;
begin
  ;
end;

end.
