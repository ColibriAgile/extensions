#ifndef AppName
  #define AppName "Nome"
  #define AppVersion "1.0.0.0"
  #define ExtensionName "Nome"
#endif

#define PastaIncludes ".\"
#include PastaIncludes + "colibri_includes.iss"

[Setup]
AppCopyright=NCR Hospitality Intl, 2021
AppName={#AppName}
AppVersion={#AppVersion} 
AppPublisher=NCR Hospitality
DefaultDirName={code:PastaNCRColibri|c:\NCR Solution}
OutputDir=_build\pacote
OutputBaseFilename={#ExtensionName}_{#AppVersion}_client
Uninstallable=no
UsePreviousAppDir=no
SourceDir=..

[Files]
Source: "client\*"; DestDir: "{app}\plugins\{#ExtensionName}\"; Flags: skipifsourcedoesntexist ignoreversion recursesubdirs restartreplace overwritereadonly; Excludes: "*.xml,*.pdb,\ru\*.dll,\de\*.dll,\es\*.dll,\ja\*.dll"
Source: "reports\*"; DestDir: "{app}\plugins\{#ExtensionName}\reports"; Flags: skipifsourcedoesntexist ignoreversion recursesubdirs restartreplace overwritereadonly
Source: "templates\*"; DestDir: "{app}\plugins\{#ExtensionName}\templates"; Flags: skipifsourcedoesntexist ignoreversion recursesubdirs restartreplace overwritereadonly
Source: "extras\*"; DestDir: "{app}\plugins\{#ExtensionName}"; Flags: skipifsourcedoesntexist ignoreversion recursesubdirs restartreplace overwritereadonly

[InstallDelete]
Type: filesandordirs; Name: "{app}\plugins\{#ExtensionName}"
