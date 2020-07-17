unit Interacao.Tabela;

interface

uses
  System.Classes, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  ITabela = interface
    ['{85A93449-3220-44BE-84AD-494B50B9C170}']
    function Tabela(aDataSet : TFDDataSet) : ITabela;
    function Display(aKey, aValue : String) : ITabela; overload;
    function Display(aKey, aValue, aFormato : String) : ITabela; overload;
    function Display(aKey, aValue, aFormato : String; aAlinhamento : TAlignment) : ITabela; overload;
    function Display(aKey, aValue : String; aAlinhamento : TAlignment) : ITabela; overload;

    procedure Configurar(aDataSet : TFDDataSet);
  end;

implementation

end.
