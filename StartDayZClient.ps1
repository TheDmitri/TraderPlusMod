<#
=========================================================================

Name: LaunchLocalMP
Description: Launches the DayZ client and server with the compiled mod

Author: TheDmitri
``
=========================================================================
#>

. "$PSScriptRoot\Userconfig.ps1" # IMPORT USER CONFIG VARIABLES

Stop-Process -Name "DayZ_x64" -Force -ErrorAction SilentlyContinue

if ((Test-Path $DAYZ_ROOT_PATH)) {
    Push-Location $DAYZ_ROOT_PATH
    Write-Host "Starting DayZ Client..."
    <#$cmd1 = "$($DAYZ_ROOT_PATH)\DayZ_BE.exe"
    $allargs1 = @("-connect=127.0.0.1", "-port=2302", "-mod=$OUTPUT_DIR;$ADDITIONAL_MODS", "-nosplash", "-noPause", "-noBenchmark", "-doLogs", "-scriptDebug=true")
    & $cmd1 $allargs1#>
    Start-Process -FilePath "$($DAYZ_ROOT_PATH)\DayZ_BE.exe" -ArgumentList "-connect=127.0.0.1", "-port=2302", "-mod=$ADDITIONAL_MODS", "-nosplash", "-noPause", "-noBenchmark", "-doLogs", "-scriptDebug=true"
    Pop-Location
}

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
