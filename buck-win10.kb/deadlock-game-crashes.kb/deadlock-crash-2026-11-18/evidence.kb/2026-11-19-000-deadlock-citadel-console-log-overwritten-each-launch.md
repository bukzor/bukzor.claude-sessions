---
captured: "2026-11-19"
method: ./2026-11-19-000-deadlock-citadel-console-log-overwritten-each-launch.sh
---

# Deadlock citadel console.log (overwritten each launch)

```sh
'cat' '/mnt/c/Program Files (x86)/Steam/steamapps/common/Deadlock/game/citadel/console.log'
```

```
﻿11/18 19:24:57 [RenderSystem] Determined driver version for graphics adapter 0 [output 0] '': 10.0.26100.9818
11/18 19:24:57 [RenderSystem] Creating render device for graphics adapter 0 'Microsoft Basic Render Driver' [VendorId 0x1414 / DeviceId 0x8C]: 10.0.26100.9818
11/18 19:24:57 [RenderSystem] Loaded video settings config from 'cfg\video.txt'
11/18 19:24:57 [RenderSystem] Successfully created dx11 swap chain [FlipDiscard | AllowTear]
11/18 19:24:57 Pagefile: estimated 1mb CPU 7493mb GPU needed, 35988mb pagefile free
11/18 19:24:57 [Filesystem] ---------------
11/18 19:24:57 [Filesystem] Path ID:             File Path:
11/18 19:24:57 [Filesystem] CONTENT              "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\content\citadel\" 
11/18 19:24:57 [Filesystem] CONTENT              "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\content\core\" 
11/18 19:24:57 [Filesystem] CONTENTROOT          "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\content\" 
11/18 19:24:57 [Filesystem] DEFAULT_WRITE_PATH   "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\pak01.vpk" (vpk) C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\pak01.vpk
11/18 19:24:57 [Filesystem] DEFAULT_WRITE_PATH   "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\" 
11/18 19:24:57 [Filesystem] EXECUTABLE_PATH      "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\bin\win64\" 
11/18 19:24:57 [Filesystem] EXECUTABLE_PATH      "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\bin\" 
11/18 19:24:57 [Filesystem] GAME                 "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\pak01.vpk" (vpk) C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\pak01.vpk
11/18 19:24:57 [Filesystem] GAME                 "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\core\pak01.vpk" (vpk) C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\core\pak01.vpk
11/18 19:24:57 [Filesystem] GAME                 "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\shaders_pc.vpk" (vpk) C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\shaders_pc.vpk
11/18 19:24:57 [Filesystem] GAME                 "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\core\shaders_pc.vpk" (vpk) C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\core\shaders_pc.vpk
11/18 19:24:57 [Filesystem] GAME                 "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\" 
11/18 19:24:57 [Filesystem] GAME                 "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\core\" 
11/18 19:24:57 [Filesystem] GAMEBIN              "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\bin\win64\" 
11/18 19:24:57 [Filesystem] GAMEBIN              "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\bin\" 
11/18 19:24:57 [Filesystem] GAMEBIN              "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\core\bin\win64\" 
11/18 19:24:57 [Filesystem] GAMEBIN              "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\core\bin\" 
11/18 19:24:57 [Filesystem] GAMEROOT             "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\" 
11/18 19:24:57 [Filesystem] MOD                  "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\pak01.vpk" (vpk) C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\pak01.vpk
11/18 19:24:57 [Filesystem] MOD                  "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\citadel\" 
11/18 19:24:57 [Filesystem] PLATFORM             "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\core\pak01.vpk" (vpk) C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\core\pak01.vpk
11/18 19:24:57 [Filesystem] PLATFORM             "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\game\core\" 
11/18 19:24:57 [Filesystem] SHADER_SOURCE        "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\src\shaders\citadel\" 
11/18 19:24:57 [Filesystem] SHADER_SOURCE        "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\src\shaders\core\" 
11/18 19:24:57 [Filesystem] SHADER_SOURCE_MOD    "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\src\shaders\citadel\" 
11/18 19:24:57 [Filesystem] SHADER_SOURCE_ROOT   "C:\Program Files (x86)\Steam\steamapps\common\Deadlock\src\shaders\" 
11/18 19:24:57 [Filesystem] USRLOCAL             "C:\Program Files (x86)\Steam\userdata\37093539\1422450\local\" 
11/18 19:24:57 [CommandLine] command line arguments:
11/18 19:24:57 [CommandLine] -steam -console -condebug
11/18 19:24:59 [SteamNetSockets] Initialized low level socket/threading support.
11/18 19:24:59 [SteamNetSockets] Set SteamNetworkingSockets P2P_STUN_ServerList to '162.254.195.71:3478' as per SteamNetworkingSocketsSerialized
11/18 19:24:59 [SteamNetSockets] SDR RelayNetworkStatus:  avail=Attempting  config=Attempting  anyrelay=Not Attempted   (Attempt #1 to fetch config (only-if-cached) from https://api.steampowered.com/ISteamApps/GetSDRConfig/v1?appid=1422450)
11/18 19:24:59 [SteamNetSockets] AuthStatus (steamid:76561197997359267):  Attempting  (Requesting cert)
11/18 19:24:59 [SteamNetSockets] Pending ping measurement until network config is obtained.
11/18 19:24:59 [SteamNetSockets] SDR RelayNetworkStatus:  avail=Attempting  config=Attempting  anyrelay=Waiting   (Attempt #1 to fetch config (only-if-cached) from https://api.steampowered.com/ISteamApps/GetSDRConfig/v1?appid=1422450)
11/18 19:24:59 [Networking] Got ISteamNetworkingSockets user interfaces from standalone lib
11/18 19:24:59 [Networking] Network System Initialized
11/18 19:24:59 ResetBreakpadAppId: Universe is 1 (k_EUniversePublic)
```
