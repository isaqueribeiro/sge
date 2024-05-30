unit UGrPadraoImpressao;

interface

uses
  UGrPadrao,
  Interacao.Versao,
  Controller.Versao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  dxGDIPlusClasses, frxClass, frxExportRTF, frxExportXLS, frxExportPDF, frxExportMail,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White,
  dxSkinsDefaultPainters;

type
  TfrmGrPadraoImpressao = class(TfrmGrPadrao)
    Bevel1: TBevel;
    Bevel3: TBevel;
    pnlBanner: TPanel;
    pnlRelatorio: TPanel;
    GrpBxRelatorio: TGroupBox;
    lblRelatorio: TLabel;
    edRelatorio: TComboBox;
    Bevel4: TBevel;
    GrpBxFiltro: TGroupBox;
    imgBanner: TImage;
    tlbBotoes: TPanel;
    Bevel2: TBevel;
    btnVisualizar: TcxButton;
    bvlTool4: TBevel;
    procedure frGetValue(const VarName: String; var Value: Variant);
    procedure edRelatorioChange(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ver : IVersao;
    _frReport: TfrxReport;
    _PeriodoRelatorio ,
    _SubTituloRelario : String;
    _Todos ,
    _ApenasConsolidado : Boolean;
    _Filtros : String;
    procedure PadronizarNomeListaRelatorio;
    procedure SetVariablesDefault(const pFastReport : TfrxReport);

    function GetTituloRelario : String;
  public
    { Public declarations }
    property frReport : TfrxReport read _frReport write _frReport;
    property TituloRelario : String read GetTituloRelario;
    property SubTituloRelario : String read _SubTituloRelario write _SubTituloRelario;
    property PeriodoRelatorio : String read _PeriodoRelatorio write _PeriodoRelatorio;
    property Todos : Boolean read _Todos write _Todos;
    property ApenasConsolidado : Boolean read _ApenasConsolidado write _ApenasConsolidado;
    property Filtros : String read _Filtros write _Filtros;

    procedure RegistrarRotinaSistema; override;
    procedure CarregarDadosEmpresa; virtual;
  end;

var
  frmGrPadraoImpressao: TfrmGrPadraoImpressao;

implementation

uses
  UConstantesDGE, UFuncoes, UDMBusiness, UDMRecursos, UDMNFe;

{$R *.dfm}

const
  CATEGORY_VAR = 'Local';
  VAR_TITLE    = 'Titulo';
  VAR_SUBTITLE = 'SubTitulo';
  VAR_PERIODO  = 'Periodo';
  VAR_TODOS    = 'Todos';
  VAR_APENASCONSOLIDADO = 'ApenasConsolidado';
  VAR_SYSTEM            = 'Sistema';
  VAR_SYSTEM_CODE       = 'SistemaCodigo';
  VAR_USER              = 'Usuario';
  VAR_EMPRESA           = 'Entidade';
  VAR_DEPARTAMENTO      = 'Depto';
  VAR_FILTROS           = 'Filtros';

procedure TfrmGrPadraoImpressao.edRelatorioChange(Sender: TObject);
begin
  btnVisualizar.Enabled := (edRelatorio.ItemIndex > -1);
end;

procedure TfrmGrPadraoImpressao.frGetValue(const VarName: String;
  var Value: Variant);
begin
  if ( VarName = VAR_TITLE ) then
    Value := AnsiUpperCase(TituloRelario);

  if ( VarName = VAR_SUBTITLE ) then
    Value := SubTituloRelario;

  if ( VarName = VAR_PERIODO ) then
    Value := PeriodoRelatorio;

  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - vers�o ' + ver.FileVersion;

  if ( VarName = VAR_SYSTEM_CODE ) then
    Value := gSistema.Codigo;

  if ( VarName = VAR_USER ) then
    Value := GetUserApp;

  if ( VarName = VAR_EMPRESA ) then
    Value := GetEmpresaNomeDefault;

  if ( VarName = VAR_DEPARTAMENTO ) then
    Value := EmptyStr;

  if ( VarName = VAR_FILTROS ) then
    Value := Filtros;

  if ( VarName = VAR_TODOS ) then
    if ( Todos ) then
      Value := 1
    else
      Value := 0;

  if ( VarName = VAR_APENASCONSOLIDADO ) then
    if ( ApenasConsolidado ) then
      Value := 1
    else
      Value := 0;
end;

procedure TfrmGrPadraoImpressao.btnVisualizarClick(Sender: TObject);
begin
  WaitAMoment(WAIT_AMOMENT_PrintPrepare);
  try
    if not Assigned(_frReport) then
    begin
      WaitAMomentFree;
      ShowError('Objeto de relat�rio n�o instanciado!');
    end
    else
    begin
      with frReport do
      begin
        CarregarDadosEmpresa;

        SetVariablesDefault(frReport);

        ReportOptions.Author := ver.CompanyName;
        ReportOptions.Name   := TituloRelario;

        OnGetValue := frGetValue;

        PrepareReport;
        WaitAMomentFree;
        ShowReport;
      end;
    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TfrmGrPadraoImpressao.PadronizarNomeListaRelatorio;
var
  S : String;
  I : Integer;
begin
  for I := 0 to edRelatorio.Items.Count - 1 do
  begin
    S := Trim(edRelatorio.Items.Strings[I]);
    if not StrIsInteger(Copy(S, 1, 2)) then
      edRelatorio.Items.Strings[I] := FormatFloat('00" - "', I + 1) + S;
  end;
end;

procedure TfrmGrPadraoImpressao.FormCreate(Sender: TObject);
begin
  inherited;
  ver := TVersaoController.GetInstance();

  PeriodoRelatorio := EmptyStr;
  SubTituloRelario := EmptyStr;

  Filtros := '(Nenhum)';
  Todos   := False;
  ApenasConsolidado := False;

  PadronizarNomeListaRelatorio;

  if (edRelatorio.Items.Count > 0) then
    edRelatorio.ItemIndex := 0
  else
    edRelatorio.ItemIndex := -1;

  DMNFe.AbrirEmitente(GetEmpresaIDDefault);
end;

procedure TfrmGrPadraoImpressao.SetVariablesDefault(
  const pFastReport: TfrxReport);

  function VariableExist(VariableName : String) : Boolean;
  begin
    Result := (frReport.Variables.IndexOf(VariableName) > -1);
  end;

begin
  if Assigned(frReport) then
  begin
    if (frReport.ReportOptions.Name) = EmptyStr then
      frReport.ReportOptions.Name := Application.Title;

    if (frReport.ReportOptions.Author) = EmptyStr then
      frReport.ReportOptions.Author := GetUserApp;

    if ( not VariableExist(CATEGORY_VAR) ) then
      frReport.Variables.AddVariable(EmptyStr, CATEGORY_VAR, null);

    if ( not VariableExist(VAR_TITLE) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_TITLE, TituloRelario);

    if ( not VariableExist(VAR_SUBTITLE) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_SUBTITLE, EmptyStr);

    if ( not VariableExist(VAR_PERIODO) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_PERIODO, EmptyStr);

    if ( not VariableExist(VAR_EMPRESA) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_EMPRESA, GetEmpresaNomeDefault);

    if ( not VariableExist(VAR_USER) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_USER, GetUserApp);

    if ( not VariableExist(VAR_DEPARTAMENTO) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_DEPARTAMENTO, EmptyStr);

    if ( not VariableExist(VAR_FILTROS) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_FILTROS, Filtros);

    if ( not VariableExist(VAR_TODOS) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_TODOS, 1);

    if ( not VariableExist(VAR_APENASCONSOLIDADO) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_APENASCONSOLIDADO, 0);

    if ( not VariableExist(VAR_SYSTEM) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_SYSTEM, Application.Title + ' - vers�o ' + ver.FileVersion);

    if ( not VariableExist(VAR_SYSTEM_CODE) ) then
      frReport.Variables.AddVariable(CATEGORY_VAR, VAR_SYSTEM_CODE, gSistema.Codigo);
  end;
end;

function TfrmGrPadraoImpressao.GetTituloRelario: String;
begin
  Result := Trim(Copy(edRelatorio.Text, pos('-', edRelatorio.Text) + 1, Length(edRelatorio.Text)));
end;

procedure TfrmGrPadraoImpressao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_ESCAPE ) then
    ModalResult := mrCancel;
end;

procedure TfrmGrPadraoImpressao.RegistrarRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
    SetRotinaSistema(ROTINA_TIPO_TELA, RotinaID, Trim(Self.Caption), RotinaPaiID);
end;

procedure TfrmGrPadraoImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(GetEmpresaIDDefault);
      DMBusiness.ConfigurarEmail(gUsuarioLogado.Empresa, EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGrPadraoImpressao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SetEmpresaIDDefault(gUsuarioLogado.Empresa);
end;

end.
