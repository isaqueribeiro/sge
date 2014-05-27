unit UGrContReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin, Grids, DBGrids, ExtCtrls,
  DB, IBCustomDataSet, IBQuery;

type
  TfrmGrContReceb = class(TForm)
    Panel1: TPanel;
    dbgrdContRec: TDBGrid;
    tlbrGridFornec: TToolBar;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFechar: TBitBtn;
    pnlBotaoGrid: TPanel;
    ibdtstContRec: TIBDataSet;
    dtsrcContRec: TDataSource;
    BitBtn1: TBitBtn;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    setbco: TIBDataSet;
    dsbco: TDataSource;
    setbcoCOD: TSmallintField;
    setbcoNOME: TIBStringField;
    setbcoAGENCIA: TSmallintField;
    setbcoCONTA: TIBStringField;
    setbcoSITUACAO: TIBStringField;
    setbcoENDER: TIBStringField;
    setbcoFONE: TIBStringField;
    setbcoDTCAD: TDateField;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    SpeedButton1: TSpeedButton;
    edt: TEdit;
    spdbtnSoma: TSpeedButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    DBGrid1: TDBGrid;
    ibqryTotCR: TIBQuery;
    ibqryTotCRCOUNT: TIntegerField;
    ibdtstContRecNUMLANC: TLargeintField;
    ibdtstContRecCNPJ: TIBStringField;
    ibdtstContRecTIPPAG: TIBStringField;
    ibdtstContRecHISTORIC: TMemoField;
    ibdtstContRecNUMREC: TIBStringField;
    ibdtstContRecDTEMISS: TDateField;
    ibdtstContRecDTVENC: TDateField;
    ibdtstContRecDTREC: TDateField;
    ibdtstContRecDOCBAIX: TIBStringField;
    ibdtstContRecVALORREC: TIBBCDField;
    ibdtstContRecVALORMULTA: TIBBCDField;
    ibdtstContRecVALORRECTOT: TIBBCDField;
    ibdtstContRecDOCNF: TIBStringField;
    ibdtstContRecPARC: TSmallintField;
    ibdtstCli: TIBDataSet;
    ibdtstContRecLookCliente: TStringField;
    ibdtstContRecNOME: TIBStringField;
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgrdContRecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdContRecTitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spdbtnSomaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrContReceb: TfrmGrContReceb;

implementation

uses UCdContReceber, UBxCR, UDMBusiness;

{$R *.dfm}

procedure TfrmGrContReceb.btbtnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCdContReceb, frmCdContReceb);
  ibdtstContRec.Insert;
  frmCdContReceb.btbtnGrav.Enabled := True;
  frmCdContReceb.btbtnAtual.Enabled := False;
  frmCdContReceb.ShowModal;
  frmCdContReceb.Destroy
end;

procedure TfrmGrContReceb.btbtnFecharClick(Sender: TObject);
begin
  Close
end;

procedure TfrmGrContReceb.FormShow(Sender: TObject);
begin
 ibdtstContRec.Open
end;

procedure TfrmGrContReceb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ibdtstContRec.Close
end;

procedure TfrmGrContReceb.btbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja EXCLUIR esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON1) = idYes then
     begin
       ibdtstContRec.Delete;
       DMBusiness.ibtrnsctnBusiness.CommitRetaining;
       ShowMessage('Registro excluído com sucesso!');
     end
end;

procedure TfrmGrContReceb.btbtnAlterarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCdContReceb, frmCdContReceb);
  ibdtstContRec.Edit;

  if ibdtstContRecdtrec.IsNull=false
  then begin
       try
       showmessage('Disponível apenas para consulta');
       frmCdContReceb.DBEdit1.Enabled:=false;
       frmCdContReceb.DBEdit4.Enabled:=false;
       frmCdContReceb.DBEdit9.Enabled:=false;
       frmCdContReceb.DBEdit12.Enabled:=false;
       frmCdContReceb.DBEdit5.Enabled:=false;
       frmCdContReceb.DBEdit6.Enabled:=false;
       frmCdContReceb.DBEdit7.Enabled:=false;
       frmCdContReceb.DBEdit2.Enabled:=false;
       frmCdContReceb.DBmemo1.Enabled:=false;
       frmCdContReceb.DBEdit3.Enabled:=False;
       frmCdContReceb.DBEdit8.Enabled:=False;
       frmCdContReceb.DBcombobox1.Enabled:=false;
       frmCdContReceb.DBLookupComboBox1.Enabled:=false;



       except

       end; //try
       end;
  frmCdContReceb.btbtnGrav.Enabled := false;
  frmCdContReceb.ShowModal;
  frmCdContReceb.Destroy;
end;

procedure TfrmGrContReceb.BitBtn1Click(Sender: TObject);
begin
  if ibdtstContRecdtrec.IsNull then
    begin
      Application.CreateForm(TfrmbxCR, frmBxCR);
      frmBxCR.ShowModal;
      frmBxCR.Destroy;
    end
  else showmessage('Lançamento já baixado!!!');
end;


procedure TfrmGrContReceb.dbgrdContRecKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//impede de apagar um registro em um DBGRID através das teclas CTRL+DEL
if (Shift = [ssCtrl]) and (Key = 46) Then
KEY := 0;

end;

procedure TfrmGrContReceb.dbgrdContRecTitleClick(Column: TColumn);

var
campo:string;

begin
 campo:=column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
 application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure
 ibdtstContRec.SelectSQL.Clear; // LIMPA A QUERY
 ibdtstContRec.SelectSQL.Add('select * from tbcontrec order by '+campo); // ESCREVE O SELECT COM O ORDER BY
 if not ibdtstContRec.Prepared then
   ibdtstContRec.Prepare;
   ibdtstContRec.Open; // ABRE A QUERY COM A ORDEM ESCOLHIDA.
  // column.Font.color:=clblue; // COLOCAR A COLUNA NA COR DESEJADA
end;

procedure TfrmGrContReceb.SpeedButton1Click(Sender: TObject);
begin

   with ibdtstContRec do
     begin
       SelectSQL.Clear;
       Close;
       SelectSQL.Add('select * from TBCLIENTE C, TBCONTREC R');
       SelectSQL.Add('where (R.CNPJ = C.CNPJ) and (C.NOME like :nome)');
       SelectSQL.Add('order by C.NOME');
       Params[0].AsString := edt.Text + '%';
       Open;
     end;
  
end;

procedure TfrmGrContReceb.spdbtnSomaClick(Sender: TObject);
begin
  ibqryTotCR.Open;
    ShowMessage('Total de Duplicatas = '+ibqryTotCRCOUNT.DisplayText);
    ibqryTotCR.Close;
end;

end.
