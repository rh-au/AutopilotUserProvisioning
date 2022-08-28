# Autopilot User Provisioning
Autopilot user provisioning package for user customisation. This package registers local experience packs for users and configures user locale preferences.

## Usage
1. Download the package and customise Install.ps1.
2. Package with the [Microsoft Win32 Content Prep Tool](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool).
3. Add to Microsoft Intune and assign user group.

#### Install command
Powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\Install.ps1
#### Uninstall command
Powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\Uninstall.ps1
#### Install detection
%AppData%\Autopilot.installed
