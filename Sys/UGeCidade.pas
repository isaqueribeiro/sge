unit UGeCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, JvExMask, JvToolEdit,
  JvDBControls, dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  System.ImageList;

type
  TfrmGeCidade = class(TfrmGrPadraoCadastro)
    IbDtstTabelaCID_COD: TIntegerField;
    IbDtstTabelaCID_NOME: TIBStringField;
    IbDtstTabelaEST_COD: TSmallintField;
    IbDtstTabelaCID_SIAFI: TIntegerField;
    IbDtstTabelaCID_IBGE: TIntegerField;
    IbDtstTabelaEST_NOME: TIBStringField;
    IbDtstTabelaEST_SIGLA: TIBStringField;
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblBGE: TLabel;
    dbIBGE: TDBEdit;
    lblSIAFI: TLabel;
    dbSIAFI: TDBEdit;
    lblEstado: TLabel;
    IbDtstTabelaCID_DDD: TSmallintField;
    IbDtstTabelaCID_CEP_INICIAL: TIntegerField;
    IbDtstTabelaCID_CEP_FINAL: TIntegerField;
    lblDDD: TLabel;
    dbDDD: TDBEdit;
    lblCEPInicial: TLabel;
    dbCEPInicial: TDBEdit;
    lblCEPFinal: TLabel;
    dbCEPFinal: TDBEdit;
    GrpBxCustosOper: TGroupBox;
    dbCustoOperacional: TDBCheckBox;
    IbDtstTabelaCUSTO_OPER_PERCENTUAL: TSmallintField;
    IbDtstTabelaCUSTO_OPER_FRETE: TIBBCDField;
    IbDtstTabelaCUSTO_OPER_OUTROS: TIBBCDField;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblOutros: TLabel;
    dbOutros: TDBEdit;
    Bevel5: TBevel;
    dbEstado: TJvDBComboEdit;
    fdQryTabelaCID_COD: TIntegerField;
    fdQryTabelaCID_NOME: TStringField;
    fdQryTabelaEST_COD: TSmallintField;
    fdQryTabelaCID_SIAFI: TIntegerField;
    fdQryTabelaCID_IBGE: TIntegerField;
    fdQryTabelaCID_DDD: TSmallintField;
    fdQryTabelaCID_CEP_INICIAL: TIntegerField;
    fdQryTabelaCID_CEP_FINAL: TIntegerField;
    fdQryTabelaCUSTO_OPER_PERCENTUAL: TSmallintField;
    fdQryTabelaCUSTO_OPER_FRETE: TBCDField;
    fdQryTabelaCUSTO_OPER_OUTROS: TBCDField;
    fdQryTabelaEST_NOME: TStringField;
    fdQryTabelaEST_SIGLA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeCidade: TfrmGeCidade;

  procedure MostrarTabelaCidades(const AOwner : TComponent);
  function SelecionarCidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarCidade(const AOwner : TComponent; const Estado : Smallint; var Codigo : Integer; var Nome : String) : Boolean; overload;

implementation

uses
  UDMBusiness, UGeEstado, UGrPadrao, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaCidades(const AOwner : TComponent);
var
  frm : TfrmGeCidade;
begin
  frm := TfrmGeCidade.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeCidade;
begin
  frm := TfrmGeCidade.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarCidade(const AOwner : TComponent; const Estado : Smallint; var Codigo : Integer; var Nome : String) : Boolean; overload;
var
  frm : TfrmGeCidade;
  whr : String;
begin
  frm := TfrmGeCidade.Create(AOwner);
  try
    whr    := 'c.est_cod = ' + IntToStr(Estado);

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeCidade.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_CIDADE_ID;
  ControlFirstEdit := dbNome;

  NomeTabela     := 'TBCIDADE';
  CampoCodigo    := 'cid_cod';
  CampoDescricao := 'cid_nome';

  UpdateGenerator;

  GrpBxCustosOper.Enabled := GetCalcularCustoOperEmpresa(gUsuarioLogado.Empresa);
end;

procedure TfrmGeCidade.dbEstadoButtonClick(Sender: TObject);
var
  iEstado : Integer;
  sEstado : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarEstado(Self, iEstado, sEstado) ) then
    begin
      IbDtstTabelaEST_COD.AsInteger := iEstado;
      IbDtstTabelaEST_NOME.AsString := sEstado;
    end;
end;

procedure TfrmGeCidade.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  if ( GetEstadoIDDefault > 0 ) then
  begin
    IbDtstTabelaEST_COD.AsInteger := GetEstadoIDDefault;
    IbDtstTabelaEST_NOME.AsString := GetEstadoNomeDefault;
  end;

  IbDtstTabelaCUSTO_OPER_PERCENTUAL.AsInteger := 0; // Ord(False);
  IbDtstTabelaCUSTO_OPER_FRETE.Clear;
  IbDtstTabelaCUSTO_OPER_OUTROS.Clear;
end;

procedure TfrmGeCidade.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = IbDtstTabelaCUSTO_OPER_PERCENTUAL ) then
    if ( IbDtstTabelaCUSTO_OPER_PERCENTUAL.AsInteger = 1 ) then
    begin
      lblFrete.Caption  := 'Frete (%):';
      lblOutros.Caption := 'Outros (%):';
    end
    else
    begin
      lblFrete.Caption  := 'Frete (R$):';
      lblOutros.Caption := 'Outros (R$):';
    end;
end;

procedure TfrmGeCidade.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  DtSrcTabelaDataChange(IbDtstTabelaCUSTO_OPER_PERCENTUAL, IbDtstTabelaCUSTO_OPER_PERCENTUAL);
end;

procedure TfrmGeCidade.btbtnSalvarClick(Sender: TObject);
begin
  if ( IbDtstTabelaCUSTO_OPER_PERCENTUAL.AsInteger = 1 ) then
  begin
    if ((IbDtstTabelaCUSTO_OPER_FRETE.AsCurrency < 0) or (IbDtstTabelaCUSTO_OPER_FRETE.AsCurrency > 100)) then
    begin
      ShowWarning('Percentual de custo operacional para "Frete" inválido!');
      Exit;
    end;

    if ((IbDtstTabelaCUSTO_OPER_OUTROS.AsCurrency < 0) or (IbDtstTabelaCUSTO_OPER_OUTROS.AsCurrency > 100)) then
    begin
      ShowWarning('Percentual de custo operacional para "Outros" inválido!');
      Exit;
    end;
  end;

  if IbDtstTabelaCUSTO_OPER_PERCENTUAL.IsNull then
    IbDtstTabelaCUSTO_OPER_PERCENTUAL.AsInteger := 1;

  inherited;
end;

procedure TfrmGeCidade.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if (not btbtnAlterar.Enabled) then
    if IbDtstTabelaCUSTO_OPER_PERCENTUAL.IsNull then
      IbDtstTabelaCUSTO_OPER_PERCENTUAL.AsInteger := 1;
end;

initialization
  FormFunction.RegisterForm('frmGeCidade', TfrmGeCidade);
  
end.
