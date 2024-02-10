unit SGE.Controller.Helper;

interface

uses
  System.SysUtils,
  Data.DB,

  Vcl.StdCtrls,
  Vcl.DBCtrls,

  cxDBLookupComboBox,
  cxDBVGrid,
  cxGridDBTableView,

  SGE.Controller,
  SGE.Controller.Interfaces;

type
  TSimpleObjectList = class
    Code : String;
    Description : String;
  end;

  TControllerHelper = class Helper for TController
    private
    public
      procedure LookupComboBox(aControl : TDBLookupComboBox; aDataSouce : TDataSource;
        aDataField, aKeyField, aListField : String; const aCreateDataSetList : Boolean = True); overload;
      procedure LookupComboBox(aControl : TcxDBLookupComboBox ; aDataSouce : TDataSource;
        aDataField, aKeyField, aListField : String; const aCreateDataSetList : Boolean = True); overload;
      procedure LookupComboBox(aControl : TcxDBEditorRow ; aDataSouce : TDataSource;
        aDataField, aKeyField, aListField : String; const aCreateDataSetList : Boolean = True); overload;
      procedure LookupComboBox(aControl : TcxGridDBColumn ; aDataSouce : TDataSource;
        aDataField, aKeyField, aListField : String; const aCreateDataSetList : Boolean = True); overload;
      procedure PopuleComboBox(aControl : TComboBox; aDataSouce : TDataSource;
        aKeyField, aListField : String; const aCreateDataSetList : Boolean = True);
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

procedure TControllerHelper.LookupComboBox(aControl: TcxGridDBColumn; aDataSouce: TDataSource; aDataField, aKeyField,
  aListField: String; const aCreateDataSetList: Boolean);
begin
  aControl.DataBinding.FieldName := aDataField.Trim;
  TcxLookupComboBoxProperties(aControl.Properties).ListSource     := aDataSouce;
  TcxLookupComboBoxProperties(aControl.Properties).KeyFieldNames  := aKeyField.Trim;
  TcxLookupComboBoxProperties(aControl.Properties).ListFieldNames := aListField;

  if aCreateDataSetList then
    aDataSouce.DataSet  := Self.DAO.CreateLookupComboBoxList.DataSet
  else
    aDataSouce.DataSet  := Self.DAO.DataSet;
end;

procedure TControllerHelper.PopuleComboBox(aControl: TComboBox; aDataSouce: TDataSource; aKeyField, aListField: String;
  const aCreateDataSetList: Boolean);
var
  aObject : TSimpleObjectList;
begin
  if aCreateDataSetList then
    aDataSouce.DataSet  := Self.DAO.CreateLookupComboBoxList.DataSet
  else
    aDataSouce.DataSet  := Self.DAO.DataSet;

  if not aDataSouce.DataSet.Active then
    aDataSouce.DataSet.Open;

  aDataSouce.DataSet.First;
  aDataSouce.DataSet.DisableControls;
  try
    aControl.Items.BeginUpdate;
    aControl.Items.Clear;

    while not aDataSouce.DataSet.Eof do
    begin
      aObject := TSimpleObjectList.Create;
      aObject.Code := Trim(aDataSouce.DataSet.FieldByName(aKeyField).AsString);
      aObject.Description := Trim(aDataSouce.DataSet.FieldByName(aListField).AsString);
      aControl.Items.AddObject(aObject.Description, aObject);

      aDataSouce.DataSet.Next;
    end;
  finally
    aControl.Items.EndUpdate;

    aDataSouce.DataSet.First;
    aDataSouce.DataSet.EnableControls;
  end;
end;

end.
