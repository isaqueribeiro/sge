unit UGeApropriacaoEstoquePesquisa;

interface

uses
  UGrPadrao,
  
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, BarMenus, RxSpeedBar, RXCtrls, ExtCtrls, jpeg,
  cxGraphics, dxGDIPlusClasses, cxLookAndFeelPainters,
  cxControls, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IBStoredProc,
  DBClient, Provider, IBCustomDataSet, IBQuery, DBCtrls, Gauges, ToolWin,
  cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, Buttons, cxLookAndFeels, cxButtons,
  dxSkinsForm, Mask, rxToolEdit,

  dxSkinsCore, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, cxCurrencyEdit;

type        
  TfrmGeApropriacaoEstoquePesquisa = class(TfrmGrPadrao)
    pnlPesquisa: TPanel;
    GrpBxPesquisar: TGroupBox;
    BtnPesquisar: TSpeedButton;
    lblPesquisar: TLabel;
    lblTipoFiltro: TLabel;
    edPesquisar: TEdit;
    edTipoFiltro: TComboBox;
    edCentroCusto: TComboEdit;
    lblCentroCusto: TLabel;
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    btBtnExportar: TcxButton;
    btBtnEnviarEmail: TcxButton;
    Bevel3: TBevel;
    svdArquivo: TSaveDialog;
    smtpEmail: TIdSMTP;
    msgEmail: TIdMessage;
    IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket;
    StyleRepository: TcxStyleRepository;
    StyleSelecao: TcxStyle;
    StyleContent: TcxStyle;
    StyleContentEven: TcxStyle;
    QryGrupo: TIBQuery;
    QryFabricante: TIBQuery;
    QryProduto: TIBQuery;
    QryTotal: TIBQuery;
    DspTotal: TDataSetProvider;
    DspProduto: TDataSetProvider;
    DspFabricante: TDataSetProvider;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    CdsFabricante: TClientDataSet;
    CdsProduto: TClientDataSet;
    CdsTotal: TClientDataSet;
    dsTotal: TDataSource;
    dsProduto: TDataSource;
    dsFabricante: TDataSource;
    dsGrupo: TDataSource;
    PgcTabelas: TPageControl;
    TbsGrupo: TTabSheet;
    dbgGrupo: TcxGrid;
    dbgGrupoTbl: TcxGridDBBandedTableView;
    dbgGrupoTblGRUPO_COD: TcxGridDBBandedColumn;
    dbgGrupoTblGRUPO_DESC: TcxGridDBBandedColumn;
    dbgGrupoTblCUSTO_TOTAL: TcxGridDBBandedColumn;
    dbgGrupoTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn;
    dbgGrupoTblDISPONIVEL: TcxGridDBBandedColumn;
    dbgGrupoTblITENS: TcxGridDBBandedColumn;
    dbgGrupoTblESTOQUE: TcxGridDBBandedColumn;
    dbgGrupoLvl: TcxGridLevel;
    TbsFabricante: TTabSheet;
    dbgFab: TcxGrid;
    dbgFabTbl: TcxGridDBBandedTableView;
    dbgFabTblFABRICANTE_COD: TcxGridDBBandedColumn;
    dbgFabTblFABRICANTE_NOME: TcxGridDBBandedColumn;
    dbgFabTblCUSTO_TOTAL: TcxGridDBBandedColumn;
    dbgFabTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn;
    dbgFabTblDISPONIVEL: TcxGridDBBandedColumn;
    dbgFabTblITENS: TcxGridDBBandedColumn;
    dbgFabTblESTOQUE: TcxGridDBBandedColumn;
    dbgFabLvl: TcxGridLevel;
    TbsProduto: TTabSheet;
    dbgProduto: TcxGrid;
    dbgProdutoTbl: TcxGridDBBandedTableView;
    dbgProdutoTblPRODUTO: TcxGridDBBandedColumn;
    dbgProdutoTblDESCRI_APRESENTACAO: TcxGridDBBandedColumn;
    dbgProdutoTblCUSTO_TOTAL: TcxGridDBBandedColumn;
    dbgProdutoTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn;
    dbgProdutoTblDISPONIVEL: TcxGridDBBandedColumn;
    dbgProdutoTblUND: TcxGridDBBandedColumn;
    dbgProdutoTblGRUPO_DES: TcxGridDBBandedColumn;
    dbgProdutoTblFABRICANTE_NOME: TcxGridDBBandedColumn;
    dbgProdutoTblESTOQUE: TcxGridDBBandedColumn;
    dbgProdutoLvl: TcxGridLevel;
    btbtnSelecionar: TcxButton;
    Bevel4: TBevel;
    dbgProdutoTblPERCENTUAL: TcxGridDBBandedColumn;
    dbgFabTblPERCENTUAL: TcxGridDBBandedColumn;
    dbgGrupoTblPERCENTUAL: TcxGridDBBandedColumn;
    procedure NovaPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCentroCustoButtonClick(Sender: TObject);
    procedure edCentroCustoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure edTipoFiltroChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgGrupoTblDblClick(Sender: TObject);
    procedure dbgFabTblDblClick(Sender: TObject);
    procedure btbtnSelecionarClick(Sender: TObject);
    procedure btBtnExportarClick(Sender: TObject);
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
  frmGeApropriacaoEstoquePesquisa: TfrmGeApropriacaoEstoquePesquisa;

  function SelecionarProdutoLoteAlmox(const AOnwer : TComponent; const CentroCustoID : Integer; const CentroCustoNome : String;
    var ProdutoID, ProdutoDesc, LoteID, UnidadeDesc : String; var Unidade : Integer;
    var Estoque, Reserva, Disponivel : Currency) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE, cxGridExportLink, UGeCentroCusto;

{$R *.dfm}

const
  TIPO_GRP = 0;
  TIPO_FAB = 1;
  TIPO_PRD = 2;

  WHR_DEFAULT = '1=1';

  XXX_S = '''xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'' as lote_id--';
  XXX_G = '''xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx''--';

function SelecionarProdutoLoteAlmox(const AOnwer : TComponent; const CentroCustoID : Integer; const CentroCustoNome : String;
  var ProdutoID, ProdutoDesc, LoteID, UnidadeDesc : String; var Unidade : Integer;
  var Estoque, Reserva, Disponivel : Currency) : Boolean;
var
  AForm : TfrmGeApropriacaoEstoquePesquisa;
begin
  AForm := TfrmGeApropriacaoEstoquePesquisa.Create(AOnwer);
  try
    with AForm do
    begin
      edTipoFiltro.ItemIndex  := TIPO_PRD;
      edCentroCusto.Tag       := CentroCustoID;
      edCentroCusto.Text      := CentroCustoNome;

      lblTipoFiltro.Enabled   := False;
      edTipoFiltro.Enabled    := False;
      lblCentroCusto.Enabled  := False;
      edCentroCusto.Enabled   := False;

      btbtnSelecionar.Visible := True;
      
      Result := (ShowModal = mrOk);

      if Result then
      begin
        ProdutoID   := CdsProduto.FieldByName('produto').AsString;
        ProdutoDesc := CdsProduto.FieldByName('descri_apresentacao').AsString;
        LoteID      := CdsProduto.FieldByName('lote_id').AsString;
        UnidadeDesc := CdsProduto.FieldByName('und').AsString;
        Unidade     := CdsProduto.FieldByName('und_cod').AsInteger;
        Estoque     := CdsProduto.FieldByName('estoque').AsCurrency;
        Reserva     := CdsProduto.FieldByName('reserva').AsCurrency;
        Disponivel  := CdsProduto.FieldByName('disponivel').AsCurrency;
      end;
    end;
  finally
    AForm.Free;
  end;
end;

{ TfrmGeApropriacaoEstoquePesquisa }

procedure TfrmGeApropriacaoEstoquePesquisa.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.NovaPesquisaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if ( Key in ['0'..'9', 'a'..'z', 'A'..'Z', ' '] ) then
  begin
    edPesquisar.Text := Trim(Key);
    edPesquisar.SetFocus;
    edPesquisar.SelStart := Length(edPesquisar.Text) + 1;

    Key := #0;
  end
end;

procedure TfrmGeApropriacaoEstoquePesquisa.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  procedure LimparCentroCusto;
  begin
    edCentroCusto.Tag  := 0;
    edCentroCusto.Text := '(Todos)';
  end;

begin
  if ( (Key = VK_RETURN) and (ActiveControl = edPesquisar) ) then
    BtnPesquisar.Click
  else
  if ( Key = VK_F2 ) then
  begin
    if btbtnSelecionar.Visible and btbtnSelecionar.Enabled then
      btbtnSelecionar.Click;
  end
  else
  if ( Key = VK_F5 ) then
    BtnPesquisar.Click
  else
  if ( Key = VK_ESCAPE ) then
  begin
    if ( PgcTabelas.ActivePageIndex <> edTipoFiltro.ItemIndex ) then
      HabilitarGuia( edTipoFiltro.ItemIndex );
  end
  else
  if ( Key = VK_DELETE ) then
  begin
    if edCentroCusto.Focused then
      LimparCentroCusto;
  end
  else
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin
    if edCentroCusto.Focused then
      LimparCentroCusto;
  end;

  inherited;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.edCentroCustoButtonClick(
  Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  if ( SelecionarDepartamento(Self, 0, GetEmpresaIDDefault, iCodigo, sNome, iCliente) ) then
  begin
    edCentroCusto.Tag  := iCodigo;
    edCentroCusto.Text := sNome;
  end;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.edCentroCustoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
    edPesquisar.SetFocus
  else
    Key := #0;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.HabilitarGuia(
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

procedure TfrmGeApropriacaoEstoquePesquisa.BtnPesquisarClick(
  Sender: TObject);
begin
  ExecutarPesquisa(edTipoFiltro.ItemIndex);
end;

procedure TfrmGeApropriacaoEstoquePesquisa.edTipoFiltroChange(
  Sender: TObject);
begin
  HabilitarGuia(edTipoFiltro.ItemIndex);
end;

procedure TfrmGeApropriacaoEstoquePesquisa.FormCreate(Sender: TObject);
begin
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

procedure TfrmGeApropriacaoEstoquePesquisa.ExecutarPesquisa(
  const TipoFiltro: Integer);
var
  sWhr : String;
begin
  sWhr := '(1=1)';

  CdsTotal.Close;

  with QryTotal do
  begin
    SQL.Clear;
    SQL.AddStrings( FSQLTotal );

    SQL.Text := StringReplace(SQL.Text, 'e=e', GetEmpresaIDDefault, [rfReplaceAll]);
    SQL.Text := StringReplace(SQL.Text, 'c=c', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
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

          SQL.Text := StringReplace(SQL.Text, 'e=e', GetEmpresaIDDefault, [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, 'c=c', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);

          if btbtnSelecionar.Visible then
          begin
            SQL.Text := StringReplace(SQL.Text, XXX_S, EmptyStr, [rfReplaceAll]);
            SQL.Text := StringReplace(SQL.Text, XXX_G, EmptyStr, [rfReplaceAll]);
          end;
        end;      

        CdsProduto.Open;

        if ( CdsProduto.IsEmpty ) then
          ShowWarning('Dados não encontados de acordo com o filtro informado!')
        else
        begin
          CalcularPercentuais( CdsProduto );
          if (PgcTabelas.ActivePage = TbsProduto) then
            dbgProduto.SetFocus;
        end;

        btbtnSelecionar.Enabled := not CdsProduto.IsEmpty;
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
              sWhr := sWhr + ' and (p.codgrupo like ' + QuotedStr('%' + edPesquisar.Text + '%') + ')'
            else
              sWhr := sWhr + ' and ((upper(g.descri) like ' + QuotedStr(edPesquisar.Text + '%') + ') or (g.descri is null))';

          SQL.Text := StringReplace(SQL.Text, 'e=e', GetEmpresaIDDefault, [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, 'c=c', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;

        CdsGrupo.Open;

        if ( CdsGrupo.IsEmpty ) then
          ShowWarning('Dados não encontados de acordo com o filtro informado!')
        else
        begin
          CalcularPercentuais( CdsGrupo );
          if (PgcTabelas.ActivePage = TbsGrupo) then
            dbgGrupo.SetFocus;
        end
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
              sWhr := sWhr + ' and (p.codfabricante like ' + QuotedStr('%' + edPesquisar.Text + '%') + ')'
            else
              sWhr := sWhr + ' and ((upper(f.nome) like ' + QuotedStr(edPesquisar.Text + '%') + ') or (f.nome is null))';

          SQL.Text := StringReplace(SQL.Text, 'e=e', GetEmpresaIDDefault, [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, 'c=c', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;

        CdsFabricante.Open;

        if ( CdsFabricante.IsEmpty ) then
          ShowWarning('Dados não encontados de acordo com o filtro informado!')
        else
        begin
          CalcularPercentuais( CdsFabricante );
          if (PgcTabelas.ActivePage = TbsFabricante) then
            dbgFab.SetFocus;
        end
      end;
  end;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.CalcularPercentuais(
  cdsTabela: TClientDataSet);
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

      if ( CdsTotal.FieldByName('CUSTO_DISPONIVEL').AsCurrency = 0 ) then
        FieldByName('PERCENTUAL').AsCurrency := 0
      else
        FieldByName('PERCENTUAL').AsCurrency := (FieldByName('CUSTO_DISPONIVEL').AsCurrency / CdsTotal.FieldByName('CUSTO_DISPONIVEL').AsCurrency) * 100;

      Post;

      Next;
    end;

    First;
    EnableControls;

  end;

end;

procedure TfrmGeApropriacaoEstoquePesquisa.dbgGrupoTblDblClick(
  Sender: TObject);
var
  sWhr : String;
begin
  sWhr := '(1=1)';

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

          if ( CdsGrupo.FieldByName('GRUPO_COD').IsNull ) then
            sWhr := sWhr + ' and (p.codgrupo is null)'
          else
            sWhr := sWhr + ' and (p.codgrupo = ' + CdsGrupo.FieldByName('GRUPO_COD').AsString + ')';

          SQL.Text := StringReplace(SQL.Text, 'e=e', GetEmpresaIDDefault, [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, 'c=c', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( not CdsProduto.IsEmpty ) then
        begin
          HabilitarGuia( TIPO_PRD );
          CalcularPercentuais( CdsProduto );
        end;
      end;

  end;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.dbgFabTblDblClick(
  Sender: TObject);
var
  sWhr : String;
begin
  sWhr := '(1=1)';

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

          if ( CdsFabricante.FieldByName('FABRICANTE_COD').IsNull ) then
            sWhr := sWhr + ' and (p.codfabricante is null)'
          else
            sWhr := sWhr + ' and (p.codfabricante = ' + CdsFabricante.FieldByName('FABRICANTE_COD').AsString + ')';

          SQL.Text := StringReplace(SQL.Text, 'e=e', GetEmpresaIDDefault, [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, 'c=c', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( not CdsProduto.IsEmpty ) then
        begin
          HabilitarGuia( TIPO_PRD );
          CalcularPercentuais( CdsProduto );
        end;
      end;

  end;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.btbtnSelecionarClick(
  Sender: TObject);
begin
  if not CdsProduto.IsEmpty then
    ModalResult := mrOk;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.btBtnExportarClick(
  Sender: TObject);
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

procedure TfrmGeApropriacaoEstoquePesquisa.btBtnEnviarEmailClick(
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
      sAssunto := FormatDateTime('dd/mm/yyyy', Date) + ' - Apropriação de Estoque (' + edTipoFiltro.Text + ' / ' + edCentroCusto.Text + ')';;
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
        ShowError('Erro ao tentar enviar e-mail com o resultado da consulta de apropriação de estoque.' + #13#13 + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    if smtpEmail.Connected then
      smtpEmail.Disconnect;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeApropriacaoEstoquePesquisa', TfrmGeApropriacaoEstoquePesquisa);

end.
