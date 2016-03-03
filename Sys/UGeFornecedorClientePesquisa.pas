unit UGeFornecedorClientePesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadraoPesquisa, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls;

type
  TTipoEmissorCheque = (tecNenhum, tecFornecedor, tecCliente);
  TfrmGeFornecedorClientePesquisa = class(TfrmGrPadraoPesquisa)
    bvlBotoes2: TBevel;
    pnlBotoes: TPanel;
    Bevel2: TBevel;
    bvlTool4: TBevel;
    btnSelecionar: TcxButton;
    btnFechar: TcxButton;
    bvlBotoes1: TBevel;
    QryPesquisaTIPO: TIntegerField;
    QryPesquisaID: TIBStringField;
    QryPesquisaCODIGO: TIntegerField;
    QryPesquisaNOME: TIBStringField;
    QryPesquisaCNPJ: TIBStringField;
    QryPesquisaPF: TSmallintField;
    QryPesquisaATIVO: TSmallintField;
    procedure QryPesquisaTIPOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QryPesquisaCNPJGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure QryPesquisaATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QryPesquisaAfterScroll(DataSet: TDataSet);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PermitirSelecao;
    function ExecutarPesquisa : Boolean; override;
  end;

  function SelecionarFornecedorCliente(const AOnwer : TComponent;
    var pTipoEmissor : TTipoEmissorCheque;
    var pCodigo : Integer; var pNome, pCnpj : String) : Boolean;

implementation

{$R *.dfm}

uses
  UConstantesDGE, UDMRecursos, UDMBusiness;

function SelecionarFornecedorCliente(const AOnwer : TComponent;
  var pTipoEmissor : TTipoEmissorCheque;
  var pCodigo : Integer; var pNome, pCnpj : String) : Boolean;
var
  AForm : TfrmGeFornecedorClientePesquisa;
begin
  AForm := TfrmGeFornecedorClientePesquisa.Create(AOnwer);
  try
    Result := (AForm.ShowModal = mrOk);
    if Result then
    begin
      pTipoEmissor := TTipoEmissorCheque(AForm.QryPesquisaTIPO.AsInteger);
      pCodigo      := AForm.QryPesquisaCODIGO.AsInteger;
      pNome        := AForm.QryPesquisaNOME.AsString;
      pCnpj        := AForm.QryPesquisaCNPJ.AsString;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeFornecedorClientePesquisa.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeFornecedorClientePesquisa.btnSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TfrmGeFornecedorClientePesquisa.ExecutarPesquisa: Boolean;
var
  bRetorno : Boolean;
  sSQL : Array [1..2] of String;
begin
  bRetorno := False;
  WaitAMoment(WAIT_AMOMENT_LoadData);
  try
    try
      edPesquisar.Text := StringReplace(Trim(edPesquisar.Text), ' ', '%', [rfReplaceAll]);

      sSQL[1] := '(1 = 1)';
      sSQL[2] := '(1 = 1)';

      if StrIsInteger(edPesquisar.Text) then
      begin
        sSQL[1] := sSQL[1] + ' and (f.codforn = ' + edPesquisar.Text + ')';
        sSQL[2] := sSQL[2] + ' and (c.codigo  = ' + edPesquisar.Text + ')';
      end
      else
      if ( StrIsCPF(edPesquisar.Text) or StrIsCNPJ(edPesquisar.Text) ) then
      begin
        sSQL[1] := sSQL[1] + ' and (f.cnpj = ' + StrOnlyNumbers(edPesquisar.Text) + ')';
        sSQL[2] := sSQL[2] + ' and (c.cnpj = ' + StrOnlyNumbers(edPesquisar.Text) + ')';
      end
      else
      begin
        sSQL[1] := sSQL[1] + ' and ((f.nomeforn like ' + QuotedStr(edPesquisar.Text + '%') + ') or (f.nomefant like ' + QuotedStr(edPesquisar.Text + '%') + '))';
        sSQL[2] := sSQL[2] + ' and ((c.nome like '     + QuotedStr(edPesquisar.Text + '%') + ') or (c.nomefant like ' + QuotedStr(edPesquisar.Text + '%') + '))';
      end;

      QryPesquisa.Close;
      QryPesquisa.SQL.Clear;
      QryPesquisa.SQL.AddStrings( SQLSelect );
      QryPesquisa.SQL.Text := StringReplace(QryPesquisa.SQL.Text, '1=1', '(' + sSQL[1] + ')', [rfReplaceAll]);
      QryPesquisa.SQL.Text := StringReplace(QryPesquisa.SQL.Text, '2=2', '(' + sSQL[2] + ')', [rfReplaceAll]);
      QryPesquisa.Open;

      bRetorno := not QryPesquisa.IsEmpty;
    except
      On E : Exception do
        ShowErrorNotify(Self, E);
    end;
  finally
    WaitAMomentFree;
    Result := bRetorno;
  end;
end;

procedure TfrmGeFornecedorClientePesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID := EmptyStr;
end;

procedure TfrmGeFornecedorClientePesquisa.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_F2 ) then
    if btnSelecionar.Visible and btnSelecionar.Enabled then
      btnSelecionar.Click;
end;

procedure TfrmGeFornecedorClientePesquisa.PermitirSelecao;
begin
  btnSelecionar.Enabled := (QryPesquisaATIVO.AsInteger = 1);
end;

procedure TfrmGeFornecedorClientePesquisa.QryPesquisaAfterScroll(
  DataSet: TDataSet);
begin
  PermitirSelecao;
end;

procedure TfrmGeFornecedorClientePesquisa.QryPesquisaATIVOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

procedure TfrmGeFornecedorClientePesquisa.QryPesquisaCNPJGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if ( Sender.DataSet.FieldByName('pf').AsInteger = 1 ) then
      Text := StrFormatarCpf(Trim(Sender.AsString))
    else
      Text := StrFormatarCnpj(Trim(Sender.AsString));
  end;
end;

procedure TfrmGeFornecedorClientePesquisa.QryPesquisaTIPOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    1 : Text := 'Fornecedor';
    2 : Text := 'Cliente';
  end;
end;

end.
