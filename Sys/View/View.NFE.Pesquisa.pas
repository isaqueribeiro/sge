unit View.NFE.Pesquisa;

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

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxSkinsCore,
  cxButtons,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  UObserverInterface,
  UGrPadraoCadastro,
  Interacao.Tabela,
  Controller.Tabela,
  UConstantesDGE;

type
  TDestinatarioTipo = (dtNull = -1, dtFornecedor = 0, dtCliente = 1);

  TDestinatarioNF = record
    Codigo      : Integer;
    RazaoSocial : String;
    CpfCnpj     : String;
    InsEstadual : String;
    UF          : String;
    Tipo        : TDestinatarioTipo;
  end;

  TViewNFEPesquisa = class(TViewPadraoCadastro)
    lblData: TLabel;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    lblNotaCancelada: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    fSemNFComplementar : Boolean;
    fEmpresa : String;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBNFE_ENVIADA
  - TBVENDAS
  - TBCLIENTE
  - TBCOMPRAS
  - TBFORNECEDOR

  Views:

  Procedures:

*)

  function SelecionarNFe(const AOnwer : TComponent; var pEmpresa, pSerie, pChave : String;
    var pNumero, pModelo : Integer;
    var pDataEmissao : TDateTime;
    var pDestinatario : TDestinatarioNF;
    var MovimentoAno, MovimentoCodigo : Integer) : Boolean;

implementation

uses
  //UDMBusiness,
  UDMRecursos,
  SGE.Controller.Factory;

{$R *.dfm}

function SelecionarNFe(const AOnwer : TComponent; var pEmpresa, pSerie, pChave : String;
  var pNumero, pModelo : Integer;
  var pDataEmissao  : TDateTime;
  var pDestinatario : TDestinatarioNF;
  var MovimentoAno, MovimentoCodigo : Integer) : Boolean;
var
  AForm : TViewNFEPesquisa;
  iCodigo    : Integer;
  sDescricao : String;
begin
  AForm := TViewNFEPesquisa.Create(AOnwer);
  try
    AForm.tbsCadastro.TabVisible := False;
    AForm.fEmpresa               := pEmpresa;
    AForm.fSemNFComplementar     := True;

    AForm.WhereAdditional := 'nf.empresa = ' + QuotedStr(pEmpresa) + ' and ' +
      'nf.dataemissao between ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date) ) + ' and ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date) );

    if AForm.fSemNFComplementar then
      AForm.WhereAdditional := AForm.WhereAdditional +
//        ' and (coalesce(nf.anovenda, nf.anocompra, 0) > 0)' +
        ' and ((coalesce(nf.anovenda, nf.anocompra, 0) > 0) or (nf.lote_ano = 0))' +  // Voltar ao código anterior em 12/2015
        ' and (coalesce(nf.cancelada, 0) = 0)';

    Result := AForm.SelecionarRegistro(iCodigo, sDescricao, pEmpresa);

    if Result then
      with AForm, DtSrcTabela.DataSet do
      begin
        pSerie  := FieldByName('SERIE').AsString;
        pChave  := FieldByName('CHAVE').AsString;
        pNumero := FieldByName('NUMERO').AsInteger;
        pModelo := FieldByName('MODELO').AsInteger;
        pDataEmissao := FieldByName('DATAEMISSAO').AsDateTime;

        pDestinatario.Codigo      := FieldByName('NFE_DESTINATARIO_CODIGO').AsInteger;
        pDestinatario.RazaoSocial := FieldByName('NFE_DESTINATARIO_RAZAO').AsString;
        pDestinatario.CpfCnpj     := FieldByName('NFE_DESTINATARIO_CNPJ').AsString;
        pDestinatario.InsEstadual := FieldByName('NFE_DESTINATARIO_INSCEST').AsString;
        pDestinatario.UF          := FieldByName('NFE_DESTINATARIO_UF').AsString;

        if (FieldByName('ANOVENDA').AsInteger > 0) then
        begin
          pDestinatario.Tipo := dtCliente;
          MovimentoAno       := FieldByName('ANOVENDA').AsInteger;
          MovimentoCodigo    := FieldByName('NUMVENDA').AsInteger;
        end
        else
        if (FieldByName('ANOCOMPRA').AsInteger > 0) then
        begin
          pDestinatario.Tipo := dtFornecedor;
          MovimentoAno       := FieldByName('ANOCOMPRA').AsInteger;
          MovimentoCodigo    := FieldByName('NUMCOMPRA').AsInteger;
        end
        else
          pDestinatario.Tipo := dtNull;
      end;
  finally
    AForm.Free;
  end;
end;

procedure TViewNFEPesquisa.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar Notas Fiscais Canceladas
    if ( DtSrcTabela.DataSet.FieldByName('CANCELADA').AsInteger = 1 ) then
      dbgDados.Canvas.Font.Color := lblNotaCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
end;

procedure TViewNFEPesquisa.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.NFeEnviada;

  inherited;
  RotinaID           := EmptyStr;
  ControlFirstEdit   := dbCodigo;
  fEmpresa           := FController.DAO.Usuario.Empresa.CNPJ;
  fSemNFComplementar := False;

  DisplayFormatCodigo := '###0000000';
  NomeTabela      := 'TBNFE_ENVIADA';
  CampoCodigo     := 'nf.numero';
  CampoDescricao  := 'nf.chave';
  CampoOrdenacao  := 'nf.empresa, nf.numero, nf.serie';
  WhereAdditional := 'nf.empresa = ' + QuotedStr(fEmpresa) + ' and ' +
    'nf.dataemissao between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  tbsCadastro.TabVisible := False;

  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));
  e2Data.Date := Date;

  // Configurar tabela de cadastro
  Tabela
    .Display('NUMERO', 'Número', '###0000000', TAlignment.taCenter, False)
    .Display('NFE_VALOR_TOTAL', 'Valor NF (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Configurar;
end;

procedure TViewNFEPesquisa.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := 'nf.empresa = ' + QuotedStr(fEmpresa) + ' and ' +
    'nf.dataemissao between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if fSemNFComplementar then
    WhereAdditional := WhereAdditional +
//      ' and (coalesce(nf.anovenda, nf.anocompra, 0) > 0)' +
      ' and ((coalesce(nf.anovenda, nf.anocompra, 0) > 0) or (nf.lote_ano = 0))' +    // Voltar ao código anterior em 12/2015
      ' and (coalesce(nf.cancelada, 0) = 0)';

  inherited;
end;

initialization
  FormFunction.RegisterForm('ViewNFEPesquisa', TViewNFEPesquisa);

end.
