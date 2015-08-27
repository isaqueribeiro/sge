unit UGrPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, HPL_Strings, StdCtrls, DBCtrls, IBCustomDataSet, DB, DBClient,
  ExtCtrls, Mask, Grids, DBGrids, TypInfo, StrUtils,  ComCtrls,
  JvExMask, JvToolEdit, JvDBControls;

type
  TfrmGrPadrao = class(TForm)
    procedure ControlEditEnter(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fNomeTabela     ,
    fCampoCodigo    ,
    fCampoDescricao ,
    fCampoOrdenacao ,
    fCampoCadastroAtivo,
    fGeneratorName  ,
    fRotinaID       : String;
    procedure SetRotinaID(Value : String);
    procedure SetOnEnterExit( const Win : TWinControl );

    function GetRotinaPaiID : String;
  public
    { Public declarations }
    FuncoesString : THopeString;
    property RotinaID     : String read fRotinaID write SetRotinaID;
    property RotinaPaiID  : String read GetRotinaPaiID;

    property NomeTabela : String read fNomeTabela write fNomeTabela;
    property CampoCodigo : String read fCampoCodigo write fCampoCodigo;
    property CampoDescricao : String read fCampoDescricao write fCampoDescricao;
    property CampoOrdenacao : String read fCampoOrdenacao write fCampoOrdenacao;
    property CampoCadastroAtivo : String read fCampoCadastroAtivo write fCampoCadastroAtivo;
    property GeneratorName  : String read fGeneratorName write fGeneratorName;

    procedure RegistrarRotinaSistema; virtual; abstract;

    function GetRotinaInternaID(const Sender : TObject) : String;
    function GetRotinaSubInternaID(const Sender : TObject) : String;
    function GetPermissaoRotinaInterna(const Sender : TObject; const Alertar : Boolean = FALSE) : Boolean;

    procedure UpdateGenerator(const sWhr : String = ''); virtual;
  end;

var
  frmGrPadrao: TfrmGrPadrao;

  function CustomKeyDown(Frm : TForm; var Key : Word; Shift : TShiftState) : Boolean;
  function gGetPropInfo(Instance: TObject; PropName: String = 'Text') : String;
  function gGetOrdProp(Instance: TObject; PropName: String) : Longint;
  function gSetOrdProp(Instance: TObject; PropName: String; Value: Longint) : Boolean; overload;
  function gSetStrProp(Instance: TObject; PropName: String; Value: String) : Boolean; overload;
  function gSetFloatProp(Instance: TObject; PropName: String; Value: Extended) : Boolean; overload;

implementation

uses
  UConstantesDGE, UDMBusiness, UDMRecursos;

{$R *.dfm}

function CustomKeyDown(Frm : TForm; var Key: Word; Shift : TShiftState) : Boolean;
begin

  if (not Assigned(Frm)) or (Key = 0) then
    Exit;

  if ((Key = VK_RETURN) or (key = VK_TAB)) and (Shift = []) then
  begin

    if (
         (Frm.ActiveControl is TEdit)
      or (Frm.ActiveControl is TCheckBox)
      or (Frm.ActiveControl is TRadioButton)
      or (Frm.ActiveControl is TComboBox)
      or (Frm.ActiveControl is TMaskEdit)
      or (Frm.ActiveControl is TLabeledEdit)
      or (Frm.ActiveControl is TJvComboEdit)
      or (Frm.ActiveControl is TJvDateEdit)
      or (Frm.ActiveControl is TJvDirectoryEdit)
      // DB Controls
      or (Frm.ActiveControl is TDBEdit)
      or (Frm.ActiveControl is TDBCheckBox)
      or (Frm.ActiveControl is TDBRadioGroup)
      or (Frm.ActiveControl is TDBComboBox)
      or (Frm.ActiveControl is TDBLookupComboBox)
      or (Frm.ActiveControl is TDBLookupListBox)
      // DB Controls Jedi
      or (Frm.ActiveControl is TJvDBDateEdit)
      or (Frm.ActiveControl is TJvDBCalcEdit)
      or (Frm.ActiveControl is TJvDBComboEdit)
    ) then

      if (Frm.ActiveControl is TEdit) then
        Result := not ( Assigned(TEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TEdit(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TCheckBox) then
        Result := not ( Assigned(TCheckBox(Frm.ActiveControl).OnKeyPress) or Assigned(TCheckBox(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TRadioButton) then
        Result := not ( Assigned(TRadioButton(Frm.ActiveControl).OnKeyPress) or Assigned(TRadioButton(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TComboBox) then
        Result := not ( Assigned(TComboBox(Frm.ActiveControl).OnKeyPress) or Assigned(TComboBox(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TMaskEdit) then
        Result := not ( Assigned(TMaskEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TMaskEdit(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TLabeledEdit) then
        Result := not ( Assigned(TLabeledEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TLabeledEdit(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TJvComboEdit) then
        Result := not ( Assigned(TJvComboEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TJvComboEdit(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TJvDateEdit) then
        Result := not ( Assigned(TJvDateEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TJvDateEdit(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TJvDirectoryEdit) then
        Result := not ( Assigned(TJvDirectoryEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TJvDirectoryEdit(Frm.ActiveControl).OnKeyDown) )
      else
      // DB Controls
      if (Frm.ActiveControl is TDBEdit) then
        Result := not ( Assigned(TDBEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TDBEdit(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TDBCheckBox) then
        Result := not ( Assigned(TDBCheckBox(Frm.ActiveControl).OnKeyPress) or Assigned(TDBCheckBox(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TDBComboBox) then
        Result := not ( Assigned(TDBComboBox(Frm.ActiveControl).OnKeyPress) or Assigned(TDBComboBox(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TDBLookupComboBox) then
        Result := not ( Assigned(TDBLookupComboBox(Frm.ActiveControl).OnKeyPress) or Assigned(TDBLookupComboBox(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TDBLookupListBox) then
        Result := not ( Assigned(TDBLookupListBox(Frm.ActiveControl).OnKeyPress) or Assigned(TDBLookupListBox(Frm.ActiveControl).OnKeyDown) )
      else
      // DB Controls Jedi
      if (Frm.ActiveControl is TJvDBDateEdit) then
        Result := not ( Assigned(TJvDBDateEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TJvDBDateEdit(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TJvDBCalcEdit) then
        Result := not ( Assigned(TJvDBCalcEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TJvDBCalcEdit(Frm.ActiveControl).OnKeyDown) )
      else
      if (Frm.ActiveControl is TJvDBComboEdit) then
        Result := not ( Assigned(TJvDBComboEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TJvDBComboEdit(Frm.ActiveControl).OnKeyDown) )
      else
        Result := True

    else
    if (Frm.ActiveControl is TDBMemo) then
    begin
      with TDBMemo(Frm.ActiveControl) do
        Result := ( Assigned(DataSource) and Assigned(DataSource.DataSet) and (not (DataSource.DataSet.State in [dsInsert, dsEdit])) );
    end
    else
    if ( (Frm.ActiveControl is TMemo) and TMemo(Frm.ActiveControl).Enabled and (not TMemo(Frm.ActiveControl).ReadOnly) ) then
      Result := False;

    if Result then
    begin
      Key := 0;
      Frm.Perform(WM_NEXTDLGCTL, 0, 0);
    end;

  end;

end;

function gGetPropInfo(Instance: TObject; PropName: String = 'Text'):String;
var
  pGetPropInfo : PPropInfo;
begin

//  pGetPropInfo := GetPropInfo( Instance.ClassInfo, PropName);
  pGetPropInfo := GetPropInfo( Instance, PropName);

  if Assigned(pGetPropInfo) then
    Result := GetStrProp(Instance, PropName)
  else
    Result := '';

end;

function gGetOrdProp(Instance: TObject; PropName: string):Longint;
var pGetPropInfo: PPropInfo;
begin
  pGetPropInfo := GetPropInfo(Instance, PropName);
  if Assigned(pGetPropInfo) then
    Result := GetOrdProp(Instance, pGetPropInfo)
  else
    Result := 0;
end;

function gSetOrdProp(Instance: TObject; PropName: String; Value: Longint):Boolean;
var
  pGetPropInfo: PPropInfo;
begin

  pGetPropInfo := GetPropInfo(Instance, PropName);

  Result := Assigned(pGetPropInfo);

  if Result then
    SetOrdProp(Instance, pGetPropInfo, Value)

end;

function gSetStrProp(Instance: TObject; PropName: String; Value: String):Boolean;
var
  pGetPropInfo: PPropInfo;
begin

  pGetPropInfo := GetPropInfo(Instance, PropName);

  Result := Assigned(pGetPropInfo);

  if Result then
    SetStrProp(Instance, pGetPropInfo, Value)

end;

function gSetFloatProp(Instance: TObject; PropName: String; Value: Extended):Boolean;
var
  pGetPropInfo: PPropInfo;
begin

  pGetPropInfo := GetPropInfo(Instance, PropName);

  Result := Assigned(pGetPropInfo);

  if Result then
    SetFloatProp(Instance, pGetPropInfo, Value)

end;

procedure TfrmGrPadrao.ControlEditEnter(Sender: TObject);
var
  s   : TComponentName;
  cmp : TComponent;
  ppi : PPropInfo;
  obj : TObject;
  dts : TDataSource;
  fnt : TFont;
  sClass     : ShortString;
  DataSource : Boolean;
begin
  ppi        := GetPropInfo( Sender, 'DataSource');
  DataSource := Assigned(ppi);

  sClass := LowerCase(Sender.ClassName);

  if (gGetOrdProp(Sender, 'Enabled') = 0) then
    Exit;

  if DataSource then
  begin

    ppi := GetPropInfo( Sender, 'DataSource');

    if Assigned(ppi) then
    begin
      obj := GetObjectProp( Sender, ppi);
      dts := TDataSource(obj);
      if not ( Assigned(dts) and Assigned(dts.DataSet) and (dts.DataSet.State in [dsInsert, dsEdit]) ) then
        Exit;
    end;

  end;

  // Neste projeto o nome dos controles conscientes de dados comecam com o prefixo "db"
  // e o nome do controle correspondente a sua etiqueta (label) comeca com o preixo "lbl"
  s   := 'lbl' + Copy( TWinControl(Sender).Name, 3, MaxInt);
  cmp := Self.FindComponent(s);

  if Assigned(cmp) then
  begin
    obj := GetObjectProp(cmp, 'Font');
    if Assigned(obj) then
    begin
      TFont(obj).Style := [fsBold];
      TFont(obj).Color := clBlue;
    end;
  end;

  // A cor atual eh provisoria
  ppi := GetPropInfo( Sender, 'ReadOnly');
  if Assigned(ppi) then
    if ( gGetOrdProp(Sender, 'ReadOnly') = 0 ) then
      gSetOrdProp(Sender, 'Color', clYellow);

  ppi := GetPropInfo( Sender, 'Font');

  if Assigned(ppi) then
  begin
    obj := GetObjectProp(Sender, 'Font');
    if Assigned(obj) then
    begin
      fnt := TFont(obj);
      fnt.Style := [fsBold];
      if AnsiContainsStr(sClass, 'tcheckbox') or AnsiContainsStr(sClass, 'tdbcheckbox') then  // Um checkbox nao possui label
        fnt.Color := clBlue;
    end;
  end;
end;

procedure TfrmGrPadrao.ControlEditExit(Sender: TObject);
var
  s   : TComponentName;
  cmp : TComponent;
  ppi : PPropInfo;
  obj : TObject;
  dts : TDataSource;
  sClassName : ShortString;
  DataSource : Boolean;
begin
  ppi        := GetPropInfo( Sender, 'DataSource');
  DataSource := Assigned(ppi);

  sClassName := LowerCase(Sender.ClassName);

  if DataSource then
  begin

    ppi := GetPropInfo( Sender, 'DataSource');

    if Assigned(ppi) then
    begin
      obj := GetObjectProp( Sender, ppi);
      dts := TDataSource(obj);
      if not Assigned(dts) then
        Exit;
      if not Assigned(dts.DataSet) then
        Exit;
      if not (dts.DataSet.State in [dsInsert,dsEdit]) then
        Exit;
    end;

  end;

  // Neste projeto o nome dos controles conscientes de dados começa com o prefixo "db"
  // e o nome do controle correspondente a sua etiqueta (label) comeÃ§a com o preixo "lbl"
  s   := 'lbl' + Copy( TWinControl(Sender).Name, 3, MaxInt);
  cmp := Self.FindComponent(s);
  if Assigned(cmp) then
  begin
    ppi := GetPropInfo( cmp, 'ParentFont');
    if Assigned(ppi) then
      gSetOrdProp( cmp, 'ParentFont', 1);
  end;

  // A cor branco (clWindow) eh a padrao, mas aqui eh considerada provisoria
  ppi := GetPropInfo( Sender, 'ReadOnly');
  if Assigned(ppi) then
    if ( gGetOrdProp(Sender, 'ReadOnly') = 0 ) then
    begin
      gSetOrdProp( Sender, 'Color', clWindow);
      gSetOrdProp( Sender, 'ParentFont', 1);
      if AnsiContainsStr(sClassName, 'tcheckbox') or AnsiContainsStr(sClassName, 'tdbcheckbox') then  // Um checkbox nao possui label
        gSetOrdProp( Sender, 'Color', Self.Color);
    end;
end;

procedure TfrmGrPadrao.FormCreate(Sender: TObject);
begin
  FuncoesString := THopeString.Create;
  fRotinaID     := EmptyStr;

  SetOnEnterExit(Self);

  CampoCodigo        := EmptyStr;
  CampoDescricao     := EmptyStr;
  CampoOrdenacao     := EmptyStr;
  CampoCadastroAtivo := EmptyStr;
  NomeTabela     := EmptyStr;
  GeneratorName  := EmptyStr;
end;

procedure TfrmGrPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CustomKeyDown(Self, Key, Shift);
end;

procedure TfrmGrPadrao.SetOnEnterExit(const Win: TWinControl);
var
  I : Integer;
begin
  for I := 0 to Win.ComponentCount - 1 do
  begin

    if not (Win.Components[i] is TWinControl) then
      continue;

    if ( Win.Components[i] is TEdit ) then
    begin
      if ( not Assigned(TEdit(Win.Components[i]).OnEnter) ) then
        TEdit(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TEdit(Win.Components[i]).OnExit) ) then
        TEdit(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TMemo ) then
    begin
      if ( not Assigned(TMemo(Win.Components[i]).OnEnter) ) then
        TMemo(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TMemo(Win.Components[i]).OnExit) ) then
        TMemo(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TCheckBox ) then
    begin
      if ( not Assigned(TCheckBox(Win.Components[i]).OnEnter) ) then
        TCheckBox(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TCheckBox(Win.Components[i]).OnExit) ) then
        TCheckBox(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TListBox ) then
    begin
      if ( not Assigned(TListBox(Win.Components[i]).OnEnter) ) then
        TListBox(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TListBox(Win.Components[i]).OnExit) ) then
        TListBox(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TComboBox ) then
    begin
      if ( not Assigned(TComboBox(Win.Components[i]).OnEnter) ) then
        TComboBox(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TComboBox(Win.Components[i]).OnExit) ) then
        TComboBox(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TDateTimePicker ) then
    begin
      if ( not Assigned(TDateTimePicker(Win.Components[i]).OnEnter) ) then
        TDateTimePicker(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TDateTimePicker(Win.Components[i]).OnExit) ) then
        TDateTimePicker(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TJvComboEdit ) then
    begin
      if ( not Assigned(TJvComboEdit(Win.Components[i]).OnEnter) ) then
        TJvComboEdit(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TJvComboEdit(Win.Components[i]).OnExit) ) then
        TJvComboEdit(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TJvDateEdit ) then
    begin
      if ( not Assigned(TJvDateEdit(Win.Components[i]).OnEnter) ) then
        TJvDateEdit(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TJvDateEdit(Win.Components[i]).OnExit) ) then
        TJvDateEdit(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    //if ( Win.Components[i] is TJvLookupEdit ) then
    //begin
    //  if ( not Assigned(TRxLookupEdit(Win.Components[i]).OnEnter) ) then
    //    TRxLookupEdit(Win.Components[i]).OnEnter := ControlEditEnter;
    //  if ( not Assigned(TRxLookupEdit(Win.Components[i]).OnExit) ) then
    //    TRxLookupEdit(Win.Components[i]).OnExit  := ControlEditExit;
    //end;

    // Controls DB

    if ( Win.Components[i] is TDBEdit ) then
    begin
      if ( not Assigned(TDBEdit(Win.Components[i]).OnEnter) ) then
        TDBEdit(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TDBEdit(Win.Components[i]).OnExit) ) then
        TDBEdit(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TDBMemo ) then
    begin
      if ( not Assigned(TDBMemo(Win.Components[i]).OnEnter) ) then
        TDBMemo(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TDBMemo(Win.Components[i]).OnExit) ) then
        TDBMemo(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TDBCheckBox ) then
    begin
      if ( not Assigned(TDBCheckBox(Win.Components[i]).OnEnter) ) then
        TDBCheckBox(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TDBCheckBox(Win.Components[i]).OnExit) ) then
        TDBCheckBox(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TDBListBox ) then
    begin
      if ( not Assigned(TDBListBox(Win.Components[i]).OnEnter) ) then
        TDBListBox(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TDBListBox(Win.Components[i]).OnExit) ) then
        TDBListBox(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TDBComboBox ) then
    begin
      if ( not Assigned(TDBComboBox(Win.Components[i]).OnEnter) ) then
        TDBComboBox(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TDBComboBox(Win.Components[i]).OnExit) ) then
        TDBComboBox(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TDBLookupListBox ) then
    begin
      if ( not Assigned(TDBLookupListBox(Win.Components[i]).OnEnter) ) then
        TDBLookupListBox(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TDBLookupListBox(Win.Components[i]).OnExit) ) then
        TDBLookupListBox(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TDBLookupComboBox ) then
    begin
      if ( not Assigned(TDBLookupComboBox(Win.Components[i]).OnEnter) ) then
        TDBLookupComboBox(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TDBLookupComboBox(Win.Components[i]).OnExit) ) then
        TDBLookupComboBox(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    // Controls DB Jedi

    if ( Win.Components[i] is TJvDBDateEdit ) then
    begin
      if ( not Assigned(TJvDBDateEdit(Win.Components[i]).OnEnter) ) then
        TJvDBDateEdit(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TJvDBDateEdit(Win.Components[i]).OnExit) ) then
        TJvDBDateEdit(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TJvDBCalcEdit ) then
    begin
      if ( not Assigned(TJvDBCalcEdit(Win.Components[i]).OnEnter) ) then
        TJvDBCalcEdit(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TJvDBCalcEdit(Win.Components[i]).OnExit) ) then
        TJvDBCalcEdit(Win.Components[i]).OnExit  := ControlEditExit;
    end;

    if ( Win.Components[i] is TJvDBComboEdit ) then
    begin
      if ( not Assigned(TJvDBComboEdit(Win.Components[i]).OnEnter) ) then
        TJvDBComboEdit(Win.Components[i]).OnEnter := ControlEditEnter;
      if ( not Assigned(TJvDBComboEdit(Win.Components[i]).OnExit) ) then
        TJvDBComboEdit(Win.Components[i]).OnExit  := ControlEditExit;
    end;

  end;
end;

procedure TfrmGrPadrao.FormShow(Sender: TObject);
begin
  RegistrarRotinaSistema;
end;

procedure TfrmGrPadrao.SetRotinaID(Value: String);
var
  sComplemento : String;
begin
  sComplemento := StringOfChar('0', ROTINA_LENGTH_ID);

  if ( Trim(Value) = EmptyStr ) then
    fRotinaID := EmptyStr
  else
    fRotinaID := Copy(Trim(Value) + sComplemento, 1, ROTINA_LENGTH_ID);
end;

function TfrmGrPadrao.GetRotinaPaiID: String;
var
  sComplemento : String;
begin
  sComplemento := StringOfChar('0', ROTINA_LENGTH_ID);

  if ( Trim(fRotinaID) = EmptyStr ) then
    Result := EmptyStr
  else
    Result := Copy(Copy(RotinaID, 1, 3) + sComplemento, 1, ROTINA_LENGTH_ID);
end;

function TfrmGrPadrao.GetRotinaInternaID(const Sender: TObject): String;
var
  sComplemento : String;
begin
  sComplemento := StringOfChar('0', ROTINA_LENGTH_ID);

  if ( Trim(RotinaID) = EmptyStr ) then
    Result := EmptyStr
  else
    Result := Copy(Copy(RotinaID, 1, 6) + FormatFloat('00', TComponent(Sender).Tag) + sComplemento, 1, ROTINA_LENGTH_ID);
end;

function TfrmGrPadrao.GetPermissaoRotinaInterna(const Sender: TObject;
  const Alertar: Boolean): Boolean;
var
  sRotinaInternaID : String;
begin
  sRotinaInternaID := GetRotinaInternaID(Sender);

  if Trim(sRotinaInternaID) = EmptyStr then
    Result := True
  else
    Result := GetPermissaoRotinaSistema(sRotinaInternaID, Alertar);
end;

function TfrmGrPadrao.GetRotinaSubInternaID(
  const Sender: TObject): String;
var
  sComplemento : String;
begin
  sComplemento := StringOfChar('0', ROTINA_LENGTH_ID);

  if ( Trim(RotinaID) = EmptyStr ) then
    Result := EmptyStr
  else
    Result := Copy(Copy(RotinaID, 1, 8) + FormatFloat('00', TComponent(Sender).Tag) + sComplemento, 1, ROTINA_LENGTH_ID);
end;

procedure TfrmGrPadrao.UpdateGenerator(const sWhr: String);
begin
  if ( (GeneratorName <> EmptyStr) and (NomeTabela <> EmptyStr) and (CampoCodigo <> EmptyStr) ) then
    UpdateSequence(GeneratorName, NomeTabela, CampoCodigo, sWhr);
end;

end.
