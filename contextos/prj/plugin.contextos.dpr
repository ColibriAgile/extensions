library plugin.contextos;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  IOutils,
  System.SysUtils,
  winapi.windows,
  plugin.api in '..\src\plugin.api.pas',
  form.config in '..\ui\form.config.pas' {formConfig},
  form.notificacao in '..\ui\form.notificacao.pas' {formNotificacao},
  form.mensagemerro in '..\ui\form.mensagemerro.pas' {formMensagemErro};

{$E col}
{$R *.res}
{$DEFINE DEBUGVIEW}

exports
  Ativar,
  AtribuirObtencaoDeFuncoes,
  Configurar,
  ConfigurarDB,
  Desativar,
  Notificar,
  ObterDadosFabricante,
  ObterMacro,
  ObterNome,
  ObterVersao,
  RegistrarAssinaturas,
  RegistrarAssinaturasServer,
  VerificarVersao;

var
  SaveDllProc: Pointer;

procedure Init_Destroy(Reason: Integer);
begin
  if Reason = DLL_PROCESS_DETACH then
  begin
    DllProc := SaveDllProc;
  end;
end;

begin
end.


