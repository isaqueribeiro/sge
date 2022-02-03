unit SGE.Model.DAO.Query.Cliente;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOQueryCliente = class(TModelDAO, IModelDAOQuery)
    private

    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOQuery;
  end;

implementation

{ TModelDAOQueryCliente }

constructor TModelDAOQueryCliente.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select                         ')
        .Add('    cl.Codigo                  ')
        .Add('  , cl.Pessoa_fisica           ')
        .Add('  , cl.Cnpj                    ')
        .Add('  , cl.Tipo                    ')
        .Add('  , cl.Nome                    ')
        .Add('  , cl.NomeFant                ')
        .Add('  , cl.Inscest                 ')
        .Add('  , cl.Inscmun                 ')
        .Add('  , cl.Ender                   ')
        .Add('  , cl.Complemento             ')
        .Add('  , cl.Numero_end              ')
        .Add('  , cl.Bairro                  ')
        .Add('  , cl.Cep                     ')
        .Add('  , cl.Cidade                  ')
        .Add('  , cl.Uf                      ')
        .Add('  , cl.Fone                    ')
        .Add('  , cl.FoneCel                 ')
        .Add('  , cl.FoneComerc              ')
        .Add('  , cl.Tlg_tipo                ')
        .Add('  , cl.Log_cod                 ')
        .Add('  , cl.Bai_cod                 ')
        .Add('  , cl.Cid_cod                 ')
        .Add('  , cl.Est_cod                 ')
        .Add('  , cl.Email                   ')
        .Add('  , cl.Site                    ')
        .Add('  , cl.Pais_id                 ')
        .Add('  , cl.Valor_limite_compra     ')
        .Add('  , cl.Vendedor_cod            ')
        .Add('  , cl.DtCad                   ')
        .Add('  , cl.Bloqueado               ')
        .Add('  , cl.Bloqueado_data          ')
        .Add('  , cl.Bloqueado_motivo        ')
        .Add('  , cl.Bloqueado_usuario       ')
        .Add('  , cl.Bloqueado_automatico    ')
        .Add('  , cl.DesBloqueado_data       ')
        .Add('  , cl.Usuario                 ')
        .Add('  , cl.emitir_nfe_devolucao    ')
        .Add('  , cl.custo_oper_percentual   ')
        .Add('  , cl.custo_oper_frete        ')
        .Add('  , cl.custo_oper_outros       ')
        .Add('  , cl.entrega_fracionada_venda')
        .Add('  , cl.banco					         ')
        .Add('  , cl.agencia                 ')
        .Add('  , cl.cc                      ')
        .Add('  , cl.praca                   ')
        .Add('  , cl.banco_2                 ')
        .Add('  , cl.agencia_2               ')
        .Add('  , cl.cc_2                    ')
        .Add('  , cl.praca_2                 ')
        .Add('  , cl.banco_3                 ')
        .Add('  , cl.agencia_3               ')
        .Add('  , cl.cc_3                    ')
        .Add('  , cl.praca_3                 ')
        .Add('  , cl.observacao              ')
        .Add('  , cl.ativo                   ')
        .Add('  , coalesce( cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '' '', '''') || l.Log_nome as varchar(250)), cl.Ender ) as Logradouro')
        .Add('  , coalesce(c.Cid_nome, cl.Cidade) as Cid_nome')
        .Add('  , coalesce(u.Est_nome, cl.Uf) as Est_nome    ')
        .Add('  , p.Pais_nome                                ')
        .Add('  , coalesce(est.produtos,  0) as produtos     ')
        .Add('  , coalesce(est.valores, 0.0) as valores      ')
        .Add('from TBCLIENTE cl                              ')
        .Add('  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = cl.Tlg_tipo)')
        .Add('  left join TBLOGRADOURO l on (l.Log_cod = cl.Log_cod)      ')
        .Add('  left join TBCIDADE c on (c.Cid_cod = cl.Cid_cod)          ')
        .Add('  left join TBESTADO u on (u.Est_cod = cl.Est_cod)          ')
        .Add('  left join TBPAIS p on (p.Pais_id = cl.Pais_id)            ')
        .Add('  left join (                                               ')
        .Add('    Select                                                  ')
        .Add('        x.cod_cliente                                       ')
        .Add('      , count(x.cod_produto) as produtos                    ')
        .Add('      , sum(x.quantidade * x.valor_medio) as valores        ')
        .Add('    from TBCLIENTE_ESTOQUE x                                ')
        .Add('    where (x.cod_cliente <> 1)                              ')
        .Add('      and (x.quantidade > 0.0)                              ')
        .Add('    group by                                                ')
        .Add('        x.cod_cliente                                       ')
        .Add('  ) est on (est.cod_cliente = cl.codigo)                    ')
      .&End
    .Close;
end;

destructor TModelDAOQueryCliente.Destroy;
begin
  inherited;
end;

class function TModelDAOQueryCliente.New: IModelDAOQuery;
begin
  Result := Self.Create;
end;

end.
