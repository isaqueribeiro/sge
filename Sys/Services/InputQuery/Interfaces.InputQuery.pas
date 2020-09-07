unit Interfaces.InputQuery;

interface

uses
  System.Classes;

type
  TProcedureValidationPrompt = procedure (Sender: TObject; var Key: Char) of object;
  TProcedureConfirmationPrompt = procedure (Sender: TObject) of object;

  IViewInputQuery = interface
    ['{95CCF51B-2C2B-4889-AA5F-818169C5312C}']
    function CaptionForm(aTexto : String) : IViewInputQuery;
    function LabelPrompt(aTexto : String) : IViewInputQuery;
    function AlignmentPrompt(aAlinhamento : TAlignment) : IViewInputQuery;
    function ProcedureValidationPrompt(aEvent : TProcedureValidationPrompt) : IViewInputQuery;
    function ProcedureConfirmationPrompt(aEvent : TProcedureConfirmationPrompt) : IViewInputQuery;
    function ShowForm(var aRetorno : String) : Boolean; overload;
    function ShowForm(var aRetorno : Integer) : Boolean; overload;
  end;

implementation

end.
