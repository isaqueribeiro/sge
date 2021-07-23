unit Interacao.Tabela;

interface

uses
  System.Classes, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  ITabela = interface
    ['{85A93449-3220-44BE-84AD-494B50B9C170}']
    function Tabela(aDataSet : TDataSet) : ITabela; overload;
    function Tabela(aDataSet : TFDDataSet) : ITabela; overload;
    function Display(aKey, aValue : String; const aRequired : Boolean = False) : ITabela; overload;
    function Display(aKey, aValue, aFormato : String; const aRequired : Boolean = False) : ITabela; overload;
    function Display(aKey, aValue, aFormato : String; aAlinhamento : TAlignment; const aRequired : Boolean = False) : ITabela; overload;
    function Display(aKey, aValue : String; aAlinhamento : TAlignment; const aRequired : Boolean = False) : ITabela; overload;

    procedure Configurar; overload;
    procedure Configurar(aDataSet : TDataSet); overload;
    procedure Configurar(aDataSet : TFDDataSet); overload;
  end;

implementation

end.
