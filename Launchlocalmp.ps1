<#
=========================================================================

Name: LaunchLocalMP
Description: Launches the DayZ client and server with the compiled mod

Author: TheDmitri

=========================================================================
#>

. "$PSScriptRoot\Userconfig.ps1" # IMPORT USER CONFIG VARIABLES

#Stop-Process -Name "DayZ_x64" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "DayZServer_x64" -Force -ErrorAction SilentlyContinue

if ($CLEAR_LOGS_AUTOMATIC){
    Invoke-Expression ".\Clearlogs.ps1"
}

if ((Test-Path $LOCAL_DAYZ_SERVER_PATH)) {
    <#$cmd = "$($LOCAL_DAYZ_SERVER_PATH)\DayZServer_x64.exe"
    $allargs = @("-config=serverDZ.cfg", "-profiles=$SERVER_PROFILE_PATH", "-mod=$OUTPUT_DIR;$ADDITIONAL_MODS", "-port=2302", "-dologs", "-adminlog", "-freezecheck", "-scrAllowFileWrite")
    & $cmd $allargs#>
    Write-Host "Starting DayZ Server..."
    Start-Process -FilePath "$($LOCAL_DAYZ_SERVER_PATH)\DayZServer_x64.exe" -ArgumentList "-config=serverDZ.cfg", "-profiles=$SERVER_PROFILE_PATH", "-port=2302", "-mod=$ADDITIONAL_MODS;$SERVER_MODS", "-dologs", "-adminlog", "-freezecheck", "-scrAllowFileWrite"
}

if ([bool]$PUBLIC_KEY_PATH -and (Test-Path $PUBLIC_KEY_PATH)) {
    Copy-Item $PUBLIC_KEY_PATH -Destination "$($LOCAL_DAYZ_SERVER_PATH)\keys" | Out-Null
}

<#Start-Sleep -Seconds 5

if ((Test-Path $DAYZ_ROOT_PATH)) {
    Push-Location $DAYZ_ROOT_PATH
    Write-Host "Starting DayZ Client..."
    $cmd1 = "$($DAYZ_ROOT_PATH)\DayZ_BE.exe"
    $allargs1 = @("-connect=127.0.0.1", "-port=2302", "-mod=$OUTPUT_DIR;$ADDITIONAL_MODS", "-nosplash", "-noPause", "-noBenchmark", "-doLogs", "-scriptDebug=true")
    & $cmd1 $allargs1
    Start-Process -FilePath "$($DAYZ_ROOT_PATH)\DayZ_BE.exe" -ArgumentList "-connect=127.0.0.1", "-port=2302", "-mod=$OUTPUT_DIR;$ADDITIONAL_MODS", "-nosplash", "-noPause", "-noBenchmark", "-doLogs", "-scriptDebug=true"
    Pop-Location
}#>

Exit

<#Start-Sleep -Seconds 15

$dir = $SERVER_PROFILE_PATH
$OCSlatest = (Get-ChildItem -Path $dir -Filter 'crash*.log' | Sort-Object LastCreatedTime -Descending | Select-Object -First 1).fullname
if ($OCSlatest) {
    #we know we have a file
    $OCSlatest
    $search = (Get-Content $OCSlatest | Select-String -Pattern 'success').Matches.Success
    if($search){
        Invoke-Item $OCSlatest
        Invoke-Expression ".\StopClientAndServer.ps1"
        #Get-Content $OCSlatest -tail 20 -Recurse -Force
    }
}
else {
    "No matching files found in $dir"
}

#Read-Host -Prompt "Press Enter to exit"
#>
