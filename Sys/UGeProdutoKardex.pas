unit UGeProdutoKardex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoPesquisa, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, Mask, JvToolEdit, JvExMask, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeProdutoKardex = class(TfrmGrPadraoPesquisa)
    lblData: TLabel;
    lblProduto: TLabel;
    edProduto: TJvComboEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    fdQryPesquisaCODEMPRESA: TStringField;
    fdQryPesquisaCODPROD: TStringField;
    fdQryPesquisaDOC: TStringField;
    fdQryPesquisaHISTORICO: TStringField;
    fdQryPesquisaDTHIST: TSQLTimeStampField;
    fdQryPesquisaQTDEATUAL: TBCDField;
    fdQryPesquisaQTDENOVA: TBCDField;
    fdQryPesquisaQTDEFINAL: TBCDField;
    fdQryPesquisaUNIDADE: TStringField;
    fdQryPesquisaRESP: TStringField;
    fdQryPesquisaMOTIVO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure edProdutoButtonClick(Sender: TObject);
    procedure edProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

(*
  Tabelas:
  - TBPRODHIST
  - TBPRODUTO
  - TBUNIDADEPROD

  Views:

  Procedures:

*)

var
  frmGeProdutoKardex: TfrmGeProdutoKardex;

implementation

uses
  UDMBusiness, UConstantesDGE, UGrPadrao, UGeProduto;

{$R *.dfm}

{ TfrmGeProdutoKardex }

function TfrmGeProdutoKardex.ExecutarPesquisa: Boolean;
var
  sDataInicial,
  sDataFinal  : String;
begin
  if (edProduto.Tag = 0) then
  begin
    ShowWarning('Favor selecionar o produto/serviço para pesquisa de histórico no período informado.');
    Exit;
  end;

  Screen.Cursor := crSQLWait;
  try
    sDataInicial     := FormatDateTime('yyyy-mm-dd', StrToDateDef(e1Data.Text, Date)) + ' 00:00:00';
    sDataFinal       := FormatDateTime('yyyy-mm-dd', StrToDateDef(e2Data.Text, Date)) + ' 23:59:59';
    edPesquisar.Text := Trim(edPesquisar.Text);

    fdQryPesquisa.Close;

    with fdQryPesquisa do
    begin
      SQL.Clear;
      SQL.AddStrings( SQLSelect );
      SQL.Add('where ph.codprod = ' + QuotedStr(Trim(Copy(edProduto.Text, 1, Pos('-', edProduto.Text) - 1))));
      SQL.Add('  and ph.dthist between ' + QuotedStr(sDataInicial) + ' and ' + QuotedStr(sDataFinal));
      SQL.Add('  and ph.historico like ' + QuotedStr(Trim(edPesquisar.Text) + '%'));
      SQL.Add('order by ph.dthist');
    end;

    fdQryPesquisa.Open;

    Result := not fdQryPesquisa.IsEmpty;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGeProdutoKardex.FormCreate(Sender: TObject);
begin
  inherited;
  e1Data.Date := Date - 30;
  e2Data.Date := Date;
end;

procedure TfrmGeProdutoKardex.edProdutoButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCodigo ,
  sNome   : String;
begin
  if SelecionarProduto(Self, iCodigo, sCodigo, sNome) then
  begin
    edProduto.Tag  := iCodigo;
    edProduto.Text := sCodigo + ' - ' + sNome;
  end;
end;

procedure TfrmGeProdutoKardex.edProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TfrmGeProdutoKardex.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) or ((Shift = [ssCtrl]) and (Key = SYS_KEY_L)) Then
  begin
    if ( edProduto.Focused ) then
    begin
      edProduto.Tag  := 0;
      edProduto.Text := EmptyStr;
    end;
  end;

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeProdutoKardex', TfrmGeProdutoKardex);

end.
