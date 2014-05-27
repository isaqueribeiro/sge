unit UfrmMovVeic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, Mask,
  rxToolEdit, Buttons, ExtCtrls;

type
  TfrmMovVeic = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ibqryCompVeic: TIBQuery;
    dtsCompVeic: TDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    ibqryVendVeic: TIBQuery;
    dtsiVendVeic: TDataSource;
    ibqryCompVeicVEICULO: TIBStringField;
    ibqryCompVeicPLACA: TIBStringField;
    ibqryCompVeicENTRADA: TDateField;
    ibqryCompVeicVALOR: TIBBCDField;
    ibqryCompVeicFORNECEDOR: TIBStringField;
    ibqryCompVeicCOMPRA: TIntegerField;
    ibqryCompVeicNF: TIntegerField;
    ibqryCompVeicSTATUS: TSmallintField;
    ibqryCompVeicCODIGO: TIntegerField;
    ibqryVendVeicVEICULO: TIBStringField;
    ibqryVendVeicPLACA: TIBStringField;
    ibqryVendVeicSAIDA: TDateTimeField;
    ibqryVendVeicVALOR: TIBBCDField;
    ibqryVendVeicCLIENTE: TIBStringField;
    ibqryVendVeicVENDA: TIntegerField;
    ibqryVendVeicNFE: TLargeintField;
    ibqryVendVeicSTATUS: TSmallintField;
    ibqryVendVeicCODIGO: TIntegerField;
    DBGrid2: TDBGrid;
    grpBxFiltro: TGroupBox;
    edtFiltrar: TEdit;
    CmbBxFiltrarTipo: TComboBox;
    btnFiltrar: TSpeedButton;
    ibqryCompVeicANO: TIBStringField;
    ibqryCompVeicCORVEIC: TIBStringField;
    ibqryVendVeicANO: TIBStringField;
    ibqryVendVeicCORVEIC: TIBStringField;
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFiltrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovVeic: TfrmMovVeic;

implementation

uses UDMBusiness;

{$R *.dfm}

procedure TfrmMovVeic.btnFiltrarClick(Sender: TObject);
begin
 if not (edtFiltrar.Text = '') then
  begin
   with ibqryCompVeic do
   begin
    Close;
    case CmbBxFiltrarTipo.ItemIndex of
     0 : begin
          Params[0].AsString := edtFiltrar.Text ;
          Params[1].AsString := '%';
         end;
     1 : begin
          Params[0].AsString := '%';
          Params[1].AsString := edtFiltrar.Text + '%';
         end;
    end;
    Open;
   end;

   with ibqryVendVeic do
   begin
    Close;
    case CmbBxFiltrarTipo.ItemIndex of
     0 : begin
          Params[0].AsString := edtFiltrar.Text ;
          Params[1].AsString := '%';
         end;
     2 : begin
          Params[0].AsString := '%';
          Params[1].AsString := edtFiltrar.Text + '%';
         end;
    end;
    Open;
   end;
  end
  else ShowMessage('Digite uma palavra-chave!');
end;

procedure TfrmMovVeic.FormShow(Sender: TObject);
begin
 edtFiltrar.SetFocus
end;

procedure TfrmMovVeic.edtFiltrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then  btnFiltrarClick(Sender);
end;

// Para chamada de formulário
initialization
  FormFunction.RegisterForm('frmMovVeic', TfrmMovVeic);

end.
