Write-Host 'Downloading DotNet 4.6.2...'

$url = 'https://download.microsoft.com/download/F/9/4/F942F07D-F26F-4F30-B4E3-EBD54FABA377/NDP462-KB3151800-x86-x64-AllOS-ENU.exe'
$filename = 'dotnet4.6.2.exe'
$output = "$env:TEMP"

# create $output
if (!(test-path $output))
{
    New-Item -ItemType directory -Path $output
}

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, "$output\$filename")

Write-Host 'Installing DotNet ...'

Start-Process -FilePath "$output\$filename" -ArgumentList "/norestart /passive /log c:\temp\dotnet_install.log" -Wait

Write-Host 'DotNet installed.'
