﻿#try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
  # main helpers - these have error handling tucked into them so they become the only line of your script if that is all you need.
  # installer, will assert administrative rights
  Install-ChocolateyPackage 'camstudio' 'EXE' '/SILENT' 'http://downloads.sourceforge.net/project/camstudio/stable/CamStudio_Setup_v2.6b_r294_%28build_24Oct2010%29.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fcamstudio%2Ffiles%2Fstable%2F&ts=1348111153&use_mirror=auto' -validExitCodes @(0)
  # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
  #Exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
  # download and unpack a zip file
  #Install-ChocolateyZipPackage 'camstudio' 'http://downloads.sourceforge.net/project/camstudio/stable/CamStudio_Setup_v2.6b_r294_%28build_24Oct2010%29.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fcamstudio%2Ffiles%2Fstable%2F&ts=1348111153&use_mirror=auto' "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" '64BIT_URL_DELETE_IF_NO_64BIT' 
  
  # other helpers - using any of these means you want to uncomment the error handling up top and at bottom.
  # downloader that the main helpers use to download items
  #Get-ChocolateyWebFile 'camstudio' 'DOWNLOAD_TO_FILE_FULL_PATH' 'URL' '64BIT_URL_DELETE_IF_NO_64BIT'
  # installer, will assert administrative rights - used by Install-ChocolateyPackage
  #Install-ChocolateyInstallPackage 'camstudio' 'EXE_OR_MSI' 'SILENT_ARGS' '_FULLFILEPATH_' -validExitCodes @(0)
  # unzips a file to the specified location - auto overwrites existing content
  #Get-ChocolateyUnzip "FULL_LOCATION_TO_ZIP.zip" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  # Runs processes asserting UAC, will assert administrative rights - used by Install-ChocolateyInstallPackage
  #Start-ChocolateyProcessAsAdmin 'STATEMENTS_TO_RUN' 'Optional_Application_If_Not_PowerShell' -validExitCodes @(0)
  # add specific folders to the path - any executables found in the chocolatey package folder will already be on the path. This is used in addition to that or for cases when a native installer doesn't add things to the path.
  #Install-ChocolateyPath 'LOCATION_TO_ADD_TO_PATH' 'User_OR_Machine' # Machine will assert administrative rights
  # add specific files as shortcuts to the desktop
  #$target = Join-Path $MyInvocation.MyCommand.Definition 'camstudio.exe'
  #Install-ChocolateyDesktopLink $target
  
  #------- ADDITIONAL SETUP -------#
  # make sure to uncomment the error handling if you have additional setup to do

  #$processor = Get-WmiObject Win32_Processor
  #$is64bit = $processor.AddressWidth -eq 64

  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'camstudio'
#} catch {
  #Write-ChocolateyFailure 'camstudio' "$($_.Exception.Message)"
  #throw 
#}