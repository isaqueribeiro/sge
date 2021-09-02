unit Service.Message;

interface

type
  TServiceMessage = class
    private
    public
      class procedure ShowInformation(aMessage : String); overload;
      class procedure ShowInformation(aTitle, aMessage : String); overload;
      class procedure ShowWarning(aMessage : String); overload;
      class procedure ShowWarning(aTitle, aMessage : String); overload;

      class function ShowConfirmation(aTitle, aMessage : String) : Boolean; overload;
      class function ShowConfirmation(aMessage : String) : Boolean; overload;
      class function ShowConfirm(aMessage : String) : Boolean;
  end;

implementation

{ TServiceMessage }

uses
  System.SysUtils,
  System.StrUtils,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Controls,
  Vcl.StdCtrls,

  Winapi.Windows,

  View.Mensagem,
  UDMRecursos,
  UConstantesDGE;

class function TServiceMessage.ShowConfirmation(aTitle, aMessage: String): Boolean;
var
  fMsg  : TFrmMensagem;
  aForm : TForm;
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
      fMsg.Confirmar(aTitle.Trim, aMessage.Trim);

      Result := (fMsg.ShowModal = mrYes);
    finally
      fMsg.Free;
    end
  else
  begin
    aForm := CreateMessageDialog(PChar(aMessage.Trim), mtConfirmation, [mbYes, mbNo], TMsgDlgBtn.mbNo);
    try
      aForm.Caption := IfThen(aMessage.Trim.IsEmpty, 'Confirmar', aTitle);

      (aForm.FindComponent('Yes') as TButton).Caption  := '&Sim';
      (aForm.FindComponent('No')  as TButton).Caption  := '&Não';

      Result := ( aForm.ShowModal = ID_YES );
    finally
      FreeAndNil(aForm);
    end;
  end;
end;

class function TServiceMessage.ShowConfirm(aMessage: String): Boolean;
begin
  Result := TServiceMessage.ShowConfirmation('Confirme!', aMessage);
end;

class function TServiceMessage.ShowConfirmation(aMessage: String): Boolean;
begin
  Result := TServiceMessage.ShowConfirmation('Confirme!', aMessage);
end;

class procedure TServiceMessage.ShowInformation(aTitle, aMessage: String);
var
  fMsg  : TFrmMensagem;
  aForm : TForm;
begin
  WaitAMomentFree;

  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
      fMsg.Informe(aTitle.Trim, aMessage.Trim);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
  begin
    aForm := CreateMessageDialog(PChar(aMessage.Trim), TMsgDlgType.mtInformation, [mbOK], TMsgDlgBtn.mbOK);
    try
      aForm.Caption := aTitle.Trim;
      aForm.ShowModal;
    finally
      FreeAndNil(aForm);
    end;
  end;
end;

class procedure TServiceMessage.ShowInformation(aMessage: String);
begin
  TServiceMessage.ShowInformation('Informação', aMessage);
end;

class procedure TServiceMessage.ShowWarning(aTitle, aMessage: String);
var
  fMsg  : TFrmMensagem;
  aForm : TForm;
begin
  WaitAMomentFree;

  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
      fMsg.Alerta(aTitle.Trim, aMessage.Trim);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
  begin
    aForm := CreateMessageDialog(PChar(aMessage.Trim), TMsgDlgType.mtWarning, [mbOK], TMsgDlgBtn.mbOK);
    try
      aForm.Caption := aTitle.Trim;
      aForm.ShowModal;
    finally
      FreeAndNil(aForm);
    end;
  end;
end;

class procedure TServiceMessage.ShowWarning(aMessage: String);
var
  fMsg  : TFrmMensagem;
  aForm : TForm;
begin
  WaitAMomentFree;

  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
      fMsg.Alerta('Alerta', aMessage.Trim);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
  begin
    aForm := CreateMessageDialog(PChar(aMessage.Trim), TMsgDlgType.mtWarning, [mbOK], TMsgDlgBtn.mbOK);
    try
      aForm.Caption := 'Alerta!';
      aForm.ShowModal;
    finally
      FreeAndNil(aForm);
    end;
  end;
end;

end.
