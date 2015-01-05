unit UEcfBematechNaoFiscal;

interface

Uses
  SysUtils, StrUtils, Classes, Printers, Graphics, UEcfAgil, UFuncoes;

  Type
    TEcfBematechNaoFiscal = class(TEcfAgil)
    private
      function GetModeloImpressora : Integer;
      procedure ImprimirCabecalho;
    public
      constructor Criar(sDll, sNomeImpressora : String; iModeloEspecifico : Integer;
        sPorta, sEmp, sEndereco, sBairro, sFone, sCep, sCid, sCnpj, sInscEstadual, sID, sArquivoLogotipo : String; bImp_Gliche : Boolean); override;

      procedure Compactar_Fonte; override;
      procedure Descompactar_Fonte; override;
      procedure CentralzarElementos; override;

      procedure Gliche(Imprimir : Boolean); override;
      procedure Incluir_Item(Item, Codigo, Descricao, Quant, V_Unitario, ST, Total_Item : String); override;
      procedure Incluir_Forma_Pgto(Descricao, Valor : String); override;
      procedure Incluir_Texto_Valor(Descricao, Valor : String); override;
      procedure SubTotalVenda(Valor : String; const LinhaSobre : Boolean); override;
      procedure Desconto(Valor : String); override;
      procedure TotalVenda(Valor : String); override;
      procedure TotalCaixa(Valor : String); override;
      procedure Valor_Recebido(Valor : String); override;
      procedure Troco(Valor : String); override;
      procedure MSG_Cupom(Msg1, Msg2, Msg3 : String); override;
      procedure Emitir_Cupom_Conv(Emitir : Boolean; Convenio, Conveniado, Valor : String); override;
      procedure Titulo_Cupom(Str : String); override;
      procedure Titulo_Cupom_DANFE(sTitulo1, sTitulo2, sTitulo3, sTitulo4 : String); override;
      procedure Identifica_Cupom(Data : TDateTime; sID, sNomeVendedor : String); override;
      procedure Identifica_Consumidor(sCNPJ_CPF, sNome, sEndereco : String); override;
      procedure Linha; override;
      procedure Pular_Linha(Num : Integer); override;
      procedure Finalizar; override;
      procedure Abrir_Gaveta; override;
      procedure Assinar_Vendedor(Nome : String); override;
      procedure Titulo_Livre(Str : String); override;
      procedure Texto_Livre(Str : String); override;
      procedure Texto_Livre_Negrito(Str : String); override;
      procedure Texto_Livre_Centralizado(Str : String); override;

      procedure ImprimirQRCode(const ArquivoBmpQRCode : String); override;
  end;

implementation

  function IniciaPorta( Porta: string ): integer; stdcall; far; external 'MP2032.DLL';
  function FechaPorta: integer; stdcall; far; external 'MP2032.DLL';
  function BematechTX( BufTrans: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ComandoTX( BufTrans: string; TamBufTrans: integer ): integer; stdcall; far; external 'MP2032.DLL';
  function CaracterGrafico( BufTrans: string; TamBufTrans: integer ): integer; stdcall; far; external 'MP2032.DLL';
  function DocumentInserted: integer; stdcall; far; external 'MP2032.DLL';
  function Le_Status: integer; stdcall; far; external 'MP2032.DLL';
  function AutenticaDoc( texto: string; tempo: integer ): integer; stdcall; far; external 'MP2032.DLL';
  function Le_Status_Gaveta: integer; stdcall; far; external 'MP2032.DLL';
  function ConfiguraTamanhoExtrato( NumeroLinhas: Integer ): integer; stdcall; far; external 'MP2032.DLL';
  function HabilitaExtratoLongo( Flag: Integer ): integer; stdcall; far; external 'MP2032.DLL';
  function HabilitaEsperaImpressao( Flag: Integer ): integer; stdcall; far; external 'MP2032.DLL';
  function EsperaImpressao: integer; stdcall; far; external 'MP2032.DLL';
  function ConfiguraModeloImpressora( ModeloImpressora: integer ): integer; stdcall; far; external 'MP2032.DLL';
  function AcionaGuilhotina( Modo: integer ): integer; stdcall; far; external 'MP2032.DLL';
  function FormataTX (BufTras: string; TpoLtra: integer; Italic: integer; Sublin: integer; expand: integer; enfat: integer ): integer; stdcall; far; external 'MP2032.DLL';
  function HabilitaPresenterRetratil( iFlag: integer ): integer; stdcall; far; external 'MP2032.DLL';
  function ProgramaPresenterRetratil( iTempo: integer ): integer; stdcall; far; external 'MP2032.DLL';
  function VerificaPapelPresenter: integer; stdcall; far; external 'MP2032.DLL';
  function SelecionaQualidadeImpressao( iTipoQualidade : integer ): integer; stdcall; far; external 'MP2032.DLL';


  // Função para Configuração dos Códigos de Barras

  function ConfiguraCodigoBarras( Altura: integer; Largura: integer; PosicaoCaracteres: integer; Fonte: integer; Margem: integer ): integer; stdcall; far; external 'MP2032.DLL';

  // Funções para impressão dos códigos de barras

  function ImprimeCodigoBarrasUPCA( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasUPCE( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasEAN13( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasEAN8( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasCODE39( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasCODE93( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasCODE128( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasITF( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasCODABAR( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasISBN( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasMSI( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasPLESSEY( Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeCodigoBarrasPDF417( NivelCorrecaoErros: integer; Altura: integer; Largura: integer; Colunas: integer; Codigo: string ): integer; stdcall; far; external 'MP2032.DLL';

  // Funções para impressão de BitMap

  function ImprimeBitmap ( name: string; mode: integer): integer; stdcall; far; external 'MP2032.DLL';
  function ImprimeBmpEspecial ( name: string; xScale: integer; yScale: integer; angle: integer): integer; stdcall; far; external 'MP2032.DLL';
  function AjustaLarguraPapel ( width: integer): integer; stdcall; far; external 'MP2032.DLL';
  function SelectDithering ( mode: integer): integer; stdcall; far; external 'MP2032.DLL';
  function PrinterReset : integer; stdcall; far; external 'MP2032.DLL';
  function LeituraStatusEstendido        ( A: array of byte ): integer; stdcall; far; external 'MP2032.DLL';
  function IoControl        ( flag: Integer; mode : Boolean ): integer; stdcall; far; external 'MP2032.DLL'

const
  PULAR_LINHA_FINAL = 3;

{ TEcfBematechNaoFiscal }

procedure TEcfBematechNaoFiscal.Abrir_Gaveta;
var
  sComando : String;
begin
  sComando    := #27 + #118 + #140;
  Int_Retorno := ComandoTX( sComando, Length( sComando ) );
end;

procedure TEcfBematechNaoFiscal.Assinar_Vendedor(Nome: String);
const
                //123456789012345678901234567890123456789012345678   -> 48
   ln : String = '................................................';
begin
  Self.Pular_Linha(1);
  Int_Retorno := FormataTX(PChar(cMargem + 'Vendedor: ' + Copy(ln, 1, Num_Colunas - 10)) + #10,                      cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(cMargem + '          ' + Centralizar(Num_Colunas - 10, RemoveAcentos(Nome))) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
end;

procedure TEcfBematechNaoFiscal.CentralzarElementos;
begin
  Int_Retorno := BematechTX(PChar(cCentraliza));
end;

procedure TEcfBematechNaoFiscal.Compactar_Fonte;
begin
  ;
end;

constructor TEcfBematechNaoFiscal.Criar(sDll, sNomeImpressora : String; iModeloEspecifico : Integer; sPorta,
  sEmp, sEndereco, sBairro, sFone, sCep, sCid, sCnpj, sInscEstadual,
  sID, sArquivoLogotipo : String; bImp_Gliche: Boolean);
begin
  Self.Create;

  Num_Colunas      := 66;
  ModeloEspecifico := iModeloEspecifico;
  NomeImpressora := sNomeImpressora;
  Dll            := sDll;
  Porta          := sPorta;
  Nome_Empresa   := sEmp;
  Endereco       := sEndereco;
  Bairro         := sBairro;
  Fone           := sFone;
  Cep            := sCep;
  Cidade         := sCid;
  CNPJ           := sCnpj;
  Insc_Estadual  := sInscEstadual;
  ID_Venda       := sID;
  Logotipo       := sArquivoLogotipo;
  QRCode         := EmptyStr;

  ConfiguraModeloImpressora(GetModeloImpressora);

  Int_Retorno := IniciaPorta(PChar(Porta));

  Porta_Aberta := (Int_Retorno = 1);

  if Porta_Aberta then
  begin
    SelecionaQualidadeImpressao(4);
    Gliche(bImp_Gliche);
  end
  else
    raise Exception.Create('A impressora não está conectada ou não está ligada!');  
end;

procedure TEcfBematechNaoFiscal.Descompactar_Fonte;
begin
  ;
end;

procedure TEcfBematechNaoFiscal.Desconto(Valor: String);
begin
  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(24, 'Desconto: ')),   cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(Alinhar_Direita(Num_Colunas - 25, Valor)) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
end;

procedure TEcfBematechNaoFiscal.Emitir_Cupom_Conv(Emitir: Boolean;
  Convenio, Conveniado, Valor: String);
var
  dh : String;
begin
  if Emitir then begin

    Int_Retorno := AcionaGuilhotina(1);
    Int_Retorno := PrinterReset;

    Self.Gliche(True);

    dh := FormatDateTime('dd/MM/yy hh:mm:ss', Now);

    Int_Retorno := FormataTX( PChar(cMargem + dh), cTipoLetraComprimido, 0, 0, 0, 0);
    Int_Retorno := FormataTX( PChar(Alinhar_Direita(Num_Colunas - Length(dh + cMargem), 'COD: ' + ID_Venda)) + #10, cTipoLetraComprimido, 0, 0, 0, 1);

    Int_Retorno := BematechTX(PChar(cCentraliza));
    Int_Retorno := FormataTX( PChar('VENDA CONVENIO') + #10, cTipoLetraComprimido, 0, 0, 1, 1);
    Int_Retorno := BematechTX(PChar(cEsquerda));

    Self.Compactar_Fonte;

    Self.Linha;

    Int_Retorno := FormataTX( PChar(cMargem + 'Convenio:   ' + Alinhar_Esquerda(Num_Colunas - 13, RemoveAcentos(Convenio)))   + #10, cTipoLetraComprimido, 0, 0, 0, 0);
    Int_Retorno := FormataTX( PChar(cMargem + 'Conveniado: ' + Alinhar_Esquerda(Num_Colunas - 13, RemoveAcentos(Conveniado))) + #10, cTipoLetraComprimido, 0, 0, 0, 0);

    Self.Pular_Linha(2);

    Int_Retorno := FormataTX(PChar( Alinhar_Esquerda(16, 'TOTAL DEBITO R$') ),                   cTipoLetraComprimido, 0, 0, 1, 1);
    Int_Retorno := FormataTX(PChar( Alinhar_Direita(Round(Num_Colunas / 2) - 16, Valor) + #10 ), cTipoLetraComprimido, 0, 0, 1, 1);

    Self.Compactar_Fonte;
    Self.Pular_Linha(PULAR_LINHA_FINAL);

    Int_Retorno := FormataTX( PChar(cMargem + Centralizar(Num_Colunas, '----------------------------------------')) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
    Int_Retorno := FormataTX( PChar(cMargem + Centralizar(Num_Colunas, Conveniado))                                 + #10, cTipoLetraComprimido, 0, 0, 0, 0);

    Self.Pular_Linha(PULAR_LINHA_FINAL);
  end;
end;

procedure TEcfBematechNaoFiscal.Finalizar;
begin
  Self.Linha;

  Int_Retorno := FormataTX( PChar(Centralizar(Num_Colunas, RemoveAcentos(SoftHouse))) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX( PChar(Centralizar(Num_Colunas, RemoveAcentos(Sistema)))   + #10, cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX( PChar(Centralizar(Num_Colunas, 'Versao ' + Versao))       + #10, cTipoLetraComprimido, 0, 0, 0, 0);

  Self.Pular_Linha(PULAR_LINHA_FINAL);
  
  Int_Retorno := AcionaGuilhotina(1);
  Int_Retorno := PrinterReset;
  Int_Retorno := FechaPorta;
end;

function TEcfBematechNaoFiscal.GetModeloImpressora: Integer;
const
  ecfBema_Nenhum     = 0;
  ecfBema_MP_20_CI   = 1;
  ecfBema_MP_20_MI   = 2;
  ecfBema_MP_20_TH   = 3;
  ecfBema_MP_2000_CI = 4;
  ecfBema_MP_2000_TH = 5;
  ecfBema_MP_2100_TH = 6;
  ecfBema_MP_4000_TH = 7;
  ecfBema_MP_4200_TH = 8;
  ecfBema_MP_2500_TH = 9;

begin
  Case ModeloEspecifico of
    ecfBema_MP_20_CI   : Result := 1;
    ecfBema_MP_20_MI   : Result := 1;
    ecfBema_MP_20_TH   : Result := 0;
    ecfBema_MP_2000_CI : Result := 0;
    ecfBema_MP_2000_TH : Result := 0;
    ecfBema_MP_2100_TH : Result := 0;
    ecfBema_MP_4000_TH : Result := 5;
    ecfBema_MP_4200_TH : Result := 7;
    ecfBema_MP_2500_TH : Result := 8;
    else
     Result := -1;
  end;
end;

procedure TEcfBematechNaoFiscal.Gliche(Imprimir: Boolean);
const
  EMP_FONE_CEP = 'FONE: %s CEP: %s';
  EMP_IDENTIF  = 'CNPJ: %s IE: %s';
begin
  if Imprimir then begin
    if FileExists(Logotipo) then
    begin
      Int_Retorno := BematechTX(PChar(cCentraliza));
      Int_Retorno := ImprimeBmpEspecial(PChar(Logotipo), 90, 90, 0);
      Int_Retorno := BematechTX(PChar(cEsquerda));
    end;

    Int_Retorno := BematechTX(PChar(cCentraliza));
    Int_Retorno := FormataTX( PChar(RemoveAcentos(Nome_Empresa))                + #10, cTipoLetraComprimido, 0, 0, 1, 1);
    Int_Retorno := FormataTX( PChar(RemoveAcentos(Endereco))                    + #10, cTipoLetraComprimido, 0, 0, 0, 0);
    Int_Retorno := FormataTX( PChar(RemoveAcentos(Bairro))                      + #10, cTipoLetraComprimido, 0, 0, 0, 0);
    Int_Retorno := FormataTX( PChar(RemoveAcentos(Cep + ' - ' + Cidade))        + #10, cTipoLetraComprimido, 0, 0, 0, 0);
    Int_Retorno := FormataTX( PChar(RemoveAcentos(Fone))                        + #10, cTipoLetraComprimido, 0, 0, 0, 0);
    Int_Retorno := FormataTX( PChar(Format(EMP_IDENTIF, [CNPJ, Insc_Estadual])) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
    Int_Retorno := BematechTX(PChar(cEsquerda));
    Self.Linha;
  end;
end;

procedure TEcfBematechNaoFiscal.Identifica_Consumidor(sCNPJ_CPF, sNome,
  sEndereco: String);
begin
  sCNPJ_CPF := Trim(Copy(Trim(sCNPJ_CPF), 1, Num_Colunas - 2));
  sNome     := Trim(Copy(Trim(sNome),     1, Num_Colunas - 2));
  sEndereco := Trim(Copy(Trim(sEndereco), 1, Num_Colunas - 2));

  Self.Compactar_Fonte;

  Int_Retorno := FormataTX(PChar(Centralizar(Round(Num_Colunas / 2), 'CONSUMIDOR')) + #10, cTipoLetraComprimido, 0, 0, 1, 0);

  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(10, 'CNPJ/CPF: ')),                  cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(Num_Colunas - 12, sCNPJ_CPF)) + #10, cTipoLetraComprimido, 0, 0, 0, 0);

  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(10, 'NOME    : ')),                  cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(Num_Colunas - 12, sNome))     + #10, cTipoLetraComprimido, 0, 0, 0, 0);

  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(10, 'Endereco: ')),                  cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(Num_Colunas - 12, sEndereco)) + #10, cTipoLetraComprimido, 0, 0, 0, 0);

  Self.Linha;
end;

procedure TEcfBematechNaoFiscal.Identifica_Cupom(Data: TDateTime; sID,
  sNomeVendedor: String);
var
  dh : String;
begin
  dh := FormatDateTime('dd/MM/yy hh:mm:ss', Data);
  ID_Venda := sID;

  Int_Retorno := FormataTX( PChar(cMargem + dh), cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX( PChar(Alinhar_Direita(Num_Colunas - Length(dh + cMargem), 'COD: ' + ID_Venda)) + #10, cTipoLetraComprimido, 0, 0, 0, 1);

  NomeVendedor := RemoveAcentos(Trim(sNomeVendedor));

  if NomeVendedor <> EmptyStr then
  begin
    Int_Retorno := FormataTX( PChar(cMargem + 'Vendedor(a) : '), cTipoLetraComprimido, 0, 0, 0, 0);
    Int_Retorno := FormataTX( PChar(Alinhar_Esquerda(Num_Colunas - 15, NomeVendedor)) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
  end;

  Self.Linha;
end;

procedure TEcfBematechNaoFiscal.ImprimirCabecalho;
begin
  Self.Compactar_Fonte;

  Int_Retorno := FormataTX(PChar( cMargem + Alinhar_Esquerda(7, 'ITEM') ),                 cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar( Alinhar_Esquerda(10, 'CODIGO') ),                        cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar( Alinhar_Esquerda(Num_Colunas - 18, 'DESCRICAO') + #10 ), cTipoLetraComprimido, 0, 0, 0, 0);

  Int_Retorno := FormataTX(PChar( cMargem + Alinhar_Direita(20, 'QTD x UNITARIO') ),       cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar( Alinhar_Direita(10, 'ST') ),                             cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar( Alinhar_Direita(Num_Colunas - 31, 'VALOR (R$)') + #10 ), cTipoLetraComprimido, 0, 0, 0, 0);
end;

procedure TEcfBematechNaoFiscal.ImprimirQRCode(
  const ArquivoBmpQRCode: String);
begin
  Int_Retorno := BematechTX(PChar(cCentraliza));
  Int_Retorno := ImprimeBmpEspecial(PChar(ArquivoBmpQRCode), 90, 90, 0);
  Int_Retorno := BematechTX(PChar(cEsquerda));
end;

procedure TEcfBematechNaoFiscal.Incluir_Forma_Pgto(Descricao,
  Valor: String);
begin
  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(24, Descricao)),      cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(Alinhar_Direita(Num_Colunas - 25, Valor)) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
end;

procedure TEcfBematechNaoFiscal.Incluir_Item(Item, Codigo, Descricao,
  Quant, V_Unitario, ST, Total_Item: String);
var
  esp_desc : Integer;
begin
  esp_desc := Num_Colunas - 18;

  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(3, Item)),                                           cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(Alinhar_Esquerda(14, Codigo)),                                                  cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(Alinhar_Esquerda(esp_desc, Copy(RemoveAcentos(Descricao), 1, esp_desc))) + #10, cTipoLetraComprimido, 0, 0, 0, 0);

  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Direita(9, Quant)), cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(' x '),                               cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(Alinhar_Direita(9, V_Unitario)),      cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(Alinhar_Direita(9, ST)),              cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(Alinhar_Direita(Num_Colunas - 31, Total_Item)) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
end;

procedure TEcfBematechNaoFiscal.Incluir_Texto_Valor(Descricao,
  Valor: String);
begin
  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(24, Descricao)),      cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(Alinhar_Direita(Num_Colunas - 25, Valor)) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
end;

procedure TEcfBematechNaoFiscal.Linha;
begin
  Int_Retorno := FormataTX(PChar( cMargem + Divisor('-') ) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
end;

procedure TEcfBematechNaoFiscal.MSG_Cupom(Msg1, Msg2, Msg3: String);
begin
  if (Length(Trim(Msg1)) <> 0) then
    Int_Retorno := FormataTX(PChar( cMargem + Centralizar(Num_Colunas, Msg1)) + #10, cTipoLetraComprimido, 0, 0, 0, 0);

  if (Length(Trim(Msg2)) <> 0) then
    Int_Retorno := FormataTX(PChar( cMargem + Centralizar(Num_Colunas, Msg2)) + #10, cTipoLetraComprimido, 0, 0, 0, 0);

  if (Length(Trim(Msg3)) <> 0) then
    Int_Retorno := FormataTX(PChar( cMargem + Centralizar(Num_Colunas, Msg3)) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
end;

procedure TEcfBematechNaoFiscal.Pular_Linha(Num: Integer);
var
  I : Integer;
begin
  for I := 1 to Num do
    Int_Retorno := BematechTX(EmptyStr);
end;

procedure TEcfBematechNaoFiscal.SubTotalVenda(Valor: String;
  const LinhaSobre: Boolean);
begin
  if LinhaSobre then
    Int_Retorno := FormataTX(PChar( Alinhar_Direita(Num_Colunas, '----------------')) + #10, cTipoLetraComprimido, 0, 0, 0, 1);

  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(24, 'Subtotal R$ ')), cTipoLetraComprimido, 0, 0, 0, 1);
  Int_Retorno := FormataTX(PChar(Alinhar_Direita(Num_Colunas - 25, Valor)) + #10, cTipoLetraComprimido, 0, 0, 0, 1);

  Self.Compactar_Fonte;
end;

procedure TEcfBematechNaoFiscal.Texto_Livre(Str: String);
begin
  Self.Compactar_Fonte;
  Int_Retorno := FormataTX(PChar(cMargem + Str) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
end;

procedure TEcfBematechNaoFiscal.Texto_Livre_Centralizado(Str: String);
begin
  Int_Retorno := BematechTX(PChar(cCentraliza));
  Int_Retorno := FormataTX(PChar(Str) + #10, cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := BematechTX(PChar(cEsquerda));
  Self.Compactar_Fonte;
end;

procedure TEcfBematechNaoFiscal.Texto_Livre_Negrito(Str: String);
begin
  Self.Compactar_Fonte;
  Int_Retorno := FormataTX(PChar(cMargem + Str) + #10, cTipoLetraComprimido, 0, 0, 0, 1);
end;

procedure TEcfBematechNaoFiscal.Titulo_Cupom(Str: String);
begin
  Int_Retorno := BematechTX(PChar(cCentraliza));
  Int_Retorno := FormataTX(PChar(Str) + #10, cTipoLetraComprimido, 0, 0, 1, 1);
  Int_Retorno := BematechTX(PChar(cEsquerda));

  Self.ImprimirCabecalho;

  Self.Linha;
end;

procedure TEcfBematechNaoFiscal.Titulo_Cupom_DANFE(sTitulo1, sTitulo2,
  sTitulo3, sTitulo4: String);
begin
  Int_Retorno := BematechTX(PChar(cCentraliza));
  Int_Retorno := FormataTX(PChar( cMargem + sTitulo1 ) + #10, cTipoLetraComprimido, 0, 0, 1, 1);
  Int_Retorno := FormataTX(PChar( cMargem + sTitulo2 ) + #10, cTipoLetraComprimido, 0, 0, 0, 1);
  Int_Retorno := FormataTX(PChar( cMargem + sTitulo3 ) + #10, cTipoLetraComprimido, 0, 0, 0, 1);
  Int_Retorno := FormataTX(PChar( cMargem + sTitulo4 ) + #10, cTipoLetraComprimido, 0, 0, 0, 1);
  Int_Retorno := BematechTX(PChar(cEsquerda));

  Self.Linha;
  Self.ImprimirCabecalho;
  Self.Linha;
end;

procedure TEcfBematechNaoFiscal.Titulo_Livre(Str: String);
begin
  Int_Retorno := BematechTX(PChar(cCentraliza));
  Int_Retorno := FormataTX(PChar(Str) + #10, cTipoLetraComprimido, 0, 0, 1, 1);
  Int_Retorno := BematechTX(PChar(cEsquerda));

  Self.Compactar_Fonte;
end;

procedure TEcfBematechNaoFiscal.TotalCaixa(Valor: String);
begin
  Int_Retorno := FormataTX(PChar( Alinhar_Esquerda(10, 'CAIXA R$') ),                          cTipoLetraComprimido, 0, 0, 1, 1);
  Int_Retorno := FormataTX(PChar( Alinhar_Direita(Round(Num_Colunas / 2) - 10, Valor) + #10 ), cTipoLetraComprimido, 0, 0, 1, 1);

  Self.Compactar_Fonte;
end;

procedure TEcfBematechNaoFiscal.TotalVenda(Valor: String);
begin
  Int_Retorno := FormataTX(PChar( Alinhar_Esquerda(10, 'TOTAL R$') ),                          cTipoLetraComprimido, 0, 0, 1, 1);
  Int_Retorno := FormataTX(PChar( Alinhar_Direita(Round(Num_Colunas / 2) - 10, Valor) + #10 ), cTipoLetraComprimido, 0, 0, 1, 1);

  Self.Compactar_Fonte;
end;

procedure TEcfBematechNaoFiscal.Troco(Valor: String);
begin
  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(24, 'TROCO         :')), cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(Alinhar_Direita(Num_Colunas - 25, Valor)) + #10,    cTipoLetraComprimido, 0, 0, 0, 0);
end;

procedure TEcfBematechNaoFiscal.Valor_Recebido(Valor: String);
begin
  Int_Retorno := FormataTX(PChar(cMargem + Alinhar_Esquerda(24, 'VALOR RECEBIDO:')), cTipoLetraComprimido, 0, 0, 0, 0);
  Int_Retorno := FormataTX(PChar(Alinhar_Direita(Num_Colunas - 25, Valor)) + #10,    cTipoLetraComprimido, 0, 0, 0, 0);
end;

end.
