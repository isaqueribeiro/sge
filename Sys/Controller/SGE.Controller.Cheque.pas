unit SGE.Controller.Cheque;

interface

uses
  Data.DB,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table (Cadastro de Cheques)
  TControllerCheque = class(TController, IControllerCheque)
    private
      FBaixas : IModelDAOCustom;
      procedure CNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCheque;

      function CarregarBaixas : IControllerCheque; overload;
      function CarregarBaixas(aNumeroControle : Integer) : IControllerCheque; overload;
      function Baixas : IModelDAOCustom;
  end;

  // View (Tipos de Cheque)
  TControllerTipoChequeView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerCheque }

uses Service.Utils;

constructor TControllerCheque.Create;
begin
  inherited Create(TModelDAOFactory.New.Cheque);
end;

destructor TControllerCheque.Destroy;
begin
  inherited;
end;

class function TControllerCheque.New: IControllerCheque;
begin
  Result := Self.Create;
end;

function TControllerCheque.CarregarBaixas(aNumeroControle: Integer): IControllerCheque;
begin
  Result := Self;

  if (not Assigned(FBaixas)) then
  begin
    FBaixas := TModelDAOFactory.New.Busca;

    FBaixas
      .Clear
      .SQL('Select ')
      .SQL('    ''CP - Contas A Pagar'' as tipo ')
      .SQL('  , pb.anolanc || ''/'' || right(''0000000'' || pb.numlanc, 7) as lancamento ')
      .SQL('  , pb.anolanc ')
      .SQL('  , pb.numlanc ')
      .SQL('  , pb.seq     ')
      .SQL('  , pb.data_pagto  ')
      .SQL('  , pb.valor_baixa ')
      .SQL('  , pb.documento_baixa ')
      .SQL('  , pb.usuario ')
      .SQL('  , fc.nomeforn      as nome ')
      .SQL('  , fc.cnpj          as nome_cnpj ')
      .SQL('  , fc.pessoa_fisica as nome_pf ')
      .SQL('from TBCONTPAG_BAIXA pb ')
      .SQL('  inner join TBCONTPAG cp on (cp.anolanc = pb.anolanc and cp.numlanc = pb.numlanc) ')
      .SQL('  inner join TBFORNECEDOR fc on (fc.codforn = cp.codforn) ')
      .SQL('where (pb.controle_cheque = :controle) ')
      .SQL(' ')
      .SQL('union ')
      .SQL(' ')
      .SQL('Select ')
      .SQL('    ''CR - Contas A Receber'' as tipo ')
      .SQL('  , pr.anolanc || ''/'' || right(''0000000'' || pr.numlanc, 7) as lancamento ')
      .SQL('  , pr.anolanc ')
      .SQL('  , pr.numlanc ')
      .SQL('  , pr.seq     ')
      .SQL('  , pr.data_pagto  ')
      .SQL('  , pr.valor_baixa ')
      .SQL('  , pr.documento_baixa ')
      .SQL('  , pr.usuario ')
      .SQL('  , cc.nome          as nome ')
      .SQL('  , cc.cnpj          as nome_cnpj ')
      .SQL('  , cc.pessoa_fisica as nome_pf ')
      .SQL('from TBCONTREC_BAIXA pr ')
      .SQL('  inner join TBCONTREC cr on (cr.anolanc = pr.anolanc and cr.numlanc = pr.numlanc) ')
      .SQL('  inner join TBCLIENTE cc on (cc.codigo = cr.cliente) ')
      .SQL('where (pr.controle_cheque = :controle) ')
      .OrderBy('6') // data_pagto
      .OrderBy('2') // lancamento
  end;

  FBaixas
    .ParamsByName('controle', aNumeroControle)
    .Open;

  FBaixas.DataSet.FieldByName('nome_cnpj').OnGetText := CNPJGetText;
end;

procedure TControllerCheque.CNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if TServicesUtils.StrIsCPF(Sender.AsString) then
      Text := TServicesUtils.StrFormatarCpf(Sender.AsString)
    else
      Text := TServicesUtils.StrFormatarCnpj(Sender.AsString);
  end;
end;

function TControllerCheque.CarregarBaixas: IControllerCheque;
begin
  Result := Self.CarregarBaixas(FDAO.DataSet.FieldByName('controle').AsInteger);
end;

function TControllerCheque.Baixas: IModelDAOCustom;
begin
  if (not Assigned(FBaixas)) then
    Self.CarregarBaixas;

  Result := FBaixas;
end;

{ TControllerTipoChequeView }

constructor TControllerTipoChequeView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoChequeView);
end;

destructor TControllerTipoChequeView.Destroy;
begin
  inherited;
end;

class function TControllerTipoChequeView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
