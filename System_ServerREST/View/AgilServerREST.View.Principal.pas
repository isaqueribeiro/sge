unit AgilServerREST.View.Principal;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects,

  uDWAbout,
  uRESTDWServerEvents,
  uRESTDWBase,
  ServerUtils;

type
  TViewPrincipal = class(TForm)
    lytToolBar: TLayout;
    recToolBar: TRectangle;
    swtAtivar: TSwitch;
    lblAtivar: TLabel;
    lytStatusBar: TLayout;
    Rectangle2: TRectangle;
    Layout: TLayout;
    LayoutSideBar: TLayout;
    LayoutContent: TLayout;
    recSideBar: TRectangle;
    imgConfiguracoes: TImage;
    imgHome: TImage;
    imgUsuarios: TImage;
    imgEmpresas: TImage;
    Layout1: TLayout;
    ImgLogo: TImage;
    recLogo: TRectangle;
    Layout2: TLayout;
    lblSystemName: TLabel;
    Label2: TLabel;
    RESTServicePooler: TRESTServicePooler;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure swtAtivarSwitch(Sender: TObject);
    procedure imgConfiguracoesClick(Sender: TObject);
  private
    { Private declarations }
    procedure InicializarComponentes;
    procedure AtivarServico(const ActiveService : Boolean);
  public
    { Public declarations }
  end;

var
  ViewPrincipal : TViewPrincipal;

implementation

uses
  SGE.Assets.Style,
  AgilServerREST.Controller.Factory,
  AgilServerREST.DataModule.RDWService;

{$R *.fmx}

procedure TViewPrincipal.AtivarServico(const ActiveService : Boolean);
begin
  try
    try
      if ActiveService and (not RESTServicePooler.Active) then
      begin
        _ControllerFactory.Configuracao.Load;

        // Configurar serviço
        RESTServicePooler.ServicePort := _ControllerFactory.Configuracao.Entity.API.porta;

        TRDWAuthOptionBasic(RESTServicePooler.AuthenticationOptions.OptionParams).Username :=
          _ControllerFactory.Configuracao.Entity.API.usuario;
        TRDWAuthOptionBasic(RESTServicePooler.AuthenticationOptions.OptionParams).Password :=
          _ControllerFactory.Configuracao.Entity.API.senha;

        RESTServicePooler.CriptOptions.Key := _ControllerFactory.Configuracao.Entity.API.chave;
        RESTServicePooler.CriptOptions.Use := not (_ControllerFactory.Configuracao.Entity.API.chave = EmptyStr);

        // Ativar serviço
        RESTServicePooler.Active := True;
      end
      else
        RESTServicePooler.Active := False;
    except
      On E : Exception do
        ;
    end;
  finally

  end;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  Self.Left   := Screen.Width - Self.Width + 10;
  Self.Top    := 0;
  Self.Height := Screen.Height - 34;
  Label1.Text := System.SysUtils.GetCurrentDir;

  InicializarComponentes;
end;

procedure TViewPrincipal.imgConfiguracoesClick(Sender: TObject);
begin
  if RESTServicePooler.Active then
    ShowMessage('O serviço está ative e não pode ser reconfigurado!')
  else
    ;
end;

procedure TViewPrincipal.InicializarComponentes;
begin
  recToolBar.Fill.Color := BACKGROUND_COLOR_DARK;
  recSideBar.Fill.Color := BACKGROUND_COLOR_PRIMARY;
  recLogo.Fill.Color    := BACKGROUND_COLOR_PRIMARY;

  RESTServicePooler.ServerMethodClass := TRDWService;
end;

procedure TViewPrincipal.swtAtivarSwitch(Sender: TObject);
begin
  AtivarServico(swtAtivar.IsChecked);

  if swtAtivar.IsChecked then
    lblAtivar.Text := 'ATIVO'
  else
    lblAtivar.Text := 'DESATIVADO';
end;

end.
