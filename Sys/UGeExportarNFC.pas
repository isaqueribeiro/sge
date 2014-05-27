unit UGeExportarNFC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, rxToolEdit, ExtCtrls, Buttons, DB,
  IBCustomDataSet;

type
  TfrmGeExportarNFC = class(TfrmGrPadrao)
    GrpBxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    edDataInicial: TDateEdit;
    edDataFinal: TDateEdit;
    chkNFeAtiva: TCheckBox;
    Bevel8: TBevel;
    PnlBotoes: TPanel;
    Bevel3: TBevel;
    lblInforme: TLabel;
    btnExportar: TBitBtn;
    btnCancelar: TBitBtn;
    cdsCompetencia: TIBDataSet;
    edCompetencia: TComboBox;
    cdsCompetenciaCMP_NUM: TIntegerField;
    cdsCompetenciaCMP_DESC: TIBStringField;
    lblCompetencia: TLabel;
    GrpBxTipoArquivo: TRadioGroup;
    Bevel1: TBevel;
    lblDiretorioExportacao: TLabel;
    Bevel2: TBevel;
    edDiretorioExportacao: TDirectoryEdit;
    cdsNFC: TIBDataSet;
    cdsNFCTIPO: TIBStringField;
    cdsNFCLINHA: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure MontarPeriodoClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarCompetencias;

    function GetTipoArquivo : Integer;
    function ExportarNFC : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;

    property TipoArquivo : Integer read GetTipoArquivo;
  end;

var
  frmGeExportarNFC: TfrmGeExportarNFC;

implementation

uses
  UConstantesDGE, UDMBusiness, DateUtils, IniFiles;

{$R *.dfm}

{ TfrmGeExportarNFC }

procedure TfrmGeExportarNFC.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeExportarNFC.FormCreate(Sender: TObject);
begin
  edDataInicial.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  edDataFinal.Date   := StrToDate(FormatFloat('00', DaysInMonth(GetDateDB)) + FormatDateTime('/mm/yyyy', GetDateDB));

  inherited;

  CarregarCompetencias;
  edDiretorioExportacao.Text := FileINI.ReadString('Exportacao', 'NFC', EmptyStr);
  MontarPeriodoClick( edCompetencia );
end;

procedure TfrmGeExportarNFC.CarregarCompetencias;
begin
  with cdsCompetencia do
  begin
    Close;
    ParamByName('empresa').AsString := GetEmpresaIDDefault;
    Open;

    edCompetencia.Items.Clear;
    while not Eof do
    begin
      edCompetencia.Items.Add(cdsCompetenciaCMP_DESC.AsString);
      Next;
    end;

    if (edCompetencia.Items.Count > 0) then
    begin
      edCompetencia.OnChange  := MontarPeriodoClick;
      edCompetencia.ItemIndex := (edCompetencia.Items.Count - 1);
    end;
  end;
end;

function TfrmGeExportarNFC.ExportarNFC: Boolean;
var
  sArquivo : String;
  Arquivo  : TStringList;
begin
  edDiretorioExportacao.Text := Trim(edDiretorioExportacao.Text);

  if Copy(edDiretorioExportacao.Text, Length(edDiretorioExportacao.Text), 1) <> '\' then
    edDiretorioExportacao.Text := edDiretorioExportacao.Text + '\';

  ForceDirectories(edDiretorioExportacao.Text);

  btnExportar.Enabled := False;
  btnCancelar.Enabled := False;

  Arquivo  := TStringList.Create;
  sArquivo := edDiretorioExportacao.Text +
    GetEmpresaIDDefault + '_' +
    StringReplace(StringReplace(edCompetencia.Text, '/', '-', [rfReplaceAll]), '\', '-', [rfReplaceAll]) +
    '.txt';

  try

    try
      FileINI.WriteString('Exportacao', 'NFC', edDiretorioExportacao.Text);
      FileINI.UpdateFile;

      lblInforme.Visible := True;

      if cdsNFC.IsEmpty then
        Exit;

      Arquivo.BeginUpdate;

      cdsNFC.First;

      while not cdsNFC.Eof do
      begin
        Application.ProcessMessages;
        Arquivo.Add( Trim(cdsNFCLINHA.AsString) );

        lblInforme.Caption := Trim(cdsNFCLINHA.AsString) + ' . . .' + #13 +
          FormatFloat('0.###"%"', (cdsNFC.RecNo / lblInforme.Tag * 100));
        lblInforme.Update;

        cdsNFC.Next;
      end;

      Arquivo.SaveToFile(sArquivo);

      Result := FileExists(sArquivo);
    except
      On E : Exception do
      begin
        lblInforme.Visible := False;
        Result := False;
        ShowError('Erro ao tentar gerar arquivos de exportação das Noas Fiscais!' + #13#13 + E.Message);
      end;
    end;

  finally
    btnExportar.Enabled := True;
    btnCancelar.Enabled := True;
  end;
end;

procedure TfrmGeExportarNFC.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeExportarNFC.MontarPeriodoClick(Sender: TObject);
var
  sCompetencia : String;
begin
  if cdsCompetencia.Locate('CMP_DESC', edCompetencia.Text, []) then
  begin
    sCompetencia      := cdsCompetenciaCMP_NUM.AsString;
    edCompetencia.Tag := cdsCompetenciaCMP_NUM.AsInteger;

    edDataInicial.Date := StrToDate('01/' + Copy(sCompetencia, 5, 2) + '/' + Copy(sCompetencia, 1, 4));
    edDataFinal.Date   := StrToDate(FormatFloat('00', DaysInMonth(edDataInicial.Date)) + FormatDateTime('/mm/yyyy', edDataInicial.Date));
  end;
end;

function TfrmGeExportarNFC.GetTipoArquivo: Integer;
begin
  Result := (GrpBxTipoArquivo.ItemIndex + 1);
end;

procedure TfrmGeExportarNFC.btnExportarClick(Sender: TObject);
begin
  if ( edCompetencia.ItemIndex < 0 ) then
    ShowWarning('Favor informar a competência!')
  else
  if ( Trim(edDiretorioExportacao.Text) = EmptyStr ) then
    ShowWarning('Favor informa o diretório para a exportação dos arquivos de NFe!')
  else
  if ( not DirectoryExists(Trim(edDiretorioExportacao.Text)) ) then
    ShowWarning('Diretório informado não existe!')
  else
    with cdsNFC do
    begin

      Close;

      ParamByName('data_inicial').AsDate    := edDataInicial.Date;
      ParamByName('data_final').AsDate      := edDataFinal.Date;
      ParamByName('tipo_arquivo').AsInteger := TipoArquivo;
      ParamByName('empresa').AsString       := GetEmpresaIDDefault;
      ParamByName('status_venda').AsInteger := STATUS_VND_NFE;

      Open;

      Last;
      lblInforme.Tag := RecordCount;

      if IsEmpty then
        ShowWarning('Não existem Notas Fiscais Eletrônicas emitidas na competência informada!')
      else
      if ShowConfirm('Confirma a exportação das notas encontradas na competência informada?', 'Exportar NFC') then
        if ExportarNFC then
        begin
          ShowInformation('Dados exportados com sucesso!');
          ModalResult := mrOk;
        end;
    end;
end;

initialization
  FormFunction.RegisterForm('frmGeExportarNFC', TfrmGeExportarNFC);

end.
