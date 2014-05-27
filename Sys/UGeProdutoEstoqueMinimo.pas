unit UGeProdutoEstoqueMinimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls, ToolWin, ComCtrls, DB,
  DBClient, Provider, IBCustomDataSet, IBQuery, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxGrid,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdMessage, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP;

type
  TFrmGeProdutoEstoqueMinimo = class(TfrmGrPadrao)
    pnlPesquisa: TPanel;
    GrpBxPesquisar: TGroupBox;
    BtnPesquisar: TSpeedButton;
    lblPesquisar: TLabel;
    lblTipoFiltro: TLabel;
    edPesquisar: TEdit;
    edTipoFiltro: TComboBox;
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    btbtnIncluir: TBitBtn;
    btBtnEnviarEmail: TBitBtn;
    Bevel3: TBevel;
    QryProduto: TIBQuery;
    DspProduto: TDataSetProvider;
    CdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    QryGrupo: TIBQuery;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    dsGrupo: TDataSource;
    QryFabricante: TIBQuery;
    DspFabricante: TDataSetProvider;
    CdsFabricante: TClientDataSet;
    dsFabricante: TDataSource;
    PgcTabelas: TPageControl;
    TbsGrupo: TTabSheet;
    dbgGrupo: TcxGrid;
    dbgGrupoTbl: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn31: TcxGridDBBandedColumn;
    cxGridDBBandedColumn32: TcxGridDBBandedColumn;
    cxGridDBBandedColumn33: TcxGridDBBandedColumn;
    cxGridDBBandedColumn34: TcxGridDBBandedColumn;
    cxGridDBBandedColumn35: TcxGridDBBandedColumn;
    cxGridDBBandedColumn36: TcxGridDBBandedColumn;
    cxGridDBBandedColumn56: TcxGridDBBandedColumn;
    cxGridDBBandedColumn57: TcxGridDBBandedColumn;
    cxGridDBBandedColumn58: TcxGridDBBandedColumn;
    dbgGrupoTblColumn1: TcxGridDBBandedColumn;
    dbgGrupoTblColumn2: TcxGridDBBandedColumn;
    dbgGrupoTblColumn3: TcxGridDBBandedColumn;
    dbgGrupoTblColumn4: TcxGridDBBandedColumn;
    dbgGrupoLvl: TcxGridLevel;
    TbsFabricante: TTabSheet;
    TbsProduto: TTabSheet;
    dbgProduto: TcxGrid;
    dbgProdutoTbl: TcxGridDBBandedTableView;
    dbgProdutoTblColumn1: TcxGridDBBandedColumn;
    dbgProdutoTblColumn2: TcxGridDBBandedColumn;
    dbgProdutoTblColumn3: TcxGridDBBandedColumn;
    dbgProdutoTblColumn4: TcxGridDBBandedColumn;
    dbgProdutoTblColumn5: TcxGridDBBandedColumn;
    dbgProdutoTblColumn6: TcxGridDBBandedColumn;
    dbgProdutoTblColumn7: TcxGridDBBandedColumn;
    dbgProdutoTblColumn8: TcxGridDBBandedColumn;
    dbgProdutoTblColumn29: TcxGridDBBandedColumn;
    dbgProdutoTblColumn30: TcxGridDBBandedColumn;
    dbgProdutoTblColumn31: TcxGridDBBandedColumn;
    dbgProdutoTblColumn32: TcxGridDBBandedColumn;
    dbgProdutoLvl: TcxGridLevel;
    dbgProdutoTblColumn9: TcxGridDBBandedColumn;
    CdsProdutoCODEMP: TStringField;
    CdsProdutoCOD: TStringField;
    CdsProdutoCODIGO: TIntegerField;
    CdsProdutoDESCRI: TStringField;
    CdsProdutoAPRESENTACAO: TStringField;
    CdsProdutoDESCRI_APRESENTACAO: TStringField;
    CdsProdutoCODGRUPO: TSmallintField;
    CdsProdutoGRUPO: TStringField;
    CdsProdutoCODFABRICANTE: TIntegerField;
    CdsProdutoFABRICANTE: TStringField;
    CdsProdutoESTOQMIN: TSmallintField;
    CdsProdutoCODUNIDADE: TSmallintField;
    CdsProdutoUNIDADE: TStringField;
    CdsProdutoCOMPRA_QTDE_01: TBCDField;
    CdsProdutoCOMPRA_VALOR_01: TBCDField;
    CdsProdutoVENDA_QTDE_01: TBCDField;
    CdsProdutoVENDA_VALOR_01: TBCDField;
    CdsProdutoDATA_ULTIMA_COMPRA: TDateField;
    CdsProdutoDATA_ULTIMA_VENDA: TDateField;
    StyleRepository: TcxStyleRepository;
    StyleSelecao: TcxStyle;
    StyleContent: TcxStyle;
    StyleContentEven: TcxStyle;
    svdArquivo: TSaveDialog;
    smtpEmail: TIdSMTP;
    msgEmail: TIdMessage;
    IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket;
    QryTotal: TIBQuery;
    DspTotal: TDataSetProvider;
    CdsTotal: TClientDataSet;
    dsTotal: TDataSource;
    CdsGrupoCODIGO: TSmallintField;
    CdsGrupoDESCRICAO: TStringField;
    CdsGrupoITENS: TIntegerField;
    CdsGrupoCOMPRA_QTDE_01: TBCDField;
    CdsGrupoCOMPRA_VALOR_01: TBCDField;
    CdsGrupoVENDA_QTDE_01: TBCDField;
    CdsGrupoVENDA_VALOR_01: TBCDField;
    CdsGrupoDATA_ULTIMA_COMPRA: TDateField;
    CdsGrupoDATA_ULTIMA_VENDA: TDateField;
    CdsGrupoPERCENT_CQ01: TBCDField;
    CdsGrupoPERCENT_CV01: TBCDField;
    CdsGrupoPERCENT_VQ01: TBCDField;
    CdsGrupoPERCENT_VV01: TBCDField;
    dbgGrupoTblColumn5: TcxGridDBBandedColumn;
    dbgFab: TcxGrid;
    dbgFabTbl: TcxGridDBBandedTableView;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    cxGridDBBandedColumn9: TcxGridDBBandedColumn;
    cxGridDBBandedColumn10: TcxGridDBBandedColumn;
    cxGridDBBandedColumn11: TcxGridDBBandedColumn;
    cxGridDBBandedColumn12: TcxGridDBBandedColumn;
    cxGridDBBandedColumn13: TcxGridDBBandedColumn;
    cxGridDBBandedColumn14: TcxGridDBBandedColumn;
    cxGridDBBandedColumn15: TcxGridDBBandedColumn;
    cxGridDBBandedColumn16: TcxGridDBBandedColumn;
    cxGridDBBandedColumn17: TcxGridDBBandedColumn;
    cxGridDBBandedColumn18: TcxGridDBBandedColumn;
    dbgFabLvl: TcxGridLevel;
    CdsFabricanteCODIGO: TIntegerField;
    CdsFabricanteDESCRICAO: TStringField;
    CdsFabricanteESTOQUE_MINIMO: TLargeintField;
    CdsFabricanteITENS: TIntegerField;
    CdsFabricanteCOMPRA_QTDE_01: TBCDField;
    CdsFabricanteCOMPRA_VALOR_01: TBCDField;
    CdsFabricanteVENDA_QTDE_01: TBCDField;
    CdsFabricanteVENDA_VALOR_01: TBCDField;
    CdsFabricanteDATA_ULTIMA_COMPRA: TDateField;
    CdsFabricanteDATA_ULTIMA_VENDA: TDateField;
    CdsFabricantePERCENT_CQ01: TBCDField;
    CdsFabricantePERCENT_CV01: TBCDField;
    CdsFabricantePERCENT_VQ01: TBCDField;
    CdsFabricantePERCENT_VV01: TBCDField;
    CdsGrupoESTOQUE: TBCDField;
    CdsGrupoESTOQUE_MINIMO: TLargeintField;
    CdsFabricanteESTOQUE: TBCDField;
    CdsProdutoQTDE: TBCDField;
    procedure NovaPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTipoFiltroChange(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure dbgGrupoTblDblClick(Sender: TObject);
    procedure dbgFabTblDblClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btBtnEnviarEmailClick(Sender: TObject);
  private
    { Private declarations }
    FSQLTotal   ,
    FSQLGrupo   ,
    FSQLFabricante,
    FSQLProduto : TStringList;
    procedure HabilitarGuia(const TipoFiltro : Integer);
    procedure ExecutarPesquisa(const TipoFiltro : Integer);
    procedure CalcularPercentuais( cdsTabela : TClientDataSet );
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  FrmGeProdutoEstoqueMinimo: TFrmGeProdutoEstoqueMinimo;

implementation

uses
  UDMBusiness, UConstantesDGE, cxGridExportLink;

{$R *.dfm}

const
  TIPO_GRP = 0;
  TIPO_FAB = 1;
  TIPO_PRD = 2;

  WHR_DEFAULT = '1=1';

{ TFrmGeProdutoEstoqueMinimo }

procedure TFrmGeProdutoEstoqueMinimo.HabilitarGuia(
  const TipoFiltro: Integer);
var
  I : Integer;
begin
  for I := 0 to PgcTabelas.PageCount - 1 do
    PgcTabelas.Pages[I].TabVisible := False;

  if ( TipoFiltro < PgcTabelas.PageCount ) then
  begin
    PgcTabelas.Pages[TipoFiltro].TabVisible := True;
    PgcTabelas.Pages[TipoFiltro].Caption    := edTipoFiltro.Items.Strings[TipoFiltro];
  end;
end;

procedure TFrmGeProdutoEstoqueMinimo.FormCreate(Sender: TObject);
begin
  {$IFDEF DGE}
  dbgGrupo.LookAndFeel.AssignedValues := [lfvKind,lfvNativeStyle,lfvSkinName];
  dbgGrupo.LookAndFeel.Kind           := lfStandard;
  dbgGrupo.LookAndFeel.NativeStyle    := True;

  dbgFab.LookAndFeel.AssignedValues := [lfvKind,lfvNativeStyle,lfvSkinName];
  dbgFab.LookAndFeel.Kind           := lfStandard;
  dbgFab.LookAndFeel.NativeStyle    := True;

  dbgProduto.LookAndFeel.AssignedValues := [lfvKind,lfvNativeStyle,lfvSkinName];
  dbgProduto.LookAndFeel.Kind           := lfStandard;
  dbgProduto.LookAndFeel.NativeStyle    := True;
  {$ENDIF}

  inherited;

  FSQLTotal := TStringList.Create;
  FSQLTotal.AddStrings( QryTotal.SQL );

  FSQLGrupo := TStringList.Create;
  FSQLGrupo.AddStrings( QryGrupo.SQL );

  FSQLFabricante := TStringList.Create;
  FSQLFabricante.AddStrings( QryFabricante.SQL );

  FSQLProduto := TStringList.Create;
  FSQLProduto.AddStrings( QryProduto.SQL );

  edTipoFiltro.ItemIndex := TIPO_PRD;
  HabilitarGuia(edTipoFiltro.ItemIndex);
end;

procedure TFrmGeProdutoEstoqueMinimo.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( (Key = VK_RETURN) and (ActiveControl = edPesquisar) ) then
    BtnPesquisar.Click
  else
  if ( Key = VK_F5 ) then
    BtnPesquisar.Click
  else
  if ( Key = VK_ESCAPE ) then
  begin
    if ( PgcTabelas.ActivePageIndex <> edTipoFiltro.ItemIndex ) then
      HabilitarGuia( edTipoFiltro.ItemIndex );
  end;

  inherited;
end;

procedure TFrmGeProdutoEstoqueMinimo.NovaPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key in ['0'..'9', 'a'..'z', 'A'..'Z', ' '] ) then
  begin
    edPesquisar.Text := Trim(Key);
    edPesquisar.SetFocus;
    edPesquisar.SelStart := Length(edPesquisar.Text) + 1;

    Key := #0;
  end
end;

procedure TFrmGeProdutoEstoqueMinimo.edTipoFiltroChange(Sender: TObject);
begin
  HabilitarGuia(edTipoFiltro.ItemIndex);
end;

procedure TFrmGeProdutoEstoqueMinimo.ExecutarPesquisa(
  const TipoFiltro: Integer);
var
  sWhr : String;
begin
  sWhr := '(p.codemp = ' + QuotedStr(GetEmpresaIDDefault) + ')';

  CdsTotal.Close;
  with QryTotal do
  begin
    SQL.Clear;
    SQL.AddStrings( FSQLTotal );
    SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
  end;
  CdsTotal.Open;

  Case TipoFiltro of
    TIPO_PRD:
      begin
        CdsProduto.Close;
        with QryProduto do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLProduto );

          if ( Trim(edPesquisar.Text) <> EmptyStr ) then
            if ( StrToIntDef(Trim(edPesquisar.Text), 0) > 0 ) then
              sWhr := sWhr + ' and (p.cod like ' + QuotedStr('%' + edPesquisar.Text + '%') + ')'
            else
              sWhr := sWhr + ' and (upper(p.descri) like ' + QuotedStr(edPesquisar.Text + '%') + ')';

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( CdsProduto.IsEmpty ) then
          ShowWarning('Dados não encontados de acordo com o filtro informado!');
      end;

    TIPO_GRP:
      begin
        CdsGrupo.Close;
        with QryGrupo do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLGrupo );

          if ( Trim(edPesquisar.Text) <> EmptyStr ) then
            if ( StrToIntDef(Trim(edPesquisar.Text), 0) > 0 ) then
              sWhr := sWhr + ' and (p.codgrupo = ' + edPesquisar.Text + ')'
            else
              sWhr := sWhr + ' and (upper(g.descri) like ' + QuotedStr(edPesquisar.Text + '%') + ')';

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsGrupo.Open;

        if ( CdsGrupo.IsEmpty ) then
          ShowWarning('Dados não encontados de acordo com o filtro informado!')
        else
          CalcularPercentuais( CdsGrupo );
      end;

    TIPO_FAB:
      begin
        CdsFabricante.Close;
        with QryFabricante do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLFabricante );

          if ( Trim(edPesquisar.Text) <> EmptyStr ) then
            if ( StrToIntDef(Trim(edPesquisar.Text), 0) > 0 ) then
              sWhr := sWhr + ' and (p.codfabricante = ' + edPesquisar.Text + ')'
            else
              sWhr := sWhr + ' and (upper(f.nome) like ' + QuotedStr(edPesquisar.Text + '%') + ')';

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsFabricante.Open;

        if ( CdsFabricante.IsEmpty ) then
          ShowWarning('Dados não encontados de acordo com o filtro informado!')
        else
          CalcularPercentuais( CdsFabricante );
      end;
  end;
end;

procedure TFrmGeProdutoEstoqueMinimo.BtnPesquisarClick(Sender: TObject);
begin
  ExecutarPesquisa(edTipoFiltro.ItemIndex);
end;

procedure TFrmGeProdutoEstoqueMinimo.CalcularPercentuais(
  cdsTabela: TClientDataSet);
var
  I ,
  X : Integer;
  sOrigem  ,
  sDestino : String;
const
  // Coompra
  FIELD_CMP_QTDE   = 'compra_qtde_';
  FIELD_CMP_VALOR  = 'compra_valor_';
  FIELD_PERCENT_CQ = 'percent_cq';
  FIELD_PERCENT_CV = 'percent_cv';
  // Venda
  FIELD_VND_QTDE   = 'venda_qtde_';
  FIELD_VND_VALOR  = 'venda_valor_';
  FIELD_PERCENT_VQ = 'percent_vq';
  FIELD_PERCENT_VV = 'percent_vv';
  // Controlles Fields
  FIELDS_CONTADOR : Array[1..1] of String = ('01');             // Array[1..6] of String = ('01', '03', '06', '09', '12', '99');
  FIELDS_ORIGEM   : Array[1..1] of String = (FIELD_CMP_QTDE);   // Array[1..4] of String = (FIELD_CMP_QTDE,   FIELD_CMP_VALOR,  FIELD_VND_QTDE,   FIELD_VND_VALOR);
  FIELDS_DESTINO  : Array[1..1] of String = (FIELD_PERCENT_CQ); // Array[1..4] of String = (FIELD_PERCENT_CQ, FIELD_PERCENT_CV, FIELD_PERCENT_VQ, FIELD_PERCENT_VV);
begin

  with cdsTabela do
  begin

  if ( IsEmpty ) then
    Exit;

    DisableControls;
    First;

    while not Eof do
    begin
      Edit;

      for I := Low(FIELDS_CONTADOR) to High(FIELDS_CONTADOR) do
      begin
        for X := Low(FIELDS_ORIGEM) to High(FIELDS_ORIGEM) do
        begin
          sOrigem  := FIELDS_ORIGEM[X]  + FIELDS_CONTADOR[I];
          sDestino := FIELDS_DESTINO[X] + FIELDS_CONTADOR[I];

          if ( FieldByName(sOrigem).AsCurrency = 0 ) then
            FieldByName(sDestino).AsCurrency := 0
          else
            FieldByName(sDestino).AsCurrency := (FieldByName(sOrigem).AsCurrency / CdsTotal.FieldByName(sOrigem).AsCurrency) * 100;
        end;
      end;

      Post;

      Next;
    end;

    First;
    EnableControls;

  end;

end;

procedure TFrmGeProdutoEstoqueMinimo.dbgGrupoTblDblClick(Sender: TObject);
var
  sWhr : String;
begin
  sWhr := '(p.codemp = ' + QuotedStr(GetEmpresaIDDefault) + ')';

  Case edTipoFiltro.ItemIndex of
    TIPO_GRP:
      begin
        if ( CdsGrupo.IsEmpty ) then
          Exit;

        CdsProduto.Close;
        with QryProduto do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLProduto );

          if ( CdsGrupoCODIGO.IsNull ) then
            sWhr := sWhr + ' and (p.codgrupo is null)'
          else
            sWhr := sWhr + ' and (p.codgrupo = ' + CdsGrupoCODIGO.AsString + ')';

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( not CdsProduto.IsEmpty ) then
          HabilitarGuia( TIPO_PRD );
      end;

  end;
end;

procedure TFrmGeProdutoEstoqueMinimo.dbgFabTblDblClick(Sender: TObject);
var
  sWhr : String;
begin
  sWhr := '(p.codemp = ' + QuotedStr(GetEmpresaIDDefault) + ')';

  Case edTipoFiltro.ItemIndex of
    TIPO_FAB:
      begin
        if ( CdsFabricante.IsEmpty ) then
          Exit;

        CdsProduto.Close;
        with QryProduto do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLProduto );

          if ( CdsFabricanteCODIGO.IsNull ) then
            sWhr := sWhr + ' and (p.codfabricante is null)'
          else
            sWhr := sWhr + ' and (p.codfabricante = ' + CdsFabricanteCODIGO.AsString + ')';

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( not CdsProduto.IsEmpty ) then
          HabilitarGuia( TIPO_PRD );
      end;

  end;
end;

procedure TFrmGeProdutoEstoqueMinimo.btbtnIncluirClick(Sender: TObject);
begin
  Case PgcTabelas.ActivePageIndex of
    TIPO_GRP:
      if ( CdsGrupo.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_FAB:
      if ( CdsFabricante.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_PRD:
      if ( CdsProduto.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;
  end;

  if ( svdArquivo.Execute ) then
    Case PgcTabelas.ActivePageIndex of
      TIPO_GRP: ExportGridToExcel(svdArquivo.FileName, dbgGrupo);
      TIPO_FAB: ExportGridToExcel(svdArquivo.FileName, dbgFab);
      TIPO_PRD: ExportGridToExcel(svdArquivo.FileName, dbgProduto);
    end;
end;

procedure TFrmGeProdutoEstoqueMinimo.btBtnEnviarEmailClick(
  Sender: TObject);
var
  sAssunto  ,
  sEmailTo  ,
  sAssinaturaHtml,
  sAssinaturaTxt ,
  sFileNameHtml  ,
  sFileNameXls   : String;
begin
  Case PgcTabelas.ActivePageIndex of
    TIPO_GRP:
      if ( CdsGrupo.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_FAB:
      if ( CdsFabricante.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_PRD:
      if ( CdsProduto.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;
  end;

  sEmailTo := GetEmailEmpresa(GetEmpresaIDDefault);
  if not InputQuery('Enviar e-mail', 'Favor informar e-mail do destinatário:', sEmailTo) then
    Exit;

  if ( Trim(sEmailTo) = EmptyStr ) then
    Exit;

  sFileNameHtml := ExtractFilePath(Application.ExeName) + '_Temp\' + FormatDateTime('yyyymmdd_hhmmss".html"', Now);
  sFileNameXls  := ExtractFilePath(Application.ExeName) + '_Temp\' + FormatDateTime('yyyymmdd_hhmmss".xls"', Now);
  ForceDirectories(ExtractFilePath(sFileNameHtml));

  Case PgcTabelas.ActivePageIndex of
    TIPO_GRP:
      begin
        ExportGridToHTML(sFileNameHtml, dbgGrupo);
        ExportGridToExcel(sFileNameXls, dbgGrupo);
      end;

    TIPO_FAB:
      begin
        ExportGridToHTML(sFileNameHtml, dbgFab);
        ExportGridToExcel(sFileNameXls, dbgFab);
      end;

    TIPO_PRD:
      begin
        ExportGridToHTML(sFileNameHtml, dbgProduto);
        ExportGridToExcel(sFileNameXls, dbgProduto);
      end;
  end;

  Screen.Cursor := crHourGlass;
  try
    try
      sAssunto := FormatDateTime('dd/mm/yyyy', Date) + ' - Alerta de Estoque Mínimo (' + edTipoFiltro.Text + ')';;
      CarregarConfiguracoesEmpresa(GetEmpresaIDDefault, sAssunto, sAssinaturaHtml, sAssinaturaTxt);

      smtpEmail.Username    := gContaEmail.Conta;
      smtpEmail.Password    := gContaEmail.Senha;
      smtpEmail.Host        := gContaEmail.Servidor_SMTP;
      smtpEmail.Port        := gContaEmail.Porta_SMTP;
      smtpEmail.ReadTimeout := 10000;    // Leitura da Conexão em 10 segundos!

      if gContaEmail.RequerAutenticacao then
        smtpEmail.AuthenticationType := atLogin
      else
        smtpEmail.AuthenticationType := atNone;

      if gContaEmail.ConexaoSeguraSSL then
        smtpEmail.IOHandler := IdSSLIOHandlerSocket
      else
        smtpEmail.IOHandler := nil;

      // Origem
      msgEmail.From.Address := gContaEmail.Conta;
      msgEmail.Body.Text    := gContaEmail.Assinatura_Padrao;
      msgEmail.Subject      := sAssunto;

      // Destino
      msgEmail.Recipients.EMailAddresses := sEmailTo;

      TIdAttachment.Create(msgEmail.MessageParts, sFileNameHtml);
      TIdAttachment.Create(msgEmail.MessageParts, sFileNameXls);

      smtpEmail.Connect;
      smtpEmail.Authenticate;
      smtpEmail.Send(msgEmail);

      ShowInformation('E-mail enviado com sucesso!' + #13 + 'Arquivo(s) anexo(s) : ' + #13 + sFileNameHtml + #13 + sFileNameXls);
    except
      On E : Exception do
        ShowError('Erro ao tentar enviar e-mail com o resultado da consulta de estoque mínimo.' + #13#13 + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    if smtpEmail.Connected then
      smtpEmail.Disconnect;
  end;
end;

procedure TFrmGeProdutoEstoqueMinimo.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('FrmGeProdutoEstoqueMinimo', TFrmGeProdutoEstoqueMinimo);

end.
