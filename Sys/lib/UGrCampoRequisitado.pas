unit UGrCampoRequisitado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, StdCtrls, Buttons, DB, DBClient, Grids,
  DBGrids, IBCustomDataSet;

type
  TfrmCampoRequisitado = class(TfrmGrPadrao)
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

var
  frmCampoRequisitado: TfrmCampoRequisitado;

  function CamposRequiridos(const AOwer : TComponent; const Tabela : TClientDataSet; const TabelaNome : String) : Boolean; overload;
  function CamposRequiridos(const AOwer : TComponent; const Tabela : TIBDataSet; const TabelaNome : String) : Boolean; overload;

implementation

{$R *.dfm}

function CamposRequiridos(const AOwer : TComponent; const Tabela : TClientDataSet; const TabelaNome : String) : Boolean;
var
  I : Integer;
  frm : TfrmCampoRequisitado;
begin
  frm := TfrmCampoRequisitado.Create(Aower);
  try

    with frm, cdsRequisitado do
    begin
      frm.pnlDescricao.Caption := Trim(TabelaNome);

      CreateDataSet;
      for I := 0 to Tabela.Fields.Count - 1 do
        if ( Tabela.Fields[I].Required ) then
          if ( Tabela.Fields[I].IsNull ) then
          begin
            Append;
            cdsRequisitadoID.Value    := RecordCount + 1;
            cdsRequisitadoImage.Value := 1;
            cdsRequisitadoDescription.Value := ' * ' + Trim(Tabela.Fields[I].DisplayName);
            Post;
          end;
       Result := (RecordCount > 0);

       if ( Result ) then
         ShowModal;
    end;

  finally
    frm.Free;
  end;
end;

function CamposRequiridos(const AOwer : TComponent; const Tabela : TIBDataSet; const TabelaNome : String) : Boolean;
var
  I : Integer;
  frm : TfrmCampoRequisitado;
begin
  frm := TfrmCampoRequisitado.Create(Aower);
  try

    with frm, cdsRequisitado do
    begin
      frm.pnlDescricao.Caption := Trim(TabelaNome);

      CreateDataSet;
      for I := 0 to Tabela.Fields.Count - 1 do
        if ( Tabela.Fields[I].Required ) then
          if ( Tabela.Fields[I].IsNull ) then
          begin
            Append;
            cdsRequisitadoID.Value    := RecordCount + 1;
            cdsRequisitadoImage.Value := 1;
            cdsRequisitadoDescription.Value := ' * ' + Trim(Tabela.Fields[I].DisplayName);
            Post;
          end;
       Result := (RecordCount > 0);

       if ( Result ) then
         ShowModal;
    end;

  finally
    frm.Free;
  end;
end;

procedure TfrmCampoRequisitado.cdsRequisitadoIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FormatFloat('00"."',  Sender.AsInteger);
end;

procedure TfrmCampoRequisitado.dbgRequisitadoDrawColumnCell(
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

procedure TfrmCampoRequisitado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key = #27 ) then
    Self.Close;
end;

procedure TfrmCampoRequisitado.RegistrarRotinaSistema;
begin
  ;
end;

end.
