unit Interfaces.PrevisaoTempo;

interface

type
  TCidadePrevisaoTempo = record
    Id : Integer;
    Nome : String;
    UF : String;
  end;

  IPrevisaoTempo = interface
    ['{C1F2D87D-6C8F-4935-92D9-F1F24DF69AFE}']
    function Cidade(Value : TCidadePrevisaoTempo) : IPrevisaoTempo; overload;
    function Cidade : TCidadePrevisaoTempo; overload;

    function GetCidade(var aCidade : TCidadePrevisaoTempo; out aRetornoXML : String) : IPrevisaoTempo;
  end;

implementation

end.
