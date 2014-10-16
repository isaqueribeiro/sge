unit FuncoesFormulario;

interface

uses
  Classes, Forms, Controls, QRCtrls, QuickRpt,
  UObserverInterface;

type
  TFormularios = class
  private

  public
    class function EstaAberto(sForm: String): Boolean;
    class function ShowModalForm(const AOnwer : TComponent; NomeForm: String): Boolean;
    class function ShowModalFormObserver(const AOnwer : TComponent; NomeForm: String; Observador : IObserver): Boolean;
    class procedure ShowForm(const AOnwer : TComponent; NomeForm: String);
    class procedure ShowFormReport(const AOnwer : TComponent; NomeForm: String); overload;
    class procedure ShowFormReport(const AOnwer : TComponent; NomeForm, NomeQuickRep: String); overload;
    class procedure ShowFormReportParams(const AOnwer : TComponent; NomeForm, NomeQuickRep,
      NomePropriedade: String; ValorPropriedade : Variant);
    class procedure RegisterForm(const aFormName: string; aFormClass: TComponentClass);
    class procedure FecharTodosForm;
end;

var
  FForm: TForm;

implementation

uses FormFactoryU, TypInfo;

class function TFormularios.EstaAberto(sForm: String): Boolean;
var
  I: Integer;
begin
  // Verificar se já foi Chamada
  Result := True;
  for I := Screen.FormCount - 1 downto 0 do
    if Screen.Forms[i].name  = sForm then
    begin
      Result := False;
      Exit;
    end;
end;

class procedure TFormularios.FecharTodosForm;
var
  I : Integer;
  FForm: TForm;
begin
  // Fecha todos os formulários Abertos
  for I := Screen.FormCount - 1 downto 0 do
    if Screen.Forms[i].Name <> 'frmPrincipal' then
      if Assigned(Screen.Forms[i]) then
      begin
         FForm := Screen.Forms[i];
         FForm.Close;
      end;
end;

class procedure TFormularios.RegisterForm(const aFormName: string;
  aFormClass: TComponentClass);
begin
  _FormFactory.RegisterForm(aFormName, aFormClass);
end;

class procedure TFormularios.ShowForm(const AOnwer : TComponent; NomeForm: String);
begin
  if TFormularios.EstaAberto(NomeForm) then
    FForm := _FormFactory.CreateForm(AOnwer, NomeForm);
  FForm.Show;
end;

class procedure TFormularios.ShowFormReport(const AOnwer : TComponent; NomeForm: String);
var
  I : Integer;
  qckrp : TComponent;
begin
  try
    if TFormularios.EstaAberto(NomeForm) then
      FForm := _FormFactory.CreateForm(AOnwer, NomeForm);

    qckrp := nil;
    for I := 0 to FForm.ComponentCount - 1 do
      if FForm.Components[I] is TQuickRep then
      begin
        qckrp     := FForm.Components[I];
        Break;
      end;

    if ( qckrp <> nil ) then
      TQuickRep(qckrp).PreviewModal;
  finally
    FForm.Free;
  end;
end;

class procedure TFormularios.ShowFormReport(const AOnwer : TComponent; NomeForm, NomeQuickRep: String);
var
  qckrp : TComponent;
begin
  try
    if TFormularios.EstaAberto(NomeForm) then
      FForm := _FormFactory.CreateForm(AOnwer, NomeForm);

    qckrp := FForm.FindComponent(NomeQuickRep);

    if Assigned(qckrp) then
      TQuickRep(qckrp).PreviewModal;
  finally
    FForm.Free;
  end;
end;

class procedure TFormularios.ShowFormReportParams(const AOnwer : TComponent; NomeForm, NomeQuickRep,
  NomePropriedade: String; ValorPropriedade : Variant);
var
  qckrp : TComponent;
  pProp : PPropInfo;
begin
  try
    if TFormularios.EstaAberto(NomeForm) then
      FForm := _FormFactory.CreateForm(AOnwer, NomeForm);

    pProp := GetPropInfo( FForm.ClassInfo, NomePropriedade);
    if Assigned(pProp) then
      SetPropValue(FForm, NomePropriedade, ValorPropriedade);

    qckrp := FForm.FindComponent(NomeQuickRep);
    if Assigned(qckrp) then
      TQuickRep(qckrp).PreviewModal;
  finally
    FForm.Free;
  end;
end;

class function TFormularios.ShowModalForm(const AOnwer: TComponent;
  NomeForm: String): Boolean;
begin
  try
    if TFormularios.EstaAberto(NomeForm) then
      FForm := _FormFactory.CreateForm(AOnwer, NomeForm);
    try
      Result := (FForm.ShowModal = mrOk);
    except
      FForm  := _FormFactory.CreateForm(AOnwer, NomeForm);
      Result := (FForm.ShowModal = mrOk);
    end;
  finally
    FForm.Free;
  end;
end;

class function TFormularios.ShowModalFormObserver(const AOnwer: TComponent;
  NomeForm: String; Observador: IObserver): Boolean;
begin
  try
    if TFormularios.EstaAberto(NomeForm) then
      FForm := _FormFactory.CreateForm(AOnwer, NomeForm);

    // Adicionando o "Observador" no formulário "Observado"  
    IObservable(FForm as IObservable).addObserver(Observador);

    Result := (FForm.ShowModal = mrOk);
  finally
    FForm.Free;
  end;
end;

end.

