unit UEcfWindowsPrinter;

interface

Uses
  SysUtils, StrUtils, Classes, Printers, Graphics, UEcfAgil, UFuncoes;

  Type
    TEcfWindowsPrinter = class(TEcfAgil)
    private
      fArquivoQRCODE : TBitmap;
      procedure ImprimirCabecalho;
    public
      constructor Criar(sDll, sNomeImpressora : String; iModeloEspecifico : Integer;
        sPorta, sEmp, sEndereco, sBairro, sFone, sCep, sCid, sCnpj, sInscEstadual, sID, sArquivoLogotipo : String; bImp_Gliche : Boolean); override;

      procedure Compactar_Fonte; override;
      procedure Descompactar_Fonte; override;

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

{ TEcfWindowsPrinter }

constructor TEcfWindowsPrinter.Criar(sDll, sNomeImpressora: String;
  iModeloEspecifico: Integer; sPorta, sEmp, sEndereco, sBairro, sFone, sCep,
  sCid, sCnpj, sInscEstadual, sID, sArquivoLogotipo : String; bImp_Gliche: Boolean);
begin
  Self.Create;

  Num_Colunas      := 50;
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

  // Definir a impressora de acordo com a configuração
  myPrinter.PrinterIndex := myPrinter.Printers.IndexOf(PChar(NomeImpressora));

  Texto_Cupom.Clear;
  myPrinter.BeginDoc;

  myPrinter.Canvas.Font.Name := 'Courier New';
  myPrinter.Canvas.Font.Size := 8;

  Gliche(bImp_Gliche);
end;

procedure TEcfWindowsPrinter.Compactar_Fonte;
begin
  myPrinter.Canvas.Font.Style := [fsBold];
end;

procedure TEcfWindowsPrinter.Descompactar_Fonte;
begin
  myPrinter.Canvas.Font.Style := [];
end;

procedure TEcfWindowsPrinter.Gliche(Imprimir: Boolean);
const
  EMP_FONE_CEP = 'FONE: %s CEP: %s';
  EMP_IDENTIF  = 'CNPJ: %s IE: %s';
begin
  Texto_Cupom.Clear;

  if Imprimir then begin
    Texto_Cupom.Add( '\n' + Centralizar(Num_Colunas, RemoveAcentos(Nome_Empresa)) );
    Texto_Cupom.Add( Centralizar(Num_Colunas, RemoveAcentos(Endereco)) );
    Texto_Cupom.Add( Centralizar(Num_Colunas, RemoveAcentos(Bairro)) );
    Texto_Cupom.Add( Centralizar(Num_Colunas, RemoveAcentos(Cep + ' - ' + Cidade)) );
    Texto_Cupom.Add( Centralizar(Num_Colunas, RemoveAcentos(Fone)) );
    Texto_Cupom.Add( Centralizar(Num_Colunas, Format(EMP_IDENTIF, [CNPJ, Insc_Estadual])) );
    Self.Linha;
  end;
end;

procedure TEcfWindowsPrinter.Linha;
begin
  Texto_Cupom.Add( Divisor('-') );
end;

procedure TEcfWindowsPrinter.Incluir_Item(Item, Codigo, Descricao, Quant,
  V_Unitario, ST, Total_Item: String);
var
  esp_desc : Integer;
begin
  esp_desc := Num_Colunas - 18;

  Texto_Cupom.Add(
    Alinhar_Esquerda(3, Item)    +
    Alinhar_Esquerda(14, Codigo) +
    Alinhar_Esquerda(esp_desc, Copy(RemoveAcentos(Descricao), 1, esp_desc)) );

  Texto_Cupom.Add(
    Alinhar_Direita(9, Quant) +
    ' x ' +
    Alinhar_Direita(9, V_Unitario) +
    Alinhar_Direita(9, ST) +
    Alinhar_Direita(Num_Colunas - 31, Total_Item) );
end;

procedure TEcfWindowsPrinter.Incluir_Forma_Pgto(Descricao, Valor: String);
begin
  if (Length(Trim(Descricao)) <> 0) then
    Texto_Cupom.Add(
      Alinhar_Esquerda(24, Descricao) +
      Alinhar_Direita(Num_Colunas - 25, Valor) );
end;

procedure TEcfWindowsPrinter.Desconto(Valor: String);
begin
  Texto_Cupom.Add( 'Desconto:' + Alinhar_Direita(Num_Colunas - 10, Valor) );
end;

procedure TEcfWindowsPrinter.Emitir_Cupom_Conv(Emitir: Boolean; Convenio,
  Conveniado, Valor: String);
begin
  if Emitir then
  begin
    Texto_Cupom.Clear;

    Self.Gliche(True);
    Self.Identifica_Cupom(Now, ID_Venda, EmptyStr);
    Self.Titulo_Livre( 'VENDA CONVENIO' );
    Self.Compactar_Fonte;

    Self.Linha;
    Texto_Cupom.Add( 'Convenio:   ' + Alinhar_Esquerda(Num_Colunas - 13, RemoveAcentos(Convenio)) );
    Texto_Cupom.Add( 'Conveniado: ' + Alinhar_Esquerda(Num_Colunas - 13, RemoveAcentos(Conveniado)) );
    Self.Pular_Linha(2);

    Texto_Cupom.Add( '\n' + 'TOTAL DEBITO R$ ' + Alinhar_Direita(Num_Colunas - 17, Valor) );
    Self.Pular_Linha(3);

    Texto_Cupom.Add( Centralizar(Num_Colunas, '----------------------------------------') );
    Texto_Cupom.Add( Centralizar(Num_Colunas, Conveniado) );

    Self.Pular_Linha(5);

    myPrinter.BeginDoc;
    ImprimirComCanvas_Spooler( Texto_Cupom );
    myPrinter.EndDoc;
  end;
end;

procedure TEcfWindowsPrinter.Identifica_Consumidor(sCNPJ_CPF, sNome,
  sEndereco: String);
begin
  Texto_Cupom.Add( '\n' + Centralizar(Num_Colunas, 'CONSUMIDOR') );

  Texto_Cupom.Add( Alinhar_Esquerda(10, 'CNPJ/CPF: ') +
    Alinhar_Esquerda(Num_Colunas - 10, sCNPJ_CPF) );

  Texto_Cupom.Add( Alinhar_Esquerda(06, 'NOME: ') +
    Alinhar_Esquerda(Num_Colunas - 06, sNome) );

  Texto_Cupom.Add( Alinhar_Esquerda(10, 'Endereco: ') +
    Alinhar_Esquerda(Num_Colunas - 10, sEndereco) );

  Self.Linha;
end;

procedure TEcfWindowsPrinter.Identifica_Cupom(Data: TDateTime; sID,
  sNomeVendedor: String);
var
  dh : String;
begin
  dh := FormatDateTime('dd/MM/yy hh:mm:ss', Data);
  ID_Venda := sID;
  Texto_Cupom.Add( '\n' + dh + Alinhar_Direita(Num_Colunas - 18, 'COD: ' + ID_Venda) );

  NomeVendedor := RemoveAcentos(Trim(sNomeVendedor));

  if NomeVendedor <> EmptyStr then
    Texto_Cupom.Add( 'Vendedor(a) : ' + Alinhar_Esquerda(Num_Colunas - 15, NomeVendedor) );

  Self.Linha;
end;

procedure TEcfWindowsPrinter.MSG_Cupom(Msg1, Msg2, Msg3: String);
begin
  if (Length(Trim(Msg1)) <> 0) then
    Texto_Cupom.Add( Centralizar(Num_Colunas, Msg1) );

  if (Length(Trim(Msg2)) <> 0) then
    Texto_Cupom.Add( Centralizar(Num_Colunas, Msg2) );

  if (Length(Trim(Msg3)) <> 0) then
    Texto_Cupom.Add( Centralizar(Num_Colunas, Msg3) );
end;

procedure TEcfWindowsPrinter.SubTotalVenda(Valor: String; const LinhaSobre : Boolean);
begin
  if LinhaSobre then
    Texto_Cupom.Add( '\n' + Alinhar_Direita(Num_Colunas, '----------------') );
    
  Texto_Cupom.Add( '\n' + 'Subtotal R$' + Alinhar_Direita(Num_Colunas - 12, Valor) );
end;

procedure TEcfWindowsPrinter.Titulo_Cupom(Str: String);
begin
  Texto_Cupom.Add( '\n'+ Centralizar(Num_Colunas, Str) );

  Self.ImprimirCabecalho;
  Self.Linha;
end;

procedure TEcfWindowsPrinter.TotalCaixa(Valor: String);
begin
  Texto_Cupom.Add('\n' + 'CAIXA R$ ' + Alinhar_Direita(Num_Colunas - 10, Valor) );
end;

procedure TEcfWindowsPrinter.TotalVenda(Valor: String);
begin
  Texto_Cupom.Add( '\n' + 'TOTAL R$ ' + Alinhar_Direita(Num_Colunas - 10, Valor) );
end;

procedure TEcfWindowsPrinter.Troco(Valor: String);
begin
  Texto_Cupom.Add( 'TROCO         : ' + Alinhar_Direita(Num_Colunas - 17, Valor) );
end;

procedure TEcfWindowsPrinter.Valor_Recebido(Valor: String);
begin
  Texto_Cupom.Add( 'VALOR RECEBIDO: ' + Alinhar_Direita(Num_Colunas - 17, Valor) );
end;

procedure TEcfWindowsPrinter.Abrir_Gaveta;
begin
  ;
end;

procedure TEcfWindowsPrinter.Assinar_Vendedor(Nome: String);
const
   ln : String = '................................................................................';
begin
  Self.Pular_Linha(1);

  Texto_Cupom.Add( 'Vendedor: ' + RemoveAcentos(Copy(ln, 1, Num_Colunas - 10)) );
  Texto_Cupom.Add( '          ' + Centralizar(Num_Colunas - 10, RemoveAcentos(Nome)) );
end;

procedure TEcfWindowsPrinter.Finalizar;
begin
  Self.Linha;

  Texto_Cupom.Add( Centralizar(Num_Colunas, RemoveAcentos(SoftHouse)) );
  Texto_Cupom.Add( Centralizar(Num_Colunas, RemoveAcentos(Sistema)) );
  Texto_Cupom.Add( Centralizar(Num_Colunas, 'Versao ' + Versao) );

  Texto_Cupom.Add( ' *' );
  Texto_Cupom.Add( ' *' );
  Texto_Cupom.Add( ' *' );

  ImprimirComCanvas_Spooler( Texto_Cupom );
  myPrinter.EndDoc;
end;

procedure TEcfWindowsPrinter.Pular_Linha(Num: Integer);
var
  i : Integer;
begin
  for i := 1 to Num do
    Texto_Cupom.Add( EmptyStr );
end;

procedure TEcfWindowsPrinter.Texto_Livre(Str: String);
begin
  Texto_Cupom.Add( Str );
end;

procedure TEcfWindowsPrinter.Titulo_Livre(Str: String);
begin
  Texto_Cupom.Add( '\n' + Centralizar(Num_Colunas, Str) );
end;

procedure TEcfWindowsPrinter.Texto_Livre_Negrito(Str: String);
begin
  Self.Texto_Livre( '\n' + Str );
end;

procedure TEcfWindowsPrinter.Incluir_Texto_Valor(Descricao, Valor: String);
begin
  if (Length(Trim(Descricao)) <> 0) then
    Texto_Cupom.Add(
      Alinhar_Esquerda(24, Descricao) +
      Alinhar_Direita(Num_Colunas - 25, Valor) );
end;

procedure TEcfWindowsPrinter.Titulo_Cupom_DANFE(sTitulo1, sTitulo2, sTitulo3, sTitulo4: String);
begin
  Texto_Cupom.Add( '\n'+ Centralizar(Num_Colunas, sTitulo1) );
  Texto_Cupom.Add( Centralizar(Num_Colunas, sTitulo2) );
  Texto_Cupom.Add( Centralizar(Num_Colunas, sTitulo3) );
  Texto_Cupom.Add( Centralizar(Num_Colunas, sTitulo4) );

  Self.Linha;
  Self.ImprimirCabecalho;
  Self.Linha;
end;

procedure TEcfWindowsPrinter.ImprimirCabecalho;
begin
  Texto_Cupom.Add(
    Alinhar_Esquerda( 7, 'ITEM') +
    Alinhar_Esquerda(10, 'CODIGO') +
    Alinhar_Esquerda(20, 'DESCRICAO') );

  Texto_Cupom.Add( Alinhar_Direita(20, 'QTD x UNITARIO') +
    Alinhar_Direita(10, 'ST') +
    Alinhar_Direita(Num_Colunas - 30, 'VALOR(R$)') );
end;

procedure TEcfWindowsPrinter.Texto_Livre_Centralizado(Str: String);
begin
  Texto_Cupom.Add( Centralizar(Num_Colunas, Str) );
end;

procedure TEcfWindowsPrinter.ImprimirQRCode(
  const ArquivoBmpQRCode: String);
begin
  fArquivoQRCODE := TBitmap.Create;
  fArquivoQRCODE.LoadFromFile( ArquivoBmpQRCode );

  if (fArquivoQRCODE.Height > 0) then
  begin
    QRCode := Trim(ArquivoBmpQRCode);
    Texto_Cupom.Add( cTagQRCode );
  end;
end;

end.
