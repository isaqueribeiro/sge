unit Sobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmSobre = class(TForm)
    BitBtn1: TBitBtn;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

procedure TfrmSobre.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

end.
