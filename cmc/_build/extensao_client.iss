#ifndef AppName
  #define AppName "Nome"
  #define AppVersion "1.0.0.0"
  #define ExtensionName "Nome"
#endif

#define PastaIncludes ".\"
#include PastaIncludes + "colibri_includes.iss"
#define SetupBaseName "CMC_"

[Setup]
AppName=NCR Command Center
AppVersion={#AppVersion}
VersionInfoVersion={#AppVersion}
AppPublisher=NCR Food Service
AppCopyright=Copyright 2018
UninstallDisplayName=NCR Command Center
DefaultDirName={code:PastaNCRColibri|c:\NCR Colibri}
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputDir=pacote
OutputBaseFilename={#ExtensionName}_{#AppVersion}
Compression=lzma
SolidCompression=yes
CloseApplications=force
Uninstallable=no
UsePreviousLanguage=no

[Languages]
Name: "br"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "es"; MessagesFile: "compiler:Languages\Spanish.isl"

[Files]
Source: "..\bin\*.*"; DestDir: "{tmp}"; Flags: ignoreversion;

[Code]
// Caminho config: {pf32}\NCR\CMC

// Serviços:
// CmcAgent - reiniciar ao mudar
// CmcSvcWatcher

// Ao desinstalar, rodar (no baixado):
// cmcinstall /uninstall

// Para instalar nas estações:
// cmcinst /ip NOMEOUIPMASTER
// Para instalar no servidor
// cmcinst /siteid 5899{SERIAL}

{------------------------------------------------------------------------------}
function ObterParametros(s:string): String;
var
  i: Integer;
begin
  Result := ExpandConstant('/InstallPath "{app}\cmc"');

  for i:= 0 to ParamCount - 1 do
     if ParamStr(i) = '-serial' then
     begin
       Log('Encontrado parâmetro serial com valor ' + ParamStr(i+1));
       Result := Result + ' /siteid 5899' + ParamStr(i+1);
       break;
     end
     else if ParamStr(i) = '-masterhost' then
     begin
       Log('Encontrado parâmetro serial com valor ' + ParamStr(i+1));
       Result := Result + ' /ip ' + ParamStr(i+1);
       break;
     end;
   Log('Parametros: ' + Result);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssDone then
  begin
    // Dessa forma apago só se estiverem vazios, o Deltree não serve
    if RemoveDir('C:\bootdrv\aloha\rdf\images') then
      if RemoveDir('C:\bootdrv\aloha\rdf') then
        if RemoveDir('C:\bootdrv\aloha') then
          RemoveDir('C:\bootdrv');
  end;
end;

[Run]
Filename: "{tmp}\CMCInst.exe"; Parameters: "/uninstall"; WorkingDir: "{tmp}"; Flags: runhidden
Filename: "{tmp}\CMCInst.exe"; Parameters: "{code:ObterParametros}";WorkingDir: "{tmp}"; Flags: runhidden

