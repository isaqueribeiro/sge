unit uGerRelCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, Menus, QRCtrls, QuickRpt;

type
  TfrmGerRelCR = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    btbtnLista: TBitBtn;
    qckrpCR: TQuickRep;
    TitleBand1: TQRBand;
    lblNomeSistema1: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblPeriodo: TQRLabel;
    QRLabel2: TQRLabel;
    qrlblCliente: TQRLabel;
    QRDBText5: TQRDBText;
    qrlblStatus: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblCliMot: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRSysData3: TQRSysData;
    PageFooterBand2: TQRBand;
    QRSysData2: TQRSysData;
    grpbxVendedor: TGroupBox;
    cmbbxCliente: TComboBox;
    qckrpVendasSintetico: TQuickRep;
    QRBand1: TQRBand;
    lblNomeSistema2: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    QRBand2: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand3: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand4: TQRBand;
    QRLabel20: TQRLabel;
    QRExpr2: TQRExpr;
    QRSysData5: TQRSysData;
    QRExpr3: TQRExpr;
    QRBand5: TQRBand;
    QRSysData6: TQRSysData;
    ibqryCR: TIBQuery;
    ibqryEmp: TIBQuery;
    rdgrpPeriodo: TRadioGroup;
    rdgrpStatus: TRadioGroup;
    ibqryCli: TIBQuery;
    ibqryCliNOME: TIBStringField;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand6: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel16: TQRLabel;
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    dttmpcIni: TDateTimePicker;
    StaticText2: TStaticText;
    dttmpcFim: TDateTimePicker;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerRelCR: TfrmGerRelCR;

implementation

uses UDMBusiness, uRelCR, UFuncoes;

{$R *.dfm}


procedure TfrmGerRelCR.FormCreate(Sender: TObject);
begin
  lblNomeSistema1.Caption := GetProductName + ' - versão ' + GetVersion;
  lblNomeSistema2.Caption := GetProductName + ' - versão ' + GetVersion;

 dttmpcIni.Date := IncMonth(Date, -1);
 dttmpcFim.Date := Date;

 ibqryCli.Open;
 cmbbxCliente.Items.Add('TODOS');
 while not ibqryCli.Eof do
  begin
   cmbbxCliente.Items.Add(ibqryCliNOME.Value);
   ibqryCli.Next;
  end;
 ibqryCli.Close;

 cmbbxCliente.ItemIndex := 1;
end;

procedure TfrmGerRelCR.btbtnListaClick(Sender: TObject);
var periodo, status : string;
begin
 ibqryCR.Close;
 ibqryCR.SQL.Clear;
 ibqryCR.SQL.Add('select CR.numlanc, CR.tippag, CR.dtemiss, CR.dtvenc, CR.dtrec, CR.valorrec, CR.valorrectot, CR.parcela, CR.numvenda, C.nome ');
 ibqryCR.SQL.Add('from TBCONTREC CR inner join tbcliente C on (CR.cnpj = C.cnpj) ');
 ibqryCR.SQL.Add('left join tbvendas v on (v.ano=cr.anovenda and v.codcontrol=cr.numvenda) ');

 case rdgrpPeriodo.ItemIndex of
  0 : begin  // PERIODO DATA DE VENCIMENTO
        periodo := 'DATA DE VENCIMENTO: ';
        case rdgrpStatus.ItemIndex of
         0 : begin  // DUPLICATAS - TODAS
               ibqryCR.SQL.Add('where (C.nome like :cliente) and (CR.dtvenc between :dataini and :datafim) and (CR.parcela > 0) and (CR.situacao > 0) ');
               ibqryCR.SQL.Add('order by CR.dtvenc, c.nome');
               status := 'TODAS' ;
             end;
          1 : begin  // DUPLICATAS - BAIXADAS
               ibqryCR.SQL.Add('where (C.nome like :cliente) and (CR.dtvenc between :dataini and :datafim) and (CR.dtrec is not null) and (CR.parcela > 0)  and (CR.situacao > 0)');
               ibqryCR.SQL.Add('order by CR.dtvenc, c.nome, CR.dtrec');
               status := 'BAIXADAS' ;
             end;
          2 : begin  // DUPLICATAS - A RECEBER
               ibqryCR.SQL.Add('where (C.nome like :cliente) and (CR.dtvenc between :dataini and :datafim) and (CR.dtrec is null) and (CR.parcela > 0) and (CR.situacao > 0)');
               ibqryCR.SQL.Add('order by CR.dtvenc, c.nome');
               status := 'A RECEBER' ;
             end;
        end;
      end;

  1 : begin  // PERIODO DATA DE RECEBIMENTO
        periodo := 'DATA DE RECEBIMENTO: ';
      //  case rdgrpStatus.ItemIndex of
        // 0 :
             begin  // DUPLICATAS - TODAS
               ibqryCR.SQL.Add('where (C.nome like :cliente) and (CR.dtrec between :dataini and :datafim) and (CR.dtrec is not null) and (CR.parcela > 0) and (CR.situacao > 0)');
               ibqryCR.SQL.Add('order by CR.dtrec, c.nome');
               status := 'BAIXADAS' ;
             end;
      //  end;
      end;

  2 : begin  // PERIODO DATA DE EMISSAO
        periodo := 'DATA DE EMISSÃO: ';
        case rdgrpStatus.ItemIndex of
         0 : begin  // DUPLICATAS - TODAS
               ibqryCR.SQL.Add('where (C.nome like :cliente) and (CR.dtemiss between :dataini and :datafim) and (CR.parcela > 0) and (CR.situacao > 0)');
               ibqryCR.SQL.Add('order by CR.dtemiss, c.nome');
               status := 'TODAS' ;
             end;
          1 : begin  // DUPLICATAS - BAIXADAS
               ibqryCR.SQL.Add('where (C.nome like :cliente) and (CR.dtemiss between :dataini and :datafim) and (CR.dtrec is not null) and (CR.parcela > 0) and (CR.situacao > 0)');
               ibqryCR.SQL.Add('order by CR.dtemiss, c.nome, CR.dtrec');
               status := 'BAIXADAS' ;
             end;
          2 : begin  // DUPLICATAS - A RECEBER
               ibqryCR.SQL.Add('where (C.nome like :cliente) and (CR.dtemiss between :dataini and :datafim) and (CR.dtrec is null) and (CR.parcela > 0) and (CR.situacao > 0)');
               ibqryCR.SQL.Add('order by CR.dtemiss, c.nome, CR.dtvenc');
               status := 'A RECEBER' ;
             end;
        end;
      end;

 end;

 if cmbbxCliente.Text = 'TODOS' then ibqryCR.ParamByName('cliente').Value := '%'
  else ibqryCR.ParamByName('cliente').Value := cmbbxCliente.Text;
 ibqryCR.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
 ibqryCR.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);


 qrlblPeriodo.Caption := periodo  + DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
 qrlblCliente.Caption := 'CLIENTE: ' + cmbbxCliente.Text;
 qrlblStatus.Caption := 'STATUS: ' + status;

 ibqryCR.Open;
 if ibqryCR.IsEmpty then
    MessageDlg ('Relatório Sem Registros!',mtWarning, [mbOk],0)
 else qckrpCR.Preview;

end;

initialization
  FormFunction.RegisterForm('frmGerRelCR', TfrmGerRelCR);

end.
