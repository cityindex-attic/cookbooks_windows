# locals.
$svnRoot = Get-NewResource svn_root
$svnUsername = Get-NewResource svn_username
$svnPassword = Get-NewResource svn_password

$outputDirectory = Get-NewResource output_directory

#check inputs.
$Error.Clear()
if (($svnRoot -eq $NULL) -or ($svnRoot -eq ""))
{
    Write-Error "Error: provider requires a 'svn_root' parameter to be set! Ex: 'http://example.com/svn/trunk'"
    exit 131
}
if (($outputDirectory -eq $NULL) -or ($outputDirectory -eq ""))
{
    Write-Error "Error: provider requires 'output_directory' parameter to be set! Ex: 'c:\\websites'"
    exit 132
}

if ($svnUsername -eq $NULL)
{
    $svnUsername=""
}
if ($svnPassword -eq $NULL)
{
    $svnPassword=""
}

#tell the script to "stop" or "continue" when a command fails
$ErrorActionPreference = "stop"

$outputDirectory = Join-Path $outputDirectory ""

if (!(Test-Path $outputDirectory)) {
    Write-Output "Creating directory: $outputDirectory"
    New-Item $outputDirectory -type directory > $null
}

svn.cmd --quiet --non-interactive --no-auth-cache --username `"$svnUsername`" --password `"$svnPassword`" export $svnRoot $outputDirectory

if ($LastExitCode -ne 0)
{ 
    Write-Error "Error: SVN export failed" 
    exit 133
}
else
{
    Set-ChefNode exportpath $outputDirectory
}
