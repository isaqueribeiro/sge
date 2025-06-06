unit View.Usuario.Perfil;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, Mask, DBCtrls, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, Menus, DBClient, Provider,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, System.ImageList, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinsDefaultPainters;

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

  TViewUsuarioPerfil = class(TfrmGrPadraoCadastro)
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
    fdQryTabelaCOD: TSmallintField;
    fdQryTabelaFUNCAO: TStringField;
    stpFuncaoPermissao: TFDStoredProc;
    qryMenu: TFDQuery;
    qrySubMenu: TFDQuery;
    qryPermissao: TFDQuery;
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
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure MontarListaPermissao(const TreeViewPermissao: TTreeView; const iSistema : Integer; const iPerfil : Integer);
    procedure CarregarPermissao(const iSistema : Integer; const iPerfil : Integer);
    procedure GravarPermissao(const iSistema : Integer; const iPerfil : Integer);
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

var
  ViewUsuarioPerfil: TViewUsuarioPerfil;

implementation

uses
  UDMBusiness, UConstantesDGE, UGrUsuarioCopiarPerfil, UDMRecursos;

{$R *.dfm}

const
  AUTHORIZED_RESTRITO   = 41;
  AUTHORIZED_HABILITADO = 42;
  AUTHORIZED_INVISIVEL  = 22;

procedure TViewUsuarioPerfil.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID            := ROTINA_CAD_PERFIL_ID;
  ControlFirstEdit    := dbDescricao;
  DisplayFormatCodigo := '##00';

  NomeTabela     := 'TBFUNCAO';
  CampoCodigo    := 'COD';
  CampoDescricao := 'FUNCAO';
  CampoOrdenacao := 'f.COD';

  if (GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM) then
    WhereAdditional := '(f.cod <> ' + IntToStr(FUNCTION_USER_ID_SYSTEM_ADM) + ')';

  miRestrito.Tag   := AUTHORIZED_RESTRITO;
  miDisponivel.Tag := AUTHORIZED_HABILITADO;
  miInvisivel.Tag  := AUTHORIZED_INVISIVEL;
end;

procedure TViewUsuarioPerfil.MontarListaPermissao(const TreeViewPermissao: TTreeView; const iSistema,
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

      with cdsSubMenu, Params do
      begin
        Close;
        ParamByName('sistema').AsInteger := iSistema;
        ParamByName('rotina').AsString   := sRotinaID;
        Open;

        subMenu.CloneCursor(cdsSubMenu, False);

        Close;
      end;

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

      with cdsMenu, Params do
      begin
        Close;
        ParamByName('sistema').AsInteger := iSistema;
        Open;

        cdsNivel0.CloneCursor(cdsMenu, False);
      end;

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

procedure TViewUsuarioPerfil.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
end;

procedure TViewUsuarioPerfil.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
end;

procedure TViewUsuarioPerfil.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
end;

procedure TViewUsuarioPerfil.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if ( pgcGuias.ActivePage = tbsCadastro ) then
    MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
end;

procedure TViewUsuarioPerfil.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    GravarPermissao(gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
    MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
  end;
end;

procedure TViewUsuarioPerfil.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TViewUsuarioPerfil.CarregarPermissao(const iSistema,
  iPerfil: Integer);
var
  I : Integer;
  D : PNodeDataPermissao;
begin
  WaitAMoment(WAIT_AMOMENT_Process);
  try
    with cdsPermissao, Params do
    begin

      Close;
      ParamByName('sistema').AsInteger := iSistema;
      ParamByName('perfil').AsInteger  := iPerfil;
      Open;

      for I := 0 to TreeMenu.Items.Count - 1 do
      begin

        D := TreeMenu.Items[I].Data;

        D^.bAcesso     := False;
        D^.iAutorizado := AUTHORIZED_RESTRITO;

        if Locate('rotina', D^.sRotinaID, []) then
        begin
          D^.bAcesso := (FieldByName('acesso').AsInteger = 1);

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

    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TViewUsuarioPerfil.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  MontarListaPermissao(TreeMenu, gSistema.Codigo, DtSrcTabela.DataSet.FieldByName('COD').AsInteger);
end;

procedure TViewUsuarioPerfil.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DtSrcTabela.DataSet.FieldByName('COD').Value := GetNextID(NomeTabela, CampoCodigo);
end;

procedure TViewUsuarioPerfil.GravarPermissao(const iSistema,
  iPerfil: Integer);
var
  I : Integer;
  D : PNodeDataPermissao;
begin
  WaitAMoment(WAIT_AMOMENT_Editing);
  try
    with stpFuncaoPermissao do
    begin

      for I := 0 to TreeMenu.Items.Count - 1 do
      begin

        D := TreeMenu.Items[I].Data;

        Close;

        ParamByName('sis_codigo').AsSmallInt := iSistema;
        ParamByName('fun_codigo').AsSmallInt := iPerfil;
        ParamByName('rot_codigo').AsString   := D^.sRotinaID;

        if D^.bAcesso then
          ParamByName('acesso').AsSmallInt := 1
        else
          ParamByName('acesso').AsSmallInt := 0;

        ExecProc;
      end;
      CommitTransaction;

    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TViewUsuarioPerfil.SetPermissaoPopup(Sender: TObject);
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

procedure TViewUsuarioPerfil.SetPermissaoPopupTodas(Sender: TObject);
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

procedure TViewUsuarioPerfil.miCopiarPerfilClick(Sender: TObject);
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
  FormFunction.RegisterForm('ViewUsuarioPerfil', TViewUsuarioPerfil);

end.
