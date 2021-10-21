unit View.Entrada.GerarNFE;

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
  TViewEntradaEstoqueGerarNFE = class(TfrmGrPadrao)
    dtsCompra: TDataSource;
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDataHora: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblDataEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbDataHora: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbDataEmissao: TDBEdit;
    lblHoraEmissao: TLabel;
    dbHoraEmissao: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    Bevel2: TBevel;
    lblBaseICMS: TLabel;
    dbBaseICMS: TDBEdit;
    lblValorICMS: TLabel;
    dbValorICMS: TDBEdit;
    lblBaseICMSSubs: TLabel;
    dbBaseICMSSubs: TDBEdit;
    lblValorICMSSubs: TLabel;
    dbValorICMSSubs: TDBEdit;
    lblValorPIS: TLabel;
    dbValorPIS: TDBEdit;
    lblTotalProduto: TLabel;
    dbTotalProduto: TDBEdit;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblSeguro: TLabel;
    dbSeguro: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblOutrasDespesas: TLabel;
    dbOutrasDespesas: TDBEdit;
    lblValorIPI: TLabel;
    dbValorIPI: TDBEdit;
    lblValorCOFINS: TLabel;
    dbValorCOFINS: TDBEdit;
    lblTotalNota: TLabel;
    dbTotalNota: TDBEdit;
    TmrAlerta: TTimer;
    btnCalcular: TcxButton;
    chkNaoInformarVencimento: TCheckBox;
    btnBotoes: TPanel;
    lblInforme: TLabel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TmrAlertaTimer(Sender: TObject);
  private
    { Private declarations }
    FController : IControllerEntrada;
    iSerieNFe    ,
    iNumeroNFe   : Integer;
    sFileNameXML ,
    sChaveNFE    ,
    sProtocoloNFE,
    sReciboNFE   : String;
    iNumeroLote  : Int64;
    procedure RecalcularTotalNota;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCOMPRAS
  - TBCOMPRASITENS
  - TBPRODUTO

  Views:

  Procedures:

*)

//var
//  frmGeEntradaEstoqueGerarNFe: TfrmGeEntradaEstoqueGerarNFe;
//
  function GerarNFeEntrada(const AOwer : TComponent; Ano : Smallint; Numero : Integer; Empresa : String;
    var SerieNFe, NumeroNFe  : Integer;
    var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String;
    var NumeroLote  : Int64) : Boolean;

implementation

uses
    UConstantesDGE
  , UFuncoes
  , UDMNFe
  , Controller.Tabela
  , SGE.Controller.Factory
  , Service.Message
  , Service.Utils
  , View.NFE.ConsultarLote;

{$R *.dfm}


function GerarNFeEntrada(const AOwer : TComponent; Ano : Smallint; Numero : Integer; Empresa : String;
  var SerieNFe, NumeroNFe  : Integer;
  var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String;
  var NumeroLote  : Int64) : Boolean;
var
  AForm : TViewEntradaEstoqueGerarNFE;
begin
  AForm := TViewEntradaEstoqueGerarNFE.Create(AOwer);
  try
    with AForm do
    begin
      FController.DAO.ClearWhere;
      FController
        .DAO
        .Where('c.ano        = :ano')
        .Where('c.Codcontrol = :controle')
        .Where('c.Codemp     = :empresa')
        .ParamsByName('ano',      Ano)
        .ParamsByName('controle', Numero)
        .ParamsByName('empresa',  Empresa)
        .Open;

      TTabelaController
        .New
        .Tabela(dtsCompra.DataSet)
        .Display('CODCONTROL', 'No. Entrada', '###0000000', TAlignment.taCenter)
        .Display('IPI', 'IPI', ',0.00', TAlignment.taRightJustify)
        .Display('ICMSBASE', 'Base ICMS', ',0.00', TAlignment.taRightJustify)
        .Display('ICMSVALOR', 'Valor ICMS', ',0.00', TAlignment.taRightJustify)
        .Display('ICMSSUBSTBASE', 'Base ICMS Subst.', ',0.00', TAlignment.taRightJustify)
        .Display('ICMSSUBSTVALOR', 'Valor ICMS Subst.', ',0.00', TAlignment.taRightJustify)
        .Display('FRETE', 'Frete', ',0.00', TAlignment.taRightJustify)
        .Display('OUTROSCUSTOS', 'Outros Custos', ',0.00', TAlignment.taRightJustify)
        .Display('DESCONTO', 'Desconto', ',0.00', TAlignment.taRightJustify)
        .Display('TOTALNF', 'Total Nota Fiscal', ',0.00', TAlignment.taRightJustify)
        .Display('TOTALPROD', 'Total Produto', ',0.00', TAlignment.taRightJustify)
        .Display('VALORSEGURO', 'Valor Seguro', ',0.00', TAlignment.taRightJustify)
        .Display('VALORTOTAL_IPI', 'Total IPI', ',0.00', TAlignment.taRightJustify)
        .Display('VALORPIS', 'Total PIS', ',0.00', TAlignment.taRightJustify)
        .Display('VALORCOFINS', 'Total COFINS', ',0.00', TAlignment.taRightJustify)
        .Configurar;

      chkNaoInformarVencimento.Checked := not FController.CFOP.GetGerarDuplicata(dtsCompra.DataSet.FieldByName('NFCFOP').AsInteger);

      if (not dtsCompra.DataSet.IsEmpty) then
      begin
        dtsCompra.DataSet.Edit;

        if FController.CFOP.GetDevolucao(dtsCompra.DataSet.FieldByName('NFCFOP').AsInteger) then
        begin
          dtsCompra.DataSet.FieldByName('ICMSBASE').AsCurrency  := dtsCompra.DataSet.FieldByName('VALOR_BASE_ICMS_NORMAL_SAIDA').AsCurrency;
          dtsCompra.DataSet.FieldByName('ICMSVALOR').AsCurrency := dtsCompra.DataSet.FieldByName('VALOR_TOTAL_ICMS_NORMAL_SAIDA').AsCurrency;
        end
        else
        begin
          dtsCompra.DataSet.FieldByName('ICMSBASE').AsCurrency  := dtsCompra.DataSet.FieldByName('VALOR_BASE_ICMS_NORMAL_ENTRADA').AsCurrency;
          dtsCompra.DataSet.FieldByName('ICMSVALOR').AsCurrency := dtsCompra.DataSet.FieldByName('VALOR_TOTAL_ICMS_NORMAL_ENTRADA').AsCurrency;
        end;

        dtsCompra.DataSet.FieldByName('ICMSSUBSTBASE').AsCurrency  := 0;
        dtsCompra.DataSet.FieldByName('ICMSSUBSTVALOR').AsCurrency := 0;

        dtsCompra.DataSet.FieldByName('VALORSEGURO').AsCurrency    := 0;
        dtsCompra.DataSet.FieldByName('VALORTOTAL_IPI').AsCurrency := dtsCompra.DataSet.FieldByName('IPI').AsCurrency;
        dtsCompra.DataSet.FieldByName('VALORPIS').AsCurrency       := dtsCompra.DataSet.FieldByName('VALOR_TOTAL_PIS').AsCurrency;
        dtsCompra.DataSet.FieldByName('VALORCOFINS').AsCurrency    := dtsCompra.DataSet.FieldByName('VALOR_TOTAL_COFINS').AsCurrency;
        dtsCompra.DataSet.FieldByName('VALORTOTAL_II').AsCurrency  := 0;

        RecalcularTotalNota;
      end;

      Result := (ShowModal = mrOk);

      if Result then
      begin
        SerieNFe     := iSerieNFe;
        NumeroNFe    := iNumeroNFe;
        FileNameXML  := sFileNameXML;
        ChaveNFE     := sChaveNFE;
        ProtocoloNFE := sProtocoloNFE;
        ReciboNFE    := sReciboNFE;
        NumeroLote   := iNumeroLote;
      end;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TViewEntradaEstoqueGerarNFE.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewEntradaEstoqueGerarNFE.RecalcularTotalNota;
begin
  if (not dtsCompra.DataSet.IsEmpty) then
  begin
    if (dtsCompra.DataSet.State <> dsEdit) then
      dtsCompra.DataSet.Edit;

    dtsCompra.DataSet.FieldByName('DTEMISS').AsDateTime := Date;
    dtsCompra.DataSet.FieldByName('HREMISS').AsDateTime := Time;

    dtsCompra.DataSet.FieldByName('TOTALNF').AsCurrency := (
      dtsCompra.DataSet.FieldByName('TOTALPROD').AsCurrency -
      dtsCompra.DataSet.FieldByName('DESCONTO').AsCurrency  +
      dtsCompra.DataSet.FieldByName('IPI').AsCurrency
    );
  end;
end;

procedure TViewEntradaEstoqueGerarNFE.btnCalcularClick(Sender: TObject);
begin
  RecalcularTotalNota;
  if ( (dbTotalNota.Visible) and (dbTotalNota.Enabled) ) then
    dbTotalNota.SetFocus;
end;

procedure TViewEntradaEstoqueGerarNFE.btnConfirmarClick(Sender: TObject);
var
  bRT ,
  bOK : Boolean;
  sVN       ,
  sRecibo   ,
  sCompraID : String;
  aTipoMovimento : TTipoMovimento;
  aFileXML       : TStringList;
  aDenegada : Boolean;
  aDenegadaMotivo : String;
begin
(*
  IMR - 04/10/2019 :
    Removida a rotina de verificação do serviço de emissão da NFe da procedure "GerarNFeEntradaOnLineACBr()" para que
    esteja num nível de chamada acima.

  IMR - 29/10/2018 :
    Implementação da rotina de tratamento das rejeições sobre a duplicidade de notas
    fiscais.
*)

  if not GetConectedInternet then
  begin
    TServiceMessage.ShowWarning('Estação de trabalho sem acesso a Internet!');
    Exit;
  end;

  if chkNaoInformarVencimento.Checked then
    sVN := 'Alerta : Os vencimentos não serão informados na NF-e.' + #13#13
  else
    sVN := EmptyStr;

  DMNFe.LerConfiguracao(dtsCompra.DataSet.FieldByName('CODEMP').AsString, tipoDANFEFast);
  DMNFe.ValidarCnpjDocumento(dtsCompra.DataSet.FieldByName('CODEMP').AsString);

  if not DMNFe.ACBrNFe.WebServices.StatusServico.Executar then
  begin
    TServiceMessage.ShowWarning('Serviço Inoperante!' + #13#13 +
      'Motivos:' + #13 +
      '--------------------------------------' + #13 +
      '1. Certificado A1 ou A3 não instalado'  + #13 +
      '2. Certificado A3 não conectado na UBS' + #13 +
      '3. Webservice de emissão da NF-e offline.'
    );
    Exit;
  end;

  if (Copy(DMNFe.GetCnpjCertificado, 1, 8) <> Copy(FController.DAO.Usuario.Empresa.CNPJ, 1, 8)) then
  begin
    TServiceMessage.ShowWarning('A Empresa selecionada no login do sistema não está de acordo com o Certificado informado!');
    Exit;
  end;

  if TServiceMessage.ShowConfirm(sVN + 'Confirma a geração da NF-e de Entrada?') then
  begin
    if ( dtsCompra.DataSet.State = dsEdit ) then
    begin
      dtsCompra.DataSet.Post;

      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;
    end;

    lblInforme.Visible := True;
    lblInforme.Caption := 'Gerando NF-e junto a SEFA. Aguarde . . . ';
    TmrAlerta.Enabled  := True;

    Application.ProcessMessages;

    if DMNFe.GerarNFeOnLine(dtsCompra.DataSet.FieldByName('CODEMP').AsString) then
      bOK := DMNFe.GerarNFeEntradaOnLineACBr(
          dtsCompra.DataSet.FieldByName('CODEMP').AsString
        , dtsCompra.DataSet.FieldByName('CODFORN').AsInteger
        , dtsCompra.DataSet.FieldByName('ANO').AsInteger
        , dtsCompra.DataSet.FieldByName('CODCONTROL').AsInteger
        , iSerieNFe
        , iNumeroNFe
        , sFileNameXML
        , sChaveNFE
        , sProtocoloNFE
        , sReciboNFE
        , iNumeroLote
        , aDenegada
        , aDenegadaMotivo
        , chkNaoInformarVencimento.Checked
        , False
      )
    else
      bOK := DMNFe.GerarNFeEntradaOffLineACBr(
          dtsCompra.DataSet.FieldByName('CODEMP').AsString
        , dtsCompra.DataSet.FieldByName('CODFORN').AsInteger
        , dtsCompra.DataSet.FieldByName('ANO').AsInteger
        , dtsCompra.DataSet.FieldByName('CODCONTROL').AsInteger
        , iSerieNFe
        , iNumeroNFe
        , sFileNameXML
        , sChaveNFE
        , chkNaoInformarVencimento.Checked
        , False
      );

    if aDenegada then
    begin
      dtsCompra.DataSet.Edit;

      dtsCompra.DataSet.FieldByName('NFE_DENEGADA').AsInteger       := 1;
      dtsCompra.DataSet.FieldByName('NFE_DENEGADA_MOTIVO').AsString := AnsiUpperCase(Trim(aDenegadaMotivo));

      dtsCompra.DataSet.Post;

      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;
    end;

    if not bOk then
    begin
      // Refeição: Duplicidade de NF-e [nRec:999999999999999]
      // 1. Verificar se a mensagem de rejeição é sobre a duplicação da NF-e.
      // 2. Pegar o número de recibo retornado e buscar na SEFA a NF-e correspondente
      // 3. Identificar a venda nesta NF-e encontrada
      // 4. Comparar a compra encontrada com a compra corrente
      // 5. Se as compras forem iguais, colocar [nRec:999999999999999] na compra corrente

      if ((DMNFe.MensagemErro) <> EmptyStr) then
      begin
        aFileXML := TStringList.Create;
        try
          if (Pos('Duplicidade de NF-e', DMNFe.MensagemErro) > 0) then   // Passo 1
          begin
            sRecibo := TServicesUtils.StrOnlyNumbers(Copy(DMNFe.MensagemErro,          // Passo 2.1
              Pos('[nRec:', DMNFe.MensagemErro),
              Pos(']', DMNFe.MensagemErro)) );

            if (StrToInt64Def(sRecibo.Trim, 0) > 0) then // Passo 2.2 => (Número de Recibo != 000000000000000)
            begin
              bRT := BuscarRetornoReciboNFe(Self
                , dtsCompra.DataSet.FieldByName('CODEMP').AsString
                , Trim(sRecibo)
                , iSerieNFe
                , iNumeroNFe
                , sFileNameXML
                , sChaveNFE
                , sProtocoloNFE
                , aTipoMovimento
                , aDenegada
                , aDenegadaMotivo
              );

              if bRT and (aTipoMovimento = tmNFeEntrada) then
              begin
                sReciboNFE  := Trim(sRecibo);
                iNumeroLote := iNumeroNFe;

                // Analisar o nome do arquivo XML retornado
                if (Trim(sFileNameXML) = EmptyStr) or (not FileExists(sFileNameXML)) then
                  sFileNameXML := DMNFe.GetDiretorioXmlNFe + sChaveNFE + '-nfe.xml';

                if FileExists(sFileNameXML) then                         // Passo 3
                begin
                  aFileXML.LoadFromFile(sFileNameXML);
                  sCompraID := 'Compra: ' + dtsCompra.DataSet.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', dtsCompra.DataSet.FieldByName('CODCONTROL').AsInteger);
                  if (Pos(sCompraID, aFileXML.Text) > 0) then            // Passo 3, 4
                  begin
                    sReciboNFE  := Trim(sRecibo);
                    iNumeroLote := iNumeroNFe;
                    DMNFe.GuardarLoteNFeEntrada(
                        dtsCompra.DataSet.FieldByName('CODEMP').AsString
                      , dtsCompra.DataSet.FieldByName('ANO').AsInteger
                      , dtsCompra.DataSet.FieldByName('CODCONTROL').AsInteger
                      , iNumeroLote
                      , sReciboNFE);                                     // Passo 5
                  end;
                end;
              end;
            end;
          end;
        finally
          aFileXML.Free;
        end;
      end;

    end;

    TmrAlerta.Enabled  := False;
    lblInforme.Visible := False;

    if ( bOK ) then
      ModalResult := mrOk
    else
      ModalResult := mrCancel;
  end;
end;

procedure TViewEntradaEstoqueGerarNFE.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerFactory.New.Entrada;
  dtsCompra.DataSet := FController.DAO.DataSet;

  iSerieNFe     := 0;
  iNumeroNFe    := 0;
  sFileNameXML  := EmptyStr;
  sChaveNFE     := EmptyStr;
  sProtocoloNFE := EmptyStr;
  sReciboNFE    := EmptyStr;
  iNumeroLote   := 0;
  lblInforme.Caption := EmptyStr;
end;

procedure TViewEntradaEstoqueGerarNFE.TmrAlertaTimer(Sender: TObject);
begin
  lblInforme.Visible := not lblInforme.Visible;
end;

procedure TViewEntradaEstoqueGerarNFE.RegistrarRotinaSistema;
begin
  ;
end;

end.
