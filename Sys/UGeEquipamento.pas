unit UGeEquipamento;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, ToolWin, IBTable, ACBrConsultaCPF, ACBrBase, ACBrSocket, ACBrConsultaCNPJ, JPEG, JvExMask, JvToolEdit,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2007Green, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, System.ImageList, JvDBControls;

type
  TEquipamentoCliente = record
    Cliente  ,
    Codigo   ,
    Tipo     : Integer;
    TipoDescr,
    Descricao,
    Marca    ,
    Modelo   ,
    Referencia,
    Serial    : String;
  end;

  TfrmGeEquipamento = class(TfrmGrPadraoCadastro)
    lblModelo: TLabel;
    dbModelo: TDBEdit;
    lblReferencia: TLabel;
    dbReferencia: TDBEdit;
    dtsTipo: TDataSource;
    dbUsuario: TDBEdit;
    lblUsuario: TLabel;
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaTIPO: TSmallintField;
    IbDtstTabelaCLIENTE: TIntegerField;
    IbDtstTabelaDESCRICAO: TIBStringField;
    IbDtstTabelaESPECIFICACAO: TMemoField;
    IbDtstTabelaMARCA: TIBStringField;
    IbDtstTabelaMODELO: TIBStringField;
    IbDtstTabelaFABRICANTE: TIntegerField;
    IbDtstTabelaREFERENCIA: TIBStringField;
    IbDtstTabelaSERIAL: TIBStringField;
    IbDtstTabelaUSUARIO: TIBStringField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaNOME: TIBStringField;
    IbDtstTabelaTIPO_DESCRICAO: TIBStringField;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    lblMarca: TLabel;
    dbMarca: TDBEdit;
    lblSerialNumber: TLabel;
    dbSerialNumber: TDBEdit;
    lblEspecificacao: TLabel;
    Bevel9: TBevel;
    dbEspecificacao: TDBMemo;
    Bevel5: TBevel;
    fdQryTipo: TFDQuery;
    lblCliente: TLabel;
    dbCliente: TJvDBComboEdit;
    procedure ProximoCampoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaCNPJGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    fCliente : Integer;
    procedure ConfigurarLegendasCampos;
  public
    { Public declarations }
    procedure FiltarDados(const iTipoPesquisa: Integer); overload;
  end;

(*
  Tabelas:
  - TBCLIENTE_EQUIPAMENTO
  - TBCLIENTE
  - SYS_TIPO_EQUIPAMENTO

  Views:

  Procedures:

*)

var
  frmGeEquipamento: TfrmGeEquipamento;

  procedure MostrarTabelaEquipamento(const AOwner : TComponent; const aCliente : Integer);

  function SelecionarEquipamento(const AOwner : TComponent; const aCliente : Integer; var aEquipamentoCliente : TEquipamentoCliente) : Boolean;

implementation

uses
  UDMRecursos, UDMBusiness, UGrPadrao, UConstantesDGE, View.Cliente;

{$R *.dfm}

procedure MostrarTabelaEquipamento(const AOwner : TComponent; const aCliente : Integer);
var
  AForm : TfrmGeEquipamento;
begin
  AForm := TfrmGeEquipamento.Create(AOwner);
  try
    AForm.fCliente        := aCliente;
    AForm.WhereAdditional := 'e.cliente = ' + IntToStr(aCliente);
    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarEquipamento(const AOwner : TComponent; const aCliente : Integer; var aEquipamentoCliente : TEquipamentoCliente) : Boolean;
var
  AForm : TfrmGeEquipamento;
  iCodigo    : Integer;
  sDescricao : String;
begin
  AForm := TfrmGeEquipamento.Create(AOwner);
  try
    AForm.fCliente        := aCliente;
    AForm.WhereAdditional := 'e.cliente = ' + IntToStr(aCliente);
    AForm.AbrirTabelaAuto := True;

    Result := AForm.SelecionarRegistro(iCodigo, sDescricao, AForm.WhereAdditional);

    if Result then
    begin
      aEquipamentoCliente.Cliente    := AForm.IbDtstTabelaCLIENTE.AsInteger;
      aEquipamentoCliente.Codigo     := iCodigo;
      aEquipamentoCliente.Tipo       := AForm.IbDtstTabelaTIPO.AsInteger;
      aEquipamentoCliente.TipoDescr  := AForm.dbTipo.Text;
      aEquipamentoCliente.Descricao  := sDescricao;
      aEquipamentoCliente.Marca      := AForm.IbDtstTabelaMARCA.AsString;
      aEquipamentoCliente.Modelo     := AForm.IbDtstTabelaMODELO.AsString;
      aEquipamentoCliente.Referencia := AForm.IbDtstTabelaREFERENCIA.AsString;
      aEquipamentoCliente.Serial     := AForm.IbDtstTabelaSERIAL.AsString;
    end;
  finally
    AForm.Destroy;
  end;
end;

procedure TfrmGeEquipamento.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbCliente;
  AbrirTabelaAuto  := True;

  CarregarLista(fdQryTipo);

  DisplayFormatCodigo := '##00000';

  NomeTabela      := 'TBCLIENTE_EQUIPAMENTO';
  CampoCodigo     := 'e.CODIGO';
  CampoDescricao  := 'e.DESCRICAO';
  CampoOrdenacao  := 'c.nome, c.cnpj, e.descricao';

  if (fCliente > 0) then
    WhereAdditional := 'e.cliente = ' + IntToStr(fCliente);
end;

procedure TfrmGeEquipamento.ProximoCampoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    //if ( Sender = dbHome ) then
    //  pgcMaisDados.SelectNextPage(False);
  end;
end;

procedure TfrmGeEquipamento.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  if ( fCliente = 0 ) then
  begin
    IbDtstTabelaCLIENTE.AsInteger := CONSUMIDOR_FINAL_CODIGO;
    IbDtstTabelaCNPJ.AsString     := CONSUMIDOR_FINAL_CNPJ;
    IbDtstTabelaNOME.AsString     := CONSUMIDOR_FINAL_NOME;
  end
  else
  begin
    IbDtstTabelaCLIENTE.AsInteger := fCliente;
    IbDtstTabelaCNPJ.AsString     := GetClienteCnpfCpf(fCliente);
    IbDtstTabelaNOME.AsString     := GetClienteNome(fCliente);
  end;

  IbDtstTabelaTIPO.Clear;
  IbDtstTabelaDESCRICAO.Clear;
  IbDtstTabelaESPECIFICACAO.Clear;
end;

procedure TfrmGeEquipamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmGeEquipamento.FiltarDados(const iTipoPesquisa: Integer);
begin
  try

    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
      Abort;
    end;

    with IbDtstTabela, SelectSQL do
    begin
      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      Close;
      Clear;
      AddStrings( SQLTabela );

      if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
      begin

        if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
          Add( 'where ' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) )
        else
        if StrIsCPF(Trim(edtFiltrar.Text)) or StrIsCNPJ(Trim(edtFiltrar.Text)) then
          Add( 'where c.cnpj = ' + QuotedStr(StrOnlyNumbers(Trim(edtFiltrar.Text))) )
        else
        begin
          Add( 'where ((upper(e.descricao) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') +
               '     or upper(e.descricao) like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + '))');
          Add( '   or ((upper(c.nome) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') +
               '     or upper(c.nome) like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + '))');
        end;
      end;

      if ( WhereAdditional <> EmptyStr ) then
        if ( Pos('where', SelectSQL.Text) > 0 ) then
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

procedure TfrmGeEquipamento.btnFiltrarClick(Sender: TObject);
begin
  // inherited;
  FiltarDados(0);
  CentralizarCodigo;
end;

procedure TfrmGeEquipamento.IbDtstTabelaCNPJGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    if ( Length(Trim(Sender.AsString)) = 8 ) then
      Sender.EditMask := '999.999.999-99;0; '
    else
      Sender.EditMask := '99.999.999/9999-99;0; '

end;

procedure TfrmGeEquipamento.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sIE   ,
  sNome : String;
  bBloqueado : Boolean;
  sBloqueado : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCliente(Self, iCodigo, sCNPJ, sIE, sNome, bBloqueado, sBloqueado) ) then
    begin
      IbDtstTabelaCLIENTE.AsInteger := iCodigo;
      IbDtstTabelaCNPJ.AsString     := sCNPJ;
      IbDtstTabelaNOME.AsString     := sNome;
    end;
end;

procedure TfrmGeEquipamento.ConfigurarLegendasCampos;
begin
  if ( IbDtstTabelaTIPO.AsInteger in [TIPO_EQUIPAMENTO_CARRO, TIPO_EQUIPAMENTO_MOTO] ) then
  begin
    lblSerialNumber.Caption         := 'Placa:';
    IbDtstTabelaSERIAL.DisplayLabel := 'Placa';
  end
  else
  begin
    lblSerialNumber.Caption         := 'Serial Number:';
    IbDtstTabelaSERIAL.DisplayLabel := 'Serial Number';
  end;
end;

procedure TfrmGeEquipamento.pgcGuiasChange(Sender: TObject);
begin
  ConfigurarLegendasCampos;
end;

procedure TfrmGeEquipamento.IbDtstTabelaAfterScroll(DataSet: TDataSet);
begin
  ConfigurarLegendasCampos;
end;

procedure TfrmGeEquipamento.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = IbDtstTabelaTIPO ) then
    ConfigurarLegendasCampos;
end;

initialization
  FormFunction.RegisterForm('frmGeEquipamento', TfrmGeEquipamento);

end.
