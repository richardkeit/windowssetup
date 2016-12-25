# Written by Richard Keit rajkeit@gmail.com
# Use with due credit given


function print2screen{
param ($text)

Write-Host "==================`n$text`n==================`n"

}




print2screen "Setting execution policy"
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force -Verbose
print2screen "Install Chocolatey"

$chocoinstall=choco
if ($chocoinstall -inotmatch "Chocolatey"){
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    print2screen "Chocolately hopefully installed"
    }
else { print2screen "Looks to be already be installed"}

$pkginstall = Get-Content -Path $PWD\choco_packages.out

foreach ($pkg in $pkginstall){

choco install --ignore-checksums -y $pkg
sleep -Seconds 2 

print2screen "$pkg installed"

}




C:\tools\cygwin\bin\cat.exe "db_home: test >> /cygdrive/etc/nsswitch.conf"