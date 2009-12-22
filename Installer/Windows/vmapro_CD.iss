; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName={cm:MyAppName}
AppVerName={cm:MyAppName} Pro 5.0
AppPublisherURL={cm:MyAppUrl}
AppSupportURL={cm:MyAppUrl}
AppUpdatesURL={cm:MyAppUrl}
DefaultDirName={reg:HKCU\Software\Astro_PC\VirtualMoon,Install_Dir|{pf}\VirtualMoon}
DefaultGroupName={cm:MyAppName}
LicenseFile=CD\Data1\licence.txt
InfoBeforeFile=CD\Data1\readme.txt
OutputDir=setup\CDpro
OutputBaseFilename=setup
Compression=lzma
SolidCompression=true
UseSetupLdr=false
ShowLanguageDialog=yes
UsePreviousAppDir=false
WizardImageFile=setup_pict\WizMoonImage.bmp
WizardSmallImageFile=setup_pict\WizMoonSmallImage.bmp
UninstallLogMode=append
AppID={{3EB7A19B-690F-49BA-B494-CADA547D0DB9}
VersionInfoDescription={cm:MyAppName}

[CustomMessages]
eng.MyAppName=Virtual Moon Atlas
eng.MyAppUrl=http://www.ap-i.net/avl/en/start
eng.MyWebPage=VMA
eng.MyDocumentation=Documentation
eng.MyDocFile=doc\UK_Index_Doc.html
eng.MyTutorial=doc\UK_tutorial.html
eng.MyTutorialMsg=Read the tutorial
fre.MyAppName=Atlas Virtuel de la Lune
fre.MyAppUrl=http://www.ap-i.net/avl/fr/start
fre.MyWebPage=AVL
fre.MyDocumentation=Documentation
fre.MyDocFile=doc\FR_Index_Doc.html
fre.MyTutorial=doc\FR_tutorial.html
fre.MyTutorialMsg=Voir les instructions

[Messages]
eng.UninstalledAll=%1 was successfully removed from your computer.
fre.UninstalledAll=%1 a été correctement désinstallé de cet ordinateur.

[Languages]
Name: eng; MessagesFile: compiler:Default.isl; InfoBeforeFile: CD\Data1\readme.txt; LicenseFile: CD\Data1\licence.txt
Name: fre; MessagesFile: compiler:Languages\French.isl; InfoBeforeFile: CD\Data1\lisezmoi.txt; LicenseFile: CD\Data1\licence_fr.txt

[InstallDelete]
Name: {app}\vmapro.exe; Type: files; Components: ; Tasks: ; Languages: 
Name: {app}\vmaexpert.exe; Type: files; Components: ; Tasks: ; Languages: 
Name: {app}\vmalight.exe; Type: files; Components: ; Tasks: ; Languages: 
Name: {app}\virtualmoon.exe; Type: files; Components: ; Tasks: ; Languages: 
Name: {app}\vmabasic.exe; Type: files; Components: ; Tasks: ; Languages: 
Name: {app}\fiximg.exe; Type: files; Components: ; Tasks: ; Languages: 
Name: {app}\createtexture.exe; Type: files; Components: ; Tasks: ; Languages: 
Name: {app}\plan404.dll; Type: files; Components: ; Tasks: ; Languages: 
Name: {app}\elp82.dll; Type: files; Components: ; Tasks: ; Languages: 
Name: {localappdata}\Virtualmoon\vignette; Type: filesandordirs
Name: {localappdata}\Virtualmoon\Database\*.dbl; Type: files
Name: {localappdata}\Virtualmoon\Database\database_journal.txt; Type: files
Name: {localappdata}\Virtualmoon\vma.rc; Type: files
Name: {userappdata}\Virtualmoon\vignette; Type: filesandordirs
Name: {userappdata}\Virtualmoon\Database\*.dbl; Type: files
Name: {userappdata}\Virtualmoon\Database\database_journal.txt; Type: files
Name: {userappdata}\Virtualmoon\virtualmoon.ini; Type: files
Name: {group}\Virtual Moon Atlas Pro.lnk; Type: files; Components: ; Tasks: ; Languages: 
Name: {group}\Virtual Moon Atlas Expert.lnk; Type: files; Components: ; Tasks: ; Languages: 
Name: {group}\Virtual Moon Atlas Light.lnk; Type: files; Components: ; Tasks: ; Languages: 
Name: {group}\Virtual Moon Atlas Basic.lnk; Type: files; Components: ; Tasks: ; Languages: 
Name: {group}\Atlas Virtuel de la Lune Pro.lnk; Type: files; Components: ; Tasks: ; Languages: 
Name: {group}\Atlas Virtuel de la Lune Expert.lnk; Type: files; Components: ; Tasks: ; Languages: 
Name: {group}\Atlas Virtuel de la Lune Light.lnk; Type: files; Components: ; Tasks: ; Languages: 
Name: {group}\Atlas Virtuel de la Lune Basic.lnk; Type: files; Components: ; Tasks: ; Languages: 

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: CD\Data1\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Main
Source: CD\Data2\*; DestDir: {app}; Flags: recursesubdirs ignoreversion replacesameversion; Components: Pictures; Tasks: ; Languages: 

[Components]
Name: Main; Description: Required program files; Types: custom full compact; Languages: eng; Flags: fixed
Name: Main; Description: Fichiers nécessaires pour le programme; Types: custom full compact; Languages: fre; Flags: fixed
Name: Pictures; Description: Lunar formation pictures; Types: full; Languages: eng; Flags: exclusive
Name: Pictures; Description: Images des formations lunaires; Types: full; Languages: fre; Flags: exclusive
Name: FixOldPict; Description: No pictures; Flags: exclusive disablenouninstallwarning; Types: custom compact; Languages: eng
Name: FixOldPict; Description: Sans images; Flags: exclusive disablenouninstallwarning; Types: custom compact; Languages: fre

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Registry]
Root: HKCU; Subkey: Software\Astro_PC\VirtualMoon; ValueType: string; ValueName: Install_Dir; ValueData: {app}; Flags: uninsdeletekey

[INI]
Filename: {app}\vma.url; Section: InternetShortcut; Key: URL; String: {cm:MyAppUrl}

[Icons]
Name: {group}\{cm:MyAppName}; Filename: {app}\atlun.exe; WorkingDir: {app}; IconIndex: 0; Tasks: ; Languages: 
Name: {group}\Documentation; Filename: {app}\{cm:MyDocFile}; WorkingDir: {app}/doc
Name: {group}\{cm:ProgramOnTheWeb,{cm:MyWebPage}}; Filename: {app}\vma.url
Name: {userdesktop}\{cm:MyAppName}; Filename: {app}\atlun.exe; Tasks: desktopicon; WorkingDir: {app}; IconIndex: 0
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\{cm:MyAppName}; Filename: {app}\atlun.exe; Tasks: quicklaunchicon; WorkingDir: {app}; IconIndex: 0

[Run]
Filename: {app}\fiximg.exe; Parameters: Apollo; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\fiximg.exe; Parameters: ApolloMapping; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\fiximg.exe; Parameters: CLA; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\fiximg.exe; Parameters: Clementine; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\fiximg.exe; Parameters: LAC_LM; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\fiximg.exe; Parameters: Lopam; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\fiximg.exe; Parameters: Probes; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\fiximg.exe; Parameters: BestOfAmateurs; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\fiximg.exe; Parameters: BestOfHiggins; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\fiximg.exe; Parameters: BestOfLazzarotti; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\fiximg.exe; Parameters: LunaStars; WorkingDir: {app}; StatusMsg: Fix old pictures format ...; Components: FixOldPict
Filename: {app}\{cm:MyTutorial}; Flags: postinstall shellexec nowait skipifsilent; Description: {cm:MyTutorialMsg}

[UninstallDelete]
Type: files; Name: {app}\vma.url
Name: {localappdata}\Virtualmoon\vignette; Type: filesandordirs
Name: {localappdata}\Virtualmoon\Database\*.dbl; Type: files
Name: {localappdata}\Virtualmoon\Database\database_journal.txt; Type: files
Name: {localappdata}\Virtualmoon\vma.rc; Type: files

[_ISTool]
UseAbsolutePaths=false
