<#
=========================================================================

Name: ClearLogs
Description: Deletes all logs associated with DayZ, client and server

Author: TheDmitri

=========================================================================
#>

. "$PSScriptRoot\userconfig.ps1" # IMPORT USER CONFIG VARIABLES

@("$SERVER_PROFILE_PATH\","$env:LOCALAPPDATA\DayZ\","$env:LOCALAPPDATA\DayZ Exp\") | ForEach-Object {
    if ([bool]$_ -and (Test-Path $_)) {
        Get-ChildItem -Path "$_\*" -Include "*.rpt","*.log","*.mdmp","*.ADM","*.tak" -ErrorAction SilentlyContinue | Remove-Item
    }
}

exit
