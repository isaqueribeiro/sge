unit UGeEntradaEstoqueCancelar;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeEntradaEstoqueCancelar = class(TfrmGrPadrao)
    dtsEntrada: TDataSource;
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblFornecedor: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblDataEntrada: TLabel;
    dbCodigo: TDBEdit;
    dbFornecedor: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbDataEntrada: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    Bevel2: TBevel;
    lblCancelUsuario: TLabel;
    lblCancelDataHora: TLabel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    dbCancelUsuario: TEdit;
    dbCancelDataHora: TEdit;
    lblTotalNota: TLabel;
    dbTotalNota: TDBEdit;
    lblInforme: TLabel;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    cdsEntrada: TFDQuery;
    updEntrada: TFDUpdateSQL;
    cdsEntradaANO: TSmallintField;
    cdsEntradaCODCONTROL: TIntegerField;
    cdsEntradaCODEMP: TStringField;
    cdsEntradaCODFORN: TIntegerField;
    cdsEntradaNF: TIntegerField;
    cdsEntradaNFSERIE: TStringField;
    cdsEntradaDTLANCAMENTO: TSQLTimeStampField;
    cdsEntradaDTEMISS: TDateField;
    cdsEntradaDTENT: TDateField;
    cdsEntradaDTFINALIZACAO_COMPRA: TSQLTimeStampField;
    cdsEntradaNFCFOP: TIntegerField;
    cdsEntradaNATUREZA: TStringField;
    cdsEntradaSTATUS: TSmallintField;
    cdsEntradaOBS: TMemoField;
    cdsEntradaUSUARIO: TStringField;
    cdsEntradaFORMAPAGTO_COD: TSmallintField;
    cdsEntradaCONDICAOPAGTO_COD: TSmallintField;
    cdsEntradaCOMPRA_PRAZO: TSmallintField;
    cdsEntradaPRAZO_01: TSmallintField;
    cdsEntradaPRAZO_02: TSmallintField;
    cdsEntradaPRAZO_03: TSmallintField;
    cdsEntradaPRAZO_04: TSmallintField;
    cdsEntradaPRAZO_05: TSmallintField;
    cdsEntradaPRAZO_06: TSmallintField;
    cdsEntradaPRAZO_07: TSmallintField;
    cdsEntradaPRAZO_08: TSmallintField;
    cdsEntradaPRAZO_09: TSmallintField;
    cdsEntradaPRAZO_10: TSmallintField;
    cdsEntradaPRAZO_11: TSmallintField;
    cdsEntradaPRAZO_12: TSmallintField;
    cdsEntradaCANCEL_USUARIO: TStringField;
    cdsEntradaCANCEL_DATAHORA: TSQLTimeStampField;
    cdsEntradaCANCEL_MOTIVO: TMemoField;
    cdsEntradaNOMEFORN: TStringField;
    cdsEntradaCNPJ: TStringField;
    cdsEntradaTOTALNF: TFMTBCDField;
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCOMPRAS
  - TBFORNECEDOR

  Views:

  Procedures:

*)

//var
//  frmGeEntradaEstoqueCancelar: TfrmGeEntradaEstoqueCancelar;
//
  function CancelarENT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
    Controller.Tabela
  , UConstantesDGE
  , UDMBusiness
  , UDMNFe
  , UFuncoes;

{$R *.dfm}

function CancelarENT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  frm : TfrmGeEntradaEstoqueCancelar;
begin
  frm := TfrmGeEntradaEstoqueCancelar.Create(AOwer);
  try
    with frm do
    begin
      cdsEntrada.Close;
      cdsEntrada.ParamByName('anocompra').AsInteger := Ano;
      cdsEntrada.ParamByName('numcompra').AsInteger := Numero;
      cdsEntrada.Open;

      dbCancelUsuario.Text  := GetUserApp;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeEntradaEstoqueCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeEntradaEstoqueCancelar.btnCancelarClick(Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if ( cdsEntrada.IsEmpty ) then
    Exit;

  if ( Trim(dbMotivo.Lines.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informar o motivo de cancelamento da entrada');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    ShowWarning('Motivo de cancelamento da compra deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    if ( cdsEntradaSTATUS.AsInteger = STATUS_VND_NFE ) then
      sMsg := 'Esta compra possui Nota Fiscal de Entrada Emitida e ao cancelar a compra a NF-e será cancelada.'#13#13'Confirma o cancelamento da compra?'
    else
      sMsg := 'Confirma o cancelamento da compra?';

    Cont := ShowConfirm(sMsg);

    if ( Cont ) then
      if ( cdsEntradaSTATUS.AsInteger = STATUS_CMP_NFE ) then
      begin
        if not GetConectedInternet then
        begin
          ShowWarning('Estação de trabalho sem acesso a Internet!');
          Exit;
        end;

        if not GetEstacaoEmitiNFe(cdsEntradaCODEMP.AsString) then
        begin
          ShowWarning('Estação de trabalho não habilitada para cancelar Entrada/NFe!');
          Exit;
        end;

        if not DMNFe.GetValidadeCertificado(cdsEntradaCODEMP.AsString) then
          Exit;

        lblInforme.Caption := 'Cancelando NF-e junto a SEFA. Aguarde . . . ';
        Application.ProcessMessages;

        Cont := DMNFe.CancelarNFeEntradaACBr( cdsEntradaCODEMP.AsString, cdsEntradaCODFORN.AsInteger,
                cdsEntradaANO.AsInteger, cdsEntradaCODCONTROL.AsInteger, UpperCase(Trim(dbMotivo.Lines.Text)) );
      end;

    if ( Cont ) then
      with cdsEntrada do
      begin
        Edit;

        cdsEntradaSTATUS.AsInteger           := STATUS_CMP_CAN;
        cdsEntradaCANCEL_DATAHORA.AsDateTime := StrToDateTime( Trim(dbCancelDataHora.Text) );
        cdsEntradaCANCEL_USUARIO.AsString    := UpperCase( Trim(dbCancelUsuario.Text) );
        cdsEntradaCANCEL_MOTIVO.AsString     := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;
        ApplyUpdates;
        CommitUpdates;

        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TfrmGeEntradaEstoqueCancelar.FormCreate(Sender: TObject);
begin
  inherited;
  TTabelaController
    .New
    .Tabela( cdsEntrada )
    .Display('TOTALNF', 'Total Nota Fiscal', ',0.00', TAlignment.taRightJustify)
    .Configurar( cdsEntrada );
end;

procedure TfrmGeEntradaEstoqueCancelar.RegistrarRotinaSistema;
begin
  ;
end;

end.
