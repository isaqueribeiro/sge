unit CopiarEColar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, ExtCtrls, Buttons;

type
  TfrmCopiarEColar = class(TForm)
    OpenDialogArquivo: TOpenDialog;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    btnOk: TBitBtn;
    btnPesquisar: TSpeedButton;
    ButtonEditArquivo: TEdit;
    BitBtn1: TBitBtn;
    procedure OpenDialogArquivoShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCopiarEColar: TfrmCopiarEColar;

implementation

uses Principal;

{$R *.dfm}

procedure TfrmCopiarEColar.OpenDialogArquivoShow(Sender: TObject);
begin
   ShowMessage('Selecione um arquivo.');
end;

procedure TfrmCopiarEColar.btnOkClick(Sender: TObject);
const
   SizeBuffer = 1024;
var
   OldFile: TFileStream;
   NewFile: TFileStream;

   Buffer: Pointer;

   SizeCopied: Integer;
   SizeForCopy, TotalCopied: Int64;
begin
  try
      if Self.Tag = 0 then
         OldFile := TFileStream.Create(frmPrincipal.idsConfiguracaoDIRSERVIDORLOCAL.AsString+'BACKUP\'+
            frmPrincipal.tvwLocal.Selected.Text, fmOpenRead)
      else
         OldFile := TFileStream.Create(ButtonEditArquivo.Text, fmOpenRead);
   except
      ShowMessage('Não foi possível abrir o arquivo.');
   end;

   try
      if Self.Tag = 0 then
         NewFile := TFileStream.Create(ButtonEditArquivo.Text, fmOpenWrite
            or fmCreate)
      else
         NewFile := TFileStream.Create(frmPrincipal.idsConfiguracaoDIRSERVIDORLOCAL.AsString+'BACKUP\'+
               ExtractFileName(ButtonEditArquivo.Text), fmOpenWrite
            or fmCreate)

   except
      OldFile.Free;

      ShowMessage('Não foi possível criar o arquivo.');
   end;


   SizeForCopy := OldFile.Size;
   TotalCopied := 0;

   with ProgressBar1 do
   begin
      Min := 0;
      Max := 100;

      Position := 0;
   end;

   GetMem(Buffer, SizeBuffer);


   Panel2.Show;
   btnOk.Enabled := False;
   try
      while TotalCopied < SizeForCopy do
      begin
         SizeCopied := OldFile.Read(Buffer^, SizeBuffer);
         SizeCopied := NewFile.Write(Buffer^, SizeBuffer);

         TotalCopied := TotalCopied + SizeCopied;

         ProgressBar1.Position :=
            Round( (TotalCopied/SizeForCopy)*100 );
         Application.ProcessMessages;
      end;
   finally
      Panel2.Hide;

      OldFile.Free;
      NewFile.Free;

      FreeMem(Buffer, SizeBuffer);

      Self.Close;
   end;

end;

procedure TfrmCopiarEColar.btnPesquisarClick(Sender: TObject);
begin
   if OpenDialogArquivo.Execute then
      ButtonEditArquivo.Text := OpenDialogArquivo.FileName;
end;

procedure TfrmCopiarEColar.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
