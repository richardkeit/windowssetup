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



$basicpkg = @()
$pkgversion = @{}
$pkglist = Get-Content -Path $PWD\choco_packages.out



#Loop through file and create multi-dimensional array for files with version
print2screen "Looping through file to create a hash table to install specific versions"
foreach ($pkg in $pkglist){

        if ($pkg -match ","){

            $appname = $pkg.Split(",")[0]
            $appversion = $pkg.Split(",")[1]
            $pkgversion.Add("$appname", "$appversion")          
        }

        else {

            $basicpkg += $pkg
        }
}


print2screen "These apps will install with a specific version"
$pkgversion | Format-Table

print2screen "These apps will install with the latest"
foreach ($x in $basicpkg){Write-Host "$x"}

$proceed = Read-Host -Prompt "Do you want to continue?`n(Y/N)"

if ($proceed -inotmatch "y"){return}

foreach ($pkg in $basicpkg){

    Invoke-Command {choco install --ignore-checksums -y $pkg}
    sleep -Seconds 2 

    print2screen "$pkg installed"

}

foreach ($item in $pkgversion.GetEnumerator()) {
    
    Invoke-Command {choco install -y $($item.Name) --version $($item.Value)}
}

print2screen "Modifying cygwin to allow rsync between guest and host"

Invoke-Expression .\cygwin_start_up.bat

print2screen "Start vagrant"
pushd .\vagrantbox
print2screen "Installing vb-box plugin and some others"

$vplugins = { "micromachine" , "log4r" , "i18n" , "vagrant-vbguest"}
foreach ($plugin in $vplugins){
    Invoke-Expression -Command  "vagrant plugin install $plugin"
}
Invoke-Expression -Command "vagrant up"




