unit form.notificacao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  ClipBrd,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  JvExControls,
  JvEditorCommon,
  JvEditor,
  JvHLEditor,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  suporte.json,
  form.mensagemerro,
  JvAppStorage,
  JvAppIniStorage,
  JvComponentBase,
  JvFormPlacement,
  plugin.api;

type
  TformNotificacao = class(TForm)
    btnContinuar: TButton;
    btnCopiar: TButton;
    btnErro: TButton;
    btnModificadores: TButton;
    chkNaoExibir: TCheckBox;
    edtEvento: TEdit;
    lblTitulo: TLabel;
    mmoContexto: TJvHLEditor;
    mmoModificadores: TJvHLEditor;
    pge: TPageControl;
    pnlBotoes: TPanel;
    pnlModificadores: TPanel;
    sto: TJvAppIniFileStorage;
    tabContexto: TTabSheet;
    tabModificadores: TTabSheet;
    fsto: TJvFormStorage;
    procedure btnCopiarClick(Sender: TObject);
    procedure btnErroClick(Sender: TObject);
    procedure btnModificadoresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    mensagemErro: string;
    acao: string;
  public
    class function Executar(evento, contexto:string;out erro, modificadores, acao: string; out naoExibir:Boolean): Integer;
  end;

implementation

{$R *.dfm}

class function TformNotificacao.Executar(evento, contexto:string;out erro, modificadores, acao: string; out naoExibir:Boolean): Integer;
var
  form: TformNotificacao;
begin
  form := TformNotificacao.Create(nil);
  form.edtEvento.Text := evento;
  form.mmoContexto.Lines.Text := contexto;
  try
    Result := form.ShowModal();
    erro := form.mensagemErro;
    modificadores := form.mmoModificadores.Lines.Text;
    naoExibir := form.chkNaoExibir.Checked;
    acao := form.acao;
  finally
    FreeAndNil(form);
  end;
end;

procedure TformNotificacao.FormCreate(Sender: TObject);
begin
  sto.FileName := IncludeTrailingPathDelimiter(ObterCaminhoDoPlugin()) + 'contextos.ini';
end;

procedure TformNotificacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27)  then
    ModalResult := mrCancel
  else
    inherited;
end;

procedure TformNotificacao.FormShow(Sender: TObject);
begin
  pge.TabIndex := 0;
end;

procedure TformNotificacao.btnModificadoresClick(Sender: TObject);
var
  obj,
  mods: ISuperJson;
begin
  mods := SJ(mmoContexto.Lines.Text).O['modificadores'];
  if (mods = nil) then
  begin
    MessageBox(Handle,'Contexto não possui modificadores', 'Erro', mrOk);
    Exit;
  end;

  // Monto um contexto apenas com os modificadores
  obj := SJ('{"modificadores":{}}');
  obj.O['modificadores'] := mods;
  mmoModificadores.Lines.Text := obj.AsJson(True);
  obj := nil;
  mods := nil;
end;

procedure TformNotificacao.btnCopiarClick(Sender: TObject);
begin
  Clipboard.AsText := mmoContexto.Lines.GetText;
end;

procedure TformNotificacao.btnErroClick(Sender: TObject);
var
  form: TformMensagemErro;
  modalRes: Integer;
begin
  form := TformMensagemErro.Create(nil);
  try
    modalRes:= form.ShowModal();
    if modalRes = mrOk then
    begin
      mensagemErro := form.memoErro.Lines.Text;
      ModalResult := mrCancel;
    end
    else if modalRes = mrAbort then
    begin
      mensagemErro := form.memoErro.Lines.Text;
      acao := 'abort';
      ModalResult := mrAbort;
    end
  finally
    FreeAndNil(form);
  end;
end;

end.
