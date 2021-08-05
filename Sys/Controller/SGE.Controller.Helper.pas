unit SGE.Controller.Helper;

interface

uses
  System.SysUtils,
  Data.DB,
  Vcl.DBCtrls,
  SGE.Controller,
  SGE.Controller.Interfaces;

type
  TControllerHelper = class Helper for TController
    private
    public
      procedure LookupComboBox(aControl : TDBLookupComboBox; aDataSouce : TDataSource;
        aDataField, aKeyField, aListField : String; const aCreateDataSetList : Boolean = True);
  end;

implementation

{ TControllerHelper }

procedure TControllerHelper.LookupComboBox(aControl : TDBLookupComboBox; aDataSouce : TDataSource;
 aDataField, aKeyField, aListField : String; const aCreateDataSetList : Boolean = True);
begin
  aControl.ListSource := aDataSouce;
  aControl.DataField  := aDataField.Trim;
  aControl.KeyField   := aKeyField.Trim;
  aControl.ListField  := aListField;

  if aCreateDataSetList then
    aDataSouce.DataSet  := Self.DAO.CreateLookupComboBoxList.DataSet
  else
    aDataSouce.DataSet  := Self.DAO.DataSet;
end;

end.
