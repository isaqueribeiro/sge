unit UGeEstoqueAjusteManual;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, StdCtrls, Buttons, ExtCtrls,
  Mask, DBCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeEstoqueAjusteManual = class(TfrmGrPadrao)
    GrpBxEmpresa: TGroupBox;
    lblCNPJ: TLabel;
    lblRazaoSocial: TLabel;
    dbCNPJ: TDBEdit;
    dbRazaoSocial: TDBEdit;
    Bevel1: TBevel;
    GrpBxDadosAjuste: TGroupBox;
    Bevel2: TBevel;
    lblProduto: TLabel;
    lblProdutoDesc: TLabel;
    dbProdutoDesc: TDBEdit;
    lblEstoque: TLabel;
    dbEstoque: TDBEdit;
    lblFornecedor: TLabel;
    lblDocumento: TLabel;
    dbDocumento: TDBEdit;
    lblQuantidade: TLabel;
    dbQuantidade: TDBEdit;
    lblEstoqueNovo: TLabel;
    dbEstoqueNovo: TDBEdit;
    lblDataAjuste: TLabel;
    dbDataAjuste: TDBEdit;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    dtsAjuste: TDataSource;
    dtsEmpresa: TDataSource;
    dtsProduto: TDataSource;
    btnNovoAjuste: TcxButton;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    dbProduto: TJvDBComboEdit;
    dbFornecedor: TJvDBComboEdit;
    fdQryEmpresa: TFDQuery;
    fdQryLotes: TFDQuery;
    dtsLotes: TDataSource;
    Bevel3: TBevel;
    pnlMotivo: TPanel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    pnlLote: TPanel;
    lblDescricao: TLabel;
    dbDescricao: TDBComboBox;
    dbDataFabricacao: TJvDBDateEdit;
    lblDataFabricacao: TLabel;
    dbDataValidade: TJvDBDateEdit;
    lblDataValidade: TLabel;
    fdSetLoteProduto: TFDStoredProc;
    qryProduto: TFDQuery;
    qryAjuste: TFDQuery;
    updAjuste: TFDUpdateSQL;
    qryAjusteCONTROLE: TIntegerField;
    qryAjusteCODPROD: TStringField;
    qryAjusteCODEMPRESA: TStringField;
    qryAjusteCODFORN: TIntegerField;
    qryAjusteSISTEMA: TSmallintField;
    qryAjusteDOC: TStringField;
    qryAjusteMOTIVO: TStringField;
    qryAjusteDTAJUST: TSQLTimeStampField;
    qryAjusteUSUARIO: TStringField;
    qryAjusteLOTE_ID: TStringField;
    qryAjusteLOTE_DESCRICAO: TStringField;
    qryAjusteLOTE_DATA_FAB: TDateField;
    qryAjusteLOTE_DATA_VAL: TDateField;
    qryAjusteNOMEFORN: TStringField;
    qryAjusteQTDEATUAL: TFMTBCDField;
    qryAjusteQTDENOVA: TFMTBCDField;
    qryAjusteQTDEFINAL: TFMTBCDField;
    qryAjusteFRACIONADOR: TFMTBCDField;
    procedure ControlEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryEmpresaCNPJGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtsAjusteStateChange(Sender: TObject);
    procedure btnNovoAjusteClick(Sender: TObject);
    procedure qryProdutoQTDEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure qryAjusteNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FSQLProduto : TStringList;
    procedure CarregarDadosProduto(const Codigo : String);
    procedure CarregarLotes(const aEmpresa, aProduto : String);
    procedure UpdateLotes;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBAJUSTESTOQ
  - TBFORNECEDOR
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBESTOQUE_ALMOX

  Views:

  Procedures:
  - SET_LOTE_PRODUTO
*)

var
  frmGeEstoqueAjusteManual: TfrmGeEstoqueAjusteManual;

implementation

uses
    Controller.Tabela
  , UConstantesDGE
  , UDMBusiness
  , UDMRecursos
  , UGeProduto
  , UGeFornecedor;

{$R *.dfm}

procedure TfrmGeEstoqueAjusteManual.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID := ROTINA_ENT_AJUSTE_ID;

  with fdQryEmpresa do
  begin
    Close;
    SQL.Add('where e.cnpj = ' + QuotedStr(gUsuarioLogado.Empresa));
    SQL.Add('order by 2');
    Open;
  end;

  // Configurar tabela de ajustes
  TTabelaController
    .New
    .Tabela( qryAjuste )
    .Display('QTDEATUAL', 'Estoque', ',0.###', TAlignment.taRightJustify)
    .Display('QTDENOVA', 'Quantidade', ',0.###', TAlignment.taRightJustify)
    .Display('QTDEFINAL', 'Novo Estoque', ',0.###', TAlignment.taRightJustify)
    .Display('FRACIONADOR', 'Fracionador', '0', TAlignment.taRightJustify)
    .Configurar( qryAjuste );

  qryAjuste.Open;

  FSQLProduto := TStringList.Create;
  FSQLProduto.AddStrings( qryProduto.SQL );
end;

procedure TfrmGeEstoqueAjusteManual.qryAjusteNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryAjusteCODEMPRESA.Assign( fdQryEmpresa.FieldByName('CNPJ') );
  qryAjusteSISTEMA.AsInteger      := gSistema.Codigo;
  qryAjusteDTAJUST.AsDateTime     := GetDateTimeDB;
  qryAjusteUSUARIO.AsString       := gUsuarioLogado.Login;
  qryAjusteFRACIONADOR.AsCurrency := 1;

  qryAjusteLOTE_ID.Clear;
  qryAjusteLOTE_DESCRICAO.Clear;
  qryAjusteLOTE_DATA_FAB.Clear;
  qryAjusteLOTE_DATA_VAL.Clear;
  qryAjusteCODPROD.Clear;
  qryAjusteCODFORN.Clear;
  qryAjusteQTDEATUAL.Clear;
  qryAjusteQTDENOVA.Clear;
  qryAjusteQTDEFINAL.Clear;
  qryAjusteMOTIVO.Clear;

  dbProduto.SetFocus;
end;

procedure TfrmGeEstoqueAjusteManual.qryEmpresaCNPJGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := StrFormatarCnpj(Sender.AsString);
end;

procedure TfrmGeEstoqueAjusteManual.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_ESCAPE ) then
  begin
    if (qryAjuste.State in [TDataSetState.dsInsert, TDataSetState.dsEdit]) then
      qryAjuste.Cancel
    else
      Self.Close;
  end;
end;

procedure TfrmGeEstoqueAjusteManual.dtsAjusteStateChange(Sender: TObject);
begin
  dtsAjuste.AutoEdit    := ( qryAjuste.State in [dsEdit, dsInsert] );
  dbProduto.ReadOnly    := not ( qryAjuste.State in [dsEdit, dsInsert] );
  dbMotivo.ReadOnly     := not ( qryAjuste.State in [dsEdit, dsInsert] );

  btnNovoAjuste.Enabled := ( qryAjuste.Active and (qryAjuste.State = dsBrowse) );
  btnConfirmar.Enabled  := ( qryAjuste.State in [dsEdit, dsInsert] );
  btnCancelar.Enabled   := ( qryAjuste.State in [dsEdit, dsInsert] );
end;

procedure TfrmGeEstoqueAjusteManual.btnNovoAjusteClick(Sender: TObject);
begin
  qryAjuste.ParamByName('controle').Value := 0;
  qryAjuste.Append;
end;

procedure TfrmGeEstoqueAjusteManual.CarregarDadosProduto(
  const Codigo: String);
var
  sUnico  ,
  sCodigo : String;
begin
  if not StrIsInteger(Codigo) then
    raise Exception.Create('Código do produto inválido!');

  sCodigo := FormatFloat('0000000', StrToInt(Codigo));
  sUnico  := IfThen(GetEstoqueUnificadoEmpresa(gUsuarioLogado.Empresa), '1', '0');

  with qryProduto, SQL do
  begin
    Close;

    Clear;
    AddStrings( FSQLProduto );
    Add('where ( p.cod    = ' + QuotedStr(sCodigo) + ')');
    Add('  and ((p.codemp = ' + QuotedStr(gUsuarioLogado.Empresa) + ') or (' + sUnico + ' = 1))');

    Open;

    if (not IsEmpty) and (qryAjuste.State in [dsEdit, dsInsert]) then
    begin
      qryAjusteCODPROD.AsString       := qryProduto.FieldByName('COD').AsString;
      qryAjusteQTDEATUAL.AsCurrency   := qryProduto.FieldByName('QTDE').AsCurrency;
      qryAjusteFRACIONADOR.AsCurrency := qryProduto.FieldByName('FRACIONADOR').AsCurrency;
    end;

    pnlLote.Visible := (qryProduto.FieldByName('ESTOQUE_APROP_LOTE').AsInteger = FLAG_SIM);
  end;
end;

procedure TfrmGeEstoqueAjusteManual.CarregarLotes(const aEmpresa,
  aProduto: String);
var
  aLote : TLoteProduto;
begin
  with fdQryLotes do
  begin
    if fdQryLotes.Active then
      fdQryLotes.Close;

    ParamByName('empresa').AsString       := aEmpresa;
    ParamByName('centro_custo').AsInteger := CENTRO_CUSTO_ESTOQUE_GERAL;
    ParamByName('produto').AsString       := aProduto;

    OpenOrExecute;
    First;

    dbDescricao.Clear;
    dbDescricao.Items.BeginUpdate;
    while not Eof do
    begin
      aLote := TLoteProduto.Create;

      aLote.ID         := FieldByName('id').AsString;
      aLote.Descricao  := FieldByName('descricao').AsString;
      aLote.Fabricacao := FieldByName('data_fabricacao').AsDateTime;
      aLote.Validade   := FieldByName('data_validade').AsDateTime;

      dbDescricao.Items.AddObject(aLote.Descricao, aLote);
      Next;
    end;
    dbDescricao.Items.EndUpdate;

    fdQryLotes.Close;
  end;
end;

procedure TfrmGeEstoqueAjusteManual.ControlEditExit(Sender: TObject);
var
  aLote : TLoteProduto;
begin
  inherited;
  if ( (Sender = dbProduto) and (StrToIntDef(dbProduto.Field.AsString, 0) > 0) ) then
  begin
    CarregarDadosProduto( IntToStr(StrToIntDef(dbProduto.Field.AsString, 0)) );
    CarregarLotes(qryAjusteCODEMPRESA.AsString, dbProduto.Field.AsString);
  end;

  if ( Sender = dbQuantidade ) then
    if ( qryAjuste.State in [dsEdit, dsInsert] ) then
      qryAjusteQTDEFINAL.AsCurrency := qryAjusteQTDEATUAL.AsCurrency + qryAjusteQTDENOVA.AsCurrency;

  if ( (Sender = dbDescricao) and (dbDescricao.ItemIndex >= 0) ) then
  begin

    if ( qryAjuste.State in [dsEdit, dsInsert] ) then
    begin
      if (dbDescricao.ItemIndex >= 0) then
      begin
        aLote := TLoteProduto(dbDescricao.Items.Objects[dbDescricao.ItemIndex]);
        qryAjusteLOTE_ID.AsString         := aLote.ID;
        qryAjusteLOTE_DATA_FAB.AsDateTime := aLote.Fabricacao;
        qryAjusteLOTE_DATA_VAL.AsDateTime := aLote.Validade;
      end
      else
      begin
        qryAjusteLOTE_ID.Clear;
        qryAjusteLOTE_DATA_FAB.Clear;
        qryAjusteLOTE_DATA_VAL.Clear;
      end;
    end;

  end
end;

procedure TfrmGeEstoqueAjusteManual.qryProdutoQTDEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Text := FormatFloat(',0.###', Sender.AsCurrency) + ' ' + AnsiUpperCase(qryProduto.FieldByName('UNP_SIGLA').AsString);
end;

procedure TfrmGeEstoqueAjusteManual.btnCancelarClick(Sender: TObject);
begin
  if ( qryAjuste.State in [dsEdit, dsInsert] ) then
    if ShowConfirm('Deseja cancelar o lançamento do novo estoque para o produto?', 'Ajuste de Estoque') then
    begin
      qryAjuste.Cancel;
      qryProduto.Close;
    end;
end;

procedure TfrmGeEstoqueAjusteManual.btnConfirmarClick(Sender: TObject);
begin
  if ( qryAjuste.State in [dsEdit, dsInsert] ) then
    if Trim(dbMotivo.Lines.Text) = EmptyStr then
      ShowWarning('Favor informar o motivo do ajuste manual de estoque do produto selecionado.')
    else
    if ( Trim(dbProdutoDesc.Text) = EmptyStr ) then
      ShowWarning('Favor selecionar o produto para seu ajuste manual de estoque.')
    else
    if ( dbQuantidade.Field.AsInteger = 0 ) then
      ShowWarning('Favor informar a quantidade do ajuste manual de estoque para produto selecionado.')
    else
    if ( pnlLote.Visible and (Trim(dbDescricao.Text) = EmptyStr) ) then
      ShowWarning('Favor informar o Lote, Data de Fabricação e/ou Data de Validade.')
    else
    if ( qryProduto.FieldByName('MOVIMENTA_ESTOQUE').AsInteger = 0 ) then
      ShowWarning('Ajuste manual de estoque não permitido!' + #13 + 'Produto selecionado está marcado para NÃO MOVIMENTAR ESTOQUE.')
    else
    if ShowConfirmation('Confirma o lançamento do novo estoque para o produto?') then
    begin
      qryAjusteCONTROLE.AsInteger := GetNextID('TBAJUSTESTOQ', 'CONTROLE');
      qryAjusteMOTIVO.AsString    := AnsiUpperCase( (dbMotivo.Lines.Text) );
      qryAjuste.Post;

      qryAjuste.ParamByName('controle').Value := qryAjusteCONTROLE.Value;

      // Se o estoque do produto for gerenciado por Lote
      if pnlLote.Visible then
        UpdateLotes
      else
      begin
        // Disparar trigger TG_AJUST_ESTOQUE_HISTORICO para atualizar estoque e gerar histórico
        qryAjuste.ApplyUpdates;
        qryAjuste.CommitUpdates;

        CommitTransaction;
      end;
    end;
end;

procedure TfrmGeEstoqueAjusteManual.dbProdutoButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCodigoAlfa,
  sNome      : String;
begin
  if ( qryAjuste.State in [dsEdit, dsInsert] ) then
    if SelecionarProdutoParaAjuste(Self, gUsuarioLogado.Empresa, iCodigo, sCodigoAlfa, sNome) then
    begin
      CarregarDadosProduto( sCodigoAlfa );
      CarregarLotes(gUsuarioLogado.Empresa, sCodigoAlfa);
    end;
end;

procedure TfrmGeEstoqueAjusteManual.dbFornecedorButtonClick(
  Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  if ( qryAjuste.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      qryAjusteCODFORN.AsInteger := iCodigo;
      qryAjusteNOMEFORN.AsString := sNome;
    end;
end;

procedure TfrmGeEstoqueAjusteManual.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeEstoqueAjusteManual.UpdateLotes;
begin
  if (qryAjuste.State in [dsEdit, dsInsert]) then
    qryAjuste.Post;

  try
    if fdSetLoteProduto.Active then
      fdSetLoteProduto.Close;

    if (Trim(qryAjusteLOTE_DESCRICAO.AsString) <> EmptyStr) then
    begin
      fdSetLoteProduto.ParamByName('empresa').AsString        := qryAjusteCODEMPRESA.AsString;
      fdSetLoteProduto.ParamByName('centro_custo').AsInteger  := CENTRO_CUSTO_ESTOQUE_GERAL;
      fdSetLoteProduto.ParamByName('sistema').AsSmallInt      := gSistema.Codigo;
      fdSetLoteProduto.ParamByName('produto').AsString        := qryAjusteCODPROD.AsString;
      fdSetLoteProduto.ParamByName('lote_descricao').AsString := Trim(qryAjusteLOTE_DESCRICAO.AsString);
      fdSetLoteProduto.ParamByName('lote_qtde').AsCurrency    := qryAjusteQTDENOVA.AsCurrency * qryAjusteFRACIONADOR.AsCurrency;

      if not qryAjusteLOTE_DATA_FAB.IsNull then
        fdSetLoteProduto.ParamByName('lote_fab').AsDateTime := qryAjusteLOTE_DATA_FAB.AsDateTime
      else
        fdSetLoteProduto.ParamByName('lote_fab').Clear;

      if not qryAjusteLOTE_DATA_VAL.IsNull then
        fdSetLoteProduto.ParamByName('lote_val').AsDateTime := qryAjusteLOTE_DATA_VAL.AsDateTime
      else
        fdSetLoteProduto.ParamByName('lote_val').Clear;

      if fdSetLoteProduto.OpenOrExecute then
      begin
        qryAjuste.Edit;
        qryAjusteLOTE_ID.AsString := fdSetLoteProduto.FieldByName('lote_id').AsString;
        qryAjuste.Post;
      end;
    end;
  finally
    fdSetLoteProduto.Close;

    qryAjuste.ApplyUpdates();
    qryAjuste.CommitUpdates;

    CommitTransaction;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeEstoqueAjusteManual', TfrmGeEstoqueAjusteManual);

end.
