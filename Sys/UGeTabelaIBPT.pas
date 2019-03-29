unit UGeTabelaIBPT;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, Mask, DBCtrls, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, IBQuery, IBTable,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons, JvExMask,
  JvToolEdit, JvDBControls, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TTipoTabelaIBPT = (tIbptGeral, tIbptProdutos, tIbptServicos);
  TfrmGeTabelaIBPT = class(TfrmGrPadraoCadastro)
    lblCodigoNCM: TLabel;
    dbCodigoNCM: TDBEdit;
    dbDescricao: TDBMemo;
    lblDescricao: TLabel;
    dtsNivelIBPT: TDataSource;
    lblExcecao: TLabel;
    dbExcecao: TDBLookupComboBox;
    lblTabela: TLabel;
    dbTabela: TDBLookupComboBox;
    dtsTabelaIBPT: TDataSource;
    GrpBxAliquotas: TGroupBox;
    lblAliquotaNAC: TLabel;
    dbAliquotaNAC: TDBEdit;
    lblAliquotaINT: TLabel;
    dbAliquotaINT: TDBEdit;
    dbAliquotaEST: TDBEdit;
    lblAliquotaEST: TLabel;
    dbAliquotaMUN: TDBEdit;
    lblAliquotaMUN: TLabel;
    btnImportar: TcxButton;
    Bevel5: TBevel;
    dbAtivo: TDBCheckBox;
    lblNCMDesativado: TLabel;
    fdQryNivelIBPT: TFDQuery;
    fdQryTabelaIBPT: TFDQuery;
    fdQryTabelaID_IBPT: TIntegerField;
    fdQryTabelaNCM_IBPT: TStringField;
    fdQryTabelaEX_IBPT: TStringField;
    fdQryTabelaTABELA_IBPT: TStringField;
    fdQryTabelaDESCRICAO_IBPT: TMemoField;
    fdQryTabelaALIQNACIONAL_IBPT: TBCDField;
    fdQryTabelaALIQINTERNACIONAL_IBPT: TBCDField;
    fdQryTabelaALIQESTADUAL_IBPT: TBCDField;
    fdQryTabelaALIQMUNICIPAL_IBPT: TBCDField;
    fdQryTabelaATIVO: TSmallintField;
    fdQryTabelaDESCRICAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fdQryTabelaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FTipoTabela : TTipoTabelaIBPT;
  public
    { Public declarations }
    procedure FiltarDados(const aTipo : Integer = 0); overload;
  end;

(*
  Tabelas:
  - SYS_IBPT

  Views:

  Procedures:

*)

var
  frmGeTabelaIBPT: TfrmGeTabelaIBPT;

  function SelecionarCodigoIBPT(const AOwner : TComponent; const aTipoTabela : TTipoTabelaIBPT;
    var aIndice : Integer; var aCodigo : String; var aDescricao : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE, UGeTabelaIBPTImportar;

{$R *.dfm}

(*
  IMR - 07/01/2016 :
    Inserção do campo "ATIVO" no cadastro.
*)

function SelecionarCodigoIBPT(const AOwner : TComponent; const aTipoTabela : TTipoTabelaIBPT;
  var aIndice : Integer; var aCodigo : String; var aDescricao : String) : Boolean;
var
  frm : TfrmGeTabelaIBPT;
begin
  frm := TfrmGeTabelaIBPT.Create(AOwner);
  try
    frm.FTipoTabela := aTipoTabela;

    Result := frm.SelecionarRegistro(aIndice, aDescricao);

    if Result then
      aCodigo := frm.DtSrcTabela.DataSet.FieldByName('NCM_IBPT').AsString;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTabelaIBPT.btnFiltrarClick(Sender: TObject);
begin
  Case FTipoTabela of
    tIbptProdutos: WhereAdditional := 't.tabela_ibpt in (''0'')';
    tIbptServicos: WhereAdditional := 't.tabela_ibpt in (''1'', ''2'')';
  end;

  //inherited;
  FiltarDados(0);
  CentralizarCodigo;
end;

procedure TfrmGeTabelaIBPT.btnImportarClick(Sender: TObject);
begin
  if ImportarTabelaIBPT(Self) then
    btnFiltrar.Click;
end;

procedure TfrmGeTabelaIBPT.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  // Destacar códigos NCM desativados
  if ( DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger = 0 ) then
    dbgDados.Canvas.Font.Color := lblNCMDesativado.Font.Color;

  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TfrmGeTabelaIBPT.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  btnImportar.Enabled := btbtnIncluir.Enabled;
end;

procedure TfrmGeTabelaIBPT.fdQryTabelaCalcFields(DataSet: TDataSet);
begin
  with DataSet do
   FieldByName('DESCRICAO').AsString := Copy(FieldByName('DESCRICAO_IBPT').AsString, 1, FieldByName('DESCRICAO').Size);
end;

procedure TfrmGeTabelaIBPT.FiltarDados(const aTipo: Integer);
begin
  try

    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
      Abort;
    end;

    with fdQryTabela, SQL do
    begin
      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      Close;
      Clear;
      AddStrings( SQLTabela );

      if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
      begin

        Case aTipo of
          // Por ID, Código NCM
          0:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
            begin
              Add( 'where ((' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) );
              Add( '  ) or (t.ncm_ibpt like ' + QuotedStr(Trim(edtFiltrar.Text) + '%') + '))' );
            end
            else
            begin
              Add( 'where ((upper(t.descricao_ibpt) like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') +
                   '     or upper(t.descricao_ibpt) like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + '))');
            end;
        end;

      end;

      if ( WhereAdditional <> EmptyStr ) then
        if ( Pos('where', SQL.Text) > 0 ) then
          Add( '  and (' + WhereAdditional + ')' )
        else
          Add( 'where (' + WhereAdditional + ')' );

      Add( 'order by ' + CampoOrdenacao );

      Open;

      try

        if ( not IsEmpty ) then
          dbgDados.SetFocus
        else
        begin
          ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

          edtFiltrar.SetFocus;
          edtFiltrar.SelectAll;
        end;

      except
      end;

    end;
  except
    On E : Exception do
      ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13#13 + E.Message + #13#13 + 'Script:' + #13 + IbDtstTabela.SelectSQL.Text);
  end;
end;

procedure TfrmGeTabelaIBPT.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_TABELA_IBPT_ID;
  ControlFirstEdit := dbCodigoNCM;
  FTipoTabela      := tIbptGeral;

  DisplayFormatCodigo := '0000000';

  NomeTabela         := 'SYS_IBPT';
  CampoCodigo        := 't.id_ibpt';
  CampoDescricao     := 't.descricao_ibpt';
  CampoOrdenacao     := 't.ex_ibpt, t.ncm_ibpt, t.descricao_ibpt';
  CampoCadastroAtivo := 't.ativo';
  AbrirTabelaAuto    := True;

  UpdateGenerator;

  CarregarLista(fdQryNivelIBPT);
  CarregarLista(fdQryTabelaIBPT);
end;

procedure TfrmGeTabelaIBPT.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('EX_IBPT').Value := '0';
    FieldByName('ALIQNACIONAL_IBPT').Value      := 0.0;
    FieldByName('ALIQINTERNACIONAL_IBPT').Value := 0.0;
    FieldByName('ALIQESTADUAL_IBPT').Value      := 0.0;
    FieldByName('ALIQMUNICIPAL_IBPT').Value     := 0.0;
    FieldByName('ATIVO').Value                  := 1;
    FieldByName('TABELA_IBPT').Clear;
    FieldByName('DESCRICAO_IBPT').Clear;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeTabelaIBPT', TfrmGeTabelaIBPT);

end.
