unit form.config;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.StrUtils,
  System.Variants,
  System.Classes,
  System.IOUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  JvExComCtrls,
  JvComCtrls,
  JvCheckTreeView,
  suporte.json,
  plugin.api,
  Vcl.ExtCtrls,
  suporte.log;

type
  TformConfig = class(TForm)
    btnAplicar: TButton;
    btnDesmarcarTodos: TButton;
    btnFechar: TButton;
    btnMarcarTodos: TButton;
    chkMostrarNotificacao: TCheckBox;
    lblTitulo: TLabel;
    pnlBotoes: TPanel;
    treeEventos: TJvCheckTreeView;
    procedure FormShow(Sender: TObject);
    procedure btnMarcarTodosClick(Sender: TObject);
    procedure btnDesmarcarTodosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
  public
    const LOG_SESSAO = 'plugin_contextos';
  private
    _eventos : TStringList;
  public
    class function Executar(informacao:PChar): Integer;
  end;

implementation

{$R *.dfm}

procedure TformConfig.FormShow(Sender: TObject);
var
  obj,
  item,
  subitem: ISuperJson;
  treeNode,
  subNode : TTreeNode;
  buffer: PChar;
  chave,
  evento: string;
  qtd,
  total: Integer;
begin
  _eventos := TStringList.Create();

//Obtenho as configura��es salvas
  buffer := ObterConfigs(NOME_PLUGIN, 0);
  Logger(LOG_SESSAO).Debug('Configuracoes', string(buffer));
  obj := SJ(buffer).o['configs'];
  try
    for item in obj do
    begin
      chave := item.name;
      if StartsStr('Evento_', chave) then
      begin
        evento := Copy(chave, 8, Length(chave)-7);
        _eventos.Add(evento);
      end;
    end;
    chkMostrarNotificacao.Checked := obj.X['MostrarNotificacao'].S['valor'] = '1';
  finally
    LiberarBuffer(buffer);
    obj := nil;
    item := nil;
  end;

//Leio os eventos existentes
  obj := SJ(TFile.ReadAllText(ObterCaminhoDoPlugin + 'eventos.json'));
  treeEventos.Items.Clear;
  treeNode := nil;
  try
    for item in obj.o['eventos'] do
    begin
      treeNode := treeEventos.Items.Add(treeNode, item.Name);
      qtd := 0;
      total := 0;
      subNode := nil;

      for subitem in item do
      begin
        subNode := treeEventos.Items.AddChild(treeNode, subitem.AsString);
        evento := item.name + '_' + subitem.AsString;
        subNode.Data := StrNew(PChar(evento));
        if _eventos.IndexOf(evento) >= 0 then
        begin
          treeEventos.Checked[subNode] := True;
          inc(qtd);
        end;
        inc(total);
      end;
      treeEventos.Checked[treeNode] := (subNode <> nil) and (qtd = total);
    end;
  finally
    obj := nil;
    item := nil;
    subitem := nil;
    treeEventos.Refresh;
  end;
end;

procedure TformConfig.FormDestroy(Sender: TObject);
var
  item:Integer;
begin
  for item := 0 to treeEventos.Items.Count-1 do
    if Assigned(treeEventos.Items.Item[item].Data) then
      StrDispose(PChar(treeEventos.Items.Item[item].Data));

  FreeAndNil(_eventos);
end;

procedure TformConfig.btnMarcarTodosClick(Sender: TObject);
var
  node : TTreeNode;
begin
  for node in treeEventos.Items do
    treeEventos.Checked[node] := True;
end;

procedure TformConfig.btnDesmarcarTodosClick(Sender: TObject);
var
  node : TTreeNode;
begin
  for node in treeEventos.Items do
    treeEventos.Checked[node] := False;
end;

class function TformConfig.Executar(informacao:PChar): Integer;
var
  form: TformConfig;
begin
  form := TformConfig.Create(nil);
  try
    Result := form.ShowModal();
  finally
    FreeAndNil(form);
  end;
end;

procedure TformConfig.btnAplicarClick(Sender: TObject);
var
  node: TTreeNode;
  lista: TStringList;
  valor: PChar;
  item: Integer;
begin
  lista := TStringList.Create;
  try
    for node in treeEventos.Items do
      if Assigned(node.Data) and treeEventos.Checked[node] then
        lista.Add(PChar(node.Data));

    // Apago as configs anteriores que n�o ser�o mais utilizadas
    for item := 0 to _eventos.Count-1 do
      if lista.IndexOf(_eventos.Strings[item]) < 0 then
        GravarConfig(NOME_PLUGIN, PChar('Evento_' + _eventos.Strings[item]), 0, nil);

    // Gravo as configs inclu�das
    for item := 0 to lista.Count-1 do
      if _eventos.IndexOf(lista.Strings[item]) < 0 then
        GravarConfig(NOME_PLUGIN, PChar('Evento_' + lista.Strings[item]), 0, '1');

    _eventos.Text := lista.Text;

    if chkMostrarNotificacao.Checked then
      valor := '1'
    else
      valor := '0';
    GravarConfig(NOME_PLUGIN, 'MostrarNotificacao', 0, valor);
  finally
    FreeAndNil(lista);
  end;
end;

end.
