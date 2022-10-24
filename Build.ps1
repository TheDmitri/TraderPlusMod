<#
=========================================================================

Name: Build
Description: Build and Start local server for scripting debugging

Author: TheDmitri

=========================================================================
#>

. "$PSScriptRoot\Userconfig.ps1" # IMPORT USER CONFIG VARIABLES

Invoke-Expression ".\StopClientAndServer.ps1"
Start-Sleep -Seconds 1

Get-ChildItem –Path $PROJECT_SRC |
Foreach-Object {
$filename = $OUTPUT_DIR + $_ + ".pbo"
$source = $PROJECT_SRC+$_

if (Test-Path $filename) {
  Remove-Item -Verbose -Force $filename
  Write-Host "Previous PBO Deleted"
}

$cmd = 'C:\Users\Brbap\OneDrive\Documents\GAMES\DAYZ\Git\DAYZTemplate\others\PBOSharp\PBOSharp_Example\bin\Debug\PBOSharp_Example.exe'
$allargs = @($source, $OUTPUT_DIR, $filename)
& $cmd $allargs

  Start-Sleep -Seconds 1
}

# START THE GAME + SERVER AFTER BUILDING THE PBO
switch ($LAUNCH_AFTER_BUILD)
{
    1
   {
       Invoke-Expression ".\launchoffline.ps1"
   }
    2
    {
        Invoke-Expression ".\launchlocalmp.ps1"
   }
}
