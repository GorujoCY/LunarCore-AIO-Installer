; Script generated by the Inno Setup Script Wizard and Modified by me.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "LunarCore"
#define MyAppVersion "1.12"
#define MyAppPublisher "Gorujo. For LC: Melledy"
#define MyAppExeName "LunarCore.jar"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
; I redacted directories to hide my windows username and simplify the actual location
AppId=[REDACTED FOR SECURITY REASON]
AppName={#MyAppName}
AppVerName=Gorujo's LunarCore Installer 1.12
;' Closing out quotation markdown issue here, this is supposed to be a comment 
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
UninstallDisplayIcon=%USERPROFILE%\(...)\files\icon.ico
UninstallDisplayName={#MyAppName}
DefaultDirName={localappdata}\Programs\{#MyAppName}
DefaultGroupName={#MyAppName}
SetupIconFile=%USERPROFILE%\(...)\files\icon.ico
InfoBeforeFile=%USERPROFILE%\(...)\files\README.txt 
InfoAfterFile=%USERPROFILE%\(...)\files\READMEafter.txt
LicenseFile=%USERPROFILE%\(...)\files\licensetext.txt
; Despite text and icon files being located differently on github, this is where they are actually located on my pc, same with all files
PrivilegesRequiredOverridesAllowed=commandline
OutputBaseFilename=LunarCoreSetup
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64 

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
;desktop shortcut choice
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";
;Uninstallation decision
Name: "uninstalljdk17"; Description: "Remove Java Development Kit 17 (SE)"; GroupDescription: "After Uninstall:"; Flags: unchecked;
Name: "uninstallcultivation"; Description: "Remove Cultivation"; GroupDescription: "After Uninstall:"; Flags: unchecked;

[Components]
;install componenets
Name: "installjdk17"; Description: "Install Java Development Kit 17 (SE)"; Types: full; ExtraDiskSpaceRequired: 440401920;
Name: "installcultivation"; Description: "Install Cultivation"; Types: full; ExtraDiskSpaceRequired: 17825792;

[Files]
Source: "%USERPROFILE%\(...)\files\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "%USERPROFILE%\(...)\files\LICENSE"; DestDir: "{app}"; Flags: ignoreversion
Source: "%USERPROFILE%\(...)\files\config.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "%USERPROFILE%\(...)\files\keystore.p12"; DestDir: "{app}"; Flags: ignoreversion
Source: "%USERPROFILE%\(...)\files\icon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "%USERPROFILE%\(...)\files\icon-doc.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "%USERPROFILE%\(...)\files\jdk-17_windows-x64_bin.exe"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
Source: "%USERPROFILE%\(...)\files\Cultivation_1.2.0_x64_en-US.msi"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
Source: "%USERPROFILE%\(...)\files\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "%USERPROFILE%\(...)\files\resources\*"; DestDir: "{app}\resources"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\LunarCore"; Filename: "{cmd}"; Parameters: "/K java -jar {app}\{#MyAppExeName}"; IconFilename: "{app}\icon.ico"; WorkingDir: "{app}"
Name: "{group}\{cm:UninstallProgram,LunarCore}"; Filename: "{uninstallexe}"
Name: "{group}\LunarCore Handbook"; Filename: "{app}\Lunar Core Handbook.txt"; WorkingDir: "{app}"; IconFilename: "{app}\icon-doc.ico"
Name: "{autodesktop}\LunarCore"; Filename: "{cmd}"; Parameters: "/K java -jar {app}\{#MyAppExeName}"; Tasks: desktopicon; IconFilename: "{app}\icon.ico"; WorkingDir: "{app}"
Name: "{autodesktop}\LunarCore Handbook"; Filename: "{app}\Lunar Core Handbook.txt";  Tasks: desktopicon; WorkingDir: "{app}"; IconFilename: "{app}\icon-doc.ico"

[Run]
Filename: "{app}\jdk-17_windows-x64_bin.exe"; Parameters: "/qn"; StatusMsg: "Installing JDK 17..."; Flags: runhidden; Components: installjdk17;
Filename: "{app}\Cultivation_1.2.0_x64_en-US.msi"; StatusMsg: "Installing Cultivation..."; Flags: shellexec; Components: installcultivation;
Filename: "{cmd}"; Parameters: "/K java -jar {app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: shellexec postinstall skipifsilent; WorkingDir: "{app}"

[UninstallDelete]  
Type: filesandordirs; Name: "{app}/*"; 

[UninstallRun]
Filename: "MsiExec.exe"; Parameters: "/passive /X{{F1FB15A1-E909-592A-BC35-C68EA29D4785}"; Flags: shellexec; Tasks: uninstalljdk17; 
Filename: "MsiExec.exe"; Parameters: "/passive /X{{ADEF6C8E-4701-4F8A-9483-E7EBF4D2A8A0}"; Flags: shellexec; Tasks: uninstallcultivation;
