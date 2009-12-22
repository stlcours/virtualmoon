; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName={cm:MyAppName}
AppVerName={cm:MyAppName}
DefaultDirName={reg:HKCU\Software\Astro_PC\VirtualMoon,Install_Dir|{pf}\VirtualMoon}
OutputDir=setup
OutputBaseFilename=lang_CA
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

[CustomMessages]
MyAppName=Virtual Moon Atlas, Catalan translation

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: translation\ca\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs

[Messages]
UninstalledAll=%1 was successfully removed from your computer.

[_ISTool]
UseAbsolutePaths=false
