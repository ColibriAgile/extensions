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
OutputDir=_build\pacote
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

[Run]
; Para passar os parâmetros de banco para o DbUpdate deve ser passado no innosetup assim:
; /DATABASE="-provedor provedor -servidor servidor -banco banco -usuario usuario -senha senha"
Filename: "{tmp}\CMCInst.exe"; Parameters: "/uninstall"; WorkingDir: "{tmp}"; Flags: runhidden
Filename: "{tmp}\CMCInst.exe"; Parameters: ObterParametros; WorkingDir: "{tmp}"; Flags: runhidden

[InstallDelete]
Type: dirifempty; Name: "C:\bootdrv\aloha\rdf\images"

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
function ObterParametros(): String;
var
  i: Integer;
begin

  for i:= 0 to ParamCount - 1 do
     if ParamStr(i) = '-serial' then
     begin
       if Result <> '' then
          Result := Result + ' ';
  
       Result := Result + '/siteid 5899' + ParamStr(i+1);
       break;
     end
     else if ParamStr(i) = '-master_host' then
     begin
       if Result <> '' then
          Result := Result + ' ';
  
       Result := Result + '/ip' + ParamStr(i+1);
       break;
     end;
end;