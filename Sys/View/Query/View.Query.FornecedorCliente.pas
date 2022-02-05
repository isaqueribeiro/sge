unit View.Query.FornecedorCliente;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  Data.DB,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  cxButtons,

  View.PadraoPesquisa,
  Model.Constantes;

type
  TFornecedorCliente = record
    TipoEmissor : TTipoEmissorCheque;
    Codigo : Integer;
    Nome   ,
    Cnpj   : String
  end;

  TViewQueryFornecedorCliente = class(TViewPadraoPesquisa)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function SelecionarFornecedorCliente(const AOnwer : TComponent; var aRetorno : TFornecedorCliente) : Boolean;

implementation

{$R *.dfm}

uses
  SGE.Controller.Query.Factory;

function SelecionarFornecedorCliente(const AOnwer : TComponent; var aRetorno : TFornecedorCliente) : Boolean;
var
  AForm : TViewQueryFornecedorCliente;
begin
  Result := False;
  AForm  := TViewQueryFornecedorCliente.Create(AOnwer);
  try
    Result := (AForm.ShowModal = mrOk);

    if Result then
      with AForm, COntroller do
      begin
        aRetorno.TipoEmissor := TTipoEmissorCheque(DataSet.FieldByName('tipo').AsInteger);
        aRetorno.Codigo      := DataSet.FieldByName('codigo').AsInteger;
        aRetorno.Nome        := DataSet.FieldByName('nome').AsString;
        aRetorno.Cnpj        := DataSet.FieldByName('cnpj').AsString;
      end;
  finally
    AForm.DisposeOf;
  end;
end;

procedure TViewQueryFornecedorCliente.FormCreate(Sender: TObject);
begin
  FController := TControllerQueryFactory.Instance.FornecedorCliente.DataSource(dtsPesquisa);
  inherited;

  CampoAtivo := 'ativo';

  Tabela
    .Display('id', 'Id', '###0000000', TAlignment.taCenter)
    .Display('tipo', 'Tipo', TAlignment.taLeftJustify)
    .Display('nome', 'Fornecedor / Cliente')
    .Display('cnpj', 'CPF / CNPJ')
    .Display(CampoAtivo, 'Ativo', TAlignment.taCenter);
end;

end.
