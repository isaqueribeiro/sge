unit EcfGenerico;

interface

Uses
  SysUtils, StrUtils, Classes, EcfAgil;

  Type
    TEcfGenerico = class(TEcfAgil)
    private

    public
      constructor Criar(Colunas : Integer; Dll, Porta, Emp, Ender, FoneCep, Cid, Cnpj_Insc, ID : String; Imp_Gliche : Boolean); virtual; abstract;

      procedure Compactar_Fonte; override;
      procedure Descompactar_Fonte; override;

      procedure Gliche(Imprimir : Boolean); override;
      procedure Incluir_Item(Item, Codigo, Descricao, Quant, V_Unitario, ST, Total_Item : String); override;
      procedure Incluir_TotalVenda(Valor : String); override;
      procedure Incluir_TotalCaixa(Valor : String); override;
      procedure Incluir_Forma_Pgto(Descricao, Valor : String); override;
      procedure Desconto(Valor : String); override;
      procedure Valor_Recebido(Valor : String); override;
      procedure Troco(Valor : String); override;
      procedure MSG_Cupom(Msg1, Msg2, Msg3 : String); override;
      procedure Emitir_Cupom_Conv(Emitir : Boolean; Convenio, Conveniado, Valor : String); override;
      procedure Titulo_Cupom(Str : String); override;
      procedure Identifica_Cupom(Data : TDateTime; ID : String); override;
      procedure Linha; override;
      procedure Pular_Linha(Num : Integer); override;
      procedure Finalizar; override;
      procedure Abrir_Gaveta; override;
      procedure Assinar_Vendedor(Nome : String); override;
      procedure Titulo_Livre(Str : String); override;
      procedure Texto_Livre(Str : String); override;
  end;

implementation

{ TEcfGenerico }

procedure TEcfGenerico.Compactar_Fonte;
begin
  ;
end;

end.
