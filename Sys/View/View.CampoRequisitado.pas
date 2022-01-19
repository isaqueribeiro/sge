unit View.CampoRequisitado;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Graphics,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,

  Data.DB,
  Datasnap.DBClient,

  UGrPadrao;

type
  TViewCampoRequisitado = class(TfrmGrPadrao)
    pnlBanner: TPanel;
    imgBanner: TImage;
    Label1: TLabel;
    Bevel1: TBevel;
    pnlDescricao: TPanel;
    Bevel2: TBevel;
    dtsRequisitado: TDataSource;
    cdsRequisitado: TClientDataSet;
    dbgRequisitado: TDBGrid;
    cdsRequisitadoID: TSmallintField;
    cdsRequisitadoImage: TSmallintField;
    cdsRequisitadoDescription: TStringField;
    Bevel3: TBevel;
    procedure cdsRequisitadoIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dbgRequisitadoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function CamposRequiridos(const AOwer : TComponent; const Tabela : TClientDataSet; const TabelaNome : String) : Boolean;

implementation

{$R *.dfm}

function CamposRequiridos(const AOwer : TComponent; const Tabela : TClientDataSet; const TabelaNome : String) : Boolean;
var
  I ,
  X : Integer;
  AForm : TViewCampoRequisitado;
begin
  AForm := TViewCampoRequisitado.Create(Aower);
  try
    with AForm, cdsRequisitado do
    begin
      AForm.pnlDescricao.Caption := Trim(TabelaNome);

      X := 1;
      CreateDataSet;
      for I := 0 to Tabela.Fields.Count - 1 do
        if ( Tabela.Fields[I].Required ) then
          if ( Tabela.Fields[I].IsNull ) then
          begin
            Append;
            cdsRequisitadoID.Value    := X;
            cdsRequisitadoImage.Value := 1;
            cdsRequisitadoDescription.Value := ' * ' + Trim(Tabela.Fields[I].DisplayName);
            Post;

            Inc(X);
          end;

       Result := (RecordCount > 0);

       if ( Result ) then
         ShowModal;
    end;
  finally
    AForm.DisposeOf;
  end;
end;

procedure TViewCampoRequisitado.cdsRequisitadoIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FormatFloat('00"."',  Sender.AsInteger);
end;

procedure TViewCampoRequisitado.dbgRequisitadoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  ShowScrollBar(TDBGrid(Sender).Handle, SB_VERT, False);

  TDbGrid(Sender).Canvas.font.Color := clRed;

  if odd(cdsRequisitado.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color:= clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color:= clCream;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TViewCampoRequisitado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key = #27 ) then
    Self.Close;
end;

procedure TViewCampoRequisitado.RegistrarRotinaSistema;
begin
  ;
end;

end.
