unit UEcfAgil;

interface

Uses
  SysUtils, StrUtils, Classes, Printers;

  Type
    TEcfAgil = class(TObject)
    private
      { Private declarations }
      f_retorno ,
      f_colunas ,
      f_modeloEspecifico : Integer;
      f_impressora   ,
      f_dll          ,
      f_porta_saida  ,
      f_empresa      ,
      f_endereco     ,
      f_bairro       ,
      f_fone         ,
      f_cep          ,
      f_cidade       ,
      f_cnpf         ,
      f_insc_estadual,
      f_id_venda     ,
      f_vendedor     : String;
      f_conteudo_imp : TextFile;
      f_texto_cumpo  : TStringList;
      f_myPrinter    : TPrinter;
      f_porta_aberta : Boolean;
      f_logotipo ,
      f_qrcode   ,
      f_softHouse,
      f_sistena  ,
      f_versao   : String;
    protected
      Constructor Create;
    public
      property Num_Colunas      : Integer  read f_colunas           write f_colunas;
      property ModeloEspecifico : Integer  read f_modeloEspecifico  write f_modeloEspecifico;
      property NomeImpressora: String   read f_impressora  write f_impressora;
      property Dll           : String   read f_dll         write f_dll;
      property Porta         : String   read f_porta_saida write f_porta_saida;
      property Nome_Empresa  : String   read f_empresa     write f_empresa;
      property Endereco      : String   read f_endereco    write f_endereco;
      property Bairro        : String   read f_bairro      write f_bairro;
      property Fone          : String   read f_fone        write f_fone;
      property Cep           : String   read f_cep         write f_cep;
      property Cidade        : String   read f_cidade      write f_cidade;
      property CNPJ          : String   read f_cnpf        write f_cnpf;
      property Insc_Estadual : String   read f_insc_estadual write f_insc_estadual;
      property ID_Venda      : String   read f_id_venda      write f_id_venda;
      property NomeVendedor  : String   read f_vendedor      write f_vendedor;
      property Corpo_Cupom   : TextFile read f_conteudo_imp  write f_conteudo_imp;
      property Texto_Cupom   : TStringList read f_texto_cumpo   write f_texto_cumpo;
      property myPrinter     : TPrinter read f_myPrinter     write f_myPrinter;
      property Int_Retorno   : Integer  read f_retorno       write f_retorno;
      property Porta_Aberta  : Boolean  read f_porta_aberta  write f_porta_aberta;
      property Logotipo  : String read f_logotipo write f_logotipo;
      property QRCode    : String read f_qrcode   write f_qrcode;
      property SoftHouse : String read f_softHouse   write f_softHouse;
      property Sistema   : String read f_sistena   write f_sistena;
      property Versao    : String read f_versao   write f_versao;

      constructor Criar(sDll, sNomeImpressora : String; iModeloEspecifico : Integer;
        sPorta, sEmp, sEndereco, sBairro, sFone, sCep, sCid, sCnpj, sInscEstadual, sID, sArquivoLogotipo : String; bImp_Gliche : Boolean); virtual; abstract;
      destructor Destroy; override;

      procedure Compactar_Fonte; virtual; abstract;
      procedure Descompactar_Fonte; virtual; abstract;

      function Centralizar(Esp : Integer; Str : String) : String; 
      function Alinhar_Direita(Esp : Integer; Str : String) : String; 
      function Alinhar_Esquerda(Esp : Integer; Str : String) : String; 
      function Divisor(Str : String) : String; 

      procedure Gliche(Imprimir : Boolean); virtual; abstract;
      procedure Incluir_Item(Item, Codigo, Descricao, Quant, V_Unitario, ST, Total_Item : String); virtual; abstract;
      procedure Incluir_Forma_Pgto(Descricao, Valor : String); virtual; abstract;
      procedure Incluir_Texto_Valor(Descricao, Valor : String); virtual; abstract;
      procedure SubTotalVenda(Valor : String; const LinhaSobre : Boolean); virtual; abstract;
      procedure Desconto(Valor : String); virtual; abstract;
      procedure TotalVenda(Valor : String); virtual; abstract;
      procedure TotalCaixa(Valor : String); virtual; abstract;
      procedure Valor_Recebido(Valor : String); virtual; abstract;
      procedure Troco(Valor : String); virtual; abstract;
      procedure MSG_Cupom(Msg1, Msg2, Msg3 : String); virtual; abstract;
      procedure Emitir_Cupom_Conv(Emitir : Boolean; Convenio, Conveniado, Valor : String); virtual; abstract;
      procedure Titulo_Cupom(Str : String); virtual; abstract;
      procedure Titulo_Cupom_DANFE(sTitulo1, sTitulo2, sTitulo3, sTitulo4 : String); virtual; abstract;
      procedure Identifica_Cupom(Data : TDateTime; sID, sNomeVendedor : String); virtual; abstract;
      procedure Identifica_Consumidor(sCNPJ_CPF, sNome, sEndereco : String); virtual; abstract;
      procedure Linha; virtual; abstract;
      procedure Pular_Linha(Num : Integer); virtual; abstract;
      procedure Finalizar; virtual; abstract;
      procedure Abrir_Gaveta; virtual; abstract;
      procedure Assinar_Vendedor(Nome : String); virtual; abstract;
      procedure Titulo_Livre(Str : String); virtual; abstract;
      procedure Texto_Livre(Str : String); virtual; abstract;
      procedure Texto_Livre_Negrito(Str : String); virtual; abstract;

      procedure ImprimirComCanvas_Spooler(const Memo: TStringList);
  end;

const
  cMargem     = ' ';
  cJustif     = #27#97#51;
  cCentraliza = #27#97#1;
  cEject      = #12;

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

  { Tipo da fonte Bematech }
  cTipoLetraComprimido = 1;
  cTipoLetraNormal     = 2;
  cTipoLetraElite      = 3;

implementation

{ TEcfAgil }

constructor TEcfAgil.Create;
begin
  inherited Create;
  Texto_Cupom := TStringList.Create;
  myPrinter   := Printer;
end;

function TEcfAgil.Alinhar_Direita(Esp: Integer; Str: String): String;
var
  i   ,
  tam ,
  res : Integer;
  cmp : String;
begin
  tam := Length(Trim(Str));
  res := Esp - tam;
  cmp := StringOfChar(' ', res);
//  Result := Copy(cmp + Trim(Str), 1, Num_Colunas);
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
  res := Esp - tam;
  cmp := StringOfChar(' ', res);
//  Result := Copy(Trim(Str) + cmp, 1, Num_Colunas);
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
//  Result := Copy(cmp + Trim(Str), 1, Num_Colunas);
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

destructor TEcfAgil.Destroy;
begin
  try
    if (Texto_Cupom <> nil) then
      Texto_Cupom.Free;

    CloseFile(f_conteudo_imp);
  except
  end;

  inherited;
end;

procedure TEcfAgil.ImprimirComCanvas_Spooler(const Memo: TStringList);
const
  cEspacoLinha = 5;
  cMargemSuperior = 50;
  cMargemEsquerda = 30;

  TAG_NEGRITO = '\n';
var
  AlturaLinha, Y, I: integer;
  sLinha : Array[0..1] of String;
begin
  AlturaLinha := Printer.Canvas.TextHeight('Tg');

  Y := cMargemSuperior;
  for I := 0 to Memo.Count - 1 do begin

    if Y > myPrinter.PageHeight then
    begin
      myPrinter.NewPage;
      Y := cMargemSuperior;
    end;

    sLinha[0] := Memo[I];
    sLinha[1] := EmptyStr;

    if Copy(sLinha[0], 1, 2) = TAG_NEGRITO then
    begin
      Self.Compactar_Fonte;
      sLinha[0] := Copy(sLinha[0], 3, Length(sLinha[0]));
    end
    else
      Self.Descompactar_Fonte;

    // Quebrar de linha
    
    if Length(Trim(sLinha[0])) > Num_Colunas then
    begin
      sLinha[1] := Copy(Trim(sLinha[0]), Num_Colunas, Num_Colunas);
      sLinha[0] := Copy(Trim(sLinha[0]), 1, Num_Colunas - 1) + '-';
    end;

    myPrinter.Canvas.TextOut(cMargemEsquerda, Y, sLinha[0]);
    Y := Y + AlturaLinha + cEspacoLinha;

    if (Trim(sLinha[1]) <> EmptyStr) then
    begin
      myPrinter.Canvas.TextOut(cMargemEsquerda, Y, sLinha[1]);
      Y := Y + AlturaLinha + cEspacoLinha;
    end;
  end;

end;

end.
