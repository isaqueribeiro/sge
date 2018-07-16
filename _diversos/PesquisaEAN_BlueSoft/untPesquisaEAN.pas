unit untPesquisaEAN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, auHTTP,
  IPPeerClient, REST.Client, REST.Types, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TfrmPesquisaEAN = class(TForm)
    lblNumero: TLabel;
    cmbTipo: TComboBox;
    edtNumero: TEdit;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    mmResposta: TMemo;
    restClient: TRESTClient;
    restRequest: TRESTRequest;
    restResponse: TRESTResponse;
    procedure cmbTipoChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaEAN: TfrmPesquisaEAN;

implementation

{$R *.dfm}

uses
  System.JSON;

procedure TfrmPesquisaEAN.Button1Click(Sender: TObject);
var
  str ,
  pes : string;
  aResponseCosmos : TJSONValue;
begin
  // https://www.projetoacbr.com.br/forum/topic/27116-integracao-api-bluesoft-cosmos/

  mmResposta.Lines.Clear;

  restClient.BaseURL   := 'http://cosmos.bluesoft.com.br/api';
  restRequest.Client   := restClient;
  restRequest.Response := restResponse;
  restRequest.Method   := rmGET;

    Case cmbTipo.ItemIndex of
      0 : pes := '/ncms/{codigo}/products';
      1 : pes := '/gtins/{codigo}';
    end;

  restRequest.Resource := pes;
  restRequest.Params.AddHeader('X-Cosmos-Token', 'QLEJmWiWiYAwBl482AMYnA');
  restRequest.Params.ParameterByName('codigo').Value := Trim(edtNumero.Text);
  restRequest.Execute;

  if (restResponse.StatusCode = 200) then
  begin
    mmResposta.Lines.Add(restResponse.JSONText);

//    aResponseCosmos := TJSONValue(restResponse.JSONText);
//    // Para pegar a description que está de exemplo no site:
//    str := aResponseCosmos.GetValue<TJSONString>('description').Value;
//    // Para pegar a o code do NCM que está de exemplo no site:
//    str := str + #13 + aResponseCosmos.GetValue<TJSONObject>('ncm').GetValue<TJSONString>('code').Value;
//    str := str + #13 + aResponseCosmos.GetValue<TJSONObject>('ncm').GetValue<TJSONString>('description').Value;
//    str := str + #13 + aResponseCosmos.GetValue<TJSONObject>('ncm').GetValue<TJSONString>('full_description').Value;

    aResponseCosmos := restResponse.JSONValue;

    // Para pegar a description que está de exemplo no site:
    str := 'Produto : ' + aResponseCosmos.GetValue<TJSONString>('description').Value;
    // Para pegar a o code do NCM que está de exemplo no site:
    str := str + #13 + 'NCM : ' + aResponseCosmos.GetValue<TJSONObject>('ncm').GetValue<TJSONString>('code').Value;
    str := str + #13 + aResponseCosmos.GetValue<TJSONObject>('ncm').GetValue<TJSONString>('description').Value;
    str := str + #13 + aResponseCosmos.GetValue<TJSONObject>('ncm').GetValue<TJSONString>('full_description').Value;

    ShowMessage(str);
  end
  else
    mmResposta.Lines.Add(restResponse.StatusText);
end;

procedure TfrmPesquisaEAN.cmbTipoChange(Sender: TObject);
begin
  Case cmbTipo.ItemIndex of
    0 : lblNumero.Caption := 'NCM';
    1 : lblNumero.Caption := 'EAN do Produto';
  end;
end;

end.
