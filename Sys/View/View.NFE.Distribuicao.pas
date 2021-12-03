unit View.NFE.Distribuicao;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,
  Datasnap.DBClient,

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  cxControls,
  cxStyles,
  cxEdit,
  cxDBLookupComboBox,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  cxVGrid,
  cxDBVGrid,
  cxInplaceContainer,
  cxGridLevel,
  dxLayoutContainer,
  cxGridInplaceEditForm,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxGridCustomView,
  cxGrid,

  UGrPadrao,
  SGE.Controller.Interfaces,
  UObserverInterface,
  UGrPadraoCadastro,
  Interacao.Tabela,
  Controller.Tabela,
  UConstantesDGE,

  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges, cxDBData, cxImageComboBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, cxClasses, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TViewNFEDistribuicao = class(TfrmGrPadrao)
    dtsEmpresa: TDataSource;
    GrpBxEmpresa: TGroupBox;
    lblCNPJEmpresa: TLabel;
    lblRazaoSocialEmpresa: TLabel;
    dbCNPJEmpresa: TDBEdit;
    dbRazaoSocialEmpresa: TDBEdit;
    PanelBotoes: TPanel;
    Bevel3: TBevel;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    Bevel1: TBevel;
    cdsDocumentos: TClientDataSet;
    dtsDocumentos: TDataSource;
    cdsDocumentosChave: TStringField;
    cdsDocumentosSerie: TStringField;
    cdsDocumentosNumero: TStringField;
    cdsDocumentosProtocolo: TStringField;
    cdsDocumentosCNPJ: TStringField;
    cdsDocumentosNome: TStringField;
    cdsDocumentosIEstadual: TStringField;
    cdsDocumentosNSU: TStringField;
    cdsDocumentosEmissao: TDateTimeField;
    cdsDocumentosValor: TCurrencyField;
    cdsDocumentosTipoNFe: TSmallintField;
    cdsDocumentosSituacao: TSmallintField;
    GrdDocumentosLvl: TcxGridLevel;
    GrdDocumentos: TcxGrid;
    GrdDocumentosDBTableView: TcxGridDBBandedTableView;
    GrdDocumentosDBTableViewChave: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewSerie: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewNumero: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewProtocolo: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewCNPJ: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewNome: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewIEstadual: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewNSU: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewEmissao: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewValor: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewTipoNFe: TcxGridDBBandedColumn;
    GrdDocumentosDBTableViewSituacao: TcxGridDBBandedColumn;
    StyleRepository: TcxStyleRepository;
    StyleSelecao: TcxStyle;
    StyleContent: TcxStyle;
    StyleContentEven: TcxStyle;
    cxStyleHeader: TcxStyle;
    cdsDocumentosUF: TStringField;
    cdsNSU: TFDQuery;
    lblUltimoNSU: TLabel;
    edtUltimoNSU: TEdit;
    lblQtdeNotas: TLabel;
    lblProximoNSU: TLabel;
    edtProximoNSU: TEdit;
    procedure fdQryEmpresaCNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  strict private
    class var _instance : TViewNFEDistribuicao;
  private
    { Private declarations }
    FControllerEmpresaView : IControllerCustom;

    procedure CarregarEmpresa(const aEmpresa : String);
    procedure CarregarDocumentos;

    function getNSUImportados(const aEmpresa : String) : String;
    function GetUltimoNSUImportado(const aEmpresa : String) : Integer;
    function Empresa : IControllerEmpresa;
  public
    { Public declarations }
    class function getInstance(const aEmpresa : String) : TViewNFEDistribuicao;
    class function &End(var aCNPJEmissor, aUFEmissor, aChave, aNSU : String) : Boolean;

    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBNFE_IMPORTADA

  Views:
  - VW_EMPRESA

  Procedures:
*)

implementation

{$R *.dfm}

uses
  System.Generics.Collections,
  UDMRecursos,
  UDMBusiness,
  UDMNFe,
  Classe.DistribuicaoDFe.DocumentoRetornado,
  SGE.Controller.Factory,
  SGE.Controller;

{ TfrmDistribuicaoDFe }

function TViewNFEDistribuicao.Empresa: IControllerEmpresa;
begin
  if (not Assigned(FControllerEmpresaView)) then
    FControllerEmpresaView := TControllerFactory.New.EmpresaView;

  Result := (FControllerEmpresaView as IControllerEmpresa);
end;

class function TViewNFEDistribuicao.&End(var aCNPJEmissor, aUFEmissor, aChave, aNSU : String): Boolean;
begin
  _instance.edtUltimoNSU.Text := aNSU.Trim;
  Result := (_instance.ShowModal = mrOk);
  if Result then
  begin
    aCNPJEmissor := _instance.cdsDocumentosCNPJ.AsString;
    aUFEmissor   := _instance.cdsDocumentosUF.AsString;
    aChave       := _instance.cdsDocumentosChave.AsString;
    aNSU         := _instance.cdsDocumentosNSU.AsString;
  end;
end;

procedure TViewNFEDistribuicao.fdQryEmpresaCNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := StrFormatarCnpj(Sender.AsString);
end;

procedure TViewNFEDistribuicao.btnConfirmarClick(Sender: TObject);
begin
  if (cdsDocumentos.RecordCount > 0) then
    ModalResult := mrOk;
end;

procedure TViewNFEDistribuicao.CarregarDocumentos;
var
  aFileXML ,
  aRetorno : String;
  aNSU ,
  aMaiorNSU : Int64;
  aDocumento  : TDistribuicaoDFeDocumentoRetornado;
  aDocumentos : TDictionary<String, TDistribuicaoDFeDocumentoRetornado>;
begin
  aNSU := StrToInt64Def(edtUltimoNSU.Text, 0);
  aMaiorNSU := 0;
  aDocumentos := TDictionary<String, TDistribuicaoDFeDocumentoRetornado>.Create;

  if cdsDocumentos.Active then
  begin
    cdsDocumentos.EmptyDataSet;
    cdsDocumentos.Close;
  end;

  cdsDocumentos.CreateDataSet;

  if not DMNFe.ExisteNFeParaBaixar(gUsuarioLogado.Empresa, aNSU, aFileXML, aRetorno, aDocumentos) then
    GrdDocumentosDBTableView.OptionsView.NoDataToDisplayInfoText := aRetorno.ToUpper
  else
  begin
    for aDocumento in aDocumentos.Values do
    begin
      if (not aDocumento.Chave.IsEmpty) and (not aDocumento.CNPJ.IsEmpty) then
      begin
        cdsDocumentos.Append;
        cdsDocumentosChave.AsString     := aDocumento.Chave;
        cdsDocumentosSerie.AsString     := aDocumento.Serie;
        cdsDocumentosNumero.AsString    := aDocumento.Numero;
        cdsDocumentosProtocolo.AsString := aDocumento.Protocolo;
        cdsDocumentosCNPJ.AsString      := StrFormatarCnpj(aDocumento.CNPJ);
        cdsDocumentosNome.AsString      := aDocumento.Nome;
        cdsDocumentosIEstadual.AsString := aDocumento.IEst;
        cdsDocumentosUF.AsString        := aDocumento.UF;
        cdsDocumentosNSU.AsString       := aDocumento.NSU;
        cdsDocumentosEmissao.AsDateTime := aDocumento.Emissao;
        cdsDocumentosValor.AsCurrency   := aDocumento.Valor;
        cdsDocumentosTipoNFe.Value      := Ord(aDocumento.TipoNFe);
        cdsDocumentosSituacao.Value     := Ord(aDocumento.Situacao);
        cdsDocumentos.Post;

        if (StrToInt64Def(cdsDocumentosNSU.AsString, 0) > aMaiorNSU) then
          aMaiorNSU := StrToInt64Def(cdsDocumentosNSU.AsString, 0);
      end;

      aDocumentos.Remove(aDocumento.Chave);
      aDocumento.DisposeOf;
    end;

    aDocumentos.TrimExcess;
    aDocumentos.DisposeOf;

    cdsDocumentos.First;

    lblQtdeNotas.Caption := Format('%d NOTA(S) NO LOTE DE DISTRIBUI��O', [cdsDocumentos.RecordCount]);
    edtUltimoNSU.Text    := FormatFloat('000000000000000', aNSU + 1);
    edtProximoNSU.Text   := FormatFloat('000000000000000', aMaiorNSU);
    DMNFe.SetNumeroNSUPesquisado(gUsuarioLogado.Empresa, edtUltimoNSU.Text);
  end;
end;

procedure TViewNFEDistribuicao.CarregarEmpresa(const aEmpresa : String);
begin
  if not Empresa.DAO.DataSet.Locate('cnpj', aEmpresa, []) then
    raise Exception.Create('Empresa n�o identificada!');
end;

procedure TViewNFEDistribuicao.FormCreate(Sender: TObject);
begin
  FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  inherited;
  edtUltimoNSU.Text  := '0';
  edtProximoNSU.Text := '0';

  dtsEmpresa.DataSet := FControllerEmpresaView.DAO.DataSet;
end;

procedure TViewNFEDistribuicao.FormShow(Sender: TObject);
begin
  WaitAMoment(WAIT_AMOMENT_TextoLivre, 'Buscando documentos fiscais...');
  try
    CarregarDocumentos;
    btnConfirmar.Enabled := (cdsDocumentos.RecordCount > 0);
  finally
    WaitAMomentFree;
  end;
end;

class function TViewNFEDistribuicao.getInstance(const aEmpresa : String): TViewNFEDistribuicao;
begin
  if not Assigned(_instance) then
    Application.CreateForm(TViewNFEDistribuicao, _instance);

  _instance.CarregarEmpresa(aEmpresa);

  Result := _instance;
end;

function TViewNFEDistribuicao.getNSUImportados(const aEmpresa : String): String;
var
  aRetorno : String;
begin
  aRetorno := QuotedStr('000000000000000');
  try
    cdsNSU.Close;
    cdsNSU.ParamByName('empresa').AsString := aEmpresa;
    cdsNSU.ParamByName('todos').AsInteger  := 1;
    cdsNSU.ParamByName('maximo').AsInteger := 0;
    cdsNSU.Open;

    while not cdsNSU.Eof do
    begin
      aRetorno := aRetorno + ' , ' + QuotedStr(Trim(cdsNSU.FieldByName('nsu').AsString));
      cdsNSU.Next;
    end;

    cdsNSU.Close;
  finally
    Result := aRetorno;
  end;
end;

function TViewNFEDistribuicao.GetUltimoNSUImportado(const aEmpresa: String): Integer;
var
  aRetorno : Integer;
begin
  aRetorno := 0;
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  max(nsu) as nsu');
      SQL.Add('from TBNFE_IMPORTADA');
      SQL.Add('where (empresa = ' + QuotedStr(aEmpresa) + ')');
      Open;

      aRetorno := StrToIntDef(FieldByName('nsu').AsString, 0);

      Close;
    end;
  finally
    Result := aRetorno;
  end;
end;

procedure TViewNFEDistribuicao.RegistrarRotinaSistema;
begin
  ;
end;

//initialization
//  FormFunction.RegisterForm('frmDistribuicaoDFe', TfrmDistribuicaoDFe);
//
end.