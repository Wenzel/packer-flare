# Powershell script

Write-Host 'Downloading Service Pack 1...'

$output = 'C:\Windows\Temp'
$filename = 'win7sp1.exe'

# create $output
if (!(test-path $output))
{
    New-Item -ItemType directory -Path $output
}


$architecture = $ENV:PROCESSOR_ARCHITECTURE
if ($architecture -eq "AMD64")
{
    $architecture = "X64"
}
else
{
    $architecture = "X86"
}

$url = 'https://download.microsoft.com/download/0/A/F/0AFB5316-3062-494A-AB78-7FB0D4461357/windows6.1-KB976932-' + $architecture + '.exe'

$client = new-object system.net.WebClient
$client.downloadfile($url, "$output\$filename")

Write-Host 'Installing Service Pack 1...'

Start-Process -FilePath "$output\$filename" -ArgumentList "/quiet /norestart /nodialog" -Wait

Write-Host 'Service Pack 1 installed.'
