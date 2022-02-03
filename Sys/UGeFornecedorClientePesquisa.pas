unit UGeFornecedorClientePesquisa;

interface

uses
  UGrPadraoPesquisa,
  UConstantesDGE,
  Model.Constantes,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinsDefaultPainters;

type
  TfrmGeFornecedorClientePesquisa = class(TfrmGrPadraoPesquisa)
    bvlBotoes2: TBevel;
    pnlBotoes: TPanel;
    Bevel2: TBevel;
    bvlTool4: TBevel;
    btnSelecionar: TcxButton;
    btnFechar: TcxButton;
    bvlBotoes1: TBevel;
    fdQryPesquisaTIPO: TIntegerField;
    fdQryPesquisaID: TStringField;
    fdQryPesquisaCODIGO: TIntegerField;
    fdQryPesquisaNOME: TStringField;
    fdQryPesquisaCNPJ: TStringField;
    fdQryPesquisaPF: TSmallintField;
    fdQryPesquisaATIVO: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fdQryPesquisaTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryPesquisaCNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryPesquisaATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryPesquisaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PermitirSelecao;
    function ExecutarPesquisa : Boolean; override;
  end;

(*
  Tabelas:
  - TBCLIENTE
  - TBFORNECEDOR

  Views:

  Procedures:

*)

  function SelecionarFornecedorCliente(const AOnwer : TComponent;
    var pTipoEmissor : TTipoEmissorCheque;
    var pCodigo : Integer; var pNome, pCnpj : String) : Boolean;

implementation

{$R *.dfm}

uses
  UDMRecursos, UDMBusiness;

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
      pTipoEmissor := TTipoEmissorCheque(AForm.fdQryPesquisaTIPO.AsInteger);
      pCodigo      := AForm.fdQryPesquisaCODIGO.AsInteger;
      pNome        := AForm.fdQryPesquisaNOME.AsString;
      pCnpj        := AForm.fdQryPesquisaCNPJ.AsString;
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

      fdQryPesquisa.Close;
      fdQryPesquisa.SQL.Clear;
      fdQryPesquisa.SQL.AddStrings( SQLSelect );
      fdQryPesquisa.SQL.Text := StringReplace(fdQryPesquisa.SQL.Text, '1=1', '(' + sSQL[1] + ')', [rfReplaceAll]);
      fdQryPesquisa.SQL.Text := StringReplace(fdQryPesquisa.SQL.Text, '2=2', '(' + sSQL[2] + ')', [rfReplaceAll]);
      fdQryPesquisa.Open;

      bRetorno := not fdQryPesquisa.IsEmpty;
    except
      On E : Exception do
        ShowErrorNotify(Self, E);
    end;
  finally
    WaitAMomentFree;
    Result := bRetorno;
  end;
end;

procedure TfrmGeFornecedorClientePesquisa.fdQryPesquisaAfterScroll(DataSet: TDataSet);
begin
  PermitirSelecao;
end;

procedure TfrmGeFornecedorClientePesquisa.fdQryPesquisaATIVOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

procedure TfrmGeFornecedorClientePesquisa.fdQryPesquisaCNPJGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if ( Sender.DataSet.FieldByName('pf').AsInteger = 1 ) then
      Text := StrFormatarCpf(Trim(Sender.AsString))
    else
      Text := StrFormatarCnpj(Trim(Sender.AsString));
  end;
end;

procedure TfrmGeFornecedorClientePesquisa.fdQryPesquisaTIPOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    1 : Text := 'Fornecedor';
    2 : Text := 'Cliente';
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
  btnSelecionar.Enabled := (fdQryPesquisaATIVO.AsInteger = 1);
end;

end.
