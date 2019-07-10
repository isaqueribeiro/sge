unit UGeInutilizarNumeroNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB,
  IBQuery, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeInutilizarNumeroNFe = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCNPJ: TLabel;
    lblRazaoSocial: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblHoraEmissao: TLabel;
    dbCNPJ: TDBEdit;
    dbRazaoSocial: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbHoraEmissao: TDBEdit;
    Bevel1: TBevel;
    GrpBxDadosInutilizacao: TGroupBox;
    lblUsuario: TLabel;
    lblDataHora: TLabel;
    lblJustificativa: TLabel;
    dbJustificativa: TMemo;
    dbUsuario: TEdit;
    dbDataHora: TEdit;
    Bevel2: TBevel;
    lblInforme: TLabel;
    dtsEmpresa: TDataSource;
    lblAno: TLabel;
    edAno: TEdit;
    lblModelo: TLabel;
    dbModelo: TDBEdit;
    lblNumeroInicial: TLabel;
    edNumeroInicial: TEdit;
    lblNumeroFinal: TLabel;
    edNumeroFinal: TEdit;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    qryEmpresa: TFDQuery;
    qryEmpresaCNPJ: TStringField;
    qryEmpresaRZSOC: TStringField;
    qryEmpresaSERIE_NFE: TSmallintField;
    qryEmpresaNUMERO_NFE: TIntegerField;
    qryEmpresaLOTE_ANO_NFE: TSmallintField;
    qryEmpresaLOTE_NUM_NFE: TIntegerField;
    qryEmpresaMODELO_NFE: TIntegerField;
    qryNFeEmitida: TFDQuery;
    cdsLOG: TFDQuery;
    cdsLOGUSUARIO: TStringField;
    cdsLOGDATA_HORA: TSQLTimeStampField;
    cdsLOGEMPRESA: TStringField;
    cdsLOGTIPO: TSmallintField;
    cdsLOGDESCRICAO: TStringField;
    cdsLOGESPECIFICACAO: TMemoField;
    updLOG: TFDUpdateSQL;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure qryEmpresaXXXXMODELO_NFEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryEmpresaCNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    procedure Auditar;
    procedure AtualizarContadorNota;

    function IntervaloValido(iSerie, iInicio, iFinal : Integer; var sRetorno : String) : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBEMPRESA
  - TBCONFIGURACAO
  - TBVENDAS
  - TBCOMPRAS
  - TBLOG_TRANSACAO

  Views:

  Procedures:

*)

var
  frmGeInutilizarNumeroNFe: TfrmGeInutilizarNumeroNFe;

implementation

uses UDMBusiness, UDMNFe, UConstantesDGE, UDMRecursos;

{$R *.dfm}

procedure TfrmGeInutilizarNumeroNFe.AtualizarContadorNota;
var
  aScriptSQL       : TStringList;
  aNUmeroNFEEmitida,
  aNovoNUmeroNFE   : Currency;
begin
  aScriptSQL        := TStringList.Create;
  aNUmeroNFEEmitida := qryEmpresa.FieldByName('NUMERO_NFE').AsCurrency;
  aNovoNUmeroNFE    := StrToCurrDef(Trim(edNumeroFinal.Text), 0) + 1;

  try
    if (aNUmeroNFEEmitida < aNovoNUmeroNFE) then
    begin
      aScriptSQL.BeginUpdate;
      aScriptSQL.Clear;
      aScriptSQL.Add('Update TBCONFIGURACAO Set ');
      aScriptSQL.Add('    nfe_numero = ' + CurrToStr(aNovoNUmeroNFE));
      aScriptSQL.Add('  , nfe_lote   = ' + CurrToStr(aNovoNUmeroNFE));
      aScriptSQL.Add('where empresa  = ' + QuotedStr(qryEmpresa.FieldByName('CNPJ').AsString));
      aScriptSQL.EndUpdate;

      ExecuteScriptSQL(aScriptSQL.Text);
    end;
  finally
    aScriptSQL.Free;
  end;
end;

procedure TfrmGeInutilizarNumeroNFe.Auditar;
begin
  dbUsuario.Text  := Trim(GetUserApp);
  dbDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
end;

procedure TfrmGeInutilizarNumeroNFe.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeInutilizarNumeroNFe.FormCreate(Sender: TObject);
begin
  inherited;
  
  with qryEmpresa do
  begin
    Close;
    ParamByName('cnpj').AsString := gUsuarioLogado.Empresa;
    Open;
  end;

  Auditar;
  edAno.Text := FormatDateTime('yyyy', Date);
end;

procedure TfrmGeInutilizarNumeroNFe.btnConfirmarClick(Sender: TObject);
var
  sJustific,
  sRetorno ,
  sFileXML : String;
  iAno       ,
  iModelo    ,
  iSerie     ,
  iNroInicial,
  iNroFinal  : Integer;
begin
  iAno        := StrToIntDef(Trim(edAno.Text), 0);
  iModelo     := StrToIntDef(Trim(dbModelo.Text), 0);
  iSerie      := StrToIntDef(Trim(dbSerie.Text), 0);
  iNroInicial := StrToIntDef(Trim(edNumeroInicial.Text), 0);
  iNroFinal   := StrToIntDef(Trim(edNumeroFinal.Text), 0);
  sJustific   := Trim(dbJustificativa.Lines.Text);

  if (iAno <= 0) or (iNroInicial <= 0) or (iNroFinal <= 0) then
    ShowError('Os valores dos campos "Ano", "Número Inicial" e "Número Final" não podem possuir dados negativos ou zerados!')
  else
  if ( iNroFinal < iNroInicial ) then
    ShowError('O valor do campo "Número Final" não pode ser menor que valor do campo "Número Inicial"!')
  else
  if ( (iNroInicial > qryEmpresaNUMERO_NFE.AsInteger) or (iNroFinal > qryEmpresaNUMERO_NFE.AsInteger) ) then
    ShowError('A inutilização não pode ocorrer em numerações ainda não utilizadas pelo sistema!')
  else
  if ( Length(Trim(dbJustificativa.Lines.Text)) < 15 ) then
  begin
    ShowWarning('A justificativa de inutilização de numerações de NF-e deve possuir 15 caracteres no mínimo.');
    dbJustificativa.SetFocus;
  end
  else
  if not IntervaloValido(iSerie, iNroInicial, iNroFinal, sRetorno) then
    ShowWarning('O intervalo informado para inutilização é inválido:' + #13#13 + 'Motivo:' + #13 + sRetorno)
  else
  if ShowConfirm('Confirma a initilização do intervalor de numeração de NF-e informado?') then
  begin

    if not DMNFe.GetValidadeCertificado(gUsuarioLogado.Empresa) then
      Exit;

    sRetorno := EmptyStr;
    sFileXML := EmptyStr;
    if DMNFe.InutilizaNumeroNFeACBr(gUsuarioLogado.Empresa, iAno, iModelo, iSerie, iNroInicial, iNroFinal, sJustific, sRetorno, sFileXML ) then
    begin

      with cdsLOG do
      begin
        Auditar;

        Open;
        Append;

        cdsLOGEMPRESA.AsString       := gUsuarioLogado.Empresa;
        cdsLOGUSUARIO.AsString       := dbUsuario.Text;
        cdsLOGDATA_HORA.AsDateTime   := Now;
        cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
        cdsLOGDESCRICAO.AsString     := DESC_LOG_INUTILIZA_NRO_NFE;
        cdsLOGESPECIFICACAO.AsString := sRetorno;

        Post;
        ApplyUpdates;
        CommitUpdates;

        CommitTransaction;

        AtualizarContadorNota;

        ShowInformation('Informação', 'Inutilização do(s) número(s) informado(s) realizada com sucesso!');

        DMNFe.ACBrNFe.InutNFe.LerXML(sFileXML);
        DMNFe.ACBrNFe.ImprimirInutilizacao;

        ModalResult := mrOk;
      end;

    end;

  end;
end;

procedure TfrmGeInutilizarNumeroNFe.ApenasNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmGeInutilizarNumeroNFe.qryEmpresaCNPJGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if StrIsCNPJ(Sender.AsString) then
    Text := StrFormatarCnpj(Sender.AsString)
  else
  if StrIsCPF(Sender.AsString) then
    Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeInutilizarNumeroNFe.qryEmpresaXXXXMODELO_NFEGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := IntToStr(MODELO_NFE);
end;

function TfrmGeInutilizarNumeroNFe.IntervaloValido(iSerie, iInicio,
  iFinal: Integer; var sRetorno : String): Boolean;
begin
  with qryNFeEmitida do
  begin
    Close;
    ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
    ParamByName('serie').AsInteger  := iSerie;
    ParamByName('inicio').AsInteger := iInicio;
    ParamByName('final').AsInteger  := iFinal;
    Open;

    Result := IsEmpty;

    if (not Result) then
    begin
      sRetorno := 'º Nota(s) emitida(s) : ';

      First;
      while not Eof do
      begin
        sRetorno := sRetorno +
          FormatFloat('0000000"/"', FieldByName('nfe').AsInteger) +
          FieldByName('serie').AsString + '(' + Trim(FieldByName('tipo').AsString) + '), ';

        Next;
      end;

      sRetorno := Copy(Trim(sRetorno), 1, Length(Trim(sRetorno)) - 1);
    end;
  end;

end;

procedure TfrmGeInutilizarNumeroNFe.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeInutilizarNumeroNFe', TfrmGeInutilizarNumeroNFe);

end.
