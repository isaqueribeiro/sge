unit UGeFluxoCaixaImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadraoImpressao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, Vcl.ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.Mask, JvExMask, JvToolEdit;

type
  TfrmGeFluxoCaixaImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    QryEmpresas: TIBQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    lblContaCorrente: TLabel;
    edContaCorrente: TComboBox;
    lblData: TLabel;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    QryContaCorrente: TIBQuery;
    DspContaCorrente: TDataSetProvider;
    CdsContaCorrente: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edEmpresaChange(Sender: TObject);
  private
    { Private declarations }
    IEmpresa : Array of String;
    IConta   : Array of Integer;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarContaCorrente(const pEmpresa : String);
  public
    { Public declarations }
  end;

var
  frmGeFluxoCaixaImpressao: TfrmGeFluxoCaixaImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness, DateUtils, UDMNFe;

{$R *.dfm}

{ TfrmGeFluxoCaixaImpressao }

procedure TfrmGeFluxoCaixaImpressao.CarregarContaCorrente(
  const pEmpresa: String);
var
  I : Integer;
begin
  with CdsContaCorrente do
  begin
    Close;
    ParamByName('empresa').AsString := pEmpresa;
    Open;

    edContaCorrente.Clear;
    SetLength(IConta, RecordCount + 1);

    edContaCorrente.Items.Add( '(Todas)' );
    IConta[0] := 0;
    I := 1;

    while not Eof do
    begin
      edContaCorrente.Items.Add( FieldByName('descricao').AsString + ' [' + Trim(FieldByName('tipo_desc').AsString) + ']' );
      IConta[I] := FieldByName('codigo').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edContaCorrente.ItemIndex := 0;
end;

procedure TfrmGeFluxoCaixaImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeFluxoCaixaImpressao.CarregarEmpresa;
var
  P ,
  I : Integer;
begin
  with CdsEmpresas do
  begin
    Open;

    edEmpresa.Clear;
    SetLength(IEmpresa, RecordCount);

    P := 0;
    I := 0;

    while not Eof do
    begin
      edEmpresa.Items.Add( FieldByName('rzsoc').AsString );
      IEmpresa[I] := Trim(FieldByName('cnpj').AsString);

      if ( IEmpresa[I] = gUsuarioLogado.Empresa ) then
        P := I;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edEmpresa.ItemIndex := P;
end;

procedure TfrmGeFluxoCaixaImpressao.edEmpresaChange(Sender: TObject);
begin
  if ( edEmpresa.ItemIndex > -1 ) then
    CarregarContaCorrente(IEmpresa[edEmpresa.ItemIndex]);
end;

procedure TfrmGeFluxoCaixaImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;

  inherited;

end;

procedure TfrmGeFluxoCaixaImpressao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarEmpresa;
  CarregarContaCorrente(gUsuarioLogado.Empresa);
end;

initialization
  FormFunction.RegisterForm('frmGeFluxoCaixaImpressao', TfrmGeFluxoCaixaImpressao);

end.
