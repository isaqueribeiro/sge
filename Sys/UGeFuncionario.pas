unit UGeFuncionario;

interface

uses
  UGrPadraoCadastro,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, System.ImageList,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.ImgList,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  JvExMask, JvToolEdit, JvDBControls, IBX.IBTable, Vcl.ExtDlgs, IBX.IBStoredProc,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmGeFuncionario = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    GrpBxDocumentacao: TGroupBox;
    lblCpf: TLabel;
    dbCpf: TDBEdit;
    lblRGNumero: TLabel;
    dbRGNumero: TDBEdit;
    lblRGOrgao: TLabel;
    dbRGOrgao: TDBEdit;
    lblDataCadastro: TLabel;
    dbDataCadastro: TDBEdit;
    Bevel5: TBevel;
    lblDataNascimento: TLabel;
    dbDataNascimento: TJvDBDateEdit;
    dtsSexo: TDataSource;
    dbSexo: TDBLookupComboBox;
    lblSexo: TLabel;
    GrpBxEndereco: TGroupBox;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblBairro: TLabel;
    lblLogradouro: TLabel;
    lblCEP: TLabel;
    lblNumero: TLabel;
    lblComplemento: TLabel;
    lblPais: TLabel;
    dbCEP: TDBEdit;
    dbNumero: TDBEdit;
    dbComplemento: TDBEdit;
    dbEstado: TJvDBComboEdit;
    dbCidade: TJvDBComboEdit;
    dbBairro: TJvDBComboEdit;
    dbLogradouro: TJvDBComboEdit;
    dbPais: TJvDBComboEdit;
    Bevel6: TBevel;
    pgcMaisDados: TPageControl;
    tbsContato: TTabSheet;
    lblFone: TLabel;
    lblEmail: TLabel;
    lblFoneCelular: TLabel;
    lblFoneComercial: TLabel;
    dbFone: TDBEdit;
    dbEmail: TDBEdit;
    dbFoneCelular: TDBEdit;
    dbFoneComercial: TDBEdit;
    tbsDadosAdcionais: TTabSheet;
    tbsObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    ppmLogo: TPopupMenu;
    ppmCarregarImagem: TMenuItem;
    ppmLimparImagem: TMenuItem;
    opnDialogImage: TOpenPictureDialog;
    dbFoto3x4: TDBImage;
    GrpBxParametro: TGroupBox;
    dbFlagFornecedor: TDBCheckBox;
    dbFlagVendedor: TDBCheckBox;
    dbAtivo: TDBCheckBox;
    GrpBxAcessos: TGroupBox;
    lblUsuario: TLabel;
    dbUsuario: TJvDBComboEdit;
    popFerramentas: TPopupMenu;
    ppMnAtualizarMetafonema: TMenuItem;
    lblFuncionarioDesativado: TLabel;
    fdQryTabelaCODIGO: TIntegerField;
    fdQryTabelaNOME_COMPLETO: TStringField;
    fdQryTabelaNOME_LIMPO: TStringField;
    fdQryTabelaMETAFONEMA: TStringField;
    fdQryTabelaSEXO: TStringField;
    fdQryTabelaFOTO_3X4: TBlobField;
    fdQryTabelaCPF: TStringField;
    fdQryTabelaRG_NUMERO: TStringField;
    fdQryTabelaRG_ORGAO_EMISSOR: TStringField;
    fdQryTabelaDATA_NASCIMENTO: TDateField;
    fdQryTabelaFLAG_VENDEDOR: TSmallintField;
    fdQryTabelaFLAG_FORNECEDOR: TSmallintField;
    fdQryTabelaATIVO: TSmallintField;
    fdQryTabelaLOGIN: TStringField;
    fdQryTabelaVENDEDOR: TIntegerField;
    fdQryTabelaFORNECEDOR: TIntegerField;
    fdQryTabelaENDER: TStringField;
    fdQryTabelaNUMERO_END: TStringField;
    fdQryTabelaCOMPLEMENTO: TStringField;
    fdQryTabelaBAIRRO: TStringField;
    fdQryTabelaCEP: TStringField;
    fdQryTabelaCIDADE: TStringField;
    fdQryTabelaUF: TStringField;
    fdQryTabelaTLG_TIPO: TSmallintField;
    fdQryTabelaLOG_COD: TIntegerField;
    fdQryTabelaBAI_COD: TIntegerField;
    fdQryTabelaCID_COD: TIntegerField;
    fdQryTabelaEST_COD: TSmallintField;
    fdQryTabelaPAIS_ID: TStringField;
    fdQryTabelaFONE_FIXO: TStringField;
    fdQryTabelaFONE_CELULAR: TStringField;
    fdQryTabelaFONE_COMERCIAL: TStringField;
    fdQryTabelaEMAIL: TStringField;
    fdQryTabelaOBSERVACAO: TMemoField;
    fdQryTabelaDATA_CADASTRO: TDateField;
    fdQryTabelaRG: TStringField;
    fdQryTabelaLOGRADOURO: TStringField;
    fdQryTabelaBAI_NOME: TStringField;
    fdQryTabelaCID_NOME: TStringField;
    fdQryTabelaEST_NOME: TStringField;
    fdQryTabelaPAIS_NOME: TStringField;
    qrySexo: TFDQuery;
    spSetUsuarioFuncionario: TFDStoredProc;
    spSetVendedorFuncionario: TFDStoredProc;
    procedure ProximoCampoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure dbBairroButtonClick(Sender: TObject);
    procedure dbLogradouroButtonClick(Sender: TObject);
    procedure ppmCarregarImagemClick(Sender: TObject);
    procedure ppmLimparImagemClick(Sender: TObject);
    procedure dbUsuarioButtonClick(Sender: TObject);
    procedure ppMnAtualizarMetafonemaClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    function GravarVendedorFuncinario : Boolean;
    function GravarUsuarioFuncinario : Boolean;
  public
    { Public declarations }

    procedure FiltarDados(const iTipoPesquisa: Integer); overload;
  end;

(*
  Tabelas:
  - TBFUNCIONARIO
  - TBTIPO_LOGRADOURO
  - TBLOGRADOURO
  - TBBAIRRO
  - TBCIDADE
  - TBESTADO
  - TBPAIS

  Views:
  - VW_SEXO

  Procedures:
  - SET_USUARIO_FUNCIONARIO
  - SET_VENDEDOR_FUNCIONARIO

*)

var
  frmGeFuncionario: TfrmGeFuncionario;

implementation

uses
  UConstantesDGE, UDMRecursos, UDMBusiness, UGrPadrao, UFuncoes, UDMNFe,
  View.Bairro, View.Cidade, View.Distrito, View.Estado, View.Logradouro, View.Usuario;

{$R *.dfm}

procedure TfrmGeFuncionario.btbtnListaClick(Sender: TObject);
begin
  inherited;
  DMNFe.frrListaFuncionario.ShowReport;
end;

procedure TfrmGeFuncionario.btbtnSalvarClick(Sender: TObject);
begin
  if ( Trim(DtSrcTabela.DataSet.FieldByName('CPF').AsString) <> EmptyStr ) then
    if ( not FuncoesString.StrIsCPF(DtSrcTabela.DataSet.FieldByName('CPF').AsString) ) then
    begin
      ShowWarning('Favor informar um CPF válido.');
      Abort;
    end;

  inherited;
end;

procedure TfrmGeFuncionario.btnFiltrarClick(Sender: TObject);
begin
  //inherited;
  FiltarDados(0);
  CentralizarCodigo;
end;

procedure TfrmGeFuncionario.dbBairroButtonClick(Sender: TObject);
var
  iBairro : Integer;
  sBairro : String;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( DtSrcTabela.DataSet.FieldByName('CID_COD').AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar a Cidade primeiramente!');
      dbCidade.SetFocus;
    end
    else
    if ( SelecionarBairro(Self, DtSrcTabela.DataSet.FieldByName('CID_COD').AsInteger, iBairro, sBairro) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('BAI_COD').AsInteger := iBairro;
      DtSrcTabela.DataSet.FieldByName('BAI_NOME').AsString := sBairro;
    end;
end;

procedure TfrmGeFuncionario.dbCidadeButtonClick(Sender: TObject);
var
  iCidade : Integer;
  sCidade : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( FieldByName('EST_COD').AsInteger = 0 ) then
      begin
        ShowWarning('Favor informar o Estado primeiramente!');
        dbEstado.SetFocus;
      end
      else
      if ( SelecionarCidade(Self, FieldByName('EST_COD').AsInteger, iCidade, sCidade) ) then
      begin
        FieldByName('CID_COD').AsInteger := iCidade;
        FieldByName('CID_NOME').AsString := sCidade;
        FieldByName('CIDADE').AsString   := Copy(sCidade + ' (' + FieldByName('UF').AsString + ')', 1, FieldByName('CIDADE').Size);
        FieldByName('CEP').AsString      := GetCidadeCEP(iCidade);
      end;
  end;
end;

procedure TfrmGeFuncionario.dbEstadoButtonClick(Sender: TObject);
var
  iEstado : Integer;
  sEstado ,
  sUF     : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarEstado(Self, iEstado, sEstado, sUF) ) then
      begin
        FieldByName('EST_COD').AsInteger := iEstado;
        FieldByName('EST_NOME').AsString := sEstado;
        FieldByName('UF').AsString       := sUF;
      end;
  end;
end;

procedure TfrmGeFuncionario.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  // Destacar funcionarios desativados
  if ( DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger = 0 ) then
    dbgDados.Canvas.Font.Color := lblFuncionarioDesativado.Font.Color;

  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TfrmGeFuncionario.dbLogradouroButtonClick(Sender: TObject);
var
  iTipo : Smallint;
  sTipo : String;
  iLogradouro : Integer;
  sLogradouro : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( FieldByName('CID_COD').AsInteger = 0 ) then
      begin
        ShowWarning('Favor informar a Cidade primeiramente!');
        dbCidade.SetFocus;
      end
      else
      if ( SelecionarLogradouro(Self, FieldByName('CID_COD').AsInteger, iTipo, sTipo, iLogradouro, sLogradouro) ) then
      begin
        FieldByName('TLG_TIPO').AsInteger  := iTipo;
        FieldByName('LOG_COD').AsInteger   := iLogradouro;
        FieldByName('LOGRADOURO').AsString := Trim(sTipo + ' ' + sLogradouro);
        FieldByName('ENDER').AsString      := Trim(sTipo + ' ' + sLogradouro);
      end;
  end;
end;

procedure TfrmGeFuncionario.dbUsuarioButtonClick(Sender: TObject);
var
  sLogin,
  sNome : String;
begin
  if ( dbUsuario.Button.Enabled and (IbDtstTabela.State in [dsEdit, dsInsert]) ) then
    if SelecionarUsuarioRequisitante(Self, sLogin, sNome) then
      DtSrcTabela.DataSet.FieldByName('LOGIN').AsString := sLogin;
end;

procedure TfrmGeFuncionario.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('NOME_LIMPO').AsString := FuncoesString.StrRemoveAllAccents(FieldByName('NOME_COMPLETO').AsString);
    FieldByName('METAFONEMA').AsString := Metafonema(FieldByName('NOME_COMPLETO').AsString);

    if ( Trim(FieldByName('LOGIN').AsString) = EmptyStr ) then
      if not GravarUsuarioFuncinario then
        Abort;

    if ( FieldByName('FLAG_VENDEDOR').AsInteger = 1 ) then
      if not GravarVendedorFuncinario then
        Abort;
  end;
end;

procedure TfrmGeFuncionario.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('PAIS_ID').AsString          := GetPaisIDDefault;
    FieldByName('PAIS_NOME').AsString        := GetPaisNomeDefault;
    FieldByName('EST_COD').AsInteger         := GetEstadoIDDefault;
    FieldByName('EST_NOME').AsString         := GetEstadoNomeDefault;
    FieldByName('UF').AsString               := GetEstadoUF(GetEstadoIDDefault);
    FieldByName('CID_COD').AsInteger         := GetCidadeIDDefault;
    FieldByName('CID_NOME').AsString         := GetCidadeNomeDefault;
    FieldByName('CIDADE').AsString           := Copy(FieldByName('CID_NOME').AsString + ' (' + Trim(FieldByName('UF').AsString) + ')', 1, FieldByName('CIDADE').Size);
    FieldByName('CEP').AsString              := GetCidadeCEP(GetCidadeIDDefault);
    FieldByName('NUMERO_END').AsString       := 'S/N';
    FieldByName('COMPLEMENTO').AsString      := EmptyStr;
    FieldByName('FLAG_VENDEDOR').AsInteger   := 0;
    FieldByName('FLAG_FORNECEDOR').AsInteger := 0;
    FieldByName('ATIVO').AsInteger           := 1;
    FieldByName('DATA_CADASTRO').AsDateTime  := GetDateTimeDB;
    FieldByName('CPF').Clear;
    FieldByName('DATA_NASCIMENTO').Clear;
    FieldByName('VENDEDOR').Clear;
    FieldByName('FORNECEDOR').Clear;
    FieldByName('LOGIN').Clear;
    FieldByName('OBSERVACAO').Clear;
    FieldByName('FOTO_3X4').Clear;
  end;
end;

procedure TfrmGeFuncionario.FiltarDados(const iTipoPesquisa: Integer);
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

        if StrIsCPF(Trim(edtFiltrar.Text)) then
          Add( 'where f.cpf = ' + QuotedStr(Trim(edtFiltrar.Text)) )
        else
        if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
          Add( 'where ' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) )
        else
        begin
          Add( 'where ((upper(f.nome_completo) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') +
               '     or upper(f.nome_completo) like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + '))');
          Add( '   or ((upper(f.metafonema) like ' + QuotedStr(Metafonema(Trim(edtFiltrar.Text)) + '%') + '))');
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

procedure TfrmGeFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmGeFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_FUNCIONARIO_ID;
  ControlFirstEdit := dbNome;

  CarregarLista(qrySexo);

  DisplayFormatCodigo := '##0000';

  NomeTabela         := 'TBFUNCIONARIO';
  CampoCodigo        := 'f.codigo';
  CampoDescricao     := 'f.nome_completo';
  CampoCadastroAtivo := 'f.ativo';

  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;
  dbFlagVendedor.Enabled       := gLicencaSistema.UsarSGE or gLicencaSistema.UsarSGI;
end;

function TfrmGeFuncionario.GravarUsuarioFuncinario: Boolean;
begin
  Result := False;
  try
    with spSetUsuarioFuncionario do
    begin
      Close;
      ParamByName('nome_completo').AsString := Trim(DtSrcTabela.DataSet.FieldByName('NOME_LIMPO').AsString);
      ParamByName('ativo').AsSmallInt       := DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger;
      ExecProc;

      CommitTransaction;

      Result := True;

      if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
        if (DtSrcTabela.DataSet.FieldByName('LOGIN').AsString <> ParamByName('usuario_login').AsString) then
          DtSrcTabela.DataSet.FieldByName('LOGIN').AsString := ParamByName('usuario_login').AsString;
    end;
  except
    On E : Exception do
      ShowError('GravarUsuarioFuncinario() - ' + E.Message);
  end;
end;

function TfrmGeFuncionario.GravarVendedorFuncinario: Boolean;
begin
  Result := False;
  try
    with spSetVendedorFuncionario do
    begin
      Close;
      ParamByName('nome_completo').AsString := Trim(DtSrcTabela.DataSet.FieldByName('NOME_COMPLETO').AsString);
      ParamByName('cpf').AsString           := Trim(DtSrcTabela.DataSet.FieldByName('CPF').AsString);
      ParamByName('email').AsString         := Trim(DtSrcTabela.DataSet.FieldByName('EMAIL').AsString);
      ParamByName('ativo').AsSmallInt       := DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger;
      ExecProc;

      CommitTransaction;

      Result := True;

      if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
        if (DtSrcTabela.DataSet.FieldByName('VENDEDOR').AsInteger <> ParamByName('codigo_vendedor').AsInteger) then
          DtSrcTabela.DataSet.FieldByName('VENDEDOR').AsInteger := ParamByName('codigo_vendedor').AsInteger;
    end;
  except
    On E : Exception do
      ShowError('GravarVendedorFuncinario() - ' + E.Message);
  end;
end;

procedure TfrmGeFuncionario.ppmCarregarImagemClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( opnDialogImage.Execute ) then
      fdQryTabelaFOTO_3X4.LoadFromFile( opnDialogImage.FileName );
end;

procedure TfrmGeFuncionario.ppmLimparImagemClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    fdQryTabelaFOTO_3X4.Clear;
end;

procedure TfrmGeFuncionario.ppMnAtualizarMetafonemaClick(Sender: TObject);
var
  sUpdate : String;
begin
  if IbDtstTabela.IsEmpty then
    Exit;

  fdQryTabela.First;
  fdQryTabela.DisableControls;
  Screen.Cursor := crSQLWait;
  try
    while not fdQryTabela.Eof do
    begin
      sUpdate := 'Update TBFUNCIONARIO Set nome_limpo = %s, metafonema = %s where codigo = %s';
      sUpdate := Format(sUpdate, [
        QuotedStr(FuncoesString.StrRemoveAllAccents(fdQryTabelaNOME_COMPLETO.AsString)),
        QuotedStr(Metafonema(fdQryTabelaNOME_COMPLETO.AsString)),
        fdQryTabelaCODIGO.AsString]);
      ExecuteScriptSQL( sUpdate );

      fdQryTabela.Next;
    end;
  finally
    fdQryTabela.First;
    fdQryTabela.EnableControls;
    Screen.Cursor := crDefault;

    ShowInformation('Atualização', 'Código metafônico dos registros atualizados com sucesso!');
  end;
end;

procedure TfrmGeFuncionario.ProximoCampoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    if ( Sender = dbComplemento ) then
    begin
      pgcMaisDados.ActivePage := tbsContato;
      dbFone.SetFocus;
    end
    else
    if ( Sender = dbEmail ) then
      pgcMaisDados.ActivePage := tbsDadosAdcionais
    else
    if ( Sender = dbFoto3x4 ) then
      pgcMaisDados.ActivePage := tbsObservacao;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeFuncionario', TfrmGeFuncionario);

end.
