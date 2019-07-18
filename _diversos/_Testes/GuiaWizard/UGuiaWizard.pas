unit UGuiaWizard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TShapeDinamico = class(TShape)
    public
      constructor Create(AOwner: TComponent; aLeft, aTop, aTag : Integer); overload; // override;
  end;

  TLabelDinamico = class(TLabel)
    public
      constructor Create(AOwner: TComponent; aLeft, aTop, aTag : Integer; aEvento : TNotifyEvent); overload; // override;
  end;

  TForm1 = class(TForm)
    Panel1: TPanel;
    shpLinha: TShape;
    shpGuia1: TShape;
    lblGuia1: TLabel;
    shpGuia2: TShape;
    lblGuia2: TLabel;
    shpGuia3: TShape;
    lblGuia3: TLabel;
    shpGuia4: TShape;
    lblGuia4: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Label2: TLabel;
    procedure SelecionarGuia(Sender: TObject);
    procedure SelecionarGuiaDinamica(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    aQuandidadeLinks : Integer;
    procedure DestacarLink(const aIndex : Integer);
    procedure DestacarLinkDinamico(const aIndex : Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  linha : TShape;
  S : TShapeDinamico;
  L : TLabelDinamico;
  I ,
  X : Integer;

  aEspesumaLinha,
  aMargemTop    ,
  aMargemLeft   ,
  aHeight       : Integer;
begin
  X := 0;

  aMargemTop     := 18;
  aEspesumaLinha := 2;

  for I := 1 to aQuandidadeLinks do
  begin
    S := TShapeDinamico.Create(Self, 40, (aMargemTop * I) + X, I);
    L := TLabelDinamico.Create(Self, 60, (aMargemTop * I) + X, I, SelecionarGuiaDinamica);
    aHeight := ((aMargemTop * I) + X);
    X := ((aMargemTop - 2) * I);

    // Início
    if (I = 1) then
    begin
      S.Enabled := False;
      S.Left    := aMargemTop;
      S.Shape   := TShapeType.stSquare;
      S.Brush.Color := clYellow;
      L.Enabled := False;
      L.Caption := 'I n í c i o';
      L.Font.Style := [fsBold];
      L.OnClick    := nil;

      linha        := TShape.Create(Self);
      linha.Left   := (S.Left + Round(S.Width  / 2)) - 1;
      linha.Top    := (S.Top  + Round(S.Height / 2)) - 1;
      linha.Height := aEspesumaLinha;
      linha.Width  := S.Width + Round(S.Width  / 2) + linha.Height;
      linha.Brush.Color := clWhite;
      linha.Pen.Style   := TPenStyle.psClear;
      linha.Parent      := Panel2;
      linha.SendToBack;
    end
    else
    // Final
    if (I = aQuandidadeLinks) then
    begin
      S.Enabled := False;
      S.Left    := aMargemTop;
      S.Shape   := TShapeType.stSquare;
      S.Brush.Color := clYellow;
      L.Enabled := False;
      L.Caption := 'F i n a l';
      L.Font.Style := [fsBold];
      L.OnClick    := nil;

      linha        := TShape.Create(Self);
      linha.Left   := (S.Left + Round(S.Width  / 2)) - 1;
      linha.Top    := (S.Top  + Round(S.Height / 2)) - 1;
      linha.Height := aEspesumaLinha;
      linha.Width  := S.Width + Round(S.Width  / 2) + linha.Height;
      linha.Brush.Color := clWhite;
      linha.Pen.Style   := TPenStyle.psClear;
      linha.Parent      := Panel2;
      linha.SendToBack;
    end
    else
      aMargemLeft := S.Left;

    S.Parent := Panel2;
    L.Parent := Panel2;
  end;

  linha        := TShape.Create(Self);
  linha.Left   := (aMargemLeft + Round(S.Width  / 2)) - 1;
  linha.Top    := (aMargemTop  + Round(S.Height / 2)) - 1;
  linha.Width  := aEspesumaLinha;
  linha.Height := aHeight - S.Height - linha.Width;
  linha.Brush.Color := clWhite;
  linha.Pen.Style   := TPenStyle.psClear;
  linha.Parent      := Panel2;
  linha.SendToBack;
end;

procedure TForm1.DestacarLink(const aIndex: Integer);
var
  I : Integer;
  s ,
  l : TComponent;
begin
  // Remover destaque de todos
  for I := 1 to 4 do
  begin
    s := Self.FindComponent('shpGuia' + IntToStr(I));
    if s <> nil then
      TShape(s).Brush.Color := clWhite;

    l := Self.FindComponent('lblGuia' + IntToStr(I));
    if l <> nil then
      TLabel(l).Font.Style := [];
  end;

  // Destacar
  s := Self.FindComponent('shpGuia' + IntToStr(aIndex));
  if s <> nil then
    TShape(s).Brush.Color := clRed;

  l := Self.FindComponent('lblGuia' + IntToStr(aIndex));
  if l <> nil then
    TLabel(l).Font.Style := [fsBold];
end;

procedure TForm1.DestacarLinkDinamico(const aIndex: Integer);
var
  I : Integer;
  s ,
  l : TComponent;
begin
  // Remover destaque de todos
  for I := 1 to aQuandidadeLinks do
  begin
    s := Self.FindComponent('ShapeDinamico' + IntToStr(I));
    if s <> nil then
      if TShape(s).Enabled then
        TShape(s).Brush.Color := clWhite;

    l := Self.FindComponent('labelDinamico' + IntToStr(I));
    if l <> nil then
      if TLabel(s).Enabled then
        TLabel(l).Font.Style := [];
  end;

  // Destacar
  s := Self.FindComponent('ShapeDinamico' + IntToStr(aIndex));
  if s <> nil then
    TShape(s).Brush.Color := clRed;

  l := Self.FindComponent('labelDinamico' + IntToStr(aIndex));
  if l <> nil then
    TLabel(l).Font.Style := [fsBold];
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DestacarLink(1);
  aQuandidadeLinks := 14;
end;

procedure TForm1.SelecionarGuia(Sender: TObject);
var
  aTag : Integer;
begin
  if Sender is TShape then
    aTag := TShape(Sender).Tag
  else
  if Sender is TLabel then
    aTag := TLabel(Sender).Tag
  else
    aTag := 0;

  DestacarLink(aTag);
end;

procedure TForm1.SelecionarGuiaDinamica(Sender: TObject);
var
  aTag : Integer;
begin
  if Sender is TShape then
    aTag := TShape(Sender).Tag
  else
  if Sender is TLabel then
    aTag := TLabel(Sender).Tag
  else
    aTag := 0;

  DestacarLinkDinamico(aTag);
end;

{ TShapeDinamico }

constructor TShapeDinamico.Create(AOwner: TComponent; aLeft, aTop, aTag : Integer);
begin
  inherited Create(AOwner);
  Shape := TShapeType.stRoundSquare;

  Name        := 'ShapeDinamico' + IntToStr(aTag);
  Brush.Color := clWhite;
  Pen.Style   := TPenStyle.psClear;

  Width  := 14;
  Height := 14;

  Left := aLeft;
  Top  := aTop;
  Tag  := aTag;
end;

{ TLabelDinamico }

constructor TLabelDinamico.Create(AOwner: TComponent; aLeft, aTop, aTag: Integer; aEvento : TNotifyEvent);
begin
  inherited Create(AOwner);
  Name       := 'labelDinamico' + IntToStr(aTag);
  Caption    := 'Teste ' + IntToStr(aTag);
  Cursor     := crHandPoint;
  AutoSize   := False;
  Font.Name  := 'Tahoma';
  Font.Size  := 8;
  Font.Color := clWhite;

  Width  := 150;
  Height := 14;

  Left := aLeft;
  Top  := aTop;
  Tag  := aTag;

  OnClick := aEvento;
end;

end.
