unit UEcfFactory;

interface

Uses
  Classes, UInfoVersao, UEcfAgil, UEcfWindowsPrinter{$IFDEF PDV}, UEcfBematechNaoFiscal{$ENDIF}, Printers;

  Type
    TEcfConfiguracao = record
      Impressora       : String;
      ModeloEspecifico : Integer;
      Dll       ,
      Porta     ,
      Empresa   ,
      Endereco  ,
      Bairro    ,
      Fone      ,
      Cep       ,
      Cidade    ,
      Cnpj      ,
      InscEstadual,
      ID       : String;
      ImprimirGliche : Boolean;
      ArquivoLogo   ,
      ArquivoQRCode ,
      SoftHouse ,
      Sistema   ,
      Versao    : String;
    end;

    TEcfTipo = (ecfPadraoWindows, ecfLPTX, ecfTEXTO, ecfDaruma, ecfBematech);
    TEcfBematech = (ecfBema_Nenhum, ecfBema_MP_20_CI, ecfBema_MP_20_MI, ecfBema_MP_20_TH, ecfBema_MP_2000_CI, ecfBema_MP_2000_TH, ecfBema_MP_2100_TH, ecfBema_MP_4000_TH, ecfBema_MP_4200_TH, ecfBema_MP_2500_TH);

    TEcfFactory = class
    private
      aEcf : TEcfAgil;
      aConfiguracao : TEcfConfiguracao;
    protected
      constructor Create;
    public
      constructor CriarEcf(const aEcfTipo: TEcfTipo; const aEcfConfiguracao : TEcfConfiguracao);
      destructor Destroy; override;

      property Ecf : TEcfAgil read aEcf;
      property Configuracao : TEcfConfiguracao read aConfiguracao;
    end;

implementation

uses
  UEcfGenerico, SysUtils, Math;

{ TEcfFactory }

constructor TEcfFactory.Create;
var
  ver : TInfoVersao;
begin
  inherited Create;

  ver := TInfoVersao.GetInstance;

  with aConfiguracao do
  begin
    Impressora       := Printer.Printers.Strings[Printer.PrinterIndex];
    ModeloEspecifico := 0;
    Dll            := EmptyStr;
    Porta          := 'C:\CUPOM.TXT';
    Empresa        := 'ÁGIL SOLUÇÕES EM SOFTWARES';
    Endereco       := 'Rua Santa Maria, 68';
    Bairro         := 'Icuí-Guajará';
    Fone           := '(91) 9146.0444';
    Cep            := '67.000-000';
    Cidade         := 'ANANINDEUA / PA';
    Cnpj           := '00.000.000/0000-00';
    InscEstadual   := 'ISENTO';
    ID             := FormatFloat('##00000', RandomRange(1, 99999));
    ImprimirGliche := False;
    ArquivoLogo    := EmptyStr;
    ArquivoQRCode  := EmptyStr;
    SoftHouse      := ver.getPropertyValue(ivCOMPANY_NAME);
    Sistema        := ver.getPropertyValue(ivPRODUCT_NAME);
    Versao         := ver.getPropertyValue(ivPRODUCT_VERSION);
  end;
end;

constructor TEcfFactory.CriarEcf(const aEcfTipo: TEcfTipo; const aEcfConfiguracao : TEcfConfiguracao);
begin
  Self.Create;
  aConfiguracao := aEcfConfiguracao;

  Case aEcfTipo of
    ecfPadraoWindows:
      aEcf := TEcfWindowsPrinter.Criar(
        aConfiguracao.Dll,
        aConfiguracao.Impressora,
        aConfiguracao.ModeloEspecifico,
        aConfiguracao.Porta,
        aConfiguracao.Empresa,
        aConfiguracao.Endereco,
        aConfiguracao.Bairro,
        aConfiguracao.Fone,
        aConfiguracao.Cep,
        aConfiguracao.Cidade,
        aConfiguracao.Cnpj,
        aConfiguracao.InscEstadual,
        aConfiguracao.ID,
        aConfiguracao.ArquivoLogo,
        aConfiguracao.ImprimirGliche);

    ecfLPTX, ecfTEXTO:
      aEcf := TEcfGenerico.Criar(
        aConfiguracao.Dll,
        aConfiguracao.Impressora,
        aConfiguracao.ModeloEspecifico,
        aConfiguracao.Porta,
        aConfiguracao.Empresa,
        aConfiguracao.Endereco,
        aConfiguracao.Bairro,
        aConfiguracao.Fone,
        aConfiguracao.Cep,
        aConfiguracao.Cidade,
        aConfiguracao.Cnpj,
        aConfiguracao.InscEstadual,
        aConfiguracao.ID,
        aConfiguracao.ArquivoLogo,
        aConfiguracao.ImprimirGliche);

    ecfBematech:
      aEcf := TEcfBematechNaoFiscal.Criar(
        aConfiguracao.Dll,
        aConfiguracao.Impressora,
        aConfiguracao.ModeloEspecifico,
        aConfiguracao.Porta,
        aConfiguracao.Empresa,
        aConfiguracao.Endereco,
        aConfiguracao.Bairro,
        aConfiguracao.Fone,
        aConfiguracao.Cep,
        aConfiguracao.Cidade,
        aConfiguracao.Cnpj,
        aConfiguracao.InscEstadual,
        aConfiguracao.ID,
        aConfiguracao.ArquivoLogo,
        aConfiguracao.ImprimirGliche);

  end;

  aEcf.QRCode   := aConfiguracao.ArquivoQRCode;
end;

destructor TEcfFactory.Destroy;
begin
  if (aEcf <> nil) then
    aEcf.Free;
  inherited;
end;

end.
