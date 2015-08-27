unit UGeFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadraoCadastro, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, Vcl.ImgList, IBX.IBCustomDataSet, IBX.IBUpdateSQL, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, JvExMask, JvToolEdit, JvDBControls, IBX.IBTable,
  Vcl.ExtDlgs, IBX.IBStoredProc;

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
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaNOME_COMPLETO: TIBStringField;
    IbDtstTabelaMETAFONEMA: TIBStringField;
    IbDtstTabelaSEXO: TIBStringField;
    IbDtstTabelaFOTO_3X4: TBlobField;
    IbDtstTabelaCPF: TIBStringField;
    IbDtstTabelaRG_NUMERO: TIBStringField;
    IbDtstTabelaRG_ORGAO_EMISSOR: TIBStringField;
    IbDtstTabelaDATA_NASCIMENTO: TDateField;
    IbDtstTabelaFLAG_VENDEDOR: TSmallintField;
    IbDtstTabelaFLAG_FORNECEDOR: TSmallintField;
    IbDtstTabelaATIVO: TSmallintField;
    IbDtstTabelaVENDEDOR: TIntegerField;
    IbDtstTabelaFORNECEDOR: TIntegerField;
    IbDtstTabelaENDER: TIBStringField;
    IbDtstTabelaNUMERO_END: TIBStringField;
    IbDtstTabelaCOMPLEMENTO: TIBStringField;
    IbDtstTabelaBAIRRO: TIBStringField;
    IbDtstTabelaCEP: TIBStringField;
    IbDtstTabelaCIDADE: TIBStringField;
    IbDtstTabelaUF: TIBStringField;
    IbDtstTabelaTLG_TIPO: TSmallintField;
    IbDtstTabelaLOG_COD: TIntegerField;
    IbDtstTabelaBAI_COD: TIntegerField;
    IbDtstTabelaCID_COD: TIntegerField;
    IbDtstTabelaEST_COD: TSmallintField;
    IbDtstTabelaPAIS_ID: TIBStringField;
    IbDtstTabelaFONE_FIXO: TIBStringField;
    IbDtstTabelaFONE_CELULAR: TIBStringField;
    IbDtstTabelaFONE_COMERCIAL: TIBStringField;
    IbDtstTabelaEMAIL: TIBStringField;
    IbDtstTabelaOBSERVACAO: TWideMemoField;
    IbDtstTabelaDATA_CADASTRO: TDateField;
    lblDataNascimento: TLabel;
    dbDataNascimento: TJvDBDateEdit;
    tblSexo: TIBTable;
    dtsSexo: TDataSource;
    dbSexo: TDBLookupComboBox;
    lblSexo: TLabel;
    IbDtstTabelaLOGRADOURO: TIBStringField;
    IbDtstTabelaBAI_NOME: TIBStringField;
    IbDtstTabelaCID_NOME: TIBStringField;
    IbDtstTabelaEST_NOME: TIBStringField;
    IbDtstTabelaPAIS_NOME: TIBStringField;
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
    IbDtstTabelaRG: TIBStringField;
    setUsuarioFuncionario: TIBStoredProc;
    setVendedorFuncionario: TIBStoredProc;
    GrpBxParametro: TGroupBox;
    dbFlagFornecedor: TDBCheckBox;
    dbFlagVendedor: TDBCheckBox;
    dbAtivo: TDBCheckBox;
    GrpBxAcessos: TGroupBox;
    lblUsuario: TLabel;
    dbUsuario: TJvDBComboEdit;
    popFerramentas: TPopupMenu;
    ppMnAtualizarMetafonema: TMenuItem;
    IbDtstTabelaLOGIN: TIBStringField;
    IbDtstTabelaNOME_LIMPO: TIBStringField;
    lblFuncionarioDesativado: TLabel;
    procedure ProximoCampoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure dbBairroButtonClick(Sender: TObject);
    procedure dbLogradouroButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure ppmCarregarImagemClick(Sender: TObject);
    procedure ppmLimparImagemClick(Sender: TObject);
    procedure dbUsuarioButtonClick(Sender: TObject);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure ppMnAtualizarMetafonemaClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    function GravarVendedorFuncinario : Boolean;
    function GravarUsuarioFuncinario : Boolean;
  public
    { Public declarations }

    procedure FiltarDados(const iTipoPesquisa: Integer); overload;
  end;

var
  frmGeFuncionario: TfrmGeFuncionario;

implementation

uses
  UConstantesDGE, UDMBusiness, UGrPadrao, UFuncoes, UDMNFe,
  UGeBairro, UGeCidade, UGeDistrito, UGeEstado, UGeLogradouro, UGrUsuario;

{$R *.dfm}

procedure TfrmGeFuncionario.btbtnListaClick(Sender: TObject);
begin
  inherited;
  DMNFe.frrListaFuncionario.ShowReport;
end;

procedure TfrmGeFuncionario.btbtnSalvarClick(Sender: TObject);
begin
  if ( Trim(IbDtstTabelaCPF.AsString) <> EmptyStr ) then
    if ( not FuncoesString.StrIsCPF(IbDtstTabelaCPF.AsString) ) then
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
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaCID_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar a Cidade primeiramente!');
      dbCidade.SetFocus;
    end
    else
    if ( SelecionarBairro(Self, IbDtstTabelaCID_COD.AsInteger, iBairro, sBairro) ) then
    begin
      IbDtstTabelaBAI_COD.AsInteger := iBairro;
      IbDtstTabelaBAI_NOME.AsString := sBairro;
    end;
end;

procedure TfrmGeFuncionario.dbCidadeButtonClick(Sender: TObject);
var
  iCidade : Integer;
  sCidade : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaEST_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar o Estado primeiramente!');
      dbEstado.SetFocus;
    end
    else
    if ( SelecionarCidade(Self, IbDtstTabelaEST_COD.AsInteger, iCidade, sCidade) ) then
    begin
      IbDtstTabelaCID_COD.AsInteger := iCidade;
      IbDtstTabelaCID_NOME.AsString := sCidade;
      IbDtstTabelaCIDADE.AsString   := Copy(sCidade + ' (' + IbDtstTabelaUF.AsString + ')', 1, IbDtstTabelaCIDADE.Size);
      IbDtstTabelaCEP.AsString      := GetCidadeCEP(iCidade);
    end;
end;

procedure TfrmGeFuncionario.dbEstadoButtonClick(Sender: TObject);
var
  iEstado : Integer;
  sEstado ,
  sUF     : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarEstado(Self, iEstado, sEstado, sUF) ) then
    begin
      IbDtstTabelaEST_COD.AsInteger := iEstado;
      IbDtstTabelaEST_NOME.AsString := sEstado;
      IbDtstTabelaUF.AsString       := sUF;
    end;
end;

procedure TfrmGeFuncionario.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  // Destacar funcionarios desativados
  if ( IbDtstTabelaATIVO.AsInteger = 0 ) then
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
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaCID_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar a Cidade primeiramente!');
      dbCidade.SetFocus;
    end
    else
    if ( SelecionarLogradouro(Self, IbDtstTabelaCID_COD.AsInteger, iTipo, sTipo, iLogradouro, sLogradouro) ) then
    begin
      IbDtstTabelaTLG_TIPO.AsInteger  := iTipo;
      IbDtstTabelaLOG_COD.AsInteger   := iLogradouro;
      IbDtstTabelaLOGRADOURO.AsString := Trim(sTipo + ' ' + sLogradouro);
      IbDtstTabelaENDER.AsString      := Trim(sTipo + ' ' + sLogradouro);
    end;
end;

procedure TfrmGeFuncionario.dbUsuarioButtonClick(Sender: TObject);
var
  sLogin,
  sNome : String;
begin
  if ( dbUsuario.Button.Enabled and (IbDtstTabela.State in [dsEdit, dsInsert]) ) then
    if SelecionarUsuarioRequisitante(Self, sLogin, sNome) then
      IbDtstTabelaLOGIN.Value := sLogin;
end;

procedure TfrmGeFuncionario.FiltarDados(const iTipoPesquisa: Integer);
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

  tblSexo.Open;

  DisplayFormatCodigo := '##0000';

  NomeTabela         := 'TBFUNCIONARIO';
  CampoCodigo        := 'f.codigo';
  CampoDescricao     := 'f.nome_completo';
  CampoCadastroAtivo := 'f.ativo';

  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;
  dbFlagVendedor.Enabled       := gLicencaSistema.UsarSGE;
end;

function TfrmGeFuncionario.GravarUsuarioFuncinario: Boolean;
begin
  Result := False;
  try
    with setUsuarioFuncionario do
    begin
      Close;
      ParamByName('nome_completo').AsString := Trim(IbDtstTabelaNOME_LIMPO.AsString);
      ParamByName('ativo').AsInteger        := IbDtstTabelaATIVO.AsInteger;
      ExecProc;

      CommitTransaction;

      Result := True;

      if (IbDtstTabela.State in [dsEdit, dsInsert]) then
        if (IbDtstTabelaLOGIN.AsString <> ParamByName('usuario_login').AsString) then
          IbDtstTabelaLOGIN.AsString := ParamByName('usuario_login').AsString;
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
    with setVendedorFuncionario do
    begin
      Close;
      ParamByName('nome_completo').AsString := Trim(IbDtstTabelaNOME_COMPLETO.AsString);
      ParamByName('cpf').AsString           := Trim(IbDtstTabelaCPF.AsString);
      ParamByName('ativo').AsInteger        := IbDtstTabelaATIVO.AsInteger;
      ExecProc;

      CommitTransaction;

      Result := True;

      if (IbDtstTabela.State in [dsEdit, dsInsert]) then
        if (IbDtstTabelaVENDEDOR.AsInteger <> ParamByName('codigo_vendedor').AsInteger) then
          IbDtstTabelaVENDEDOR.AsInteger := ParamByName('codigo_vendedor').AsInteger;
    end;
  except
    On E : Exception do
      ShowError('GravarVendedorFuncinario() - ' + E.Message);
  end;
end;

procedure TfrmGeFuncionario.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  IbDtstTabelaNOME_LIMPO.AsString := FuncoesString.StrRemoveAllAccents(IbDtstTabelaNOME_COMPLETO.AsString);
  IbDtstTabelaMETAFONEMA.AsString := Metafonema(IbDtstTabelaNOME_COMPLETO.AsString);

  if ( Trim(IbDtstTabelaLOGIN.AsString) = EmptyStr ) then
    if not GravarUsuarioFuncinario then
      Abort;

  if ( IbDtstTabelaVENDEDOR.AsInteger = 1 ) then
    if not GravarVendedorFuncinario then
      Abort;
end;

procedure TfrmGeFuncionario.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaPAIS_ID.AsString          := GetPaisIDDefault;
  IbDtstTabelaPAIS_NOME.AsString        := GetPaisNomeDefault;
  IbDtstTabelaEST_COD.AsInteger         := GetEstadoIDDefault;
  IbDtstTabelaEST_NOME.AsString         := GetEstadoNomeDefault;
  IbDtstTabelaUF.AsString               := GetEstadoUF(GetEstadoIDDefault);
  IbDtstTabelaCID_COD.AsInteger         := GetCidadeIDDefault;
  IbDtstTabelaCID_NOME.AsString         := GetCidadeNomeDefault;
  IbDtstTabelaCIDADE.AsString           := Copy(IbDtstTabelaCID_NOME.AsString + ' (' + Trim(IbDtstTabelaUF.AsString) + ')', 1, IbDtstTabelaCIDADE.Size);
  IbDtstTabelaCEP.AsString              := GetCidadeCEP(GetCidadeIDDefault);
  IbDtstTabelaNUMERO_END.AsString       := 'S/N';
  IbDtstTabelaCOMPLEMENTO.AsString      := EmptyStr;
  IbDtstTabelaFLAG_VENDEDOR.AsInteger   := 0;
  IbDtstTabelaFLAG_FORNECEDOR.AsInteger := 0;
  IbDtstTabelaATIVO.AsInteger           := 1;
  IbDtstTabelaDATA_CADASTRO.AsDateTime  := GetDateTimeDB;
  IbDtstTabelaCPF.Clear;
  IbDtstTabelaDATA_NASCIMENTO.Clear;
  IbDtstTabelaVENDEDOR.Clear;
  IbDtstTabelaFORNECEDOR.Clear;
  IbDtstTabelaLOGIN.Clear;
  IbDtstTabelaOBSERVACAO.Clear;
  IbDtstTabelaFOTO_3X4.Clear;
end;

procedure TfrmGeFuncionario.ppmCarregarImagemClick(Sender: TObject);
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( opnDialogImage.Execute ) then
      IbDtstTabelaFOTO_3X4.LoadFromFile( opnDialogImage.FileName );
end;

procedure TfrmGeFuncionario.ppmLimparImagemClick(Sender: TObject);
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    IbDtstTabelaFOTO_3X4.Clear;
end;

procedure TfrmGeFuncionario.ppMnAtualizarMetafonemaClick(Sender: TObject);
var
  sUpdate : String;
begin
  if IbDtstTabela.IsEmpty then
    Exit;

  IbDtstTabela.First;
  IbDtstTabela.DisableControls;
  Screen.Cursor := crSQLWait;
  try
    while not IbDtstTabela.Eof do
    begin
      sUpdate := 'Update TBFUNCIONARIO Set nome_limpo = %s, metafonema = %s where codigo = %s';
      sUpdate := Format(sUpdate, [
        QuotedStr(FuncoesString.StrRemoveAllAccents(IbDtstTabelaNOME_COMPLETO.AsString)),
        QuotedStr(Metafonema(IbDtstTabelaNOME_COMPLETO.AsString)),
        IbDtstTabelaCODIGO.AsString]);
      ExecuteScriptSQL( sUpdate );

      IbDtstTabela.Next;
    end;
  finally
    IbDtstTabela.First;
    IbDtstTabela.EnableControls;
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
