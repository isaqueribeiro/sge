unit UGrPadraoCadastroSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, StdCtrls, Buttons, ToolWin, ComCtrls;

type
  TfrmGrPadraoCadastroSimples = class(TfrmGrPadrao)
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    tlbBotoes: TToolBar;
    Bevel3: TBevel;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    bvlTool1: TBevel;
    btbtnCancelar: TBitBtn;
    btbtnSalvar: TBitBtn;
    bvlTool2: TBevel;
    btbtnFechar: TBitBtn;
    Bevel4: TBevel;
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
