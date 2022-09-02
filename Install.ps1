<#
.DESCRIPTION
	Autopilot user provisioning package for user customisation.
	This package registers local experience packs for users and configures user locale preferences.
.NOTES
	Version:	1.0
	Author:		https://github.com/rh-au
#>

# PowerShell 32-bit to 64-bit process
if ("$env:PROCESSOR_ARCHITEW6432" -ne "ARM64") {
	if (Test-Path "$($env:WINDIR)\SysNative\WindowsPowerShell\v1.0\powershell.exe") {
		& "$($env:WINDIR)\SysNative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy bypass -NoProfile -File "$PSCommandPath"
		Exit $lastexitcode
	}
}

Start-Transcript -Path "$env:AppData\Autopilot\Install.log" | Out-Null

# Register local experience packs
(Get-AppxPackage | Where-Object { $_.Name -match "Microsoft.LanguageExperiencePack" }).InstallLocation | ForEach-Object {
	Add-AppxPackage -Register -Path "$_\AppxManifest.xml" -DisableDevelopmentMode | Out-Null
}

# Set user locale preferences
Set-Culture -CultureInfo "en-AU" | Out-Null
Set-WinHomeLocation -GeoId "12" | Out-Null
Set-WinDefaultInputMethodOverride -InputTip "0c09:00000409" | Out-Null
Set-WinUILanguageOverride -Language "en-AU" | Out-Null
Set-WinUserLanguageList "en-AU" -Force | Out-Null

# Create Intune detection file
New-Item -Path "$env:AppData\Autopilot\Autopilot.installed" -ItemType file | Out-Null

Stop-Transcript | Out-Null