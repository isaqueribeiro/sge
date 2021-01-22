unit SGE.Model.Dados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.VCLUI.Wait, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Phys.IBBase, FireDAC.Phys.IB;

type
  TDMDados = class(TDataModule)
    FConn: TFDConnection;
    FIBDriverLink: TFDPhysIBDriverLink;
    FBDriverLink: TFDPhysFBDriverLink;
    FTransaction: TFDTransaction;
    FWaitCursor: TFDGUIxWaitCursor;
    FScripts: TFDScript;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDados: TDMDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
