unit UGeExportarNFeGerada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, rxToolEdit, ExtCtrls, DB, IBCustomDataSet,
  Buttons;

type
  TfrmGeExportarNFeGerada = class(TfrmGrPadrao)
    GrpBxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edDataInicial: TDateEdit;
    edDataFinal: TDateEdit;
    lblDataFinal: TLabel;
    Bevel8: TBevel;
    GrpBxTipoNFe: TRadioGroup;
    Bevel1: TBevel;
    lblDiretorioExportacao: TLabel;
    Bevel2: TBevel;
    PnlBotoes: TPanel;
    Bevel3: TBevel;
    btnExportar: TBitBtn;
    btnCancelar: TBitBtn;
    lblInforme: TLabel;
    cdsNFe: TIBDataSet;
    cdsNFeSERIE: TIBStringField;
    cdsNFeNUMERO: TIntegerField;
    cdsNFeDATAEMISSAO: TDateField;
    cdsNFeHORAEMISSAO: TTimeField;
    cdsNFeXML_FILENAME: TIBStringField;
    cdsNFeXML_FILE: TMemoField;
    cdsNFeANOVENDA: TSmallintField;
    cdsNFeNUMVENDA: TIntegerField;
    cdsNFeANOCOMPRA: TSmallintField;
    cdsNFeNUMCOMPRA: TIntegerField;
    cdsNFeSAIDA: TIntegerField;
    cdsNFeENTRADA: TIntegerField;
    edDiretorioExportacao: TDirectoryEdit;
    chkNFeCancelada: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
  private
    { Private declarations }

    function ExportarNFe : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeExportarNFeGerada: TfrmGeExportarNFeGerada;

implementation

uses
  UDMBusiness, DateUtils, IniFiles, xmldom, XMLIntf, msxmldom, XMLDoc, UConstantesDGE;

{$R *.dfm}

procedure TfrmGeExportarNFeGerada.FormCreate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  edDataFinal.Date   := StrToDate(FormatFloat('00', DaysInMonth(GetDateDB)) + FormatDateTime('/mm/yyyy', GetDateDB));
  edDiretorioExportacao.Text := FileINI.ReadString('Exportacao', 'NFe', EmptyStr);
end;

procedure TfrmGeExportarNFeGerada.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeExportarNFeGerada.btnExportarClick(Sender: TObject);
begin
  if ( Length(Trim(edDataInicial.Text)) < 10 ) then
    ShowWarning('Favor informar a data inicial!')
  else
  if ( Length(Trim(edDataFinal.Text)) < 10 ) then
    ShowWarning('Favor informar a data Final!')
  else
  if ( Trim(edDiretorioExportacao.Text) = EmptyStr ) then
    ShowWarning('Favor informa o diretório para a exportação dos arquivos de NFe!')
  else
  if ( not DirectoryExists(Trim(edDiretorioExportacao.Text)) ) then
    ShowWarning('Diretório informado não existe!')
  else
    with cdsNFe do
    begin

      Close;

      ParamByName('data_inicial').AsDate := edDataInicial.Date;
      ParamByName('data_final').AsDate   := edDataFinal.Date;
      ParamByName('todas').AsInteger     := 0;
      ParamByName('entradas').AsInteger  := 0;
      ParamByName('saidas').AsInteger    := 0;
      ParamByName('empresa').AsString    := GetEmpresaIDDefault;

      Case GrpBxTipoNFe.ItemIndex of
        0 : ParamByName('todas').AsInteger    := 1;
        1 : ParamByName('entradas').AsInteger := 1;
        2 : ParamByName('saidas').AsInteger   := 1;
      end;

      Open;

      Last;
      lblInforme.Tag := RecordCount;

      if IsEmpty then
        ShowWarning('Não existem Notas Fiscais Eletrônicas emitidas no período informado!')
      else
      if ShowConfirm('Confirma a exportação das notas encontradas no período informado?', 'Exportar NF-e') then
        if ExportarNFe then
        begin
          ShowInformation('Dados exportados com sucesso!');
          ModalResult := mrOk;
        end;
    end;
end;

function TfrmGeExportarNFeGerada.ExportarNFe: Boolean;

  procedure SaveFileXML(const Value : String);
  var
    XML : TXMLDocument;
  begin

    try
      XML := TXMLDocument.Create(Application);

      XML.XML.Add( StringReplace(cdsNFeXML_FILE.AsString, NFE_TAG_PROTNFE_ERROR, NFE_TAG_PROTNFE_FEET, [rfReplaceAll]) );
      XML.Active := True;
      XML.SaveToFile(Value);
      XML.Active := False;
    finally
      FreeAndNil(XML);
    end;

  end;

var
  sPastaEntradas,
  sPastaSaidas  ,
  sFileNameNFe  : String;
begin
  edDiretorioExportacao.Text := Trim(edDiretorioExportacao.Text);

  if Copy(edDiretorioExportacao.Text, Length(edDiretorioExportacao.Text), 1) <> '\' then
    edDiretorioExportacao.Text := edDiretorioExportacao.Text + '\';

  sPastaEntradas := edDiretorioExportacao.Text + 'Entradas\';
  sPastaSaidas   := edDiretorioExportacao.Text + 'Saidas\';

  ForceDirectories(sPastaEntradas);
  ForceDirectories(sPastaSaidas);

  btnExportar.Enabled := False;
  btnCancelar.Enabled := False;

  try

    try
      FileINI.WriteString('Exportacao', 'NFe', edDiretorioExportacao.Text);
      FileINI.UpdateFile;
  
      lblInforme.Visible := True;
  
      if cdsNFe.IsEmpty then
        Exit;
  
      cdsNFe.First;
      while not cdsNFe.Eof do
      begin
        Application.ProcessMessages;
  
        if ( cdsNFeENTRADA.AsInteger = 1 ) then
          sFileNameNFe := sPastaEntradas + Trim(cdsNFeXML_FILENAME.AsString)
        else
        if ( cdsNFeSAIDA.AsInteger = 1 ) then
          sFileNameNFe := sPastaSaidas + Trim(cdsNFeXML_FILENAME.AsString);

        SaveFileXML( sFileNameNFe );
  
        lblInforme.Caption := Trim(cdsNFeXML_FILENAME.AsString) + ' . . .' + #13 +
          FormatFloat('0.###"%"', (cdsNFe.RecNo / lblInforme.Tag * 100));
        lblInforme.Update;
  
        cdsNFe.Next;
      end;
  
      Result := True;
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

procedure TfrmGeExportarNFeGerada.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeExportarNFeGerada', TfrmGeExportarNFeGerada);

end.
 