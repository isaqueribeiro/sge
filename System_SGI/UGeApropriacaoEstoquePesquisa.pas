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
    dbgGrupoTblColumn5: TcxGridDBBandedColumn;
    dbgGrupoLvl: TcxGridLevel;
    TbsFabricante: TTabSheet;
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
    procedure NovaPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCentroCustoButtonClick(Sender: TObject);
    procedure edCentroCustoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure edTipoFiltroChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
        end
      end;

    TIPO_GRP: ;

    TIPO_FAB: ;
  end;
(*
  sWhr := '(p.codemp = ' + QuotedStr(GetEmpresaIDDefault) + ')';

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
*)
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

initialization
  FormFunction.RegisterForm('frmGeApropriacaoEstoquePesquisa', TfrmGeApropriacaoEstoquePesquisa);

end.
