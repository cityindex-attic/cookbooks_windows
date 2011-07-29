# locals.
$linkPath = Get-NewResource link_path
$targetDirectory = Get-NewResource target_path

#check inputs.
$Error.Clear()
if (($linkPath -eq $NULL) -or ($linkPath -eq ""))
{
    Write-Error "Error: provider requires 'link_path' parameter to be set! Eg: 'c:\\websites\\RESTWebservices\\current'"
    exit 141
}
if (($targetDirectory -eq $NULL) -or ($targetDirectory -eq ""))
{
    Write-Error "Error: provider requires 'target_path' parameter to be set! Eg: 'c:\\websites\\RESTWebservices\\RESTWebServices.0.743'"
    exit 142
}

#tell the script to "stop" or "continue" when a command fails
$ErrorActionPreference = "stop"

$targetDirectory = Join-Path $targetDirectory ""

if (!(test-path $targetDirectory))
{
    Write-Error "Error: [$targetDirectory] does not exist. Aborting!"
    exit 143 
}

if (Test-Path $linkPath)
{
	Write-Output "Renmoving existing link [$linkPath]"
	Remove-Item $linkPath -r -force
}

Write-target "Making directory link [$linkPath] ==> [$targetDirectory]"

$command='mklink /D "'+$linkPath+'" "'+$targetDirectory+'""'

$command_ouput=invoke-expression $command

if ($command_ouput -match 'symbolic link created')
{
    Set-ChefNode symboliclinkpath $targetDirectory
}
else
{ 
    echo $command_ouput
    Write-Error "Error: Directory symlink failed"
    exit 144
}

