program PrinterCupom;

uses
  Windows,
  Controls,
  IniFiles,
  SysUtils,
  MidasLIB,
  Vcl.Forms,
  UPrinterCupom in '..\Sys\UPrinterCupom.pas' {frmPrinterCupom},
  UConstantesDGE in '..\Sys\UConstantesDGE.pas',
  UDMBusiness in '..\Sys\UDMBusiness.pas' {DMBusiness: TDataModule},
  UDMNFe in '..\Sys\UDMNFe.pas' {DMNFe: TDataModule},
  FormFactoryU in '..\Sys\lib\FormFactoryU.pas',
  FuncoesFormulario in '..\Sys\lib\FuncoesFormulario.pas',
  UInfoVersao in '..\Sys\lib\UInfoVersao.pas',
  UEcfAgil in '..\Sys\lib\UEcfAgil.pas',
  UEcfBematechNaoFiscal in '..\Sys\lib\UEcfBematechNaoFiscal.pas',
  UEcfFactory in '..\Sys\lib\UEcfFactory.pas',
  UEcfGenerico in '..\Sys\lib\UEcfGenerico.pas',
  UEcfWindowsPrinter in '..\Sys\lib\UEcfWindowsPrinter.pas',
  UFuncoes in '..\Sys\lib\UFuncoes.pas',
  UBaseObject in '..\Sys\lib\UBaseObject.pas',
  UObserverInterface in '..\Sys\lib\UObserverInterface.pas',
  UGrPadrao in '..\Sys\lib\UGrPadrao.pas' {frmGrPadrao},
  UGrMemo in '..\Sys\lib\UGrMemo.pas' {frmGrMemo},
  UGrMessage in '..\Sys\lib\UGrMessage.pas',
  HPL_Strings in '..\Sys\lib\HPL_Strings.pas',
  UDMRecursos in '..\Sys\UDMRecursos.pas' {DMRecursos: TDataModule},
  UGeConfigurarNFeACBr in '..\Sys\UGeConfigurarNFeACBr.pas' {frmGeConfigurarNFeACBr};

{$R *.res}

begin
  FileINI := TIniFile.Create( ExtractFilePath(ParamStr(0)) + 'Conexao.ini' );

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Printer Cupom';
  Application.CreateForm(TDMRecursos, DMRecursos);
  Application.CreateForm(TDMBusiness, DMBusiness);
  Application.CreateForm(TDMNFe, DMNFe);
  if StringReplace(Trim(ParamStr(1)), '"', '', [rfReplaceAll]) = EmptyStr then
  begin
    Application.CreateForm(TfrmPrinterCupom, frmPrinterCupom);
    Application.Run;
  end
  else
  begin
    Application.Run;
    ImprimiCupom;
  end;
end.
