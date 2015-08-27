unit UGeExportarChaveNFeGerada;

interface

uses
  UGrPadrao,
  
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, jpeg,
  cxGraphics, dxGDIPlusClasses, cxLookAndFeelPainters, cxButtons,
  cxControls, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMemo, StdCtrls, DBClient, Provider, IBCustomDataSet, IBQuery,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Mask, cxLookAndFeels, dxSkinsForm,
  JvExMask, JvToolEdit, 

  dxSkinsCore, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxNavigator;

type
  TfrmGeExportarChaveNFeGerada = class(TfrmGrPadrao)
    GrpBxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    chkNFeCancelada: TCheckBox;
    Bevel8: TBevel;
    PnlBotoes: TPanel;
    Bevel3: TBevel;
    lblInforme: TLabel;
    Bevel2: TBevel;
    lblDiretorioExportacao: TLabel;
    Bevel1: TBevel;
    GrdExpTBL: TcxGridDBTableView;
    GrdExpLvl: TcxGridLevel;
    GrdExp: TcxGrid;
    qryChaveNFe: TIBQuery;
    dspChaveNFe: TDataSetProvider;
    cdsChaveNFe: TClientDataSet;
    cdsChaveNFeNUMERONFE: TIntegerField;
    dtsChaveNFe: TDataSource;
    GrdExpTBLNUMERONFE: TcxGridDBColumn;
    GrdExpTBLSERIE: TcxGridDBColumn;
    GrdExpTBLEMISSAO: TcxGridDBColumn;
    GrdExpTBLCHAVENFE: TcxGridDBColumn;
    GrdExpTBLXML: TcxGridDBColumn;
    btnExportar: TcxButton;
    btnCancelar: TcxButton;
    edDataInicial: TJvDateEdit;
    edDataFinal: TJvDateEdit;
    edDiretorioExportacao: TJvDirectoryEdit;
    cdsChaveNFeSERIE: TWideStringField;
    cdsChaveNFeEMISSAO: TDateField;
    cdsChaveNFeCHAVENFE: TWideStringField;
    cdsChaveNFeXML: TWideMemoField;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure chkNFeCanceladaClick(Sender: TObject);
    procedure edDataInicialChange(Sender: TObject);
  private
    { Private declarations }
    FSQLChaveNFE : TStringList;
    procedure CarregarChaveNFe;
    function ExportarChaveNFe(const NomeArquivo : String) : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeExportarChaveNFeGerada: TfrmGeExportarChaveNFeGerada;

implementation

uses
  UDMBusiness, DateUtils, IniFiles, cxGridExportLink, UDMRecursos;

{$R *.dfm}

procedure TfrmGeExportarChaveNFeGerada.FormCreate(Sender: TObject);
begin
  inherited;
  FSQLChaveNFE := TStringList.Create;
  FSQLChaveNFE.AddStrings( qryChaveNFe.SQL );

  edDataInicial.OnChange := nil;
  edDataFinal.OnChange   := nil;

  edDataInicial.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  edDataFinal.Date   := StrToDate(FormatFloat('00', DaysInMonth(GetDateDB)) + FormatDateTime('/mm/yyyy', GetDateDB));
  edDiretorioExportacao.Text := FileINI.ReadString('Exportacao', 'NFe', EmptyStr);

  edDataInicial.OnChange := edDataInicialChange;
  edDataFinal.OnChange   := edDataInicialChange;

  CarregarChaveNFe;
end;

procedure TfrmGeExportarChaveNFeGerada.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmGeExportarChaveNFeGerada.ExportarChaveNFe(const NomeArquivo : String): Boolean;
begin
  if FileExists(NomeArquivo) then
    DeleteFile(NomeArquivo);

  ExportGridToExcel(NomeArquivo, GrdExp);

  Result := FileExists(NomeArquivo);
end;

procedure TfrmGeExportarChaveNFeGerada.btnExportarClick(Sender: TObject);
var
  sNomeArquivo : String;
const
  NOME_ARQUIVO = 'Chaves_NFe %s a %s%s.xls';
begin
  if ( Length(Trim(edDataInicial.Text)) < 10 ) then
    ShowWarning('Favor informar a data inicial!')
  else
  if ( Length(Trim(edDataFinal.Text)) < 10 ) then
    ShowWarning('Favor informar a data Final!')
  else
  if ( Trim(edDiretorioExportacao.Text) = EmptyStr ) then
    ShowWarning('Favor informa o diretório para a exportação da planilha de Chaves NFe!')
  else
  if ( not DirectoryExists(Trim(edDiretorioExportacao.Text)) ) then
    ShowWarning('Diretório informado não existe!')
  else
  begin

    CarregarChaveNFe;

    cdsChaveNFe.Last;
    lblInforme.Tag := cdsChaveNFe.RecordCount;

    if cdsChaveNFe.IsEmpty then
      ShowWarning('Não existem chaves de Notas Fiscais Eletrônicas emitidas no período informado!')
    else
    if ShowConfirm('Confirma a exportação das chaves de notas encontradas no período informado?', 'Exportar NF-e') then
    begin
      if Copy(Trim(edDiretorioExportacao.Text), Length(Trim(edDiretorioExportacao.Text)), 1) = '\' then
        sNomeArquivo := Trim(edDiretorioExportacao.Text) +
          Format(NOME_ARQUIVO, [FormatDateTime('dd-mm-yyyy', edDataInicial.Date), FormatDateTime('dd-mm-yyyy', edDataFinal.Date), IfThen(chkNFeCancelada.Checked, ' (Canceladas)', EmptyStr)])
      else
        sNomeArquivo := Trim(edDiretorioExportacao.Text) + '\' + 
          Format(NOME_ARQUIVO, [FormatDateTime('dd-mm-yyyy', edDataInicial.Date), FormatDateTime('dd-mm-yyyy', edDataFinal.Date), IfThen(chkNFeCancelada.Checked, ' (Canceladas)', EmptyStr)]);

      if ExportarChaveNFe(sNomeArquivo) then
      begin
        ShowInformation('Dados exportados com sucesso!');
        ModalResult := mrOk;
      end;
    end;
      
  end;
end;

procedure TfrmGeExportarChaveNFeGerada.CarregarChaveNFe;
begin
  with qryChaveNFe, SQL do
  begin
    cdsChaveNFe.Close;

    Clear;
    AddStrings( FSQLChaveNFE );
    Add('where (nf.empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ')');
    Add('and nf.dataemissao between ' +
      QuotedStr(FormatDateTime('yyyy-mm-dd', edDataInicial.Date)) + ' and ' +
      QuotedStr(FormatDateTime('yyyy-mm-dd', edDataFinal.Date)) );

    if chkNFeCancelada.Checked then
      Add('  and ((vn.status = ' + IntToStr(STATUS_VND_CAN) + ') or (cm.status = ' + IntToStr(STATUS_CMP_NFE) + '))');

    cdsChaveNFe.Open;
  end;
end;

procedure TfrmGeExportarChaveNFeGerada.chkNFeCanceladaClick(
  Sender: TObject);
begin
  CarregarChaveNFe;
end;

procedure TfrmGeExportarChaveNFeGerada.edDataInicialChange(
  Sender: TObject);
var
  D : TDateTime;
begin
  if TryStrToDate(TJvDateEdit(Sender).Text, D) then
    CarregarChaveNFe;
end;

procedure TfrmGeExportarChaveNFeGerada.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeExportarChaveNFeGerada', TfrmGeExportarChaveNFeGerada);

end.
