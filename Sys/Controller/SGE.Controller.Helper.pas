unit SGE.Controller.Helper;

interface

uses
  System.SysUtils,
  Data.DB,

  Vcl.DBCtrls,
  cxDBLookupComboBox,
  cxDBVGrid,

  SGE.Controller,
  SGE.Controller.Interfaces;

type
  TControllerHelper = class Helper for TController
    private
    public
      procedure LookupComboBox(aControl : TDBLookupComboBox; aDataSouce : TDataSource;
        aDataField, aKeyField, aListField : String; const aCreateDataSetList : Boolean = True); overload;
      procedure LookupComboBox(aControl : TcxDBLookupComboBox ; aDataSouce : TDataSource;
        aDataField, aKeyField, aListField : String; const aCreateDataSetList : Boolean = True); overload;
      procedure LookupComboBox(aControl : TcxDBEditorRow ; aDataSouce : TDataSource;
        aDataField, aKeyField, aListField : String; const aCreateDataSetList : Boolean = True); overload;
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

procedure TControllerHelper.LookupComboBox(aControl: TcxDBLookupComboBox ; aDataSouce: TDataSource; aDataField,
  aKeyField, aListField: String; const aCreateDataSetList: Boolean);
begin
  aControl.Properties.ListSource     := aDataSouce;
  aControl.DataBinding.DataField     := aDataField.Trim;
  aControl.Properties.KeyFieldNames  := aKeyField.Trim;
  aControl.Properties.ListFieldNames := aListField;

  if aCreateDataSetList then
    aDataSouce.DataSet  := Self.DAO.CreateLookupComboBoxList.DataSet
  else
    aDataSouce.DataSet  := Self.DAO.DataSet;
end;

procedure TControllerHelper.LookupComboBox(aControl: TcxDBEditorRow; aDataSouce: TDataSource; aDataField, aKeyField,
  aListField: String; const aCreateDataSetList: Boolean);
begin
  aControl.Properties.DataBinding.FieldName := aDataField.Trim;
  TcxLookupComboBoxProperties(aControl.Properties.EditProperties).ListSource     := aDataSouce;
  TcxLookupComboBoxProperties(aControl.Properties.EditProperties).KeyFieldNames  := aKeyField.Trim;
  TcxLookupComboBoxProperties(aControl.Properties.EditProperties).ListFieldNames := aListField;

  if aCreateDataSetList then
    aDataSouce.DataSet  := Self.DAO.CreateLookupComboBoxList.DataSet
  else
    aDataSouce.DataSet  := Self.DAO.DataSet;
end;

end.
