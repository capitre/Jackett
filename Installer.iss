; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Jackett"
#define MyAppVersion "0.5"
#define MyAppPublisher "Jackett  Inc."
#define MyAppURL "https://github.com/zone117x/Jackett"
#define MyAppExeName "JackettTray.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C2A9FC00-AA48-4F17-9A72-62FBCEE2785B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=setup
SetupIconFile=src\Jackett.Console\jackett.ico
UninstallDisplayIcon={app}\JackettConsole.exe
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "windowsService"; Description: "Install as a Windows Service"
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "Build\JackettTray.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "Build\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Run]
Filename: "{app}\JackettConsole.exe"; Parameters: "--Uninstall"; Flags: waituntilterminated;
Filename: "{app}\JackettConsole.exe"; Parameters: "--ReserveUrls"; Flags: waituntilterminated;
Filename: "{app}\JackettConsole.exe"; Parameters: "--Install"; Flags: waituntilterminated; Tasks: windowsService
Filename: "{app}\JackettConsole.exe"; Parameters: "--Start"; Flags: waituntilterminated; Tasks: windowsService

[UninstallRun]
Filename: "{app}\JackettConsole.exe"; Parameters: "--Uninstall"; Flags: waituntilterminated skipifdoesntexist


