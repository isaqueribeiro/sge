unit UEcfBematechNaoFiscal;

interface

Uses
  SysUtils, StrUtils, Classes, Printers, Graphics, UEcfAgil, UFuncoes;

  Type
    TEcfBematechNaoFiscal = class(TEcfAgil)
    private

    public
      constructor Criar(sDll, sNomeImpressora : String; iModeloEspecifico : Integer;
        sPorta, sEmp, sEndereco, sBairro, sFone, sCep, sCid, sCnpj, sInscEstadual, sID, sArquivoLogotipo : String; bImp_Gliche : Boolean); override;

      procedure Compactar_Fonte; override;
      procedure Descompactar_Fonte; override;

      procedure Gliche(Imprimir : Boolean); override;
      procedure Incluir_Item(Item, Codigo, Descricao, Quant, V_Unitario, ST, Total_Item : String); override;
      procedure Incluir_Forma_Pgto(Descricao, Valor : String); override;
      procedure SubTotalVenda(Valor : String; const LinhaSobre : Boolean); override;
      procedure Desconto(Valor : String); override;
      procedure TotalVenda(Valor : String); override;
      procedure TotalCaixa(Valor : String); override;
      procedure Valor_Recebido(Valor : String); override;
      procedure Troco(Valor : String); override;
      procedure MSG_Cupom(Msg1, Msg2, Msg3 : String); override;
      procedure Emitir_Cupom_Conv(Emitir : Boolean; Convenio, Conveniado, Valor : String); override;
      procedure Titulo_Cupom(Str : String); override;
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

{ TEcfBematechNaoFiscal }

procedure TEcfBematechNaoFiscal.Abrir_Gaveta;
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Assinar_Vendedor(Nome: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Compactar_Fonte;
begin
  inherited;

end;

constructor TEcfBematechNaoFiscal.Criar(sDll, sNomeImpressora : String; iModeloEspecifico : Integer; sPorta,
  sEmp, sEndereco, sBairro, sFone, sCep, sCid, sCnpj, sInscEstadual,
  sID, sArquivoLogotipo : String; bImp_Gliche: Boolean);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Descompactar_Fonte;
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Desconto(Valor: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Emitir_Cupom_Conv(Emitir: Boolean;
  Convenio, Conveniado, Valor: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Finalizar;
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Gliche(Imprimir: Boolean);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Identifica_Consumidor(sCNPJ_CPF, sNome,
  sEndereco: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Identifica_Cupom(Data: TDateTime; sID,
  sNomeVendedor: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Incluir_Forma_Pgto(Descricao,
  Valor: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Incluir_Item(Item, Codigo, Descricao,
  Quant, V_Unitario, ST, Total_Item: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Linha;
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.MSG_Cupom(Msg1, Msg2, Msg3: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Pular_Linha(Num: Integer);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.SubTotalVenda(Valor: String;
  const LinhaSobre: Boolean);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Texto_Livre(Str: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Texto_Livre_Negrito(Str: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Titulo_Cupom(Str: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Titulo_Livre(Str: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.TotalCaixa(Valor: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.TotalVenda(Valor: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Troco(Valor: String);
begin
  inherited;

end;

procedure TEcfBematechNaoFiscal.Valor_Recebido(Valor: String);
begin
  inherited;

end;

end.
