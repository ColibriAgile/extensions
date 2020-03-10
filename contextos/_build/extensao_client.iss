#ifndef AppName
  #define AppName "Nome"
  #define AppVersion "1.0.0.0"
  #define ExtensionName "Nome"
#endif

#define PastaIncludes ".\"
#include PastaIncludes + "colibri_includes.iss"


[Setup]
AppCopyright=Copyright 2017
AppName={#AppName}
AppVersion={#AppVersion} 
AppPublisher=NCR Corporation
DefaultDirName={code:PastaNCRColibri|c:\NCR Colibri}
OutputDir=_build\pacote
OutputBaseFilename={#ExtensionName}_{#AppVersion}_shared
Uninstallable=no
UsePreviousAppDir=no
SourceDir=..

[Files]
Source: "_build\*.col"; DestDir: "{app}\plugins\{#ExtensionName}\"; Flags: skipifsourcedoesntexist ignoreversion restartreplace overwritereadonly
Source: "extras\*"; DestDir: "{app}\plugins\{#ExtensionName}\"; Flags: skipifsourcedoesntexist ignoreversion recursesubdirs restartreplace overwritereadonly

[Code]

procedure CurStepChanged(CurStep: TSetupStep);
var
  cam: string;
begin
  if CurStep = ssInstall then
  begin
    cam := ExpandConstant('{app}\plugins\Contextos');
    if DirExists(cam) then
      DelTree(cam, True, True, True);
  end;
end;