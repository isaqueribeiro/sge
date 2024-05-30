unit UGeProdutoRotatividadePRC;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, jpeg,
  cxGraphics, dxGDIPlusClasses, cxLookAndFeelPainters,
  cxControls, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, DBClient, Provider, DBCtrls, Gauges, ToolWin,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxGridCustomView, cxGrid, Buttons, cxLookAndFeels, cxButtons, dxSkinsForm, cxNavigator,

  IdIOHandlerSocket, IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent,  IdSMTP,
  IdExplicitTLSClientServerBase, IdSMTPBase, IdIOHandler, IdTCPConnection, IdTCPClient, IdMessageClient,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxCurrencyEdit, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinsDefaultPainters,
  dxScrollbarAnnotations;

type
  TFrmGeProdutoRotatividadePRC = class(TfrmGrPadrao)
    pnlPesquisa: TPanel;
    BvlTipoPesquisa: TBevel;
    GrpBxTipoPesquisa: TGroupBox;
    lblTipoProcesso: TLabel;
    edTipoProcesso: TComboBox;
    GrpBxPesquisar: TGroupBox;
    lblPesquisar: TLabel;
    edPesquisar: TEdit;
    BtnProcessar: TSpeedButton;
    pnlDados: TPanel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    PgcTabelas: TPageControl;
    TbsProduto: TTabSheet;
    TbsGrupo: TTabSheet;
    TbsFabricante: TTabSheet;
    dbgProdutoLvl: TcxGridLevel;
    dbgProduto: TcxGrid;
    dbgProdutoTbl: TcxGridDBBandedTableView;
    dsProduto: TDataSource;
    DspListaProduto: TDataSetProvider;
    CdsListaProduto: TClientDataSet;
    pnlProcesso: TPanel;
    Label3: TLabel;
    gagProcesso: TGauge;
    Bevel4: TBevel;
    Bevel5: TBevel;
    dbProduto: TDBText;
    dsListaProduto: TDataSource;
    DspProduto: TDataSetProvider;
    CdsProduto: TClientDataSet;
    CdsProdutoDATA_ULTIMA_COMPRA: TDateField;
    CdsProdutoDATA_ULTIMA_VENDA: TDateField;
    CdsProdutoMOVIMENTADO: TSmallintField;
    CdsProdutoPROCESSO_DATA: TDateField;
    CdsProdutoPROCESSO_HORA: TTimeField;
    dbgProdutoTblColumn1: TcxGridDBBandedColumn;
    dbgProdutoTblColumn2: TcxGridDBBandedColumn;
    dbgProdutoTblColumn3: TcxGridDBBandedColumn;
    dbgProdutoTblColumn4: TcxGridDBBandedColumn;
    dbgProdutoTblColumn5: TcxGridDBBandedColumn;
    dbgProdutoTblColumn6: TcxGridDBBandedColumn;
    dbgProdutoTblColumn7: TcxGridDBBandedColumn;
    dbgProdutoTblColumn8: TcxGridDBBandedColumn;
    dbgProdutoTblColumn9: TcxGridDBBandedColumn;
    dbgProdutoTblColumn10: TcxGridDBBandedColumn;
    dbgProdutoTblColumn11: TcxGridDBBandedColumn;
    dbgProdutoTblColumn12: TcxGridDBBandedColumn;
    dbgProdutoTblColumn13: TcxGridDBBandedColumn;
    dbgProdutoTblColumn14: TcxGridDBBandedColumn;
    dbgProdutoTblColumn15: TcxGridDBBandedColumn;
    dbgProdutoTblColumn16: TcxGridDBBandedColumn;
    dbgProdutoTblColumn17: TcxGridDBBandedColumn;
    dbgProdutoTblColumn18: TcxGridDBBandedColumn;
    dbgProdutoTblColumn19: TcxGridDBBandedColumn;
    dbgProdutoTblColumn20: TcxGridDBBandedColumn;
    dbgProdutoTblColumn21: TcxGridDBBandedColumn;
    dbgProdutoTblColumn22: TcxGridDBBandedColumn;
    dbgProdutoTblColumn23: TcxGridDBBandedColumn;
    dbgProdutoTblColumn24: TcxGridDBBandedColumn;
    dbgProdutoTblColumn25: TcxGridDBBandedColumn;
    dbgProdutoTblColumn26: TcxGridDBBandedColumn;
    dbgProdutoTblColumn27: TcxGridDBBandedColumn;
    dbgProdutoTblColumn28: TcxGridDBBandedColumn;
    dbgProdutoTblESTOQUE: TcxGridDBBandedColumn;
    dbgProdutoTblColumn30: TcxGridDBBandedColumn;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    dsGrupo: TDataSource;
    CdsGrupoCODIGO: TSmallintField;
    CdsGrupoDATA_ULTIMA_COMPRA: TDateField;
    CdsGrupoDATA_ULTIMA_VENDA: TDateField;
    StyleRepository: TcxStyleRepository;
    StyleSelecao: TcxStyle;
    StyleContent: TcxStyle;
    StyleContentEven: TcxStyle;
    DspTotal: TDataSetProvider;
    CdsTotal: TClientDataSet;
    dsTotal: TDataSource;
    CdsTotalDATA_ULTIMA_COMPRA: TDateField;
    CdsTotalDATA_ULTIMA_VENDA: TDateField;
    pnlTotal: TPanel;
    dbgTotal: TcxGrid;
    dbgTotalTbl: TcxGridDBBandedTableView;
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
    cxGridDBBandedColumn19: TcxGridDBBandedColumn;
    cxGridDBBandedColumn20: TcxGridDBBandedColumn;
    cxGridDBBandedColumn21: TcxGridDBBandedColumn;
    cxGridDBBandedColumn22: TcxGridDBBandedColumn;
    cxGridDBBandedColumn23: TcxGridDBBandedColumn;
    cxGridDBBandedColumn24: TcxGridDBBandedColumn;
    cxGridDBBandedColumn25: TcxGridDBBandedColumn;
    cxGridDBBandedColumn26: TcxGridDBBandedColumn;
    cxGridDBBandedColumn27: TcxGridDBBandedColumn;
    cxGridDBBandedColumn28: TcxGridDBBandedColumn;
    dbgTotalTblEstoque: TcxGridDBBandedColumn;
    dbgTotalTblITEM: TcxGridDBBandedColumn;
    dbgTotalLvl: TcxGridLevel;
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
    cxGridDBBandedColumn37: TcxGridDBBandedColumn;
    cxGridDBBandedColumn38: TcxGridDBBandedColumn;
    cxGridDBBandedColumn39: TcxGridDBBandedColumn;
    cxGridDBBandedColumn40: TcxGridDBBandedColumn;
    cxGridDBBandedColumn41: TcxGridDBBandedColumn;
    cxGridDBBandedColumn42: TcxGridDBBandedColumn;
    cxGridDBBandedColumn43: TcxGridDBBandedColumn;
    cxGridDBBandedColumn44: TcxGridDBBandedColumn;
    cxGridDBBandedColumn45: TcxGridDBBandedColumn;
    cxGridDBBandedColumn46: TcxGridDBBandedColumn;
    cxGridDBBandedColumn47: TcxGridDBBandedColumn;
    cxGridDBBandedColumn48: TcxGridDBBandedColumn;
    cxGridDBBandedColumn49: TcxGridDBBandedColumn;
    cxGridDBBandedColumn50: TcxGridDBBandedColumn;
    cxGridDBBandedColumn51: TcxGridDBBandedColumn;
    cxGridDBBandedColumn52: TcxGridDBBandedColumn;
    cxGridDBBandedColumn53: TcxGridDBBandedColumn;
    cxGridDBBandedColumn54: TcxGridDBBandedColumn;
    cxGridDBBandedColumn55: TcxGridDBBandedColumn;
    cxGridDBBandedColumn56: TcxGridDBBandedColumn;
    dbgGrupoTblESTOQUE: TcxGridDBBandedColumn;
    dbgGrupoTblITEM: TcxGridDBBandedColumn;
    dbgGrupoLvl: TcxGridLevel;
    dbgGrupoTblColumn1: TcxGridDBBandedColumn;
    dbgGrupoTblColumn2: TcxGridDBBandedColumn;
    dbgGrupoTblColumn3: TcxGridDBBandedColumn;
    dbgGrupoTblColumn4: TcxGridDBBandedColumn;
    dbgGrupoTblColumn5: TcxGridDBBandedColumn;
    dbgGrupoTblColumn6: TcxGridDBBandedColumn;
    dbgGrupoTblColumn7: TcxGridDBBandedColumn;
    dbgGrupoTblColumn8: TcxGridDBBandedColumn;
    dbgGrupoTblColumn9: TcxGridDBBandedColumn;
    dbgGrupoTblColumn10: TcxGridDBBandedColumn;
    dbgGrupoTblColumn11: TcxGridDBBandedColumn;
    dbgGrupoTblColumn12: TcxGridDBBandedColumn;
    dbgGrupoTblColumn13: TcxGridDBBandedColumn;
    dbgGrupoTblColumn14: TcxGridDBBandedColumn;
    dbgGrupoTblColumn15: TcxGridDBBandedColumn;
    dbgGrupoTblColumn16: TcxGridDBBandedColumn;
    dbgGrupoTblColumn17: TcxGridDBBandedColumn;
    dbgGrupoTblColumn18: TcxGridDBBandedColumn;
    dbgGrupoTblColumn19: TcxGridDBBandedColumn;
    dbgGrupoTblColumn20: TcxGridDBBandedColumn;
    dbgGrupoTblColumn21: TcxGridDBBandedColumn;
    dbgGrupoTblColumn22: TcxGridDBBandedColumn;
    dbgGrupoTblColumn23: TcxGridDBBandedColumn;
    dbgGrupoTblColumn24: TcxGridDBBandedColumn;
    svdArquivo: TSaveDialog;
    lblTipoFiltro: TLabel;
    edTipoFiltro: TComboBox;
    dbgProdutoTblColumn31: TcxGridDBBandedColumn;
    dbgProdutoTblColumn32: TcxGridDBBandedColumn;
    DspFabricante: TDataSetProvider;
    CdsFabricante: TClientDataSet;
    DateField1: TDateField;
    DateField2: TDateField;
    dsFabricante: TDataSource;
    dbgFab: TcxGrid;
    dbgFabTbl: TcxGridDBBandedTableView;
    cxGridDBBandedColumn59: TcxGridDBBandedColumn;
    cxGridDBBandedColumn60: TcxGridDBBandedColumn;
    cxGridDBBandedColumn61: TcxGridDBBandedColumn;
    cxGridDBBandedColumn62: TcxGridDBBandedColumn;
    cxGridDBBandedColumn63: TcxGridDBBandedColumn;
    cxGridDBBandedColumn64: TcxGridDBBandedColumn;
    cxGridDBBandedColumn65: TcxGridDBBandedColumn;
    cxGridDBBandedColumn66: TcxGridDBBandedColumn;
    cxGridDBBandedColumn67: TcxGridDBBandedColumn;
    cxGridDBBandedColumn68: TcxGridDBBandedColumn;
    cxGridDBBandedColumn69: TcxGridDBBandedColumn;
    cxGridDBBandedColumn70: TcxGridDBBandedColumn;
    cxGridDBBandedColumn71: TcxGridDBBandedColumn;
    cxGridDBBandedColumn72: TcxGridDBBandedColumn;
    cxGridDBBandedColumn73: TcxGridDBBandedColumn;
    cxGridDBBandedColumn74: TcxGridDBBandedColumn;
    cxGridDBBandedColumn75: TcxGridDBBandedColumn;
    cxGridDBBandedColumn76: TcxGridDBBandedColumn;
    cxGridDBBandedColumn77: TcxGridDBBandedColumn;
    cxGridDBBandedColumn78: TcxGridDBBandedColumn;
    cxGridDBBandedColumn79: TcxGridDBBandedColumn;
    cxGridDBBandedColumn80: TcxGridDBBandedColumn;
    cxGridDBBandedColumn81: TcxGridDBBandedColumn;
    cxGridDBBandedColumn82: TcxGridDBBandedColumn;
    cxGridDBBandedColumn83: TcxGridDBBandedColumn;
    cxGridDBBandedColumn84: TcxGridDBBandedColumn;
    cxGridDBBandedColumn85: TcxGridDBBandedColumn;
    cxGridDBBandedColumn86: TcxGridDBBandedColumn;
    dbgFabTblESTOQUE: TcxGridDBBandedColumn;
    dbgFabTblITEM: TcxGridDBBandedColumn;
    cxGridDBBandedColumn89: TcxGridDBBandedColumn;
    cxGridDBBandedColumn90: TcxGridDBBandedColumn;
    cxGridDBBandedColumn91: TcxGridDBBandedColumn;
    cxGridDBBandedColumn92: TcxGridDBBandedColumn;
    cxGridDBBandedColumn93: TcxGridDBBandedColumn;
    cxGridDBBandedColumn94: TcxGridDBBandedColumn;
    cxGridDBBandedColumn95: TcxGridDBBandedColumn;
    cxGridDBBandedColumn96: TcxGridDBBandedColumn;
    cxGridDBBandedColumn97: TcxGridDBBandedColumn;
    cxGridDBBandedColumn98: TcxGridDBBandedColumn;
    cxGridDBBandedColumn99: TcxGridDBBandedColumn;
    cxGridDBBandedColumn100: TcxGridDBBandedColumn;
    cxGridDBBandedColumn101: TcxGridDBBandedColumn;
    cxGridDBBandedColumn102: TcxGridDBBandedColumn;
    cxGridDBBandedColumn103: TcxGridDBBandedColumn;
    cxGridDBBandedColumn104: TcxGridDBBandedColumn;
    cxGridDBBandedColumn105: TcxGridDBBandedColumn;
    cxGridDBBandedColumn106: TcxGridDBBandedColumn;
    cxGridDBBandedColumn107: TcxGridDBBandedColumn;
    cxGridDBBandedColumn108: TcxGridDBBandedColumn;
    cxGridDBBandedColumn109: TcxGridDBBandedColumn;
    cxGridDBBandedColumn110: TcxGridDBBandedColumn;
    cxGridDBBandedColumn111: TcxGridDBBandedColumn;
    cxGridDBBandedColumn112: TcxGridDBBandedColumn;
    dbgFabLvl: TcxGridLevel;
    CdsFabricanteCODIGO: TIntegerField;
    smtpEmail: TIdSMTP;
    msgEmail: TIdMessage;
    tlbBotoes: TPanel;
    Bevel2: TBevel;
    btbtnIncluir: TcxButton;
    btBtnEnviarEmail: TcxButton;
    BtnPesquisar: TcxButton;
    QryListaProduto: TFDQuery;
    setProdutoRotatividade: TFDStoredProc;
    QryProduto: TFDQuery;
    QryGrupo: TFDQuery;
    QryFabricante: TFDQuery;
    QryTotal: TFDQuery;
    CdsProdutoDESCRICAO: TStringField;
    CdsProdutoGRUPO: TStringField;
    CdsProdutoFABRICANTE: TStringField;
    CdsProdutoUNP_DESCRICAO: TStringField;
    CdsProdutoUNP_SIGLA: TStringField;
    CdsGrupoDESCRICAO: TStringField;
    CdsFabricanteDESCRICAO: TStringField;
    CdsProdutoPROCESSO_USUARIO: TStringField;
    CdsProdutoCODIGO: TStringField;
    CdsTotalQTDE: TFMTBCDField;
    CdsTotalESTOQUE_ALMOX: TFMTBCDField;
    CdsTotalCOMPRA_QTDE_01: TBCDField;
    CdsTotalCOMPRA_VALOR_01: TBCDField;
    CdsTotalVENDA_QTDE_01: TBCDField;
    CdsTotalVENDA_VALOR_01: TBCDField;
    CdsTotalCOMPRA_QTDE_03: TBCDField;
    CdsTotalCOMPRA_VALOR_03: TBCDField;
    CdsTotalVENDA_QTDE_03: TBCDField;
    CdsTotalVENDA_VALOR_03: TBCDField;
    CdsTotalCOMPRA_QTDE_06: TBCDField;
    CdsTotalCOMPRA_VALOR_06: TBCDField;
    CdsTotalVENDA_QTDE_06: TBCDField;
    CdsTotalVENDA_VALOR_06: TBCDField;
    CdsTotalCOMPRA_QTDE_09: TBCDField;
    CdsTotalCOMPRA_VALOR_09: TBCDField;
    CdsTotalVENDA_QTDE_09: TBCDField;
    CdsTotalVENDA_VALOR_09: TBCDField;
    CdsTotalCOMPRA_QTDE_12: TBCDField;
    CdsTotalCOMPRA_VALOR_12: TBCDField;
    CdsTotalVENDA_QTDE_12: TBCDField;
    CdsTotalVENDA_VALOR_12: TBCDField;
    CdsTotalCOMPRA_QTDE_99: TBCDField;
    CdsTotalCOMPRA_VALOR_99: TBCDField;
    CdsTotalVENDA_QTDE_99: TBCDField;
    CdsTotalVENDA_VALOR_99: TBCDField;
    CdsProdutoQTDE: TFMTBCDField;
    CdsProdutoESTOQUE_ALMOX: TFMTBCDField;
    CdsProdutoCOMPRA_QTDE_01: TBCDField;
    CdsProdutoCOMPRA_VALOR_01: TBCDField;
    CdsProdutoVENDA_QTDE_01: TBCDField;
    CdsProdutoVENDA_VALOR_01: TBCDField;
    CdsProdutoCOMPRA_QTDE_03: TBCDField;
    CdsProdutoCOMPRA_VALOR_03: TBCDField;
    CdsProdutoVENDA_QTDE_03: TBCDField;
    CdsProdutoVENDA_VALOR_03: TBCDField;
    CdsProdutoCOMPRA_QTDE_06: TBCDField;
    CdsProdutoCOMPRA_VALOR_06: TBCDField;
    CdsProdutoVENDA_QTDE_06: TBCDField;
    CdsProdutoVENDA_VALOR_06: TBCDField;
    CdsProdutoCOMPRA_QTDE_09: TBCDField;
    CdsProdutoCOMPRA_VALOR_09: TBCDField;
    CdsProdutoVENDA_QTDE_09: TBCDField;
    CdsProdutoVENDA_VALOR_09: TBCDField;
    CdsProdutoCOMPRA_QTDE_12: TBCDField;
    CdsProdutoCOMPRA_VALOR_12: TBCDField;
    CdsProdutoVENDA_QTDE_12: TBCDField;
    CdsProdutoVENDA_VALOR_12: TBCDField;
    CdsProdutoCOMPRA_QTDE_99: TBCDField;
    CdsProdutoCOMPRA_VALOR_99: TBCDField;
    CdsProdutoVENDA_QTDE_99: TBCDField;
    CdsProdutoVENDA_VALOR_99: TBCDField;
    CdsFabricanteQTDE: TFMTBCDField;
    CdsFabricanteESTOQUE_ALMOX: TFMTBCDField;
    CdsFabricanteCOMPRA_QTDE_01: TBCDField;
    CdsFabricanteCOMPRA_VALOR_01: TBCDField;
    CdsFabricanteVENDA_QTDE_01: TBCDField;
    CdsFabricanteVENDA_VALOR_01: TBCDField;
    CdsFabricanteCOMPRA_QTDE_03: TBCDField;
    CdsFabricanteCOMPRA_VALOR_03: TBCDField;
    CdsFabricanteVENDA_QTDE_03: TBCDField;
    CdsFabricanteVENDA_VALOR_03: TBCDField;
    CdsFabricanteCOMPRA_QTDE_06: TBCDField;
    CdsFabricanteCOMPRA_VALOR_06: TBCDField;
    CdsFabricanteVENDA_QTDE_06: TBCDField;
    CdsFabricanteVENDA_VALOR_06: TBCDField;
    CdsFabricanteCOMPRA_QTDE_09: TBCDField;
    CdsFabricanteCOMPRA_VALOR_09: TBCDField;
    CdsFabricanteVENDA_QTDE_09: TBCDField;
    CdsFabricanteVENDA_VALOR_09: TBCDField;
    CdsFabricanteCOMPRA_QTDE_12: TBCDField;
    CdsFabricanteCOMPRA_VALOR_12: TBCDField;
    CdsFabricanteVENDA_QTDE_12: TBCDField;
    CdsFabricanteVENDA_VALOR_12: TBCDField;
    CdsFabricanteCOMPRA_QTDE_99: TBCDField;
    CdsFabricanteCOMPRA_VALOR_99: TBCDField;
    CdsFabricanteVENDA_QTDE_99: TBCDField;
    CdsFabricanteVENDA_VALOR_99: TBCDField;
    CdsFabricantePERCENT_CQ01: TBCDField;
    CdsFabricantePERCENT_CV01: TBCDField;
    CdsFabricantePERCENT_VQ01: TBCDField;
    CdsFabricantePERCENT_VV01: TBCDField;
    CdsFabricantePERCENT_CQ03: TBCDField;
    CdsFabricantePERCENT_CV03: TBCDField;
    CdsFabricantePERCENT_VQ03: TBCDField;
    CdsFabricantePERCENT_VV03: TBCDField;
    CdsFabricantePERCENT_CQ06: TBCDField;
    CdsFabricantePERCENT_CV06: TBCDField;
    CdsFabricantePERCENT_VQ06: TBCDField;
    CdsFabricantePERCENT_VV06: TBCDField;
    CdsFabricantePERCENT_CQ09: TBCDField;
    CdsFabricantePERCENT_CV09: TBCDField;
    CdsFabricantePERCENT_VQ09: TBCDField;
    CdsFabricantePERCENT_VV09: TBCDField;
    CdsFabricantePERCENT_CQ12: TBCDField;
    CdsFabricantePERCENT_CV12: TBCDField;
    CdsFabricantePERCENT_VQ12: TBCDField;
    CdsFabricantePERCENT_VV12: TBCDField;
    CdsFabricantePERCENT_CQ99: TBCDField;
    CdsFabricantePERCENT_CV99: TBCDField;
    CdsFabricantePERCENT_VQ99: TBCDField;
    CdsFabricantePERCENT_VV99: TBCDField;
    CdsGrupoQTDE: TFMTBCDField;
    CdsGrupoESTOQUE_ALMOX: TFMTBCDField;
    CdsGrupoCOMPRA_QTDE_01: TBCDField;
    CdsGrupoCOMPRA_VALOR_01: TBCDField;
    CdsGrupoVENDA_QTDE_01: TBCDField;
    CdsGrupoVENDA_VALOR_01: TBCDField;
    CdsGrupoCOMPRA_QTDE_03: TBCDField;
    CdsGrupoCOMPRA_VALOR_03: TBCDField;
    CdsGrupoVENDA_QTDE_03: TBCDField;
    CdsGrupoVENDA_VALOR_03: TBCDField;
    CdsGrupoCOMPRA_QTDE_06: TBCDField;
    CdsGrupoCOMPRA_VALOR_06: TBCDField;
    CdsGrupoVENDA_QTDE_06: TBCDField;
    CdsGrupoVENDA_VALOR_06: TBCDField;
    CdsGrupoCOMPRA_QTDE_09: TBCDField;
    CdsGrupoCOMPRA_VALOR_09: TBCDField;
    CdsGrupoVENDA_QTDE_09: TBCDField;
    CdsGrupoVENDA_VALOR_09: TBCDField;
    CdsGrupoCOMPRA_QTDE_12: TBCDField;
    CdsGrupoCOMPRA_VALOR_12: TBCDField;
    CdsGrupoVENDA_QTDE_12: TBCDField;
    CdsGrupoVENDA_VALOR_12: TBCDField;
    CdsGrupoCOMPRA_QTDE_99: TBCDField;
    CdsGrupoCOMPRA_VALOR_99: TBCDField;
    CdsGrupoVENDA_QTDE_99: TBCDField;
    CdsGrupoVENDA_VALOR_99: TBCDField;
    CdsGrupoPERCENT_CQ01: TBCDField;
    CdsGrupoPERCENT_CV01: TBCDField;
    CdsGrupoPERCENT_VQ01: TBCDField;
    CdsGrupoPERCENT_VV01: TBCDField;
    CdsGrupoPERCENT_CQ03: TBCDField;
    CdsGrupoPERCENT_CV03: TBCDField;
    CdsGrupoPERCENT_VQ03: TBCDField;
    CdsGrupoPERCENT_VV03: TBCDField;
    CdsGrupoPERCENT_CQ06: TBCDField;
    CdsGrupoPERCENT_CV06: TBCDField;
    CdsGrupoPERCENT_VQ06: TBCDField;
    CdsGrupoPERCENT_VV06: TBCDField;
    CdsGrupoPERCENT_CQ09: TBCDField;
    CdsGrupoPERCENT_CV09: TBCDField;
    CdsGrupoPERCENT_VQ09: TBCDField;
    CdsGrupoPERCENT_VV09: TBCDField;
    CdsGrupoPERCENT_CQ12: TBCDField;
    CdsGrupoPERCENT_CV12: TBCDField;
    CdsGrupoPERCENT_VQ12: TBCDField;
    CdsGrupoPERCENT_VV12: TBCDField;
    CdsGrupoPERCENT_CQ99: TBCDField;
    CdsGrupoPERCENT_CV99: TBCDField;
    CdsGrupoPERCENT_VQ99: TBCDField;
    CdsGrupoPERCENT_VV99: TBCDField;
    CdsTotalITENS: TLargeintField;
    CdsTotalITENS_ALMOX: TLargeintField;
    CdsFabricanteITENS: TLargeintField;
    CdsFabricanteITENS_ALMOX: TLargeintField;
    CdsGrupoITENS: TLargeintField;
    CdsGrupoITENS_ALMOX: TLargeintField;
    QryTotalQTDE: TFMTBCDField;
    QryTotalESTOQUE_ALMOX: TFMTBCDField;
    QryTotalITENS: TLargeintField;
    QryTotalITENS_ALMOX: TLargeintField;
    QryTotalDATA_ULTIMA_COMPRA: TDateField;
    QryTotalDATA_ULTIMA_VENDA: TDateField;
    QryTotalCOMPRA_QTDE_01: TBCDField;
    QryTotalCOMPRA_VALOR_01: TBCDField;
    QryTotalVENDA_QTDE_01: TBCDField;
    QryTotalVENDA_VALOR_01: TBCDField;
    QryTotalCOMPRA_QTDE_03: TBCDField;
    QryTotalCOMPRA_VALOR_03: TBCDField;
    QryTotalVENDA_QTDE_03: TBCDField;
    QryTotalVENDA_VALOR_03: TBCDField;
    QryTotalCOMPRA_QTDE_06: TBCDField;
    QryTotalCOMPRA_VALOR_06: TBCDField;
    QryTotalVENDA_QTDE_06: TBCDField;
    QryTotalVENDA_VALOR_06: TBCDField;
    QryTotalCOMPRA_QTDE_09: TBCDField;
    QryTotalCOMPRA_VALOR_09: TBCDField;
    QryTotalVENDA_QTDE_09: TBCDField;
    QryTotalVENDA_VALOR_09: TBCDField;
    QryTotalCOMPRA_QTDE_12: TBCDField;
    QryTotalCOMPRA_VALOR_12: TBCDField;
    QryTotalVENDA_QTDE_12: TBCDField;
    QryTotalVENDA_VALOR_12: TBCDField;
    QryTotalCOMPRA_QTDE_99: TBCDField;
    QryTotalCOMPRA_VALOR_99: TBCDField;
    QryTotalVENDA_QTDE_99: TBCDField;
    QryTotalVENDA_VALOR_99: TBCDField;
    QryFabricanteCODIGO: TIntegerField;
    QryFabricanteDESCRICAO: TStringField;
    QryFabricanteQTDE: TFMTBCDField;
    QryFabricanteESTOQUE_ALMOX: TFMTBCDField;
    QryFabricanteITENS: TLargeintField;
    QryFabricanteITENS_ALMOX: TLargeintField;
    QryFabricanteDATA_ULTIMA_COMPRA: TDateField;
    QryFabricanteDATA_ULTIMA_VENDA: TDateField;
    QryFabricanteCOMPRA_QTDE_01: TBCDField;
    QryFabricanteCOMPRA_VALOR_01: TBCDField;
    QryFabricanteVENDA_QTDE_01: TBCDField;
    QryFabricanteVENDA_VALOR_01: TBCDField;
    QryFabricanteCOMPRA_QTDE_03: TBCDField;
    QryFabricanteCOMPRA_VALOR_03: TBCDField;
    QryFabricanteVENDA_QTDE_03: TBCDField;
    QryFabricanteVENDA_VALOR_03: TBCDField;
    QryFabricanteCOMPRA_QTDE_06: TBCDField;
    QryFabricanteCOMPRA_VALOR_06: TBCDField;
    QryFabricanteVENDA_QTDE_06: TBCDField;
    QryFabricanteVENDA_VALOR_06: TBCDField;
    QryFabricanteCOMPRA_QTDE_09: TBCDField;
    QryFabricanteCOMPRA_VALOR_09: TBCDField;
    QryFabricanteVENDA_QTDE_09: TBCDField;
    QryFabricanteVENDA_VALOR_09: TBCDField;
    QryFabricanteCOMPRA_QTDE_12: TBCDField;
    QryFabricanteCOMPRA_VALOR_12: TBCDField;
    QryFabricanteVENDA_QTDE_12: TBCDField;
    QryFabricanteVENDA_VALOR_12: TBCDField;
    QryFabricanteCOMPRA_QTDE_99: TBCDField;
    QryFabricanteCOMPRA_VALOR_99: TBCDField;
    QryFabricanteVENDA_QTDE_99: TBCDField;
    QryFabricanteVENDA_VALOR_99: TBCDField;
    QryFabricantePERCENT_CQ01: TBCDField;
    QryFabricantePERCENT_CV01: TBCDField;
    QryFabricantePERCENT_VQ01: TBCDField;
    QryFabricantePERCENT_VV01: TBCDField;
    QryFabricantePERCENT_CQ03: TBCDField;
    QryFabricantePERCENT_CV03: TBCDField;
    QryFabricantePERCENT_VQ03: TBCDField;
    QryFabricantePERCENT_VV03: TBCDField;
    QryFabricantePERCENT_CQ06: TBCDField;
    QryFabricantePERCENT_CV06: TBCDField;
    QryFabricantePERCENT_VQ06: TBCDField;
    QryFabricantePERCENT_VV06: TBCDField;
    QryFabricantePERCENT_CQ09: TBCDField;
    QryFabricantePERCENT_CV09: TBCDField;
    QryFabricantePERCENT_VQ09: TBCDField;
    QryFabricantePERCENT_VV09: TBCDField;
    QryFabricantePERCENT_CQ12: TBCDField;
    QryFabricantePERCENT_CV12: TBCDField;
    QryFabricantePERCENT_VQ12: TBCDField;
    QryFabricantePERCENT_VV12: TBCDField;
    QryFabricantePERCENT_CQ99: TBCDField;
    QryFabricantePERCENT_CV99: TBCDField;
    QryFabricantePERCENT_VQ99: TBCDField;
    QryFabricantePERCENT_VV99: TBCDField;
    QryGrupoCODIGO: TSmallintField;
    QryGrupoDESCRICAO: TStringField;
    QryGrupoQTDE: TFMTBCDField;
    QryGrupoESTOQUE_ALMOX: TFMTBCDField;
    QryGrupoITENS: TLargeintField;
    QryGrupoITENS_ALMOX: TLargeintField;
    QryGrupoDATA_ULTIMA_COMPRA: TDateField;
    QryGrupoDATA_ULTIMA_VENDA: TDateField;
    QryGrupoCOMPRA_QTDE_01: TBCDField;
    QryGrupoCOMPRA_VALOR_01: TBCDField;
    QryGrupoVENDA_QTDE_01: TBCDField;
    QryGrupoVENDA_VALOR_01: TBCDField;
    QryGrupoCOMPRA_QTDE_03: TBCDField;
    QryGrupoCOMPRA_VALOR_03: TBCDField;
    QryGrupoVENDA_QTDE_03: TBCDField;
    QryGrupoVENDA_VALOR_03: TBCDField;
    QryGrupoCOMPRA_QTDE_06: TBCDField;
    QryGrupoCOMPRA_VALOR_06: TBCDField;
    QryGrupoVENDA_QTDE_06: TBCDField;
    QryGrupoVENDA_VALOR_06: TBCDField;
    QryGrupoCOMPRA_QTDE_09: TBCDField;
    QryGrupoCOMPRA_VALOR_09: TBCDField;
    QryGrupoVENDA_QTDE_09: TBCDField;
    QryGrupoVENDA_VALOR_09: TBCDField;
    QryGrupoCOMPRA_QTDE_12: TBCDField;
    QryGrupoCOMPRA_VALOR_12: TBCDField;
    QryGrupoVENDA_QTDE_12: TBCDField;
    QryGrupoVENDA_VALOR_12: TBCDField;
    QryGrupoCOMPRA_QTDE_99: TBCDField;
    QryGrupoCOMPRA_VALOR_99: TBCDField;
    QryGrupoVENDA_QTDE_99: TBCDField;
    QryGrupoVENDA_VALOR_99: TBCDField;
    QryGrupoPERCENT_CQ01: TBCDField;
    QryGrupoPERCENT_CV01: TBCDField;
    QryGrupoPERCENT_VQ01: TBCDField;
    QryGrupoPERCENT_VV01: TBCDField;
    QryGrupoPERCENT_CQ03: TBCDField;
    QryGrupoPERCENT_CV03: TBCDField;
    QryGrupoPERCENT_VQ03: TBCDField;
    QryGrupoPERCENT_VV03: TBCDField;
    QryGrupoPERCENT_CQ06: TBCDField;
    QryGrupoPERCENT_CV06: TBCDField;
    QryGrupoPERCENT_VQ06: TBCDField;
    QryGrupoPERCENT_VV06: TBCDField;
    QryGrupoPERCENT_CQ09: TBCDField;
    QryGrupoPERCENT_CV09: TBCDField;
    QryGrupoPERCENT_VQ09: TBCDField;
    QryGrupoPERCENT_VV09: TBCDField;
    QryGrupoPERCENT_CQ12: TBCDField;
    QryGrupoPERCENT_CV12: TBCDField;
    QryGrupoPERCENT_VQ12: TBCDField;
    QryGrupoPERCENT_VV12: TBCDField;
    QryGrupoPERCENT_CQ99: TBCDField;
    QryGrupoPERCENT_CV99: TBCDField;
    QryGrupoPERCENT_VQ99: TBCDField;
    QryGrupoPERCENT_VV99: TBCDField;
    procedure NovaPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edTipoProcessoChange(Sender: TObject);
    procedure BtnProcessarClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgGrupoTblDblClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure dbgFabTblDblClick(Sender: TObject);
    procedure btBtnEnviarEmailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSQLTotal   ,
    FSQLGrupo   ,
    FSQLFabricante,
    FSQLProduto : TStringList;
    procedure HabilitarGuia(const TipoProcesso : Integer);
    procedure ExecutarPesquisa(const TipoProcesso : Integer);
    procedure CalcularPercentuais( cdsTabela : TClientDataSet );
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBPRODUTO
  - TBVENDAS
  - TBCOMPRAS
  - TBGRUPOPROD
  - TBFABRICANTE
  - TBUNIDADEPROD
  - TBPRODUTO_ROTATIVIDADE
  - TBESTOQUE_ALMOX
  - TBCENTRO_CUSTO

  Views:

  Procedures:
  - SET_PRODUTO_ROTATIVIDADE

*)

var
  FrmGeProdutoRotatividadePRC: TFrmGeProdutoRotatividadePRC;

implementation

uses
    cxGridExportLink
  , UConstantesDGE
  , UDMBusiness
  , UDMRecursos;

{$R *.dfm}

const
  TIPO_GRP = 0;
  TIPO_FAB = 1;
  TIPO_PRD = 2;

  WHR_DEFAULT_EMP = 'where 0=0';
  WHR_DEFAULT     = 'where 1=1';

  MES_01 = 30 * 1;
  MES_03 = 30 * 3;
  MES_06 = 30 * 6;
  MES_09 = 30 * 9;
  MES_12 = 30 * 12;
  MES_99 = MES_12 + 1;

{ TFrmProdutoRotatividadePRC }

procedure TFrmGeProdutoRotatividadePRC.HabilitarGuia(
  const TipoProcesso: Integer);
var
  I : Integer;
begin
  for I := 0 to PgcTabelas.PageCount - 1 do
    PgcTabelas.Pages[I].TabVisible := False;

  if ( TipoProcesso < PgcTabelas.PageCount ) then
  begin
    PgcTabelas.Pages[TipoProcesso].TabVisible := True;
    PgcTabelas.Pages[TipoProcesso].Caption    := edTipoProcesso.Items.Strings[TipoProcesso];

    if (PgcTabelas.Pages[TipoProcesso] = TbsGrupo) or (PgcTabelas.Pages[TipoProcesso] = TbsFabricante) then
      pnlTotal.Parent := PgcTabelas.Pages[TipoProcesso];
  end;
end;

procedure TFrmGeProdutoRotatividadePRC.FormCreate(Sender: TObject);
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

  edTipoFiltro.ItemIndex   := 0;
  edTipoProcesso.ItemIndex := 0;
  HabilitarGuia(edTipoProcesso.ItemIndex);

  if ( gSistema.Codigo = SISTEMA_GESTAO_IND ) then
  begin
    dbgProdutoTblESTOQUE.DataBinding.FieldName := 'ESTOQUE_ALMOX';
    dbgGrupoTblESTOQUE.DataBinding.FieldName   := 'ESTOQUE_ALMOX';
    dbgGrupoTblITEM.DataBinding.FieldName      := 'ITENS_ALMOX';
    dbgFabTblESTOQUE.DataBinding.FieldName     := 'ESTOQUE_ALMOX';
    dbgFabTblITEM.DataBinding.FieldName        := 'ITENS_ALMOX';
    dbgTotalTblEstoque.DataBinding.FieldName   := 'ESTOQUE_ALMOX';
    dbgTotalTblITEM.DataBinding.FieldName      := 'ITENS_ALMOX';
  end
  else
  begin
    dbgProdutoTblESTOQUE.DataBinding.FieldName := 'QTDE';
    dbgGrupoTblESTOQUE.DataBinding.FieldName   := 'QTDE';
    dbgGrupoTblITEM.DataBinding.FieldName      := 'ITENS';
    dbgFabTblESTOQUE.DataBinding.FieldName     := 'QTDE';
    dbgFabTblITEM.DataBinding.FieldName        := 'ITENS';
    dbgTotalTblEstoque.DataBinding.FieldName   := 'QTDE';
    dbgTotalTblITEM.DataBinding.FieldName      := 'ITENS';
  end;
end;

procedure TFrmGeProdutoRotatividadePRC.edTipoProcessoChange(Sender: TObject);
begin
  HabilitarGuia(edTipoProcesso.ItemIndex);
end;

procedure TFrmGeProdutoRotatividadePRC.BtnProcessarClick(Sender: TObject);
begin
  if ( not ShowConfirm('Deseja processar a rotatividade dos produtos?', 'Processar') ) then
    Exit;

  Screen.Cursor        := crSQLWait;
  pnlProcesso.Visible  := True;
  gagProcesso.MinValue := 0;
  gagProcesso.Progress := 0;

  try
    Application.ProcessMessages;

    CdsListaProduto.Close;
    CdsListaProduto.Params.ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
    CdsListaProduto.Open;

    gagProcesso.MaxValue := CdsListaProduto.RecordCount;
    gagProcesso.Progress := 1;

    with CdsListaProduto do
    begin

      First;
      while not Eof do
      begin
        gagProcesso.Progress := gagProcesso.Progress + 1;
        Application.ProcessMessages;

        // Processar Compra

        with setProdutoRotatividade do
        begin
          ParamByName('produto').AsString := CdsListaProduto.FieldByName('Codigo').AsString;
          ParamByName('data').Value       := CdsListaProduto.FieldByName('data_ultima_compra').AsDateTime;
          ParamByName('usuario').AsString       := gUsuarioLogado.Login;
          ParamByName('excluir_rot').AsSmallInt := 1;
          ParamByName('tipo_rotati').AsSmallInt := 0;
          ParamByName('ultima_compra').Value := CdsListaProduto.FieldByName('data_ultima_compra').AsDateTime;
          ParamByName('ultima_venda').Value  := CdsListaProduto.FieldByName('data_ultima_venda').AsDateTime;
          ExecProc;
        end;

        // Processar venda

        with setProdutoRotatividade do
        begin
          ParamByName('produto').AsString := CdsListaProduto.FieldByName('Codigo').AsString;
          ParamByName('data').Value       := CdsListaProduto.FieldByName('data_ultima_venda').AsDateTime;
          ParamByName('usuario').AsString       := gUsuarioLogado.Login;
          ParamByName('excluir_rot').AsSmallInt := 0;
          ParamByName('tipo_rotati').AsSmallInt := 1;
          ParamByName('ultima_compra').Value := CdsListaProduto.FieldByName('data_ultima_compra').AsDateTime;
          ParamByName('ultima_venda').Value  := CdsListaProduto.FieldByName('data_ultima_venda').AsDateTime;
          ExecProc;
        end;

        CommitTransaction;

        Next;
      end;

      gagProcesso.Progress := gagProcesso.MaxValue;

    end;

  finally
    pnlProcesso.Visible := False;
    Screen.Cursor       := crDefault;
  end;
end;

procedure TFrmGeProdutoRotatividadePRC.BtnPesquisarClick(Sender: TObject);
begin
  ExecutarPesquisa(edTipoProcesso.ItemIndex);
end;

procedure TFrmGeProdutoRotatividadePRC.ExecutarPesquisa(
  const TipoProcesso: Integer);
var
  sWhr : String;
begin
  sWhr := 'where (p.codemp = ' + QuotedStr(gUsuarioLogado.Empresa) + ') and (p.qtde > 0)';

  Case edTipoFiltro.ItemIndex of
    1 : sWhr := sWhr + ' and (r.movimentado = 1)';
    2 : sWhr := sWhr + ' and (r.movimentado = 0)';
    3 : sWhr := sWhr + ' and (r.data_ultima_compra is null)';
    4 : sWhr := sWhr + ' and (r.data_ultima_venda is null)';
(*
    12/09/2013 - Isaque: Regra alterada

// Lista de Itens de Filtro
(Todos)
Apenas produtos movimentados
Apenas produtos s/ movimenta��o
Produtos s/ movimenta��o de Compra
Produtos s/ movimenta��o de Venda
Produtos s/ movimenta��o de Venda a 1 m�s
Produtos s/ movimenta��o de Venda a 3 m�s
Produtos s/ movimenta��o de Venda a 6 m�s
Produtos s/ movimenta��o de Venda a 9 m�s
Produtos s/ movimenta��o de Venda a 1 ano
Produtos s/ movimenta��o de Venda a mais de 1 ano

    5 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_01)) + ')';
    6 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_03)) + ')';
    7 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_06)) + ')';
    8 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_09)) + ')';
    9 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_12)) + ')';
    10: sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_99)) + ')';
*)
    5 : sWhr := sWhr + ' and (r.data_ultima_venda between ' +
      QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_03 + 1)) + ' and ' +
      QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_01)) + ')';
    6 : sWhr := sWhr + ' and (r.data_ultima_venda between ' +
      QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_06 + 1)) + ' and ' +
      QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_03)) + ')';
    7 : sWhr := sWhr + ' and (r.data_ultima_venda between ' +
      QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_09 + 1)) + ' and ' +
      QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_06)) + ')';
    8 : sWhr := sWhr + ' and (r.data_ultima_venda between ' +
      QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_12 + 1)) + ' and ' +
      QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_09)) + ')';
    9 : sWhr := sWhr + ' and (r.data_ultima_venda between ' +
      QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_99 + 1)) + ' and ' +
      QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_12)) + ')';
    10: sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_99)) + ')';
  end;

  CdsTotal.Close;
  with QryTotal do
  begin
    SQL.Clear;
    SQL.AddStrings( FSQLTotal );
    SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT_EMP,
      'where e.empresa = ' + QuotedStr(gUsuarioLogado.Empresa), [rfReplaceAll]);
    SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
  end;
  CdsTotal.Open;

  Case TipoProcesso of
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

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT_EMP,
            'where e.empresa = ' + QuotedStr(gUsuarioLogado.Empresa), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( CdsProduto.IsEmpty ) then
          ShowWarning('Dados n�o encontados de acordo com o filtro informado!');
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

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT_EMP,
            'where e.empresa = ' + QuotedStr(gUsuarioLogado.Empresa), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsGrupo.Open;

        if ( CdsGrupo.IsEmpty ) then
          ShowWarning('Dados n�o encontados de acordo com o filtro informado!')
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

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT_EMP,
            'where e.empresa = ' + QuotedStr(gUsuarioLogado.Empresa), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsFabricante.Open;

        if ( CdsFabricante.IsEmpty ) then
          ShowWarning('Dados n�o encontados de acordo com o filtro informado!')
        else
          CalcularPercentuais( CdsFabricante );
      end;
  end;
end;

procedure TFrmGeProdutoRotatividadePRC.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( (Key = VK_RETURN) and (ActiveControl = edPesquisar) ) then
    BtnPesquisar.Click
  else
  if ( Key = VK_F5 ) then
    BtnProcessar.Click
  else
  if ( Key = VK_ESCAPE ) then
  begin
    if ( PgcTabelas.ActivePageIndex <> edTipoProcesso.ItemIndex ) then
      HabilitarGuia( edTipoProcesso.ItemIndex );
  end;

  inherited;
end;

procedure TFrmGeProdutoRotatividadePRC.FormShow(Sender: TObject);
begin
  inherited;
  Self.Caption := Self.Caption + ' - (' + GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa) + ')';
end;

procedure TFrmGeProdutoRotatividadePRC.NovaPesquisaKeyPress(Sender: TObject;
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

procedure TFrmGeProdutoRotatividadePRC.CalcularPercentuais(
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
  FIELDS_CONTADOR : Array[1..6] of String = ('01', '03', '06', '09', '12', '99');
  FIELDS_ORIGEM   : Array[1..4] of String = (FIELD_CMP_QTDE,   FIELD_CMP_VALOR,  FIELD_VND_QTDE,   FIELD_VND_VALOR);
  FIELDS_DESTINO  : Array[1..4] of String = (FIELD_PERCENT_CQ, FIELD_PERCENT_CV, FIELD_PERCENT_VQ, FIELD_PERCENT_VV);
begin

  for I := 0 to cdsTabela.Fields.Count - 1 do
    cdsTabela.Fields[I].ReadOnly := False;

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

procedure TFrmGeProdutoRotatividadePRC.dbgGrupoTblDblClick(Sender: TObject);
var
  sWhr : String;
begin
  sWhr := 'where (p.codemp = ' + QuotedStr(gUsuarioLogado.Empresa) + ')';

  Case edTipoFiltro.ItemIndex of
    1 : sWhr := sWhr + ' and (r.movimentado = 1)';
    2 : sWhr := sWhr + ' and (r.movimentado = 0)';
    3 : sWhr := sWhr + ' and (r.data_ultima_compra is null)';
    4 : sWhr := sWhr + ' and (r.data_ultima_venda is null)';
    5 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_01)) + ')';
    6 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_03)) + ')';
    7 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_06)) + ')';
    8 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_09)) + ')';
    9 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_12)) + ')';
    10: sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_99)) + ')';
  end;

  Case edTipoProcesso.ItemIndex of
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

procedure TFrmGeProdutoRotatividadePRC.btbtnIncluirClick(Sender: TObject);
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

procedure TFrmGeProdutoRotatividadePRC.dbgFabTblDblClick(Sender: TObject);
var
  sWhr : String;
begin
  sWhr := 'where (p.codemp = ' + QuotedStr(gUsuarioLogado.Empresa) + ')';

  Case edTipoFiltro.ItemIndex of
    1 : sWhr := sWhr + ' and (r.movimentado = 1)';
    2 : sWhr := sWhr + ' and (r.movimentado = 0)';
    3 : sWhr := sWhr + ' and (r.data_ultima_compra is null)';
    4 : sWhr := sWhr + ' and (r.data_ultima_venda is null)';
    5 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_01)) + ')';
    6 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_03)) + ')';
    7 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_06)) + ')';
    8 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_09)) + ')';
    9 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_12)) + ')';
    10: sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_99)) + ')';
  end;

  Case edTipoProcesso.ItemIndex of
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

procedure TFrmGeProdutoRotatividadePRC.btBtnEnviarEmailClick(
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

  if not InputQuery('Enviar e-mail', 'Favor informar e-mail do destinat�rio:', sEmailTo) then
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
      sAssunto := FormatDateTime('dd/mm/yyyy', Date) + ' - Rotatividade de Produtos (' + edTipoProcesso.Text + ')';;
      CarregarConfiguracoesEmpresa(gUsuarioLogado.Empresa, sAssunto, sAssinaturaHtml, sAssinaturaTxt);

      (* Bloco de c�digo descontinuado por sua compila��o integral ser poss�vel apenas no Delpi 7
      smtpEmail.Username    := gContaEmail.Conta;
      smtpEmail.Password    := gContaEmail.Senha;
      smtpEmail.Host        := gContaEmail.Servidor_SMTP;
      smtpEmail.Port        := gContaEmail.Porta_SMTP;
      smtpEmail.ReadTimeout := 10000;    // Leitura da Conex�o em 10 segundos!

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
      *)

      with DMBusiness, ACBrMail do
      begin
        ConfigurarEmail(gUsuarioLogado.Empresa, sEmailTo, sAssunto, gContaEmail.Mensagem_Padrao);
        AddAttachment(sFileNameHtml);
        AddAttachment(sFileNameXls);
        Send;
      end;

      ShowInformation('E-mail enviado com sucesso!' + #13 + 'Arquivo(s) anexo(s) : ' + #13 + sFileNameHtml + #13 + sFileNameXls);
    except
      On E : Exception do
        ShowError('Erro ao tentar enviar e-mail com o resultado da consulta de rotatividade.' + #13#13 + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    if smtpEmail.Connected then
      smtpEmail.Disconnect;
  end;
end;

procedure TFrmGeProdutoRotatividadePRC.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('FrmGeProdutoRotatividadePRC', TFrmGeProdutoRotatividadePRC);

end.
