# windowssetup
repository to setup windows PC with all the cool stuff


#### To-Do - Automate this update of helper ruby file
This is to fix the rsync of the files
```
        if Vagrant::Util::Platform.windows?
          # rsync for Windows expects cygwin style paths, always.
          #hostpath = Vagrant::Util::Platform.cygwin_path(hostpath)
		  hostpath = "/cygdrive" + Vagrant::Util::Platform.cygwin_path(hostpath)
        end
```