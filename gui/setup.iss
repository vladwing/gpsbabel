;
; NOTE: setup.iss is generated from setup.iss.in via configure.
; The generated setup.iss is checked in to help keep the version numbers
; synchronized.
;
; Script for generating installation setup program for GPSBabel
; Uses the Inno setup compiler.
; windeployqt should be run to prepare the necessary Qt files before
; running Inno Setup.
#ifndef gui_build_dir_name
  #define gui_build_dir_name "build-app-Desktop_Qt_5_5_1_MinGW_32bit-Release"
#endif
#ifndef gpsbabel_build_dir_name
  #define gpsbabel_build_dir_name "build-GPSBabel-Desktop_Qt_5_5_1_MinGW_32bit-Release"
#endif

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{1B8FE958-A304-4902-BF7A-4E2F0F5B7017}
AppName=GPSBabel
AppVerName=GPSBabel 1.7.0
AppPublisher=GPSBabel
AppPublisherURL=https://www.gpsbabel.org
AppSupportURL=https://www.gpsbabel.org
AppUpdatesURL=https://www.gpsbabel.org
DefaultDirName={pf}\GPSBabel
DefaultGroupName=GPSBabel
OutputDir=release
OutputBaseFilename=GPSBabel-1.7.0-Setup
OutputManifestFile=GPSBabel-1.7.0-Manifest.txt
SetupIconFile=images\babel2.ico
Compression=lzma
SolidCompression=yes
LicenseFile=COPYING.txt

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: gmapbase.html; 			DestDir: "{app}"; Flags: ignoreversion
Source: qt.conf;       			DestDir: "{app}"; Flags: ignoreversion

Source: "..\{#gui_build_dir_name}\release\*"; Excludes: "app.res,vcredist_*.exe,*.cpp,*.h,*.o,*.obj"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\{#gui_build_dir_name}\release\vcredist_x86.exe"; DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist deleteafterinstall
Source: "..\{#gui_build_dir_name}\release\vcredist_x64.exe"; DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist deleteafterinstall
Source: "..\..\{#gpsbabel_build_dir_name}\release\gpsbabel.exe";   	DestDir: "{app}"; Flags: ignoreversion
; Source: release\help\*;           	DestDir: "{app}\help"; Flags: ignoreversion recursesubdirs createallsubdirs

; Translation strings extracted from source code.  Include it in the dist
; so that users can translate if they want to.
; Source: gpsbabel_*.ts;           	DestDir: "{app}\translations"; Flags: ignoreversion
; Source: gpsbabelfe_*.ts;           	DestDir: "{app}\translations"; Flags: ignoreversion

; Compiled translation strings that are used at runtime.
Source: coretool\gpsbabel_*.qm;    	DestDir: "{app}\translations"; Flags: ignoreversion
Source: gpsbabelfe_*.qm;           	DestDir: "{app}\translations"; Flags: ignoreversion

; Miscellaneous
Source: COPYING.txt;			DestDir: {app}; Flags: ignoreversion
; Source: AUTHORS;			DestDir: {app}; Flags: ignoreversion
; Source: README.contrib;			DestDir: {app}; Flags: ignoreversion
; Source: README.gui;			DestDir: {app}; Flags: ignoreversion


; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\GPSBabel"; Filename: "{app}\gpsbabelfe.exe"
Name: "{commondesktop}\GPSBabel"; Filename: "{app}\gpsbabelfe.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\vcredist_x86.exe"; Parameters: "/quiet"; Flags: skipifdoesntexist
Filename: "{app}\vcredist_x64.exe"; Parameters: "/quiet"; Flags: skipifdoesntexist
Filename: "{app}\gpsbabelfe.exe"; Description: "{cm:LaunchProgram,GPSBabelFE}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: HKCU; Subkey: "Software\GPSBabel"; Flags: uninsdeletekeyifempty
Root: HKCU; Subkey: "Software\GPSBabel\GPSBabel"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\GPSBabel\GPSBabelFE"; Flags: uninsdeletekey

; ISPP preprocessor output can be useful for debug
#expr SaveToFile("PreprocessedScript.iss")
