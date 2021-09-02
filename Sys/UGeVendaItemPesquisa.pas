unit UGeVendaItemPesquisa;

interface

uses
  UGrPadraoPesquisa,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, JvToolEdit, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TFrmGeVendaItemPesquisa = class(TfrmGrPadraoPesquisa)
    lblData: TLabel;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    fdQryPesquisaCODPROD: TStringField;
    fdQryPesquisaPRODUTO: TStringField;
    fdQryPesquisaGRUPO: TStringField;
    fdQryPesquisaUNIDADE: TStringField;
    fdQryPesquisaVENDEDOR: TStringField;
    fdQryPesquisaCLIENTE_CPF: TStringField;
    fdQryPesquisaCLIENTE_NOME: TStringField;
    fdQryPesquisaTOTAL_BRUTO: TFMTBCDField;
    fdQryPesquisaTOTAL_DESCONTO: TFMTBCDField;
    fdQryPesquisaTOTAL_FINAL: TFMTBCDField;
    fdQryPesquisaQUANTIDADE: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigurarColunas;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

(*
  Tabelas:
  - TBVENDAS
  - TBVENDEDOR
  - TBCLIENTE
  - TVENDASITENS
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBGRUPOPROD

  Views:

  Stored Procedure:

*)

var
  FrmGeVendaItemPesquisa: TFrmGeVendaItemPesquisa;

implementation

uses
    UConstantesDGE
  , UDMBusiness
  , UDMRecursos
  , UGrPadrao;

{$R *.dfm}

const
  TIPO_AUT = 0;
  TIPO_GRP = 1;
  TIPO_VND = 2;
  TIPO_CLI = 3;

{ TFrmGeVendaItemPesquisa }

procedure TFrmGeVendaItemPesquisa.ConfigurarColunas;
begin
  dbgDados.Columns[0].Visible := edTipoPesquisa.ItemIndex in [TIPO_AUT, TIPO_VND, TIPO_CLI]; // Código
  dbgDados.Columns[1].Visible := edTipoPesquisa.ItemIndex in [TIPO_AUT, TIPO_VND, TIPO_CLI]; // Produto
  dbgDados.Columns[2].Visible := edTipoPesquisa.ItemIndex in [TIPO_AUT, TIPO_GRP];           // Grupo
  dbgDados.Columns[3].Visible := edTipoPesquisa.ItemIndex in [TIPO_VND];                     // Vendedor
  dbgDados.Columns[4].Visible := edTipoPesquisa.ItemIndex in [TIPO_CLI];                     // Cliente
end;

function TFrmGeVendaItemPesquisa.ExecutarPesquisa: Boolean;
var
  sDataInicial,
  sDataFinal  : String;
begin
  Screen.Cursor := crSQLWait;
  try
    sDataInicial     := FormatDateTime('yyyy-mm-dd', StrToDateDef(e1Data.Text, Date));
    sDataFinal       := FormatDateTime('yyyy-mm-dd', StrToDateDef(e2Data.Text, Date));
    edPesquisar.Text := Trim(edPesquisar.Text);

    fdQryPesquisa.Close;

    with fdQryPesquisa do
    begin
      SQL.Clear;
      SQL.AddStrings( SQLSelect );
      SQL.Add('where v.codemp = ' + QuotedStr(gUsuarioLogado.Empresa));
      SQL.Add('  and v.status in (3, 4)');
      SQL.Add('  and v.dtvenda between ' + QuotedStr(sDataInicial) + ' and ' + QuotedStr(sDataFinal));

      Case edTipoPesquisa.ItemIndex of
        TIPO_AUT:
          begin
            SQL[9]  := '  , cast(null as varchar(60)) as Vendedor';
            SQL[10] := '  , cast(null as varchar(18)) as Cliente_Cpf';
            SQL[11] := '  , cast(null as varchar(60)) as Cliente_Nome';

            if FuncoesString.StrIsInt(edPesquisar.Text) then
              SQL.Add('  and i.codprod = ' + FormatFloat('0000000', StrToInt(edPesquisar.Text)))
            else
              SQL.Add('  and p.descri like ' + QuotedStr(edPesquisar.Text + '%'));
          end;

        TIPO_GRP:
          begin
            SQL[1]  := '    cast(null as varchar(10)) as codprod';
            SQL[2]  := '  , cast(null as varchar(50)) as Produto';
            SQL[9]  := '  , cast(null as varchar(60)) as Vendedor';
            SQL[10] := '  , cast(null as varchar(18)) as Cliente_Cpf';
            SQL[11] := '  , cast(null as varchar(60)) as Cliente_Nome';

            if FuncoesString.StrIsInt(edPesquisar.Text) then
              SQL.Add('  and p.codgrupo = ' + edPesquisar.Text)
            else
              SQL.Add('  and g.descri like ' + QuotedStr(edPesquisar.Text + '%'));
          end;

        TIPO_VND:
          begin
            SQL[3]  := '  , cast(null as varchar(30)) as Grupo';
            SQL[10] := '  , cast(null as varchar(18)) as Cliente_Cpf';
            SQL[11] := '  , cast(null as varchar(60)) as Cliente_Nome';

            if FuncoesString.StrIsInt(edPesquisar.Text) then
              SQL.Add('  and v.vendedor_cod = ' + edPesquisar.Text)
            else
              SQL.Add('  and vd.nome like ' + QuotedStr(edPesquisar.Text + '%'));
          end;

        TIPO_CLI:
          begin
            SQL[3]  := '  , cast(null as varchar(30)) as Grupo';
            SQL[9]  := '  , cast(null as varchar(60)) as Vendedor';

            if ( StrToIntDef(edPesquisar.Text, 0) > 0 ) then
              SQL.Add('  and v.codcliente = ' + edPesquisar.Text)
            else
            if ( edPesquisar.Text = CONSUMIDOR_FINAL_CNPJ ) then
              SQL.Add('  and v.codcli = ' + QuotedStr(edPesquisar.Text))
            else
            if FuncoesString.StrIsCPF( StringReplace(StringReplace(edPesquisar.Text, '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll]) ) then
              SQL.Add('  and v.codcli = ' + QuotedStr(StringReplace(StringReplace(edPesquisar.Text, '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll])))
            else
            if FuncoesString.StrIsCNPJ( StringReplace(StringReplace(edPesquisar.Text, '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll]) ) then
              SQL.Add('  and v.codcli = ' + QuotedStr(StringReplace(StringReplace(edPesquisar.Text, '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll])))
            else
              SQL.Add('  and cl.nome like ' + QuotedStr(edPesquisar.Text + '%'));
          end;
      end;

      SQL.Add('group by');

      if ( edTipoPesquisa.ItemIndex in [TIPO_AUT, TIPO_VND, TIPO_CLI] ) then
      begin
        SQL.Add('    i.codprod');
        SQL.Add('  , p.descri');
      end;

      if ( edTipoPesquisa.ItemIndex in [TIPO_GRP] ) then
        SQL.Add('    p.codgrupo');

      if ( edTipoPesquisa.ItemIndex in [TIPO_AUT, TIPO_GRP] ) then
        SQL.Add('  , g.descri');

      SQL.Add('  , u.unp_sigla');

      if ( edTipoPesquisa.ItemIndex in [TIPO_VND] ) then
        SQL.Add('  , vd.nome');

      if ( edTipoPesquisa.ItemIndex in [TIPO_CLI] ) then
      begin
        SQL.Add('  , v.codcli');
        SQL.Add('  , cl.nome');
      end;
    end;

    fdQryPesquisa.Open;

    Result := not fdQryPesquisa.IsEmpty;
  finally
    ConfigurarColunas;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmGeVendaItemPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  e1Data.Date := Date - 7;
  e2Data.Date := Date;

  // Configurar tabela de pesquisa
  Tabela
    .Display('QUANTIDADE',     'Quantidade', ',0.###', TAlignment.taRightJustify)
    .Display('TOTAL_BRUTO',    'Total Bruto', ',0.00', TAlignment.taRightJustify)
    .Display('TOTAL_DESCONTO', 'Total Desconto', ',0.00', TAlignment.taRightJustify)
    .Display('TOTAL_FINAL',    'Total Final', ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQryPesquisa );

  ConfigurarColunas;
end;

initialization
  FormFunction.RegisterForm('FrmGeVendaItemPesquisa', TFrmGeVendaItemPesquisa);

end.
