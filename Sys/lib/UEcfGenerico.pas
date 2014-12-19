unit UEcfGenerico;

interface

Uses
  SysUtils, StrUtils, Classes, UEcfAgil, UFuncoes;

  Type
    TEcfGenerico = class(TEcfAgil)
    private
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
  end;

implementation

{ TEcfGenerico }

procedure TEcfGenerico.Abrir_Gaveta;
begin
  ;
end;

procedure TEcfGenerico.Assinar_Vendedor(Nome: String);
const
   ln : String = '.............................................................';
begin
  Self.Pular_Linha(1);

  Writeln( Corpo_Cupom, cMargem + 'Vendedor: ' + RemoveAcentos(Copy(ln, 1, Num_Colunas - Length(cMargem) - 10)) );
  Writeln( Corpo_Cupom, cMargem + '          ' + Centralizar(Num_Colunas - Length(cMargem) - 10, RemoveAcentos(Nome)) );
end;

procedure TEcfGenerico.Compactar_Fonte;
begin
  Write(Corpo_Cupom, c17cpi);
end;

constructor TEcfGenerico.Criar(sDll, sNomeImpressora : String; iModeloEspecifico : Integer; sPorta, sEmp, sEndereco, sBairro,
  sFone, sCep, sCid, sCnpj, sInscEstadual, sID, sArquivoLogotipo: String; bImp_Gliche: Boolean);
begin
  Self.Create;

  Num_Colunas      := 80;
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

  AssignFile(Corpo_Cupom, Porta);
  Rewrite(Corpo_Cupom);

  Gliche(bImp_Gliche);
end;

procedure TEcfGenerico.Descompactar_Fonte;
begin
  Write(Corpo_Cupom, c10cpi);
end;

procedure TEcfGenerico.Desconto(Valor: String);
begin
  Writeln( Corpo_Cupom, cMargem + 'Desconto: ' + Alinhar_Direita(Num_Colunas - 11, Valor) );
end;

procedure TEcfGenerico.Emitir_Cupom_Conv(Emitir: Boolean; Convenio,
  Conveniado, Valor: String);
var
  dh : String;
begin
  if Emitir then begin
    //Aviso('PICOTE O CUPOM !!!');
    Self.Gliche(True);

    dh := FormatDateTime('dd/MM/yy hh:mm:ss', Now);
    
    Write  ( Corpo_Cupom, cMargem + dh );
    Writeln( Corpo_Cupom, Alinhar_Direita(Num_Colunas - Length(dh + cMargem), 'COD: ' + ID_Venda) );
    Writeln( Corpo_Cupom, c12cpi + cINegrito + cIExpandido +
                          Centralizar(Round(Num_Colunas / 2), 'VENDA CONVENIO')  +
                          cFExpandido + cFNegrito );
    Self.Compactar_Fonte;

    Self.Linha;
    Writeln( Corpo_Cupom, cMargem + 'Convenio:   ' + Alinhar_Esquerda(Num_Colunas - 13, RemoveAcentos(Convenio)) );
    Writeln( Corpo_Cupom, cMargem + 'Conveniado: ' + Alinhar_Esquerda(Num_Colunas - 13, RemoveAcentos(Conveniado)) );
    Self.Pular_Linha(2);
    
    Write  ( Corpo_Cupom, c12cpi + cINegrito + cIExpandido +
                         cMargem + 'TOTAL DEBITO R$ ' +
                         cFExpandido + cFNegrito);
    Writeln(Corpo_Cupom, c12cpi + cINegrito + cIExpandido +
                         Alinhar_Direita(Round(Num_Colunas / 2) - 17, Valor)  +
                         cFExpandido + cFNegrito);
    Self.Compactar_Fonte;
    Self.Pular_Linha(3);

    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, '----------------------------------------') );
    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, Conveniado) );

    Self.Pular_Linha(5);
  end;
end;

procedure TEcfGenerico.Finalizar;
begin
  Self.Linha;

  Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, RemoveAcentos(SoftHouse)) );
  Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, RemoveAcentos(Sistema)) );
  Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, 'Versao ' + Versao) );

  Writeln( Corpo_Cupom, ' *' );
  Writeln( Corpo_Cupom, ' *' );
  Writeln( Corpo_Cupom, ' *' );

  CloseFile(Corpo_Cupom);
end;

procedure TEcfGenerico.Gliche(Imprimir: Boolean);
const
  EMP_IDENTIF  = 'CNPJ: %s IE: %s';
begin
  Self.Compactar_Fonte;

  if Imprimir then begin
    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, RemoveAcentos(Nome_Empresa)) );
    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, RemoveAcentos(Endereco)) );
    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, RemoveAcentos(Bairro)) );
    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, RemoveAcentos(Cep + ' - ' + Cidade)) );
    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, RemoveAcentos(Fone)) );
    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, Format(EMP_IDENTIF, [CNPJ, Insc_Estadual])) );
    Self.Linha;
  end;
end;

procedure TEcfGenerico.Identifica_Cupom(Data: TDateTime; sID, sNomeVendedor: String);
var
  dh : String;
begin
  dh := FormatDateTime('dd/MM/yy hh:mm:ss', Data);
  ID_Venda := sID;
  Write  ( Corpo_Cupom, cMargem + dh);
  Writeln( Corpo_Cupom, Alinhar_Direita(Num_Colunas - Length(dh + cMargem), 'COD: ' + ID_Venda) );

  NomeVendedor := RemoveAcentos(Trim(sNomeVendedor));

  if NomeVendedor <> EmptyStr then
  begin
    Write  ( Corpo_Cupom, cMargem + 'Vendedor(a) : ');
    Writeln( Corpo_Cupom, Alinhar_Esquerda(Num_Colunas - 15, NomeVendedor) );
  end;
  Self.Linha;
end;

procedure TEcfGenerico.Incluir_Forma_Pgto(Descricao, Valor: String);
begin
  if (Length(Trim(Descricao)) <> 0) then begin
    Write  ( Corpo_Cupom, cMargem + Alinhar_Esquerda(24, Descricao) );
    Writeln( Corpo_Cupom, Alinhar_Direita(Num_Colunas - 25, Valor) );
  end;
end;

procedure TEcfGenerico.Incluir_Item(Item, Codigo, Descricao, Quant,
  V_Unitario, ST, Total_Item: String);
var
  esp_desc : Integer;
begin
  esp_desc := Num_Colunas - 18;

  Write  ( Corpo_Cupom, cMargem + Alinhar_Esquerda(3, Item) );
  Write  ( Corpo_Cupom, Alinhar_Esquerda(14, Codigo) );
  Writeln( Corpo_Cupom, Alinhar_Esquerda(esp_desc, Copy(RemoveAcentos(Descricao), 1, esp_desc)) );

  Write  ( Corpo_Cupom, cMargem + Alinhar_Direita(9, Quant) );
  Write  ( Corpo_Cupom, ' x ' );     // 3
  Write  ( Corpo_Cupom, Alinhar_Direita(9, V_Unitario) );
  Write  ( Corpo_Cupom, Alinhar_Direita(9, ST) );
  Writeln( Corpo_Cupom, Alinhar_Direita(Num_Colunas - 31, Total_Item) );
end;

procedure TEcfGenerico.SubTotalVenda(Valor: String; const LinhaSobre : Boolean);
begin
  if LinhaSobre then
    Writeln( Corpo_Cupom, c12cpi + cINegrito +
                          Alinhar_Direita(Num_Colunas - 2, '----------------')  +
                          cFNegrito );
                          
  Write  ( Corpo_Cupom, c12cpi + cINegrito + cMargem +
                        'Subtotal R$ ' +
                        cFNegrito );
  Writeln( Corpo_Cupom, c12cpi + cINegrito + cIExpandido +
                        Alinhar_Direita(Round(Num_Colunas / 2) - 13, Valor)  +
                        cFExpandido + cFNegrito );
  Self.Compactar_Fonte;
end;

procedure TEcfGenerico.TotalVenda(Valor: String);
begin
  Write  ( Corpo_Cupom, c12cpi + cINegrito + cIExpandido + cMargem +
                        'TOTAL R$ ' +
                        cFExpandido + cFNegrito );
  Writeln( Corpo_Cupom, c12cpi + cINegrito + cIExpandido +
                        Alinhar_Direita(Round(Num_Colunas / 2) - 13, Valor)  +
                        cFExpandido + cFNegrito );
  Self.Compactar_Fonte;
end;

procedure TEcfGenerico.TotalCaixa(Valor: String);
begin
  Write  ( Corpo_Cupom, c12cpi + cINegrito + cIExpandido + cMargem +
                        'CAIXA R$ ' +
                        cFExpandido + cFNegrito );
  Writeln( Corpo_Cupom, c12cpi + cINegrito + cIExpandido +
                        Alinhar_Direita(Round(Num_Colunas / 2) - 13, Valor)  +
                        cFExpandido + cFNegrito );
  Self.Compactar_Fonte;
end;

procedure TEcfGenerico.Linha;
begin
  Writeln( Corpo_Cupom, cMargem + Divisor('-') );
end;

procedure TEcfGenerico.MSG_Cupom(Msg1, Msg2, Msg3: String);
begin
  if (Length(Trim(Msg1)) <> 0) then
    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, Msg1) );

  if (Length(Trim(Msg2)) <> 0) then
    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, Msg2) );

  if (Length(Trim(Msg3)) <> 0) then
    Writeln( Corpo_Cupom, cMargem + Centralizar(Num_Colunas, Msg3) );
end;

procedure TEcfGenerico.Pular_Linha(Num: Integer);
var
  i : Integer;
begin
  for i := 1 to Num do
    Writeln( Corpo_Cupom, EmptyStr );
end;

procedure TEcfGenerico.Texto_Livre(Str: String);
begin
  Self.Compactar_Fonte;
  Writeln( Corpo_Cupom, cMargem + Str );
end;

procedure TEcfGenerico.Titulo_Cupom(Str: String);
begin
  Writeln( Corpo_Cupom, c12cpi + cINegrito + cIExpandido +
                       cMargem + Centralizar(Round(Num_Colunas / 2), Str)  +
                       cFExpandido + cFNegrito );
  Self.ImprimirCabecalho;
  Self.Linha;
end;

procedure TEcfGenerico.Titulo_Livre(Str: String);
begin
  Writeln( Corpo_Cupom, c12cpi + cINegrito + cIExpandido +
                        cMargem + Centralizar(Round(Num_Colunas / 2), Str)  +
                        cFExpandido + cFNegrito );
  Self.Compactar_Fonte;
end;

procedure TEcfGenerico.Troco(Valor: String);
begin
  Writeln( Corpo_Cupom, cMargem + 'TROCO         : ' + Alinhar_Direita(Num_Colunas - 17, Valor) );
end;

procedure TEcfGenerico.Valor_Recebido(Valor: String);
begin
  Writeln( Corpo_Cupom, cMargem + 'VALOR RECEBIDO: ' + Alinhar_Direita(Num_Colunas - 17, Valor) );
end;

procedure TEcfGenerico.Identifica_Consumidor(sCNPJ_CPF, sNome,
  sEndereco: String);
begin
  Self.Compactar_Fonte;

  Writeln( Corpo_Cupom, c12cpi + cIExpandido +
                       cMargem + Centralizar(Round(Num_Colunas / 2), 'CONSUMIDOR')  +
                       cFExpandido );
  Write  ( Corpo_Cupom, cMargem + Alinhar_Esquerda(10, 'CNPJ/CPF: ') );
  Writeln( Corpo_Cupom, cMargem + Alinhar_Esquerda(Num_Colunas - 10, sCNPJ_CPF) );
  Write  ( Corpo_Cupom, cMargem + Alinhar_Esquerda(06, 'NOME: ') );
  Writeln( Corpo_Cupom, cMargem + Alinhar_Esquerda(Num_Colunas - 06, sNome) );
  Write  ( Corpo_Cupom, cMargem + Alinhar_Esquerda(10, 'Endereco: ') );
  Writeln( Corpo_Cupom, cMargem + Alinhar_Esquerda(Num_Colunas - 10, sEndereco) );
  Self.Linha;
end;

procedure TEcfGenerico.Texto_Livre_Negrito(Str: String);
begin
  Self.Compactar_Fonte;
  Writeln( Corpo_Cupom, cINegrito + cMargem + Str + cFNegrito);
end;

procedure TEcfGenerico.Incluir_Texto_Valor(Descricao, Valor: String);
begin
  if (Length(Trim(Descricao)) <> 0) then begin
    Write  ( Corpo_Cupom, cMargem + Alinhar_Esquerda(24, Descricao) );
    Writeln( Corpo_Cupom, Alinhar_Direita(Num_Colunas - 25, Valor) );
  end;
end;

procedure TEcfGenerico.ImprimirCabecalho;
begin
  Self.Compactar_Fonte;

  Write  ( Corpo_Cupom, cMargem + Alinhar_Esquerda(7, 'ITEM') );
  Write  ( Corpo_Cupom, Alinhar_Esquerda(10, 'CODIGO') );
  Writeln( Corpo_Cupom, Alinhar_Esquerda(20, 'DESCRICAO') );

  Write  ( Corpo_Cupom, cMargem + Alinhar_Direita(20, 'QTD x UNITARIO') );
  Write  ( Corpo_Cupom, Alinhar_Direita(10, 'ST') );
  Writeln( Corpo_Cupom, Alinhar_Direita(Num_Colunas - 31, 'VALOR (R$)') );
end;

procedure TEcfGenerico.Titulo_Cupom_DANFE(sTitulo1, sTitulo2,
  sTitulo3, sTitulo4: String);
begin
  Writeln( Corpo_Cupom, c12cpi + cIExpandido +
                       cMargem + Centralizar(Round(Num_Colunas / 2), sTitulo1)  +
                       cFExpandido );
  Writeln( Corpo_Cupom, c12cpi + cINegrito +
                       cMargem + Centralizar(Round(Num_Colunas / 2), sTitulo2)  +
                       cFNegrito );
  Writeln( Corpo_Cupom, c12cpi + cINegrito +
                       cMargem + Centralizar(Round(Num_Colunas / 2), sTitulo3)  +
                       cFNegrito );
  Writeln( Corpo_Cupom, c12cpi + cINegrito +
                       cMargem + Centralizar(Round(Num_Colunas / 2), sTitulo4)  +
                       cFNegrito );

  Self.Linha;
  Self.ImprimirCabecalho;
  Self.Linha;
end;

end.
