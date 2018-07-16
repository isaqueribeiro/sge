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

procedure TfrmPesquisaEAN.Button1Click(Sender: TObject);
var
  str ,
  url ,
  pes : string;
begin
//  mmResposta.Clear;
//
//  try  *
//    Case cmbTipo.ItemIndex of
//      0 : pes := 'ncms/' + Trim(edtNumero.Text) + '.json'; // gtins/7891910000197.json'
//      1 : pes := 'gtins/' + Trim(edtNumero.Text) + '.json'; // gtins/7891910000197.json'
//    end;
//
//    url := 'https://api.cosmos.bluesoft.com.br/' + pes;
//
////    IdHTTP1.Request.ExtraHeaders.Values['X-Cosmos-Token'] := 'QLEJmWiWiYAwBl482AMYnA';
////    IdHTTP1.Request.ContentType := 'application/json;charset=UTF-8';
//
//    IdHTTP1.Request.CustomHeaders.Clear;
//    IdHTTP1.Request.CustomHeaders.AddValue('X-Cosmos-Token', 'QLEJmWiWiYAwBl482AMYnA');
//    IdHTTP1.Request.ContentType := 'application/json';
//    IdHTTP1.Request.CharSet     := 'UTF-8';
//
//    Screen.Cursor := crHourGlass;
//    str := IdHTTP1.Get(url);
//
//  except
//    on E: Exception do
//    Begin
//      mmResposta.Lines.Add('Resposta da exceção:');
//      mmResposta.Lines.Add('--> '+E.Message);
//    End;
//  end;
//
//  mmResposta.Lines.Add('HTTP Status Code:');
//  mmResposta.Lines.Add('--> '+IdHTTP1.ResponseText);
//
//  mmResposta.Lines.Add('Resposta da consulta:');
//  mmResposta.Lines.Add('--> ' + UTF8Decode(str));
//
//  Screen.Cursor := crDefault;
  mmResposta.Lines.Clear;

  restClient.BaseURL   := 'http://cosmos.bluesoft.com.br/api';
  restRequest.Client   := restClient;
  restRequest.Response := restResponse;
  restRequest.Method   := rmGET;

    Case cmbTipo.ItemIndex of
//      0 : pes := 'ncms/' + Trim(edtNumero.Text) + '.json'; // gtins/7891910000197.json'
//      1 : pes := 'gtins/' + Trim(edtNumero.Text) + '.json'; // gtins/7891910000197.json'
      0 : pes := '/ncms/{codigo}/products';
      1 : pes := '/gtins/{codigo}';
    end;

  restRequest.Resource := pes;
  restRequest.Params.AddHeader('X-Cosmos-Token', 'QLEJmWiWiYAwBl482AMYnA');
  restRequest.Params.ParameterByName('codigo').Value := Trim(edtNumero.Text);
  restRequest.Execute;

  if (restResponse.StatusCode = 200) then
    mmResposta.Lines.Add(restResponse.JSONText)
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
