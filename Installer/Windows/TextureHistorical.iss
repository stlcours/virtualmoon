; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName={cm:MyAppName}
AppVerName={cm:MyAppName} 
DefaultDirName={reg:HKCU\Software\Astro_PC\VirtualMoon,Install_Dir|{pf}\VirtualMoon}
InfoBeforeFile=setup_pict\readme.txt
OutputDir=setup
OutputBaseFilename=texture_historical
Compression=zip
SolidCompression=true
UseSetupLdr=true
UsePreviousAppDir=false
WizardImageFile=setup_pict\WizMoonImage.bmp
WizardSmallImageFile=setup_pict\WizMoonSmallImage.bmp
UninstallLogMode=append
AppID={{3EB7A19B-690F-49BA-B494-CADA547D0DB9}
CreateUninstallRegKey=false
UpdateUninstallLogAppName=false
DirExistsWarning=no
ShowLanguageDialog=yes

[Languages]
Name: eng; MessagesFile: compiler:Default.isl; InfoBeforeFile: setup_pict\readme.txt
Name: fre; MessagesFile: compiler:Languages\French.isl; InfoBeforeFile: setup_pict\lisezmoi.txt

[Messages]
eng.UninstalledAll=%1 was successfully removed from your computer.
fre.UninstalledAll=%1 a �t� correctement d�sinstall� de cet ordinateur.

[CustomMessages]
eng.MyAppName=Historical texture complement
fre.MyAppName=addition texture Historiques

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: vmapro\Data\*; DestDir: {app}; Flags: recursesubdirs ignoreversion replacesameversion createallsubdirs 

[_ISTool]
UseAbsolutePaths=false
