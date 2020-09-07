unit UGrRegistroEstacao;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  System.ImageList, Dialogs, StdCtrls, Buttons, ExtCtrls, ToolWin, ComCtrls,
  Grids, DBGrids, ImgList, DB, IBCustomDataSet, IBUpdateSQL, cxGraphics, cxLabel,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons, cxControls, cxContainer, cxEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TFrmGrRegistroEstacao = class(TfrmGrPadrao)
    Bevel3: TBevel;
    Bevel1: TBevel;
    pgcGuia: TPageControl;
    TbsLista: TTabSheet;
    ImgList: TImageList;
    dbgRegistro: TDBGrid;
    dtsRegistro: TDataSource;
    tlbBotoes: TPanel;
    Bevel2: TBevel;
    btbtnIncluir: TcxButton;
    btbtnExcluir: TcxButton;
    Bevel4: TBevel;
    Bevel5: TBevel;
    lblHostName: TcxLabel;
    cdsRegistro: TFDQuery;
    updRegistro: TFDUpdateSQL;
    cdsRegistroEST_LOCAL: TStringField;
    cdsRegistroEST_NOME: TStringField;
    cdsRegistroEST_IP: TStringField;
    cdsRegistroEST_REGISTRO: TStringField;
    cdsRegistroEST_ULTIMO_ACESSO: TSQLTimeStampField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure cdsRegistroXSEQGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dtsRegistroStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure dbgRegistroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  FrmGrRegistroEstacao: TFrmGrRegistroEstacao;

implementation

uses
  UDMBusiness, UConstantesDGE, UGrUsuario, IdIPWatch, UFuncoes, Classe.InputQuery;

{$R *.dfm}

procedure TFrmGrRegistroEstacao.FormCreate(Sender: TObject);
begin
  inherited;
  pgcGuia.ActivePage  := TbsLista;
  lblHostName.Caption := Trim(GetHostNameLocal);
end;

procedure TFrmGrRegistroEstacao.RegistrarRotinaSistema;
begin
  ;
end;

procedure TFrmGrRegistroEstacao.FormShow(Sender: TObject);
begin
  inherited;
  cdsRegistro.Open;
end;

procedure TFrmGrRegistroEstacao.btbtnIncluirClick(Sender: TObject);
var
  sLocal : String;
begin
  if not btbtnIncluir.Enabled then
    Exit;

  if not cdsRegistro.Active then
    cdsRegistro.Open;

  if cdsRegistro.Locate('EST_NOME', lblHostName.Caption, []) then
  begin
    sLocal := Trim(cdsRegistroEST_LOCAL.AsString);
    cdsRegistro.Edit;
  end
  else
  begin
    sLocal := EmptyStr;
    cdsRegistro.Append;
  end;

  if TServiceInputQuery.InputQuery(Self, 'Local', 'Favor informar o Local da Estação de Trabalho:', sLocal) then
  begin
    cdsRegistroEST_LOCAL.AsString    := Trim(sLocal);
    cdsRegistroEST_NOME.AsString     := lblHostName.Caption;
    cdsRegistroEST_IP.AsString       := DMBusiness.IdIPWatch.LocalIP;
    cdsRegistroEST_REGISTRO.AsString := EncriptSenha(gUsuarioLogado.Login + DateTimeToStr(Now), USER_PASSWD_KEY);
    cdsRegistroEST_ULTIMO_ACESSO.AsDateTime := Now;

    cdsRegistro.Post;
    cdsRegistro.ApplyUpdates;
    CommitTransaction;

    ShowInformation('Estação de trabalho registrada com sucesso.');
    dbgRegistro.SetFocus;
  end
  else
    cdsRegistro.Cancel;
end;

procedure TFrmGrRegistroEstacao.cdsRegistroXSEQGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := IntToStr(cdsRegistro.RecNo);  
end;

procedure TFrmGrRegistroEstacao.dtsRegistroStateChange(Sender: TObject);
begin
  btbtnIncluir.Enabled := (gUsuarioLogado.Funcao = FUNCTION_USER_ID_SYSTEM_ADM) and (cdsRegistro.State = dsBrowse);
  btbtnExcluir.Enabled := (gUsuarioLogado.Funcao = FUNCTION_USER_ID_SYSTEM_ADM) and (cdsRegistro.State = dsBrowse) and (cdsRegistro.RecordCount > 0);
end;

procedure TFrmGrRegistroEstacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_ESCAPE ) then
    Self.Close;
end;

procedure TFrmGrRegistroEstacao.btbtnExcluirClick(Sender: TObject);
begin
  if not btbtnExcluir.Enabled then
    Exit;
    
  if ShowConfirmation('Registro', 'Deseja excluir da base do sistema este registro da estação de trabalho?') then
  begin
    cdsRegistro.Delete;
    cdsRegistro.ApplyUpdates;
    CommitTransaction;
  end;
end;

procedure TFrmGrRegistroEstacao.dbgRegistroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(TDbGrid(Sender).DataSource.DataSet.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color:= clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color:= clCream;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

initialization
  FormFunction.RegisterForm('FrmGrRegistroEstacao', TFrmGrRegistroEstacao);

end.
