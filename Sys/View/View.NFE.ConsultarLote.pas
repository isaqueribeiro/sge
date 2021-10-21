unit View.NFE.ConsultarLote;

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
  Datasnap.Provider,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  UGrPadrao,
  SGE.Controller.Interfaces;

type
  TTipoMovimento = (tmNFeEntrada, tmNFeSaida, tmNull);
  TViewNFEConsultarLote = class(TfrmGrPadrao)
    dtsEmpresa: TDataSource;
    GrpBxControle: TGroupBox;
    lblCNPJ: TLabel;
    lblRazaoSocial: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblHoraEmissao: TLabel;
    lblModelo: TLabel;
    dbCNPJ: TDBEdit;
    dbRazaoSocial: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbHoraEmissao: TDBEdit;
    dbModelo: TDBEdit;
    Bevel1: TBevel;
    GrpBxDadosLote: TGroupBox;
    lblUsuario: TLabel;
    lblDataHora: TLabel;
    lblJustificativa: TLabel;
    lblAno: TLabel;
    lblNumeroLote: TLabel;
    lblNumeroRecibo: TLabel;
    edJustificativa: TMemo;
    dbUsuario: TEdit;
    dbDataHora: TEdit;
    edAno: TEdit;
    edNumeroLote: TEdit;
    edNumeroRecibo: TEdit;
    Bevel2: TBevel;
    lblInforme: TLabel;
    lblChaveNFe: TLabel;
    edChaveNFe: TEdit;
    lblProtocoloTMP: TLabel;
    edProtocoloTMP: TEdit;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    procedure ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure CnpjGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FControllerEmpresaView,
    FControllerLog : IControllerCustom;

    FTipoMovimento : TTipoMovimento;
    FAguardandoRetorno : Boolean;
    FSerieNFe  ,
    FNumeroNFe : Integer;
    FFileNameXML : String;
    procedure Auditar;
    procedure CarregarEmpresa(const sCnpj : String);
    procedure CarregarLotePendente(const sCnpjEmitente, sRecibo : String);

    function PesquisarLote(const aAno, aNumero : Integer; const sRecibo : String; var Ano, Controle : Integer; var Destinaratio : String) : Boolean;
    function ConfirmarRetorno(var Denegada : Boolean; var DenegadaMotivo : String) : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function BuscarRetornoReciboNFe(const AOnwer : TComponent; const sEmpresa, sRecibo : String;
    var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE : String;
    var TipoMovimento : TTipoMovimento;
    var Denegada : Boolean;
    var DenegadaMotivo : String) : Boolean;

(*
  Tabelas:
  - TBEMPRESA
  - TBCONFIGURACAO
  - TBVENDAS
  - TBCOMRAS
  - TBNFE_ENVIADA
  - TBLOG_TRANSACAO
  - TBCLIENTE
  - TBFORNECEDOR

  Views:

  Procedures:

*)

implementation

uses
  UDMNFe,
  UConstantesDGE,
  UFuncoes,
  UDMRecursos,
  SGE.Controller,
  SGE.Controller.Helper,
  SGE.Controller.Factory,
  Service.Message,
  Service.Utils,
  Controller.Tabela;

{$R *.dfm}

{*
  IMR - 08/12/2015 :
    Criação do atributo "FAguardandoRetorno" para gerenciar a execução automática
    e espera do retorno de uma consulta de recibo quando esta é iniciada pelo
    processo de geração de NF-e no Controle de Vendas.
*}

function BuscarRetornoReciboNFe(const AOnwer : TComponent; const sEmpresa, sRecibo : String;
  var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE : String;
  var TipoMovimento : TTipoMovimento;
  var Denegada : Boolean;
  var DenegadaMotivo : String) : Boolean;
var
  AForm : TViewNFEConsultarLote;
begin
  WaitAMoment(WAIT_AMOMENT_MakerConsulta);
  AForm := TViewNFEConsultarLote.Create(AOnwer);
  try
    with AForm do
    begin
      FAguardandoRetorno := True;

      CarregarEmpresa(sEmpresa);
      CarregarLotePendente(sEmpresa, sRecibo);

      edJustificativa.Lines.Clear;
      edJustificativa.Lines.Text := 'Busca automática de retorno do recibo de envio da NF-e';
      edNumeroRecibo.Text        := sRecibo;

      Result := ConfirmarRetorno(Denegada, DenegadaMotivo);

      if Result then
      begin
        SerieNFe      := FSerieNFe;
        NumeroNFe     := FNumeroNFe;
        ChaveNFE      := Trim(edChaveNFe.Text);
        ProtocoloNFE  := Trim(edProtocoloTMP.Text);
        FileNameXML   := FFileNameXML;
        TipoMovimento := FTipoMovimento;
      end;
    end;
  finally
    AForm.Free;
    WaitAMomentFree;
  end;
end;

{ TfrmGeConsultarLoteNFe }

procedure TViewNFEConsultarLote.Auditar;
begin
  dbUsuario.Text  := FControllerEmpresaView.DAO.Usuario.Login;
  dbDataHora.Text := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
end;

procedure TViewNFEConsultarLote.FormCreate(Sender: TObject);
begin
  FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  FControllerLog := TControllerFactory.New.LogTransacao;

  inherited;
  CarregarEmpresa(FControllerEmpresaView.DAO.Usuario.Empresa.CNPJ);

  dtsEmpresa.DataSet := FControllerEmpresaView.DAO.DataSet;

  Auditar;

  FTipoMovimento     := tmNull;
  FAguardandoRetorno := False;
  FSerieNFe     := 0;
  FNumeroNFe    := 0;
  FFileNameXML  := EmptyStr;
end;

procedure TViewNFEConsultarLote.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewNFEConsultarLote.ApenasNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TViewNFEConsultarLote.FormShow(Sender: TObject);
begin
  inherited;
  if not FAguardandoRetorno then
    CarregarLotePendente(FControllerEmpresaView.DAO.Usuario.Empresa.CNPJ, EmptyStr);

  if FAguardandoRetorno then
  begin
    lblInforme.Caption := 'Iniciando busca junto a SEFA. Aguarde!';
    lblInforme.Visible := True;
    Application.ProcessMessages;
    Sleep(144);

    btnConfirmar.Click;
  end;
end;

function TViewNFEConsultarLote.PesquisarLote(const aAno, aNumero: Integer;
  const sRecibo: String; var Ano, Controle : Integer; var Destinaratio : String): Boolean;
var
  aLote : IControllerXML_NFeEnviada;
  aLoteEnvioNFE : TLoteEnvioNFE;
begin
  Result := False;
  try
    aLote := TControllerFactory.New.XML_NFeEnviada;

    aLoteEnvioNFE.Ano    := StrToIntDef(Trim(edAno.Text), 0);
    aLoteEnvioNFE.Numero := StrToIntDef(Trim(edNumeroLote.Text), 0);

    Result := not aLote.PesquisarLote(dbCNPJ.Field.AsString, edNumeroRecibo.Text, aLoteEnvioNFE).DataSet.IsEmpty;

    if Result then
      with aLote.DAO.DataSet do
      begin
        FTipoMovimento := TTipoMovimento(FieldByName('TipoNFE').AsInteger);
        Ano            := FieldByName('Ano').AsInteger;
        Controle       := FieldByName('Numero').AsInteger;
        Destinaratio   := FieldByName('Destinatario').AsString;

        edAno.Text          := FieldByName('Ano').AsString;
        edNumeroLote.Text   := FieldByName('Lote').AsString;
        edNumeroRecibo.Text := FieldByName('Recibo').AsString;
      end;
  except
    On E : Exception do
      TServiceMessage.ShowError('Erro ao tentar consultar lote.' + #13#13 + E.Message);
  end;
end;

procedure TViewNFEConsultarLote.btnConfirmarClick(Sender: TObject);
//var
//  bTudo   ,
//  bLote   ,
//  bRecibo : Boolean;
//  iAnoMov ,
//  iCodMov : Integer;
//  sRetorno : String;
//
//  iSerieNFe  ,
//  iNumeroNFe ,
//  iTipoNFe   : Integer;
//  sMensagem        ,
//  sDestinatarioCNPJ,
//  sFileNameXML ,
//  sChaveNFE    ,
//  sProtocoloTMP,
//  sProtocoloNFE,
//  sReciboNFE   : String;
//  dDataEnvio   ,
//  dDataEmissao : TDateTime;
//const
//  NOME_ARQUIVO_XML = '%s-nfe.xml';
var
  aDenegada : Boolean;
  aDenegadaMotivo : String;
begin
  ConfirmarRetorno(aDenegada, aDenegadaMotivo);
//  btnConfirmar.Enabled := False;
//  lblInforme.Visible   := True;
//  try
//    if not GetConectedInternet then
//    begin
//      ShowWarning('Estação de trabalho sem acesso a Internet!');
//      Exit;
//    end;
//
//    if (Trim(edNumeroRecibo.Text) = EmptyStr) then
//      ShowInformation('Favor informar o Número do Recibo!')
//    else
//    if (Trim(edJustificativa.Lines.Text) = EmptyStr) then
//      ShowInformation('Favor informar a justificativa da consulta do recibo!')
//    else
//    begin
//
//      PesquisarLote(0, 0, Trim(edNumeroRecibo.Text), iAnoMov, iCodMov, sDestinatarioCNPJ);
//
//      if not DMNFe.GetValidadeCertificado(dbCNPJ.Field.AsString) then
//        Exit;
//
//      sRetorno := EmptyStr;
//
//      // Executar Consulta por Recibo para obter a Chave NF-e
//
//      lblInforme.Caption := 'Executando consulta do Recibo... Aguarde!';
//      lblInforme.Update;
//
//      if DMNFe.ConsultarNumeroLoteNFeACBr(dbCNPJ.Field.AsString, Trim(edNumeroRecibo.Text), sChaveNFE, sProtocoloTMP, sRetorno, dDataEnvio ) then
//      begin
//
//        edChaveNFe.Text     := Trim(sChaveNFE);
//        edProtocoloTMP.Text := Trim(sProtocoloTMP);
//
//        edJustificativa.Lines.Add('--');
//        edJustificativa.Lines.Add('Retorno:');
//        edJustificativa.Lines.Add('--');
//        edJustificativa.Lines.Add(sRetorno);
//
//        sFileNameXML := GetDiretorioNFe + Format(NOME_ARQUIVO_XML, [Trim(edChaveNFe.Text)]);
//        sMensagem    := 'Arquivo referenciado da NF-e:' + #13#13 + ExtractFileName(sFileNameXML);
//
//        // Executar Consulta por Chave NF-e para obter o arquivo e o Protocolo
//
//        lblInforme.Caption := 'Executando consulta da Chave NF-e... Aguarde!';
//        lblInforme.Update;
//
//        if ( DMNFe.ConsultarChaveNFeACBr(dbCNPJ.Field.AsString, sChaveNFE, iSerieNFe, iNumeroNFe, iTipoNFe,
//          sDestinatarioCNPJ, sFileNameXML, sChaveNFE, sProtocoloNFE, dDataEmissao) ) then
//        begin
//          FSerieNFe  := iSerieNFe;
//          FNumeroNFe := iNumeroNFe;
//          edProtocoloTMP.Text := Trim(sProtocoloNFE);
//          FFileNameXML        := sFileNameXML;
//
//          if not FAguardandoRetorno then
//          begin
//            sMensagem := sMensagem + #13#13 + 'Arquivo a processar:' + #13#13 + ExtractFileName(sFileNameXML);
//            ShowInformation( sMensagem );
//          end;
//
//          if FAguardandoRetorno then
//            ModalResult := mrOk;
//        end;
//
//      end
//      else
//        ShowWarning('Consulta de recibo/lote NF-e sem o retorno esperado!' + #13 + sRetorno);
//
//    end;
//  finally
//    btnConfirmar.Enabled := True;
//    lblInforme.Visible   := False;
//  end;
(*
  bTudo   := (Trim(edAno.Text) = EmptyStr) and (Trim(edNumeroLote.Text) = EmptyStr) and (Trim(edNumeroRecibo.Text) = EmptyStr);
  bLote   := ((Trim(edAno.Text) <> EmptyStr) and (Trim(edNumeroLote.Text) = EmptyStr))
    or ((Trim(edAno.Text) = EmptyStr) and (Trim(edNumeroLote.Text) <> EmptyStr));
  bRecibo := bLote and (Trim(edNumeroRecibo.Text) = EmptyStr);

  if bTudo then
    ShowInformation('Favor informar o Número do Lote e/ou Recibo!')
  else
  if bLote then
    ShowInformation('Favor informar o Ano/Número do Lote!')
  else
  if bRecibo then
    ShowInformation('Favor informar o Número do Recibo!')
  else
  if PesquisarLote(StrToIntDef(Trim(edAno.Text), 0), StrToIntDef(Trim(edNumeroLote.Text), 0), Trim(edNumeroRecibo.Text), iAnoMov, iCodMov, sDestinatarioCNPJ) then
  begin

    if ShowConfirm('Confirma a consulta do lote/recibo de NF-e informado?') then
    begin

      if not DMNFe.GetValidadeCertificado then
        Exit;

      sRetorno := EmptyStr;

      // Executar Consulta Lote e Consulta Chave NF-e

      if DMNFe.ConsultarNumeroLoteNFeACBr(dbCNPJ.Field.AsString, Trim(edNumeroRecibo.Text), sChaveNFE, sRetorno ) then
      begin

        if ( DMNFe.ConsultarChaveNFeACBr(dbCNPJ.Field.AsString, sChaveNFE, iSerieNFe, iNumeroNFe, iTipoNFe,
          sDestinatarioCNPJ, sFileNameXML, sChaveNFE, sProtocoloNFE, dDataEmissao) ) then
        begin

          with qryNFE do
          begin
            Close;
            ParamByName('empresa').AsString      := dbCNPJ.Field.AsString;

            ParamByName('tipo_compra').AsInteger := Ord(FTipoMovimento);
            ParamByName('anocompra').AsInteger   := iAnoMov;
            ParamByName('numcompra').AsInteger   := iCodMov;

            ParamByName('tipo_venda').AsInteger  := Ord(FTipoMovimento);
            ParamByName('anovenda').AsInteger    := iAnoMov;
            ParamByName('numvenda').AsInteger    := iCodMov;
            Open;

            if IsEmpty then
            begin
              Append;

              qryNFEEMPRESA.Value := dbCNPJ.Field.AsString;
              if ( FTipoMovimento = tmNFeEntrada ) then
              begin
                qryNFEANOCOMPRA.AsInteger := iAnoMov;
                qryNFENUMCOMPRA.AsInteger := iCodMov;
                qryNFEANOVENDA.Clear;
                qryNFENUMVENDA.Clear;
              end
              else
              if ( FTipoMovimento = tmNFeSaida ) then
              begin
                qryNFEANOVENDA.AsInteger := iAnoMov;
                qryNFENUMVENDA.AsInteger := iCodMov;
                qryNFEANOCOMPRA.Clear;
                qryNFENUMCOMPRA.Clear;
              end;

              qryNFESERIE.Value       := FormatFloat('#00', iSerieNFe);
              qryNFENUMERO.Value      := iNumeroNFe;
              qryNFEDATAEMISSAO.Value := dDataEmissao;
              qryNFEHORAEMISSAO.Value := StrToTime( FormatDateTime('hh:mm:ss', dDataEmissao) );
              qryNFECHAVE.Value     := sChaveNFE;
              qryNFEPROTOCOLO.Value := sProtocoloNFE;
              qryNFERECIBO.Value    := Trim(edNumeroRecibo.Text);
              qryNFELOTE_ANO.Value  := StrToInt(edAno.Text);
              qryNFELOTE_NUM.Value  := StrToInt(edNumeroLote.Text);

              if ( FileExists(sFileNameXML) ) then
              begin
                qryNFEXML_FILENAME.Value := ExtractFileName( sFileNameXML );
                qryNFEXML_FILE.LoadFromFile( sFileNameXML );
              end;

              Post;
              ApplyUpdates;

              CommitTransaction;

            end;
          end;

          ShowInformation('Lote/Recibo consultado e retorno processaod com sucesso.' + #13#13 + sRetorno);

        end;

      end
      else
      begin
        ShowWarning(sRetorno);

        if ShowConfirm('Consulta Recibo', 'Deseja desconsiderar este recibo para que seja enviada uma nova solicitação para emissão de NF-e?') then
        begin
          if ( FTipoMovimento = tmNFeEntrada ) then
          begin
            with DMBusiness, fdQryBusca do
            begin
              Close;
              SQL.Clear;
              SQL.Add('Update TBCOMPRAS Set LOTE_NFE_ANO = null, LOTE_NFE_NUMERO = null, LOTE_NFE_RECIBO = null');
              SQL.Add('where ANO = ' + qryNFEANOCOMPRA.AsString);
              SQL.Add('  and CODCONTROL = ' + qryNFENUMCOMPRA.AsString);
              ExecSQL;

              CommitTransaction;
            end;
          end
          else
          if ( FTipoMovimento = tmNFeSaida ) then
          begin
            with DMBusiness, fdQryBusca do
            begin
              Close;
              SQL.Clear;
              SQL.Add('Update TBVENDAS Set LOTE_NFE_ANO = null, LOTE_NFE_NUMERO = null, LOTE_NFE_RECIBO = null');
              SQL.Add('where ANO = ' + qryNFEANOVENDA.AsString);
              SQL.Add('  and CODCONTROL = ' + qryNFENUMVENDA.AsString);
              ExecSQL;

              CommitTransaction;
            end;
          end;
        end;
      end;

      // Gravar LOG

      with cdsLOG do
      begin
        Auditar;

        Open;
        Append;

        cdsLOGUSUARIO.AsString       := dbUsuario.Text;
        cdsLOGDATA_HORA.AsDateTime   := Now;
        cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
        cdsLOGDESCRICAO.AsString     := DESC_LOG_CONSULTAR_NRO_LOTE_NFE;
        cdsLOGESPECIFICACAO.AsString := sRetorno;

        Post;
        ApplyUpdates;
        CommitTransaction;

      end;

      ModalResult := mrOk;
    end;

  end
  else
    ShowInformation('Lote/Recibo não encontrado no sistema !');
*)

end;

procedure TViewNFEConsultarLote.CarregarEmpresa(const sCnpj: String);
begin
  FControllerEmpresaView.DAO.ClearWhere;
  FControllerEmpresaView
    .DAO
    .Where('e.cnpj = :cnpj')
    .ParamsByName('cnpj', sCnpj.Trim)
    .Open;

  FControllerEmpresaView.DAO.DataSet.FieldByName('cnpj').OnGetText := CnpjGetText;

  TTabelaController
    .New
    .Tabela(FControllerEmpresaView.DAO.DataSet)
    .Display('SERIE_NFE',    'Série NF-e',  '#00', TAlignment.taCenter)
    .Display('NUMERO_NFE',   'Última NF-e emitida',  '###0000000', TAlignment.taRightJustify)
    .Display('LOTE_NUM_NFE', 'Último Lote de envio', '###0000000', TAlignment.taRightJustify)
    .Configurar;
end;

procedure TViewNFEConsultarLote.CarregarLotePendente(
  const sCnpjEmitente, sRecibo: String);
var
  aNFeEnviada : IControllerXML_NFeEnviada;
begin
  aNFeEnviada := TControllerFactory.New.XML_NFeEnviada;

  with aNFeEnviada.ListaNFePendente(sCnpjEmitente, sRecibo) do
  begin
    if not DataSet.IsEmpty then
    begin
      edAno.Text          := DataSet.FieldByName('ANO').AsString;
      edNumeroLote.Text   := DataSet.FieldByName('LOTE').AsString;
      edNumeroRecibo.Text := DataSet.FieldByName('RECIBO').AsString;
      FTipoMovimento      := TTipoMovimento(DataSet.FieldByName('TIPONFE').AsInteger);
    end;
  end;
end;

procedure TViewNFEConsultarLote.CnpjGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  if TServicesUtils.StrIsCNPJ(Sender.AsString) then
    Text := TServicesUtils.StrFormatarCnpj(Sender.AsString)
  else
  if TServicesUtils.StrIsCPF(Sender.AsString) then
    Text := TServicesUtils.StrFormatarCpf(Sender.AsString);
end;

function TViewNFEConsultarLote.ConfirmarRetorno(var Denegada : Boolean; var DenegadaMotivo : String): Boolean;
var
  bRetorno,
  bTudo   ,
  bLote   ,
  bRecibo : Boolean;
  iAnoMov ,
  iCodMov : Integer;
  sRetorno : String;

  iSerieNFe  ,
  iNumeroNFe ,
  iTipoNFe   : Integer;
  sMensagem        ,
  sDestinatarioCNPJ,
  sFileNameXML ,
  sChaveNFE    ,
  sProtocoloTMP,
  sProtocoloNFE,
  sReciboNFE   : String;
  dDataEnvio   ,
  dDataEmissao : TDateTime;
  aDenegada : Boolean;
  aDenegadaMotivo : String;
const
  NOME_ARQUIVO_XML = '%s-nfe.xml';
begin
  bRetorno := False;

  btnConfirmar.Enabled := False;
  lblInforme.Visible   := True;
  try
    if not GetConectedInternet then
    begin
      TServiceMessage.ShowWarning('Estação de trabalho sem acesso a Internet!');
      Exit;
    end;

    if (Trim(edNumeroRecibo.Text) = EmptyStr) then
      TServiceMessage.ShowInformation('Favor informar o Número do Recibo!')
    else
    if (Trim(edJustificativa.Lines.Text) = EmptyStr) then
      TServiceMessage.ShowInformation('Favor informar a justificativa da consulta do recibo!')
    else
    begin

      PesquisarLote(0, 0, Trim(edNumeroRecibo.Text), iAnoMov, iCodMov, sDestinatarioCNPJ);
      sChaveNFE := Trim(edChaveNFe.Text);

      if not DMNFe.GetValidadeCertificado(dbCNPJ.Field.AsString) then
        Exit;

      sRetorno := EmptyStr;

      // Executar Consulta por Recibo para obter a Chave NF-e

      lblInforme.Caption := 'Executando consulta do Recibo... Aguarde!';
      lblInforme.Update;

      if DMNFe.ConsultarNumeroLoteNFeACBr(dbCNPJ.Field.AsString, Trim(edNumeroRecibo.Text), sChaveNFE, sProtocoloTMP, sRetorno, dDataEnvio, aDenegada, aDenegadaMotivo) then
      begin

        edChaveNFe.Text     := Trim(sChaveNFE);
        edProtocoloTMP.Text := Trim(sProtocoloTMP);

        edJustificativa.Lines.Add('--');
        edJustificativa.Lines.Add('Retorno:');
        edJustificativa.Lines.Add('--');
        edJustificativa.Lines.Add(sRetorno);

        if aDenegada then
        begin
          edJustificativa.Lines.Add('--');
          edJustificativa.Lines.Add('Nota Denegada - Motivo:');
          edJustificativa.Lines.Add(aDenegadaMotivo);
        end;

        sFileNameXML := GetDiretorioNFe + Format(NOME_ARQUIVO_XML, [Trim(edChaveNFe.Text)]);
        sMensagem    := 'Arquivo referenciado da NF-e:' + #13#13 + ExtractFileName(sFileNameXML);

        // Executar Consulta por Chave NF-e para obter o arquivo e o Protocolo

        lblInforme.Caption := 'Executando consulta da Chave NF-e... Aguarde!';
        lblInforme.Update;

        if ( DMNFe.ConsultarChaveNFeACBr(dbCNPJ.Field.AsString, sChaveNFE, iSerieNFe, iNumeroNFe, iTipoNFe,
          sDestinatarioCNPJ, sFileNameXML, sChaveNFE, sProtocoloNFE, dDataEmissao) ) then
        begin
          FSerieNFe  := iSerieNFe;
          FNumeroNFe := iNumeroNFe;
          edProtocoloTMP.Text := Trim(sProtocoloNFE);
          FFileNameXML        := sFileNameXML;

          if not FAguardandoRetorno then
          begin
            sMensagem := sMensagem + #13#13 + 'Arquivo a processar:' + #13#13 + ExtractFileName(sFileNameXML);
            TServiceMessage.ShowInformation( sMensagem );
          end;

          edJustificativa.Lines.Add('--');
          edJustificativa.Lines.Add('Chave Nota Fiscal : ' + edChaveNFe.Text);
          edJustificativa.Lines.Add('Número Protocolo  : ' + edProtocoloTMP.Text);

          sRetorno := edJustificativa.Text;

          bRetorno := (Trim(sProtocoloNFE) <> EmptyStr) and (Trim(sFileNameXML) <> EmptyStr);
        end;
      end
      else
        TServiceMessage.ShowWarning('Consulta de recibo/lote NF-e sem o retorno esperado!' + #13 + sRetorno);

      // Gravar LOG

      FControllerLog
        .DAO
        .OpenEmpty;

      with FControllerLog.DAO.DataSet do
      begin
        Auditar;

        Open;
        Append;

        FieldByName('TIPO').AsInteger         := TIPO_LOG_TRANS_SEFA;
        FieldByName('DESCRICAO').AsString     := DESC_LOG_CONSULTAR_NRO_LOTE_NFE;
        FieldByName('ESPECIFICACAO').AsString := sRetorno;

        Post;

        FControllerLog.DAO.ApplyUpdates;
        FControllerLog.DAO.CommitUpdates;
        FControllerLog.DAO.CommitTransaction;
      end;
    end;
  finally
    btnConfirmar.Enabled := True;
    lblInforme.Visible   := False;

    Result := bRetorno;
  end;
end;

procedure TViewNFEConsultarLote.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewNFEConsultarLote.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_F5 ) then
  begin
    if Clipboard.HasFormat( CF_TEXT ) then
      if ( Length(Trim(Clipboard.AsText)) = NFE_TAMANHO_NUMERO_RECIBO ) then // 154000147188963
        edNumeroRecibo.Text := Trim(Clipboard.AsText);
  end
  else
    inherited;
end;

initialization
  FormFunction.RegisterForm('ViewNFEConsultarLote', TViewNFEConsultarLote);

end.
