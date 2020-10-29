program PrinterCupom;

uses
  Windows,
  Controls,
  IniFiles,
  SysUtils,
  MidasLIB,
  Vcl.Forms,
  Vcl.Dialogs,
  Interacao.Usuario in '..\Sys\Model\Interacao\Interacao.Usuario.pas',
  Interacao.Empresa in '..\Sys\Model\Interacao\Interacao.Empresa.pas',
  Interacao.Funcao in '..\Sys\Model\Interacao\Interacao.Funcao.pas',
  Interacao.Licenca in '..\Sys\Model\Interacao\Interacao.Licenca.pas',
  Interacao.Conexao in '..\Sys\Model\Interacao\Interacao.Conexao.pas',
  Interacao.Factory in '..\Sys\Model\Interacao\Interacao.Factory.pas',
  Interacao.Tabela in '..\Sys\Model\Interacao\Interacao.Tabela.pas',
  Interacao.Pessoa in '..\Sys\Model\Interacao\Interacao.Pessoa.pas',
  Interacao.Versao in '..\Sys\Model\Interacao\Interacao.Versao.pas',
  Interacao.PersonalizaEmpresa in '..\Sys\Model\Interacao\Interacao.PersonalizaEmpresa.pas',
  Classe.Conexao in '..\Sys\Classe\Classe.Conexao.pas',
  Classe.Empresa in '..\Sys\Classe\Classe.Empresa.pas',
  Classe.Funcao in '..\Sys\Classe\Classe.Funcao.pas',
  Classe.Licenca in '..\Sys\Classe\Classe.Licenca.pas',
  Classe.Pessoa in '..\Sys\Classe\Classe.Pessoa.pas',
  Classe.PessoaFisica in '..\Sys\Classe\Classe.PessoaFisica.pas',
  Classe.PessoaJuridica in '..\Sys\Classe\Classe.PessoaJuridica.pas',
  Classe.Usuario in '..\Sys\Classe\Classe.Usuario.pas',
  Controller.Empresa in '..\Sys\Controller\Controller.Empresa.pas',
  Controller.Factory in '..\Sys\Controller\Controller.Factory.pas',
  Controller.Licenca in '..\Sys\Controller\Controller.Licenca.pas',
  Controller.Tabela in '..\Sys\Controller\Controller.Tabela.pas',
  Controller.Usuario in '..\Sys\Controller\Controller.Usuario.pas',
  Controller.Versao in '..\Sys\Controller\Controller.Versao.pas',
  Controller.PersonalizaEmpresa in '..\Sys\Controller\Controller.PersonalizaEmpresa.pas',
  View.Mensagem in '..\Sys\View\View.Mensagem.pas' {FrmMensagem},
  UPrinterCupom in '..\Sys\UPrinterCupom.pas' {frmPrinterCupom},
  UConstantesDGE in '..\Sys\UConstantesDGE.pas',
  UDMBusiness in '..\Sys\UDMBusiness.pas' {DMBusiness: TDataModule},
  UDMNFe in '..\Sys\UDMNFe.pas' {DMNFe: TDataModule},
  FormFactoryU in '..\Sys\lib\FormFactoryU.pas',
  FuncoesFormulario in '..\Sys\lib\FuncoesFormulario.pas',
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
  HPL_Strings in '..\Sys\lib\HPL_Strings.pas',
  UDMRecursos in '..\Sys\UDMRecursos.pas' {DMRecursos: TDataModule},
  UGeConfigurarNFeACBr in '..\Sys\UGeConfigurarNFeACBr.pas' {frmGeConfigurarNFeACBr},
  UGrAguarde in '..\Sys\UGrAguarde.pas' {frmAguarde};

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
