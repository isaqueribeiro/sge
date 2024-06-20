unit View.Perfil;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,

  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsDefaultPainters,
  dxSkinsCore,
  dxSkinOffice2019Black,
  dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray,
  dxSkinOffice2019White,
  dxSkinBasic,
  dxSkinMcSkin,
  dxSkinOffice2007Green,
  dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark,
  dxSkinTheBezier,
  dxSkinWXI,

  UObserverInterface,
  UConstantesDGE,
  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela;

type
  PNodeDataPermissao = ^TNodeDataPermissao;

  TNodeDataPermissao = record
    iSistemaID   : Integer;
    iTipo        : Smallint;
    sRotinaID    : String;
    sRotinaNome  : string;
    sRotinaPaiID : String;
    iAutorizado  : Smallint;
    bAcesso      : Boolean;
  end;

  TViewPerfil = class(TViewPadraoCadastro)
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    GrpBxDadosClassificacao: TGroupBox;
    TreeMenu: TTreeView;
    PopMenuTree: TPopupMenu;
    miRestrito: TMenuItem;
    miDisponivel: TMenuItem;
    miInvisivel: TMenuItem;
    dspMenu: TDataSetProvider;
    cdsMenu: TClientDataSet;
    dspSubMenu: TDataSetProvider;
    cdsSubMenu: TClientDataSet;
    dspPermissao: TDataSetProvider;
    cdsPermissao: TClientDataSet;
    N1: TMenuItem;
    miRestritoTodas: TMenuItem;
    miDisponivelTodas: TMenuItem;
    miInverterMarcacao: TMenuItem;
    N2: TMenuItem;
    miCopiarPerfil: TMenuItem;
    procedure SetPermissaoPopup(Sender: TObject);
    procedure SetPermissaoPopupTodas(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure miCopiarPerfilClick(Sender: TObject);
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
    FControllerRotina : IControllerRotina;

    procedure MontarListaPermissao(const TreeViewPermissao: TTreeView; const iSistema : Integer; const iPerfil : Integer);
    procedure CarregarPermissao(const iSistema : Integer; const iPerfil : Integer);
    procedure GravarPermissao(const iSistema : Integer; const iPerfil : Integer);

    function Controller : IControllerPerfil;
    function Rotina : IControllerRotina;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBFUNCAO
  - SYS_ROTINA
  - SYS_SISTEMA_ROTINA
  - SYS_FUNCAO_PERMISSAO

  Views:

  Procedures:

*)

implementation

uses
  UDMRecursos,
  Service.Message,
  Service.Utils,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.Perfil.Copiar;

{$R *.dfm}

const
  AUTHORIZED_RESTRITO   = 41;
  AUTHORIZED_HABILITADO = 42;
  AUTHORIZED_INVISIVEL  = 22;

procedure TViewPerfil.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Perfil;

  inherited;
  RotinaID            := ROTINA_CAD_PERFIL_ID;
  ControlFirstEdit    := dbDescricao;
  DisplayFormatCodigo := '##00';

  NomeTabela     := 'TBFUNCAO';
  CampoCodigo    := 'COD';
  CampoDescricao := 'FUNCAO';
  CampoOrdenacao := 'f.COD';

  Tabela
    .Display('CODIGO', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('FUNCAO', 'Login', True);

  AbrirTabelaAuto := True;

  if (Controller.DAO.Usuario.Funcao.Codigo <> FUNCTION_USER_ID_SYSTEM_ADM) then
    WhereAdditional := '(f.cod != ' + IntToStr(FUNCTION_USER_ID_SYSTEM_ADM) + ')';

  miRestrito.Tag   := AUTHORIZED_RESTRITO;
  miDisponivel.Tag := AUTHORIZED_HABILITADO;
  miInvisivel.Tag  := AUTHORIZED_INVISIVEL;

  Rotina.CarregarMenus(gSistema.Codigo);
  Controller.CarregarPermissoes(gSistema.Codigo, -1);
end;

procedure TViewPerfil.MontarListaPermissao(const TreeViewPermissao: TTreeView; const iSistema,
  iPerfil: Integer);

var
  dat : TNodeDataPermissao;
  no  : TTreeNode;
  cdsNivel0 : TClientDataSet;

  function CriarNo(const TreeView : TTreeView; No : TTreeNode; iImageIndex, iSelectedIndex : Integer; var Info : TNodeDataPermissao; const sCaption : String) : TTreeNode;
  var
    NoTmp1 : TTreeNode;
    datTmp1: PNodeDataPermissao;
  begin

    if Assigned(No) then
      NoTmp1 := TreeView.Items.AddChild(No, sCaption)
    else
      NoTmp1 := TreeView.Items.Add(nil, sCaption);

    with NoTmp1 do
    begin

      New(datTmp1);

      ImageIndex    := iImageIndex;
      SelectedIndex := iSelectedIndex;

      with Info do
      begin
        datTmp1^.iSistemaID   := iSistemaID;
        datTmp1^.iTipo        := iTipo;
        datTmp1^.sRotinaID    := sRotinaID;
        datTmp1^.sRotinaNome  := sRotinaNome;
        datTmp1^.sRotinaPaiID := sRotinaPaiID;
        datTmp1^.iAutorizado  := iAutorizado;
        datTmp1^.bAcesso      := bAcesso;
      end;

      Data := datTmp1;
    end;
    Result := NoTmp1;
  end; { CriarNo }

  procedure LerSubMenu(const TreeView : TTreeView; No : TTreeNode; sRotinaID : String);
  var
    subMenu : TClientDataSet;
    NoTmp2  : TTreeNode;
    datTmp2 : TNodeDataPermissao;
  begin
    subMenu := TClientDataSet.Create(nil);
    try
      cdsSubMenu.Close;
      cdsSubMenu.ParamByName('sistema').AsInteger := iSistema;
      cdsSubMenu.ParamByName('rotina').AsString   := sRotinaID;
      cdsSubMenu.Open;

      subMenu.CloneCursor(cdsSubMenu, False);

      cdsSubMenu.Close;

      with subMenu do
      begin
        First;

        while not EOF do
        begin

          datTmp2.iSistemaID := iSistema;
          datTmp2.iTipo        := FieldByName('rot_tipo').AsInteger;
          datTmp2.sRotinaID    := FieldByName('rot_cod').AsString;
          datTmp2.sRotinaNome  := FieldByName('rot_descricao').AsString;
          datTmp2.sRotinaPaiID := FieldByName('rot_cod_pai').AsString;
          datTmp2.iAutorizado  := AUTHORIZED_RESTRITO;
          datTmp2.bAcesso      := False;

          NoTmp2 := CriarNo(TreeView, No, AUTHORIZED_RESTRITO, AUTHORIZED_RESTRITO, datTmp2, datTmp2.sRotinaNome);
          LerSubMenu(TreeView, NoTmp2, datTmp2.sRotinaID); // Procedimento recursivo

          Next;
        end;
      end;

    finally
      subMenu.Free;
    end;
  end;  { LerSubMenu }

begin
  TreeMenu.Visible := False;
  WaitAMoment(WAIT_AMOMENT_LoadData);

  cdsNivel0 := TClientDataSet.Create(nil);

  try
    try
      TreeViewPermissao.Items.BeginUpdate;
      TreeViewPermissao.Items.Clear;

      // Listar os menus do sistema
      cdsMenu.Close;
      cdsMenu.ParamByName('sistema').AsInteger := iSistema;
      cdsMenu.Open;

      cdsNivel0.CloneCursor(cdsMenu, False);

      with cdsNivel0 do
      begin
        First;

        while not Eof do
        begin

          dat.iSistemaID   := iSistema;
          dat.iTipo        := FieldByName('rot_tipo').AsInteger;
          dat.sRotinaID    := FieldByName('rot_cod').AsString;
          dat.sRotinaNome  := FieldByName('rot_descricao').AsString;
          dat.sRotinaPaiID := FieldByName('rot_cod_pai').AsString;
          dat.iAutorizado  := AUTHORIZED_RESTRITO;
          dat.bAcesso      := False;

          no := CriarNo(TreeViewPermissao, nil, AUTHORIZED_RESTRITO, AUTHORIZED_RESTRITO, dat, dat.sRotinaNome);
          LerSubMenu(TreeViewPermissao, no, dat.sRotinaID); // Procedimento recursivo

          Next;
        end;
      end;

      TreeViewPermissao.Items.EndUpdate;

      TreeViewPermissao.FullExpand;
      TreeViewPermissao.Selected := TreeViewPermissao.Items[0];
    except
    end;
  finally
    cdsNivel0.Free;
    CarregarPermissao(iSistema, iPerfil);

    WaitAMomentFree;
    TreeMenu.Visible := True;
  end;
end;

procedure TViewPerfil.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
end;

procedure TViewPerfil.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
end;

procedure TViewPerfil.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
end;

procedure TViewPerfil.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if ( pgcGuias.ActivePage = tbsCadastro ) then
    MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
end;

function TViewPerfil.Rotina: IControllerRotina;
begin
  if not Assigned(FControllerRotina) then
  begin
    FControllerRotina := TControllerFactory.New.Rotina;
    FControllerRotina.DAO.ParamsByName('sistema', gSistema.Codigo);

    dspMenu.DataSet := FControllerRotina.Menus;
    cdsMenu.FetchParams;

    dspSubMenu.DataSet := FControllerRotina.SubMenus;
    cdsSubMenu.FetchParams;
  end;

  Result := (FControllerRotina as IControllerRotina);
end;

procedure TViewPerfil.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
  begin
    GravarPermissao(gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
    MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
  end;
end;

procedure TViewPerfil.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  NoSelecionado: PNodeDataPermissao;
begin

  if (Key = VK_SPACE) then
    if TreeMenu.Focused and (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    begin

      NoSelecionado  := TreeMenu.Selected.Data;

      if Trim(NoSelecionado^.sRotinaID) = EmptyStr then
        Exit;

      Case NoSelecionado^.iAutorizado of
        AUTHORIZED_RESTRITO:
          begin
            NoSelecionado^.iAutorizado := AUTHORIZED_HABILITADO;
            NoSelecionado^.bAcesso     := True;
          end;
(*
        AUTHORIZED_HABILITADO:
          begin
            NoSelecionado^.iAutorizado := AUTHORIZED_INVISIVEL;
            NoSelecionado^.bAcesso     := False;
          end;

        AUTHORIZED_INVISIVEL:
          begin
            NoSelecionado^.iAutorizado := AUTHORIZED_RESTRITO;
            NoSelecionado^.bAcesso     := False;
          end;
*)
        AUTHORIZED_HABILITADO:
          begin
            NoSelecionado^.iAutorizado := AUTHORIZED_RESTRITO;
            NoSelecionado^.bAcesso     := False;
          end;
      end;

      TreeMenu.Selected.ImageIndex    := NoSelecionado^.iAutorizado;
      TreeMenu.Selected.SelectedIndex := NoSelecionado^.iAutorizado;
      TreeMenu.Selected.Data := NoSelecionado;

      Key := 0;

      TreeMenu.Refresh;
    end;

  inherited;

end;

procedure TViewPerfil.CarregarPermissao(const iSistema,
  iPerfil: Integer);
var
  I : Integer;
  D : PNodeDataPermissao;
begin
  WaitAMoment(WAIT_AMOMENT_Process);
  try
    cdsPermissao.Close;
    cdsPermissao.ParamByName('sistema').AsInteger := iSistema;
    cdsPermissao.ParamByName('perfil').AsInteger  := iPerfil;
    cdsPermissao.Open;

    for I := 0 to TreeMenu.Items.Count - 1 do
    begin

      D := TreeMenu.Items[I].Data;

      D^.bAcesso     := False;
      D^.iAutorizado := AUTHORIZED_RESTRITO;

      if cdsPermissao.Locate('rotina', D^.sRotinaID, []) then
      begin
        D^.bAcesso := (cdsPermissao.FieldByName('acesso').AsInteger = 1);

        if D^.bAcesso then
          D^.iAutorizado := AUTHORIZED_HABILITADO
        else
          D^.iAutorizado := AUTHORIZED_RESTRITO;
      end;

      TreeMenu.Items[I].ImageIndex    := D^.iAutorizado;
      TreeMenu.Items[I].SelectedIndex := D^.iAutorizado;
      TreeMenu.Items[I].Data          := D;

    end;

    TreeMenu.Selected := TreeMenu.Items[0];
  finally
    WaitAMomentFree;
  end;
end;

function TViewPerfil.Controller: IControllerPerfil;
begin
  Result := (FController as IControllerPerfil);

  if not Assigned(dspPermissao.DataSet) then
    dspPermissao.DataSet := Result.Permissoes;
end;

procedure TViewPerfil.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
end;

procedure TViewPerfil.GravarPermissao(const iSistema,
  iPerfil: Integer);
var
  I : Integer;
  D : PNodeDataPermissao;
begin
  WaitAMoment(WAIT_AMOMENT_Editing);
  try
    for I := 0 to Pred(TreeMenu.Items.Count) do
    begin
      D := TreeMenu.Items[I].Data;

      Controller.GravarPermissao(iSistema, iPerfil, D^.sRotinaID, D^.bAcesso);
    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TViewPerfil.SetPermissaoPopup(Sender: TObject);
var
  NoSelecionado: PNodeDataPermissao;
begin

  NoSelecionado := TreeMenu.Selected.Data;

  if (Trim(NoSelecionado^.sRotinaID) = EmptyStr) or (not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert])) then
    Exit;

  NoSelecionado^.iAutorizado := TMenuItem(Sender).Tag;
  NoSelecionado^.bAcesso     := TMenuItem(Sender).Tag = AUTHORIZED_HABILITADO;

  TreeMenu.Selected.ImageIndex    := NoSelecionado^.iAutorizado;
  TreeMenu.Selected.SelectedIndex := NoSelecionado^.iAutorizado;

  TreeMenu.Selected.Data := NoSelecionado;
end;

procedure TViewPerfil.SetPermissaoPopupTodas(Sender: TObject);
var
  I : Integer;
  D : PNodeDataPermissao;
begin
  if not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  for I := 0 to TreeMenu.Items.Count - 1 do
  begin

    D := TreeMenu.Items[I].Data;

    if (Trim(D^.sRotinaID) = EmptyStr) then
      Continue;

    Case TMenuItem(Sender).Tag of
      0:
        begin
          D^.iAutorizado := AUTHORIZED_RESTRITO;
          D^.bAcesso     := False;
        end;

      1:
        begin
          D^.iAutorizado := AUTHORIZED_HABILITADO;
          D^.bAcesso     := True;
        end;

      2:
        begin
          if D^.iAutorizado = AUTHORIZED_RESTRITO then
            D^.iAutorizado := AUTHORIZED_HABILITADO
          else
          if D^.iAutorizado = AUTHORIZED_HABILITADO then
            D^.iAutorizado := AUTHORIZED_RESTRITO;

          D^.bAcesso := (D^.iAutorizado = AUTHORIZED_HABILITADO);
        end;
    end;

    TreeMenu.Items[I].ImageIndex    := D^.iAutorizado;
    TreeMenu.Items[I].SelectedIndex := D^.iAutorizado;

    TreeMenu.Items[I].Data := D;

  end;

  TreeMenu.Selected := TreeMenu.Items[0];
  TreeMenu.Update;
end;

procedure TViewPerfil.miCopiarPerfilClick(Sender: TObject);
var
  iPerfilIn  ,
  iPerfilOut : Integer;
begin
  if not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  iPerfilIn  := DtSrcTabela.DataSet.FieldByName('COD').AsInteger;
  iPerfilOut := 0;

  if SelecionarPerfil(Self, iPerfilIn, iPerfilOut) then
    CarregarPermissao(gSistema.Codigo, iPerfilOut);
end;

initialization
  FormFunction.RegisterForm('ViewPerfil', TViewPerfil);

end.
