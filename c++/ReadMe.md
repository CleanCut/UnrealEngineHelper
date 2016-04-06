Install Unreal Engine from Source
=================================

This may or may not be complete.  Please feel free to make pull requests with additions/corrections.

All Platforms
-------------

- Install [Git](https://git-scm.com/)
- Clone the UnrealEngine repository somewhere.  The repo is so huge it saves a
  lot of time to specify the branch you want the clone to end up on (`-b 4.11`)

UE 4.10+ on Windows (and Linux cross-compile on Windows)
--------------------------------------------------------

Adapted from [Unreal's docs](https://docs.unrealengine.com/latest/INT/Programming/Development/BuildingUnrealEngine/index.html)
and [Allar's HowTo](http://allarsblog.com/2015/11/06/Installing-Linux-Toolchain-On-Windows/)

Assuming Windows 10 or equivalent...

- Install [Visual Studio Community Edition 2015](https://www.visualstudio.com/products/visual-studio-community-vs)
 - During installation select `Custom`, not `Typical`
 - Under `Programming Languages` check `Visual C++` and all its children.
- Install the Linux Toolchain (skip if you're sorta lame and don't want to support Linux gaming even though it's super simple to compile your game for Linux if you follow these simple instructions).
 - (To Do: Put the necessary parts from [Allar's HowTo](http://allarsblog.com/2015/11/06/Installing-Linux-Toolchain-On-Windows/) here).
- START HERE TO REBUILD FOR A NEW VERSION
- Make sure the UnrealEngine repository is checked out to the branch you want
- In the UnrealEngine repo run `Setup.bat`
- In the UnrealEngine repo run `GenerateProjectFiles.bat`
- Double-click `UE4.sln`
- Set the solution configuration to `Development Editor`
- Set the solution platform to `Win64`
- Right-click `UE4` in the Solution Explorer and select `Clean` (only necessary when rebuilding)
- Right-click `UE4` in the Solution Explorer and select `Build` (this will take 30 min to several hours, depending)
- Right-click `UE4` in the Solution Explorer and select `Debug > Start New Instance` to launch the editor once. This will take several minutes.  DON'T STOP HERE!
- When run in debug mode like this some features like packaging your project will fail with mysterious errors, so...
- Quit the editor without selecting a project
- Shut down Visual Studio if you don't need it (if you're just working in the engine)
- Start UE4 by clicking on `Build/Binaries/UE4Editor.exe` in the UnrealEngine repository.
- If you did all the Linux steps, there should also be a `Linux` option under `File > Package Project` 
