unit UGrPadraoCadastroSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, StdCtrls, Buttons, ToolWin, ComCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGrPadraoCadastroSimples = class(TfrmGrPadrao)
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    tlbBotoes: TPanel;
    Bevel3: TBevel;
    btbtnIncluir: TcxButton;
    btbtnAlterar: TcxButton;
    btbtnExcluir: TcxButton;
    bvlTool1: TBevel;
    btbtnCancelar: TcxButton;
    btbtnSalvar: TcxButton;
    bvlTool2: TBevel;
    btbtnFechar: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGrPadraoCadastroSimples: TfrmGrPadraoCadastroSimples;

implementation

{$R *.dfm}

uses
  UConstantesDGE, UFuncoes, UDMBusiness, UDMRecursos;

{ TfrmGrPadraoCadastroSimples }

procedure TfrmGrPadraoCadastroSimples.RegistrarRotinaSistema;
begin
  ;
end;

end.
