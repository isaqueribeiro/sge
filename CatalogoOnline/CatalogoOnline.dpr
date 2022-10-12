program CatalogoOnline;

uses
  Vcl.Forms,
  SGE.View.Produto.CatalogoOnline in 'src\View\SGE.View.Produto.CatalogoOnline.pas' {ViewProdutoCatalogoOnline};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewProdutoCatalogoOnline, ViewProdutoCatalogoOnline);
  Application.Run;
end.
