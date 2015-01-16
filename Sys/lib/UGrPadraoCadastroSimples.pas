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
    tlbBotoes: TToolBar;
    Bevel3: TBevel;
    bvlTool1: TBevel;
    bvlTool2: TBevel;
    Bevel4: TBevel;
    btbtnIncluir: TcxButton;
    btbtnAlterar: TcxButton;
    btbtnExcluir: TcxButton;
    btbtnCancelar: TcxButton;
    btbtnSalvar: TcxButton;
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

{ TfrmGrPadraoCadastroSimples }

procedure TfrmGrPadraoCadastroSimples.RegistrarRotinaSistema;
begin
  ;
end;

end.
