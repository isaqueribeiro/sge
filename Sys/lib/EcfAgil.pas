unit EcfAgil;

interface

Uses
  SysUtils, StrUtils, Classes;
  
  Type
    TEcfTipo = (ecfPadraoWindows, ecfLPT1, ecfLPT2, ecfLPT3, ecfLPT4, ecfLPT5, ecfTEXTO, ecfDaruma, ecfBematech);
    TEcfAgil = class(TObject)
    private
      { Private declarations }
      f_retorno ,
      f_colunas : Integer;
      f_dll          ,
      f_porta_saida  ,
      f_empresa      ,
      f_endereco     ,
      f_fone_cep     ,
      f_cidade       ,
      f_cnpf_insc_est,
      f_id_venda     : String;
      f_conteudo_imp : TextFile;
      f_porta_aberta : Boolean;
    protected
      Constructor Create; 
    public
      property Num_Colunas  : Integer  read f_colunas     write f_colunas;
      property Dll          : String   read f_dll         write f_dll;
      property Porta        : String   read f_porta_saida write f_porta_saida;
      property Nome_Empresa : String   read f_empresa     write f_empresa;
      property Endereco     : String   read f_endereco    write f_endereco;
      property Fone_CEP     : String   read f_fone_cep    write f_fone_cep;
      property Cidade       : String   read f_cidade      write f_cidade;
      property CNPJ_Insc_Es : String   read f_cnpf_insc_est write f_cnpf_insc_est;
      property ID_Venda     : String   read f_id_venda      write f_id_venda;
      property Corpo_Cupom  : TextFile read f_conteudo_imp  write f_conteudo_imp;
      property Int_Retorno  : Integer  read f_retorno       write f_retorno;
      property Porta_Aberta : Boolean  read f_porta_aberta  write f_porta_aberta;

      constructor Criar(Colunas : Integer; Dll, Porta, Emp, Ender, FoneCep, Cid, Cnpj_Insc, ID : String; Imp_Gliche : Boolean); virtual; abstract;

      procedure Compactar_Fonte; virtual; abstract;
      procedure Descompactar_Fonte; virtual; abstract;

      function Centralizar(Esp : Integer; Str : String) : String; 
      function Alinhar_Direita(Esp : Integer; Str : String) : String; 
      function Alinhar_Esquerda(Esp : Integer; Str : String) : String; 
      function Divisor(Str : String) : String; 

      procedure Gliche(Imprimir : Boolean); virtual; abstract;
      procedure Incluir_Item(Item, Codigo, Descricao, Quant, V_Unitario, ST, Total_Item : String); virtual; abstract;
      procedure Incluir_TotalVenda(Valor : String); virtual; abstract;
      procedure Incluir_TotalCaixa(Valor : String); virtual; abstract;
      procedure Incluir_Forma_Pgto(Descricao, Valor : String); virtual; abstract;
      procedure Desconto(Valor : String); virtual; abstract;
      procedure Valor_Recebido(Valor : String); virtual; abstract;
      procedure Troco(Valor : String); virtual; abstract;
      procedure MSG_Cupom(Msg1, Msg2, Msg3 : String); virtual; abstract;
      procedure Emitir_Cupom_Conv(Emitir : Boolean; Convenio, Conveniado, Valor : String); virtual; abstract;
      procedure Titulo_Cupom(Str : String); virtual; abstract;
      procedure Identifica_Cupom(Data : TDateTime; ID : String); virtual; abstract;
      procedure Linha; virtual; abstract;
      procedure Pular_Linha(Num : Integer); virtual; abstract;
      procedure Finalizar; virtual; abstract;
      procedure Abrir_Gaveta; virtual; abstract;
      procedure Assinar_Vendedor(Nome : String); virtual; abstract;
      procedure Titulo_Livre(Str : String); virtual; abstract;
      procedure Texto_Livre(Str : String); virtual; abstract;
  end;

const
  cMargem = ' ';
  cJustif = #27#97#51;
  cEject = #12;

  { Tamanho da fonte }
  c10cpi = #18;
  c12cpi = #27#77;
  c17cpi = #15;
  cIExpandido = #14;
  cFExpandido = #20;
  
  { Formatação da fonte }
  cINegrito = #27#71;
  cFNegrito = #27#72;
  cIItalico = #27#52;
  cFItalico = #27#53;

implementation

{ TEcfAgil }

constructor TEcfAgil.Create;
begin
  inherited Create;
end;

function TEcfAgil.Alinhar_Direita(Esp: Integer; Str: String): String;
var
  i   ,
  tam ,
  res : Integer;
  cmp : String;
begin
  tam := Length(Trim(Str));
  res := Esp - tam - 1;
  cmp := StringOfChar(' ', res);
  Result := cmp + Trim(Str);
end;

function TEcfAgil.Alinhar_Esquerda(Esp: Integer; Str: String): String;
var
  i   ,
  tam ,
  res : Integer;
  cmp : String;
begin
  tam := Length(Trim(Str));
  res := Esp - tam - 1;
  cmp := StringOfChar(' ', res);
  Result := Trim(Str) + cmp;
end;

function TEcfAgil.Centralizar(Esp: Integer; Str: String): String;
var
  i   ,
  tam ,
  res : Integer;
  cmp : String;
begin
  tam := Length(Trim(Str));
  res := Trunc((Esp - tam) / 2);
  cmp := StringOfChar(' ', res);
  Result := cmp + Trim(Str);
end;

function TEcfAgil.Divisor(Str: String): String;
var
  d : String;
  i : Integer;
begin
  d   := Trim(Str);
  Str := StringOfChar(d[Length(d)], Num_Colunas);
  Result := Str;
end;

end.
