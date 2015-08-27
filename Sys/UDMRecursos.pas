unit UDMRecursos;

interface

uses
  SysUtils, Classes, ImgList, Controls, cxGraphics;

type
  TDMRecursos = class(TDataModule)
    ImgPrincipalEnabled: TcxImageList;
    ImgPrincipalDisabled: TcxImageList;
    ImgPrincipalHot: TcxImageList;
    ImgPrincipal16x16: TcxImageList;
    ImgBotoesEnabled: TcxImageList;
    ImgBotoesDisabled: TcxImageList;
    ImgBotoesHot: TcxImageList;
    ImgBotoes16x16: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRecursos: TDMRecursos;

implementation

{$R *.dfm}

end.
