unit UGeConsultarLoteNFe_v2;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Mask, DBCtrls, IBUpdateSQL, ClipBrd, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Intf,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TTipoMovimento = (tmNFeEntrada, tmNFeSaida, tmNull);
  TfrmGeConsultarLoteNFe_v2 = class(TfrmGrPadrao)
    dtsEmpresa: TDataSource;
    cdsLOG: TIBDataSet;
    cdsLOGUSUARIO: TIBStringField;
    cdsLOGDATA_HORA: TDateTimeField;
    cdsLOGTIPO: TSmallintField;
    cdsLOGDESCRICAO: TIBStringField;
    cdsLOGESPECIFICACAO: TMemoField;
    updLOG: TIBUpdateSQL;
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
    qryNFE: TIBDataSet;
    qryNFEANOVENDA: TSmallintField;
    qryNFENUMVENDA: TIntegerField;
    qryNFEDATAEMISSAO: TDateField;
    qryNFEHORAEMISSAO: TTimeField;
    qryNFESERIE: TIBStringField;
    qryNFENUMERO: TIntegerField;
    qryNFECHAVE: TIBStringField;
    qryNFEPROTOCOLO: TIBStringField;
    qryNFERECIBO: TIBStringField;
    qryNFEXML_FILENAME: TIBStringField;
    qryNFEXML_FILE: TMemoField;
    qryNFELOTE_ANO: TSmallintField;
    qryNFELOTE_NUM: TIntegerField;
    updNFE: TIBUpdateSQL;
    qryNFEEMPRESA: TIBStringField;
    qryNFEANOCOMPRA: TSmallintField;
    qryNFENUMCOMPRA: TIntegerField;
    lblChaveNFe: TLabel;
    edChaveNFe: TEdit;
    lblProtocoloTMP: TLabel;
    edProtocoloTMP: TEdit;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    fdQryLotesPendentesNFe: TFDQuery;
    fdQryEmpresa: TFDQuery;
    procedure ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure qryEmpresaCNPJGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FTipoMovimento : TTipoMovimento;
    FAguardandoRetorno : Boolean;
    FSerieNFe  ,
    FNumeroNFe : Integer;
    FFileNameXML : String;
    procedure Auditar;
    procedure CarregarEmpresa(const sCnpj : String);
    procedure CarregarLotePendente(const sCnpjEmitente, sRecibo : String);

    function PesquisarLote(const iAno, iNumero : Integer; const sRecibo : String; var Ano, Controle : Integer; var Destinaratio : String) : Boolean;
    function ConfirmarRetorno : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function BuscarRetornoReciboNFe(const AOnwer : TComponent; const sEmpresa, sRecibo : String;
    var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE : String;
    var TipoMovimento : TTipoMovimento) : Boolean;

(*
  Tabelas:
  - TBEMPRESA
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

uses UDMBusiness, UDMNFe, UConstantesDGE, UFuncoes, UDMRecursos;

{$R *.dfm}

{*
  IMR - 08/12/2015 :
    Criação do atributo "FAguardandoRetorno" para gerenciar a execução automática
    e espera do retorno de uma consulta de recibo quando esta é iniciada pelo
    processo de geração de NF-e no Controle de Vendas.
*}

function BuscarRetornoReciboNFe(const AOnwer : TComponent; const sEmpresa, sRecibo : String;
  var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE : String;
  var TipoMovimento : TTipoMovimento) : Boolean;
var
  AForm : TfrmGeConsultarLoteNFe_v2;
begin
  WaitAMoment(WAIT_AMOMENT_MakerConsulta);
  AForm := TfrmGeConsultarLoteNFe_v2.Create(AOnwer);
  try
    with AForm do
    begin
      FAguardandoRetorno := True;

      CarregarEmpresa(sEmpresa);
      CarregarLotePendente(sEmpresa, sRecibo);

      edJustificativa.Lines.Clear;
      edJustificativa.Lines.Text := 'Busca automática de retorno do recibo de envio da NF-e';
      edNumeroRecibo.Text        := sRecibo;

      Result := ConfirmarRetorno;

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

procedure TfrmGeConsultarLoteNFe_v2.Auditar;
begin
  dbUsuario.Text  := Trim(gUsuarioLogado.Login);
  dbDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
end;

procedure TfrmGeConsultarLoteNFe_v2.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarEmpresa(gUsuarioLogado.Empresa);
  CarregarLotePendente(gUsuarioLogado.Empresa, EmptyStr);

  Auditar;

  FTipoMovimento     := tmNull;
  FAguardandoRetorno := False;
  FSerieNFe     := 0;
  FNumeroNFe    := 0;
  FFileNameXML  := EmptyStr;
end;

procedure TfrmGeConsultarLoteNFe_v2.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeConsultarLoteNFe_v2.qryEmpresaCNPJGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if StrIsCNPJ(Sender.AsString) then
    Text := StrFormatarCnpj(Sender.AsString)
  else
  if StrIsCPF(Sender.AsString) then
    Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeConsultarLoteNFe_v2.ApenasNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmGeConsultarLoteNFe_v2.FormShow(Sender: TObject);
begin
  inherited;
  if not FAguardandoRetorno then
    if not fdQryLotesPendentesNFe.IsEmpty then
    begin
      edAno.Text          := fdQryLotesPendentesNFe.FieldByName('ANO').AsString;
      edNumeroLote.Text   := fdQryLotesPendentesNFe.FieldByName('LOTE').AsString;
      edNumeroRecibo.Text := fdQryLotesPendentesNFe.FieldByName('RECIBO').AsString;
      FTipoMovimento      := TTipoMovimento(fdQryLotesPendentesNFe.FieldByName('TIPONFE').AsInteger);
    end;

  if FAguardandoRetorno then
  begin
    lblInforme.Caption := 'Iniciando busca junto a SEFA. Aguarde!';
    lblInforme.Visible := True;
    Application.ProcessMessages;
    Sleep(144);

    btnConfirmar.Click;
  end;
end;

function TfrmGeConsultarLoteNFe_v2.PesquisarLote(const iAno, iNumero: Integer;
  const sRecibo: String; var Ano, Controle : Integer; var Destinaratio : String): Boolean;
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('    v.ano        as Ano');
      SQL.Add('  , v.codcontrol as Numero');
      SQL.Add('  , 1            as TipoNFE');
      SQL.Add('  , ''Saída/Venda''   as Tipo');
      SQL.Add('  , v.lote_nfe_numero as Lote');
      SQL.Add('  , v.lote_nfe_recibo as Recibo');
      SQL.Add('  , v.codcli          as Destinatario');
      SQL.Add('from TBVENDAS v');
      SQL.Add('where v.codemp = ' + QuotedStr(dbCNPJ.Field.AsString));

      if (StrToIntDef(Trim(edAno.Text), 0) > 0) and (StrToIntDef(Trim(edNumeroLote.Text), 0) > 0) then
        SQL.Add('  and v.lote_nfe_ano = ' + Trim(edAno.Text) + ' and v.lote_nfe_numero = ' + Trim(edNumeroLote.Text));

      if (Trim(edNumeroRecibo.Text) <> EmptyStr) then
        SQL.Add('  and v.lote_nfe_recibo = ' + QuotedStr(Trim(edNumeroRecibo.Text)));

      SQL.Add('');
      SQL.Add('union');
      SQL.Add('');
      SQL.Add('Select');
      SQL.Add('    c.ano        as Ano');
      SQL.Add('  , c.codcontrol as Numero');
      SQL.Add('  , 0            as TipoNFE');
      SQL.Add('  , ''Entrada/Compra'' as Tipo');
      SQL.Add('  , c.lote_nfe_numero  as Lote');
      SQL.Add('  , c.lote_nfe_recibo  as Recibo');
      SQL.Add('  , f.cnpj             as Destinatario');
      SQL.Add('from TBCOMPRAS c');
      SQL.Add('  left join TBFORNECEDOR f on (f.codforn = c.codforn)');
      SQL.Add('where c.codemp = ' + QuotedStr(dbCNPJ.Field.AsString));

      if (StrToIntDef(Trim(edAno.Text), 0) > 0) and (StrToIntDef(Trim(edNumeroLote.Text), 0) > 0) then
        SQL.Add('  and c.lote_nfe_ano = ' + Trim(edAno.Text) + ' and c.lote_nfe_numero = ' + Trim(edNumeroLote.Text));

      if (Trim(edNumeroRecibo.Text) <> EmptyStr) then
        SQL.Add('  and c.lote_nfe_recibo = ' + QuotedStr(Trim(edNumeroRecibo.Text)));

      Open;

      Result := not IsEmpty;

      if Result then
      begin
        FTipoMovimento := TTipoMovimento(FieldByName('TipoNFE').AsInteger);
        Ano          := FieldByName('Ano').AsInteger;
        Controle     := FieldByName('Numero').AsInteger;
        Destinaratio := FieldByName('Destinatario').AsString;

        edAno.Text          := FieldByName('Ano').AsString;
        edNumeroLote.Text   := FieldByName('Lote').AsString;
        edNumeroRecibo.Text := FieldByName('Recibo').AsString;
      end;
    end;
  except
    On E : Exception do
      ShowError('Erro ao tentar consultar lote.' + #13#13 + E.Message);
  end;
end;

procedure TfrmGeConsultarLoteNFe_v2.btnConfirmarClick(Sender: TObject);
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
begin
  ConfirmarRetorno;
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

procedure TfrmGeConsultarLoteNFe_v2.CarregarEmpresa(const sCnpj: String);
begin
  with fdQryEmpresa do
  begin
    Close;
    ParamByName('cnpj').AsString := sCnpj;
    Open;
  end;
end;

procedure TfrmGeConsultarLoteNFe_v2.CarregarLotePendente(
  const sCnpjEmitente, sRecibo: String);
begin
  with fdQryLotesPendentesNFe do
  begin
    Close;
    ParamByName('empresa_vnd').AsString := sCnpjEmitente;
    ParamByName('empresa_cmp').AsString := sCnpjEmitente;
    ParamByName('recibo_vnd').AsString  := Trim(sRecibo);
    ParamByName('recibo_cmp').AsString  := Trim(sRecibo);
    ParamByName('todos').AsInteger      := IfThen(Trim(sRecibo) = EmptyStr, 1, 0);
    Open;
  end;
end;

function TfrmGeConsultarLoteNFe_v2.ConfirmarRetorno: Boolean;
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
const
  NOME_ARQUIVO_XML = '%s-nfe.xml';
begin
  bRetorno := False;

  btnConfirmar.Enabled := False;
  lblInforme.Visible   := True;
  try
    if not GetConectedInternet then
    begin
      ShowWarning('Estação de trabalho sem acesso a Internet!');
      Exit;
    end;

    if (Trim(edNumeroRecibo.Text) = EmptyStr) then
      ShowInformation('Favor informar o Número do Recibo!')
    else
    if (Trim(edJustificativa.Lines.Text) = EmptyStr) then
      ShowInformation('Favor informar a justificativa da consulta do recibo!')
    else
    begin

      PesquisarLote(0, 0, Trim(edNumeroRecibo.Text), iAnoMov, iCodMov, sDestinatarioCNPJ);

      if not DMNFe.GetValidadeCertificado(dbCNPJ.Field.AsString) then
        Exit;

      sRetorno := EmptyStr;

      // Executar Consulta por Recibo para obter a Chave NF-e

      lblInforme.Caption := 'Executando consulta do Recibo... Aguarde!';
      lblInforme.Update;

      if DMNFe.ConsultarNumeroLoteNFeACBr(dbCNPJ.Field.AsString, Trim(edNumeroRecibo.Text), sChaveNFE, sProtocoloTMP, sRetorno, dDataEnvio ) then
      begin

        edChaveNFe.Text     := Trim(sChaveNFE);
        edProtocoloTMP.Text := Trim(sProtocoloTMP);

        edJustificativa.Lines.Add('--');
        edJustificativa.Lines.Add('Retorno:');
        edJustificativa.Lines.Add('--');
        edJustificativa.Lines.Add(sRetorno);

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
            ShowInformation( sMensagem );
          end;

          bRetorno := (Trim(sProtocoloNFE) <> EmptyStr) and (Trim(sFileNameXML) <> EmptyStr);
        end;
      end
      else
        ShowWarning('Consulta de recibo/lote NF-e sem o retorno esperado!' + #13 + sRetorno);
    end;
  finally
    btnConfirmar.Enabled := True;
    lblInforme.Visible   := False;

    Result := bRetorno;
  end;
end;

procedure TfrmGeConsultarLoteNFe_v2.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeConsultarLoteNFe_v2.FormKeyDown(Sender: TObject;
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
  FormFunction.RegisterForm('frmGeConsultarLoteNFe_v2', TfrmGeConsultarLoteNFe_v2);

end.
