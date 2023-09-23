execute block
as
  declare variable codigo DMN_INTEGER_N;
  declare variable login DMN_USUARIO;
begin
  Select
    max(usr.codigo)
  from TBUSERS usr
  Into
    codigo;

  codigo = coalesce(:codigo, 0) + 1;

  for
    Select
      usr.nome
    from TBUSERS usr
    where (coalesce(usr.codigo, 0) = 0)
    Order by
      usr.nome
    Into
      login
  do
  begin
    Update TBUSERS usr Set
      usr.codigo = :codigo
    where (usr.nome = :login)
      and (coalesce(usr.codigo, 0) = 0);

    codigo = (:codigo + 1);
  end
end