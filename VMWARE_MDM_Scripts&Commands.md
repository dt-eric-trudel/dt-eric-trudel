This file gives help, commands, tricks and pointers on how to work with and navigate through VMWare Intelligent Hub UEM Console

## Native Apps
### macOS Post Install check script

This line verifies the existence of an installed app via its name.

We are looking at: ```/Applications```, ```~/Applications``` & ```/System/Applications```

 ```shell
md find -name 'AppName.app' -onlyin /Applications -onlyin ~/Applications -onlyin /System/Applications
```

If the App Exists, the Script returns a value of ```TRUE``` with an Exit code 0.

If the App doesn't exist, the Script returns a value of ```False``` with an Exit code 1.


