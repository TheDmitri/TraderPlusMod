<#
=========================================================================

Name: StopClientAndServer
Description: Stop client and server

Author: TheDmitri

=========================================================================
#>

taskkill /IM DayZServer_x64.exe /F
taskkill /IM DayZ_x64.exe /F

#Stop-Process -Name "DayZ_x64" -Force -ErrorAction SilentlyContinue
#Stop-Process -Name "DayZServer_x64" -Force -ErrorAction SilentlyContinue

Exit
