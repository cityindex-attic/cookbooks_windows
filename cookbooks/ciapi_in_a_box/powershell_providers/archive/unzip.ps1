# locals.
$archivePath = Get-NewResource archive_path
$outputDirectory = Get-NewResource output_directory

#check inputs.
$Error.Clear()
if (($archivePath -eq $NULL) -or ($archivePath -eq ""))
{
    Write-Error "Error: provider requires 'archive_path' parameter to be set! Ex: 'c:\\tmp\\app.zip'"
    exit 141
}
if (($outputDirectory -eq $NULL) -or ($outputDirectory -eq ""))
{
    Write-Error "Error: provider requires 'root_path' parameter to be set! Ex: 'c:\\websites'"
    exit 142
}

#tell the script to "stop" or "continue" when a command fails
$ErrorActionPreference = "stop"

$outputDirectory = Join-Path $outputDirectory ""

if (!(Test-Path $outputDirectory)) {
    Write-Output "Creating directory: $outputDirectory"
    New-Item $outputDirectory -type directory > $null
}

if (!(test-path $archivePath))
{
    Write-Error "Error: [$archivePath] does not exist. Aborting!"
    exit 143 
}

Write-Output "Unzipping [$archivePath] to [$outputDirectory]"

$command='cmd /c 7z x -y "'+$archivePath+'" -o"'+$outputDirectory+'""'

$command_ouput=invoke-expression $command

if ($command_ouput -match 'Everything is Ok')
{
    Set-ChefNode releasesunpackpath $outputDirectory
}
else
{ 
    echo $command_ouput
    Write-Error "Error: Unzipping failed"
    exit 144
}

