unit plugin.api;

interface

type

//Ponteiros de função
  ProcAlocarBuffer = function(Buffer: PChar): PChar; stdcall;
  ProcAssinarEvento = procedure (umPlugin, umEvento: PChar); stdcall;
  ProcCallBack = procedure(umPlugin, umEvento, umContexto: PChar); stdcall;
  ProcGravarConfig =  procedure(umPlugin, umaConfig: PChar; umaMaquina:Integer; umValor: PChar=nil); stdcall;
  ProcLiberarBuffer = procedure(Buffer: PChar);stdcall;
  ProcObterConfigs = function(umPlugin:PChar; umaMaquina:Integer): Pchar; stdcall;
  ProcObterFuncao = function (nomeFuncao: PChar):Pointer; stdcall;

//Funções Exportadas da DLL
  function VerificarVersao(informacao:PChar): PChar; stdcall; export;
  procedure Ativar(umaMaquina:Integer); stdcall; export;
  procedure AtribuirObtencaoDeFuncoes(_ObterFuncao: ProcObterFuncao); stdcall; export;
  procedure Configurar(dictMaquinas:PChar); stdcall; export;
  procedure ConfigurarDB (const umServidor, umBanco, umUsuario, umaSenha, umProvedor: PChar); stdcall;
  procedure Desativar(umaMaquina:Integer); stdcall; export;
  procedure RegistrarAssinaturas(AssinarEvento: ProcAssinarEvento); stdcall; export;
  procedure RegistrarAssinaturasServer(AssinarEvento: ProcAssinarEvento); stdcall; export;

//Não exportadas
  function Notificar(evento, contexto: PChar): PChar; stdcall;
  function ObterCaminhoDoPlugin: string;
  function ObterDadosFabricante(): PChar; stdcall;
  function ObterMacro (umaMacro: PChar): PChar; stdcall;
  function ObterNome(): PChar; stdcall;
  function ObterVersao(): PChar; stdcall;

const
  LOG_SESSAO = 'plugin.contextos';
  NOME_PLUGIN = 'Contextos';
  FABRICANTE =
    '{'+
      '"fabricante":{' +
        '"empresa":"NCR",' +
        '"desenvolvedor":"NCR Colibri",' +
        '"termos_da_licenca":"",' +
        '"direitos_de_copia":"",' +
        '"marcas_registradas":"NCR Colibri® é marca registrada da NCR Corp"' +
      '},'+
      '"suporte":{' +
        '"email":"suporte.canais@ncr.com",' +
        '"url":"",' +
        '"telefone":"(11)3323-3731"' +
      '}'+
    '}';

var
  AlocarBuffer: ProcAlocarBuffer;
  CallBack: ProcCallBack;
  GravarConfig: ProcGravarConfig;
  LiberarBuffer: ProcLiberarBuffer;
  ObterConfigs: ProcObterConfigs;
  ObterFuncao: ProcObterFuncao;
  ModoServer: Boolean = False;

implementation

uses
  System.Classes,
  Winapi.Windows,
  system.SysUtils,
  suporte.json,
  suporte.aplicativo,
{$ifdef USAR_CODESITE}
  suporte.log,
{$endif}
  System.StrUtils,
  System.IOUtils,
  form.config,
  form.notificacao;

var
  params : ISuperJson;
  mostrarNotificacao: Boolean;
  ListaNaoExibir: TStringList;
{$ifndef USAR_CODESITE}
  LogFilename: string;
{$endif}

function Notificar(evento, contexto: PChar): PChar;
var
  stringList: TStringList;
  modificadores: string;
  naoExibir: Boolean;
  ultimoErro: string;
  acao: string;
  resultado: ISuperJson;
begin
  stringList := TStringList.Create;
  stringList.Text := SJ(contexto).AsJSon(True);
  {$ifdef USAR_CODESITE}
  Logger(LOG_SESSAO).Debug(Format('Evento disparado <%s> com contexto', [evento]), stringList);
  {$else}
  TFile.AppendAllText(LogFilename, DateTimeToStr(Now()) + ' ' + string(evento) + ^j^m + stringList.Text);
  {$endif}

  if ModoServer then
    Exit(AlocarBuffer(PChar('{}')));

  ultimoErro := '';
  naoExibir := False;

  if mostrarNotificacao and (ListaNaoExibir.IndexOf(evento) < 0) then
    TformNotificacao.Executar(evento, stringList.Text, ultimoErro, modificadores, acao, naoExibir);

  stringList.Free;

  if naoExibir then
    ListaNaoExibir.Add(evento);
  if Assigned(params) and params.B['desmarcar_eventos'] then
    GravarConfig(NOME_PLUGIN, PChar(StringReplace(evento, '.', '_', [rfReplaceAll])), 0, nil);

  if Length(modificadores) >  0 then
    resultado := SJ(modificadores)
  else
    resultado := SJ();

  if ultimoErro <> '' then
    resultado.S['erro'] := ultimoErro;

  if acao <> '' then
    resultado.S['acao'] := acao;

  Result := AlocarBuffer(PChar(resultado.AsJSon(True)));
end;

function ObterVersao(): PChar; stdcall; export;
var
  caminhoDoPlugin: string;
begin
  caminhoDoPlugin := aplicativo.CaminhoDoModulo() + Aplicativo.NomeDoModulo;
  Result := AlocarBuffer(PChar(aplicativo.Versao([majorVersion, minorVersion, releaseVersion, buildVersion], caminhoDoPlugin)));
end;

function ObterNome(): PChar; stdcall; export;
begin
  Result := AlocarBuffer(PChar(NOME_PLUGIN));
end;

function ObterDadosFabricante(): PChar; stdcall; export;
begin
  Result := AlocarBuffer(PChar(FABRICANTE));
end;

procedure RegistrarAssinaturas(AssinarEvento: ProcAssinarEvento); stdcall; export;
var
  buffer : PChar;
  evento: string;
  obj,
  item: ISuperJson;
begin
  {$ifndef USAR_CODESITE}
  LogFilename := ObterCaminhoDoPlugin() + 'log';
  ForceDirectories(LogFilename);
  if ModoServer then
    LogFilename := IncludeTrailingPathDelimiter(LogFilename) + 'eventos_server.log'
  else
    LogFilename := IncludeTrailingPathDelimiter(LogFilename) + 'eventos.log';
  {$endif}

  // Obtenho os params no arquivo de config
  params := SJ(TFile.ReadAllText(ObterCaminhoDoPlugin + 'eventos.json')).o['params'];
  ListaNaoExibir:= TStringList.Create;

  // Obtenho as configurações salvas
  buffer := ObterConfigs(NOME_PLUGIN, 0);
  obj := SJ(buffer).o['configs'];
  try
    mostrarNotificacao := obj.x['MostrarNotificacao'].s['valor'] = '1';
    for item in obj do begin
      if StartsStr('Evento_', item.name) then
      begin
        evento := StringReplace(Copy(item.Name, 8, Length(item.Name)-7), '_', '.', [rfReplaceAll]);
        AssinarEvento(NOME_PLUGIN, PChar(evento));
      end;
    end;
  finally
    LiberarBuffer(buffer);
    obj := nil;
    item := nil;
  end;
end;

procedure RegistrarAssinaturasServer(AssinarEvento: ProcAssinarEvento); stdcall; export;
begin
  ModoServer := True;
  RegistrarAssinaturas(AssinarEvento);
end;

procedure AtribuirObtencaoDeFuncoes(_ObterFuncao: ProcObterFuncao); stdcall; export;
begin
  ObterFuncao := _ObterFuncao;
  CallBack := ProcCallBack(ObterFuncao('CallBack'));
  AlocarBuffer := ProcAlocarBuffer(ObterFuncao('AlocarBuffer'));
  LiberarBuffer := ProcLiberarBuffer(ObterFuncao('LiberarBuffer'));
  GravarConfig := ProcGravarConfig(ObterFuncao('GravarConfig'));
  ObterConfigs := ProcObterConfigs(ObterFuncao('ObterConfigs'));
end;

procedure Ativar(umaMaquina:Integer); stdcall; export;
begin

end;

procedure Desativar(umaMaquina:Integer); stdcall; export;
begin

end;

procedure Configurar(dictMaquinas:PChar); stdcall; export;
begin
  TformConfig.Executar(dictMaquinas);
end;

function VerificarVersao(informacao:PChar): PChar; export;
begin
  Result := AlocarBuffer('');
end;

procedure ConfigurarDB (const umServidor, umBanco, umUsuario, umaSenha, umProvedor: PChar); stdcall;
begin

end;

function ObterMacro (umaMacro: PChar): PChar; stdcall;
begin
  Result := AlocarBuffer(PChar(Format('{"erro":"Macro desconhecida: %s"}', [umaMacro])))
end;

function ObterCaminhoDoPlugin: string;
var
  buffer: array[0..MAX_PATH] of Char;
begin
  FillChar(buffer, Length(buffer)-1, #0);
  GetModuleFileName(HInstance, Buffer, Length(Buffer));
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(buffer));
end;

initialization
  ListaNaoExibir:= nil;
finalization
  FreeAndNil(ListaNaoExibir);
end.
