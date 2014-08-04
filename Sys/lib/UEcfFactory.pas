unit UEcfFactory;

interface

Uses
  Classes, UEcfAgil, UEcfWindowsPrinter, Printers;

  Type
    TEcfConfiguracao = record
      Impressora,
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
      ImprimirGliche : Boolean
    end;

    TEcfTipo = (ecfPadraoWindows, ecfLPT1, ecfLPT2, ecfLPT3, ecfLPT4, ecfLPT5, ecfTEXTO, ecfDaruma, ecfBematech);

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
begin
  inherited Create;

  with aConfiguracao do
  begin
    Impressora     := Printer.Printers.Strings[Printer.PrinterIndex];
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
  end;
end;

constructor TEcfFactory.CriarEcf(const aEcfTipo: TEcfTipo; const aEcfConfiguracao : TEcfConfiguracao);
begin
  Self.Create;
  aConfiguracao := aEcfConfiguracao;

  Case aEcfTipo of
    ecfPadraoWindows:
      aEcf := TEcfWindowsPrinter.Criar(
        aConfiguracao.Impressora,
        aConfiguracao.Dll,
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
        aConfiguracao.ImprimirGliche);

    ecfLPT1, ecfLPT2, ecfLPT3, ecfLPT4, ecfLPT5, ecfTEXTO:
      aEcf := TEcfGenerico.Criar(
        aConfiguracao.Impressora,
        aConfiguracao.Dll,
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
        aConfiguracao.ImprimirGliche);
  end;
end;

destructor TEcfFactory.Destroy;
begin
  if (aEcf <> nil) then
    aEcf.Free;
  inherited;
end;

end.
