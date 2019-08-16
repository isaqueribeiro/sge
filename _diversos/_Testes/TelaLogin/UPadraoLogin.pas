unit UPadraoLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmPadraoLogin = class(TForm)
    lblSystemDescription: TLabel;
    shapeMolduraIcone: TShape;
    lblCopyright: TLabel;
    lblVersion: TLabel;
    btnFechar: TSpeedButton;
    lblSystemName: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormFechar(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    aMoldura  ,
    aCirculoA ,
    aCirculoB ,
    aCirculoC ,
    aLinhaA   : TShape;
    aCirculoSolido,
    aTamanhoPadrao,
    aCriarMoldura : Boolean;
    procedure DesenharFormas;
    procedure DefinirLabels;
  public
    { Public declarations }
    property CirculoSolido : Boolean read aCirculoSolido write aCirculoSolido;
    property TamanhoPadrao : Boolean read aTamanhoPadrao write aTamanhoPadrao;
    property CriarMoldura  : Boolean read aCriarMoldura write aCriarMoldura;
  end;

var
  FrmPadraoLogin: TFrmPadraoLogin;

implementation

{$R *.dfm}

procedure TFrmPadraoLogin.DefinirLabels;
begin
  lblVersion.Transparent   := False;
  lblCopyright.Transparent := False;

  if Assigned(aMoldura) then
  begin
    lblVersion.Left   := aMoldura.Left;
    lblCopyright.Left := aMoldura.Left;
  end
  else
  begin
    lblVersion.Left   := 33;
    lblCopyright.Left := 33;
  end;

  lblVersion.Transparent   := True;
  lblCopyright.Transparent := True;

  lblVersion.BringToFront;
  lblCopyright.BringToFront;
end;

procedure TFrmPadraoLogin.DesenharFormas;
var
  I    ,
  aLoop,
  aStep,
  aLeft,
  aTop : Integer;
begin
  // Desenhado Grupo A de Círculos
  aCirculoA := TShape.Create(Self);
  aCirculoA.Name   := 'aCirculoA';
  aCirculoA.Shape  := TShapeType.stCircle;
  aCirculoA.Parent := Self;

  with aCirculoA do
  begin
    Left   := 0;
    Top    := 0;
    Width  := 1;
    Height := 1;
    Brush.Style := TBrushStyle.bsClear;
    Pen.Color   := $009DDB85;

    if aCirculoSolido then
    begin
      Brush.Style := TBrushStyle.bsSolid;
      Brush.Color := Pen.Color;
    end;
  end;

  aLeft := aCirculoA.Left;
  aTop  := aCirculoA.Top;
  aLoop := Round(Self.Height * 19 / 100);

  for I := 1 to aLoop do
  begin
    with TShape.Create(Self) do
    begin
      Name  := aCirculoA.Name + 'a_' + IntToStr(I);
      Shape := aCirculoA.Shape;
      Brush := aCirculoA.Brush;
      Pen   := aCirculoA.Pen;

      Left   := aLeft;
      Top    := aTop;
      Height := aCirculoA.Height + (I * 2);
      Width  := aCirculoA.Width  + (I * 2);
      Parent := Self;
      SendToBack;

      if (I mod 2) = 0 then
        Dec(aLeft);

      if (I mod 2) = 0 then
        Dec(aTop);
    end;
  end;

  // Desenhado Grupo B de Círculos
  aCirculoB := TShape.Create(Self);
  aCirculoB.Name   := 'aCirculoB';
  aCirculoB.Shape  := TShapeType.stCircle;
  aCirculoB.Parent := Self;
  I := Round(Self.Height * 80 / 100);

  with aCirculoB do
  begin
    Width  := I;
    Height := I;
    Left   := Round(Width / 2) * -1;
    Top    := Self.Height - Round(Height / 2);
    Brush.Style := TBrushStyle.bsClear;
    Pen.Color   := $004FC143;

    if aCirculoSolido then
    begin
      Brush.Style := TBrushStyle.bsSolid;
      Brush.Color := Pen.Color;
    end;
  end;

  aLeft := aCirculoB.Left;
  aTop  := aCirculoB.Top;
  aLoop := Round(Self.Height * 27 / 100);

  for I := 1 to aLoop do
  begin
    with TShape.Create(Self) do
    begin
      Name  := aCirculoB.Name + 'b_' + IntToStr(I);
      Shape := aCirculoB.Shape;
      Brush := aCirculoB.Brush;
      Pen   := aCirculoB.Pen;

      Left   := aLeft;
      Top    := aTop;
      Height := aCirculoB.Height - (I * 2);
      Width  := aCirculoB.Width  - (I * 2);
      Parent := Self;
      SendToBack;

      if (I mod 2) = 0 then
        Inc(aLeft);

      Inc(aTop, 1);
    end;
  end;

  // Desenhado Grupo C de Círculos
  aCirculoC := TShape.Create(Self);
  aCirculoC.Name   := 'aCirculoC';
  aCirculoC.Shape  := TShapeType.stCircle;
  aCirculoC.Parent := Self;

  with aCirculoC do
  begin
    Width  := 1;
    Height := 1;
    Left   := Self.Width - 122;
    Top    := Round(Self.Height / 2);
    Brush.Style := TBrushStyle.bsClear;
    Pen.Color   := $000E4C28;

    if aCirculoSolido then
    begin
      Brush.Style := TBrushStyle.bsSolid;
      Brush.Color := Pen.Color;
    end;
  end;

  aLeft := aCirculoC.Left;
  aTop  := aCirculoC.Top;
  aLoop := Round(Self.Height * 55 / 100);

  for I := 1 to aLoop do
  begin
    with TShape.Create(Self) do
    begin
      Name  := aCirculoC.Name + 'c_' + IntToStr(I);
      Shape := aCirculoC.Shape;
      Brush := aCirculoC.Brush;
      Pen   := aCirculoC.Pen;

      Left   := aLeft;
      Top    := aTop;
      Height := aCirculoC.Height + (I * 2);
      Width  := aCirculoC.Width  + (I * 2);
      Parent := Self;
      SendToBack;

      if (I mod 2) = 0 then
        Dec(aLeft);

      Dec(aTop);
    end;
  end;

  // Desenhado Grupo A de Linhas
  aLinhaA := TShape.Create(Self);
  aLinhaA.Name   := 'aLinhaA';
  aLinhaA.Shape  := TShapeType.stRoundRect;
  aLinhaA.Parent := Self;

  with aLinhaA do
  begin
    Left   := 0;
    Top    := Round(Self.Height * 50 / 100.0);
    Height := 1;
    Width  := Self.Width - Left;
    Brush.Style := TBrushStyle.bsClear;
    Pen.Color   := $000E4C28;
  end;

  aTop  := aLinhaA.Top;
  aLoop := Round(Self.Height * 8 / 100);
  aStep := Round(aLoop / 3);

  for I := 1 to aLoop do
  begin
    with TShape.Create(Self) do
    begin
      Name  := aLinhaA.Name + 'a_' + IntToStr(I);
      Shape := aLinhaA.Shape;
      Brush := aLinhaA.Brush;
      Pen   := aLinhaA.Pen;

      Left   := aLinhaA.Left;
      Top    := aTop;
      Height := 1;
      Width  := aLinhaA.Width;
      Parent := Self;
      SendToBack;

      if (I < aStep) then
        Dec(aTop)
      else
      if (I < (aStep * 2)) then
        Dec(aTop, 2)
      else
        Dec(aTop, 3);
    end;
  end;

  // Desenhado Grupo B de Linhas

  aTop  := aLinhaA.Top;
  aLoop := Round(Self.Height * 11.5 / 100);
  aStep := Round(aLoop / 3);

  for I := 1 to aLoop do
  begin
    with TShape.Create(Self) do
    begin
      Name  := aLinhaA.Name + 'b_' + IntToStr(I);
      Shape := aLinhaA.Shape;
      Brush := aLinhaA.Brush;
      Pen   := aLinhaA.Pen;

      Left   := aLinhaA.Left;
      Top    := aTop;
      Height := 1;
      Width  := aLinhaA.Width;
      Parent := Self;
      SendToBack;

      if (I < aStep) then
        Inc(aTop, 2)
      else
      if (I < (aStep * 2)) then
        Inc(aTop, 3)
      else
        Inc(aTop, 4);
    end;
  end;

  // Desenhar moldura

  if aCriarMoldura then
  begin
    aMoldura := TShape.Create(Self);
    aMoldura.Name   := 'aMoldura';
    aMoldura.Shape  := TShapeType.stRectangle;
    aMoldura.Parent := Self;
    aMoldura.BringToFront;

    with aMoldura do
    begin
      Left   := 33;
      Top    := 33;
      Width  := 157;
      Height := 182;
      Brush.Style := TBrushStyle.bsClear;
      Pen.Color   := $000E4C28;
      Pen.Width   := 5;
    end;
  end;
end;

procedure TFrmPadraoLogin.FormCreate(Sender: TObject);
begin
  if TamanhoPadrao then
  begin
    Self.Height := 377;
    Self.Width  := 610;
  end;

  DesenharFormas;
  DefinirLabels;
end;

procedure TFrmPadraoLogin.FormFechar(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmPadraoLogin.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    btnFechar.Click;
end;

end.
