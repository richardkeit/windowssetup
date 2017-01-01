# windowssetup
repository to setup windows PC with all the cool stuff

## running of the script
Open a cmd.exe session as administrator
Set a home folder for git repositories, ie "C:\git"

Clone or use the "download as zip" functionality to download the stable tag of these two repos:
- https://github.com/richardkeit/windowssetup.git
- https://github.com/richardkeit/jenkinsfile.git

Now the folders should look like this:
> C:\git
>  ----> windowssetup\ 
>  ----> jenkinsfile\

Run the automated installer like this:
`powershell.exe -ExecutionPolicy ByPass -File install_windows_apps.ps1`


#### To-Do - Automate this update of helper ruby file
This is to fix the rsync of the files
```
        if Vagrant::Util::Platform.windows?
          # rsync for Windows expects cygwin style paths, always.
          #hostpath = Vagrant::Util::Platform.cygwin_path(hostpath)
		  hostpath = "/cygdrive" + Vagrant::Util::Platform.cygwin_path(hostpath)
        end
```