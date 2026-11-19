---
captured: "2026-11-19"
method: ./2026-11-19-009-winsrvext-user32-shutdown-block-events-full-text.sh
---

# winsrvext/User32 shutdown-block events, full text

```sh
'powershell.exe' '-NoProfile' '-Command' 'Get-WinEvent -FilterHashtable @{LogName="System"; StartTime=[datetime]"2026-11-18 18:00"; EndTime=[datetime]"2026-11-18 19:22"} | Format-List TimeCreated,Id,ProviderName,Message'
```

```


TimeCreated  : 11/18/2026 7:21:46 PM
Id           : 1073
ProviderName : User32
Message      : The attempt by user BUCK-WIN10\worki to restart/shutdown computer BUCK-WIN10 failed

TimeCreated  : 11/18/2026 7:21:46 PM
Id           : 100
ProviderName : winsrvext
Message      : Process 
               C:\Windows\System32\DriverStore\FileRepository\u0198974.inf_amd64_dcac9659486b668a\B025819\atieclxx.exe 
               is delaying system shutdown after 5016 milliseconds.

TimeCreated  : 11/18/2026 7:21:41 PM
Id           : 10010
ProviderName : Microsoft-Windows-DistributedCOM
Message      : The server {A463FCB9-6B1C-4E0D-A80B-A2CA7999E25D} did not register with DCOM within the required 
               timeout.

TimeCreated  : 11/18/2026 7:21:41 PM
Id           : 10010
ProviderName : Microsoft-Windows-DistributedCOM
Message      : The server {A463FCB9-6B1C-4E0D-A80B-A2CA7999E25D} did not register with DCOM within the required 
               timeout.

TimeCreated  : 11/18/2026 7:21:41 PM
Id           : 10010
ProviderName : Microsoft-Windows-DistributedCOM
Message      : The server {A463FCB9-6B1C-4E0D-A80B-A2CA7999E25D} did not register with DCOM within the required 
               timeout.

TimeCreated  : 11/18/2026 7:21:41 PM
Id           : 10010
ProviderName : Microsoft-Windows-DistributedCOM
Message      : The server MicrosoftWindows.Client.CBS_1000.26100.385.0_x64__cw5n1h2txyewy!Global.DesktopSpotlight.AppXm
               akp9w4re9tj70pp8mcdrt273xajen0x.mca did not register with DCOM within the required timeout.

TimeCreated  : 11/18/2026 7:21:41 PM
Id           : 10010
ProviderName : Microsoft-Windows-DistributedCOM
Message      : The server MicrosoftWindows.Client.CBS_1000.26100.385.0_x64__cw5n1h2txyewy!Global.Accounts.AppXczw5m0gs1
               v24mkf1zqkkpebvayhcn73d.mca did not register with DCOM within the required timeout.

TimeCreated  : 11/18/2026 7:21:40 PM
Id           : 10010
ProviderName : Microsoft-Windows-DistributedCOM
Message      : The server {A463FCB9-6B1C-4E0D-A80B-A2CA7999E25D} did not register with DCOM within the required 
               timeout.

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 71
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Delete complete for port 7248DB76-1EBB-4120-9AD6-5D90B55F51F3 (Friendly Name: 
               7248DB76-1EBB-4120-9AD6-5D90B55F51F3).

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 69
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port 7248DB76-1EBB-4120-9AD6-5D90B55F51F3 (Friendly Name: 7248DB76-1EBB-4120-9AD6-5D90B55F51F3) 
               successfully deleted - switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Delete' succeeded on nic 
               0D46A76D-3699-491E-A340-9664B3514A45--FC232FD7-4443-4791-A539-DEEF713EC4D4 (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 234
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC 0D46A76D-3699-491E-A340-9664B3514A45--FC232FD7-4443-4791-A539-DEEF713EC4D4 successfully 
               disconnected from port .

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 71
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Delete complete for port 300C243E-DC56-44FC-8B13-08C106081624 (Friendly Name: 
               300C243E-DC56-44FC-8B13-08C106081624).

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 69
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port 300C243E-DC56-44FC-8B13-08C106081624 (Friendly Name: 300C243E-DC56-44FC-8B13-08C106081624) 
               successfully deleted - switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Delete' succeeded on nic 
               0D46A76D-3699-491E-A340-9664B3514A45--4F991BA6-51EA-4FFC-9480-A11B16BAD236 (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 234
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC 0D46A76D-3699-491E-A340-9664B3514A45--4F991BA6-51EA-4FFC-9480-A11B16BAD236 successfully 
               disconnected from port .

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 71
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Delete complete for port E6E50F4E-FEC0-4BF0-9091-A0F9BA3532BB (Friendly Name: 
               E6E50F4E-FEC0-4BF0-9091-A0F9BA3532BB).

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 69
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port E6E50F4E-FEC0-4BF0-9091-A0F9BA3532BB (Friendly Name: E6E50F4E-FEC0-4BF0-9091-A0F9BA3532BB) 
               successfully deleted - switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Delete' succeeded on nic 
               0D46A76D-3699-491E-A340-9664B3514A45--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 7:21:22 PM
Id           : 234
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC 0D46A76D-3699-491E-A340-9664B3514A45--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D successfully 
               disconnected from port .

TimeCreated  : 11/18/2026 7:21:21 PM
Id           : 234
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC 0D46A76D-3699-491E-A340-9664B3514A45--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D successfully 
               disconnected from port .

TimeCreated  : 11/18/2026 7:21:21 PM
Id           : 234
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC 0D46A76D-3699-491E-A340-9664B3514A45--FC232FD7-4443-4791-A539-DEEF713EC4D4 successfully 
               disconnected from port .

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC 0D46A76D-3699-491E-A340-9664B3514A45--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Enabled, Previous IPv6: Disabled, Current 
               IPv6: Enabled. Reason: RSC OID

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC 0D46A76D-3699-491E-A340-9664B3514A45--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Disabled, Previous IPv6: Disabled, Current 
               IPv6: Disabled. Reason: NIC connect

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 102
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Networking driver in 0D46A76D-3699-491E-A340-9664B3514A45 is loaded and the protocol version is 
               negotiated to the most recent version (Virtual machine ID 0D46A76D-3699-491E-A340-9664B3514A45).

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 232
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC 0D46A76D-3699-491E-A340-9664B3514A45--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D (Friendly Name: ) 
               successfully connected to port E6E50F4E-FEC0-4BF0-9091-A0F9BA3532BB (Friendly Name: 
               E6E50F4E-FEC0-4BF0-9091-A0F9BA3532BB) on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0(Friendly Name: FSE 
               Switch).

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Create' succeeded on nic 
               0D46A76D-3699-491E-A340-9664B3514A45--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC 0D46A76D-3699-491E-A340-9664B3514A45--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Disabled, Previous IPv6: Disabled, Current 
               IPv6: Disabled. Reason: NIC create

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 67
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port E6E50F4E-FEC0-4BF0-9091-A0F9BA3532BB (Friendly Name: E6E50F4E-FEC0-4BF0-9091-A0F9BA3532BB) 
               successfully created on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 292
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for Port E6E50F4E-FEC0-4BF0-9091-A0F9BA3532BB (Friendly Name: 
               E6E50F4E-FEC0-4BF0-9091-A0F9BA3532BB) Previous: Disabled, Current: Enabled. Reason: Port create

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC 0D46A76D-3699-491E-A340-9664B3514A45--4F991BA6-51EA-4FFC-9480-A11B16BAD236 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Enabled, Previous IPv6: Disabled, Current 
               IPv6: Enabled. Reason: RSC OID

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 102
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Networking driver in 0D46A76D-3699-491E-A340-9664B3514A45 is loaded and the protocol version is 
               negotiated to the most recent version (Virtual machine ID 0D46A76D-3699-491E-A340-9664B3514A45).

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 232
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC 0D46A76D-3699-491E-A340-9664B3514A45--4F991BA6-51EA-4FFC-9480-A11B16BAD236 (Friendly Name: ) 
               successfully connected to port 300C243E-DC56-44FC-8B13-08C106081624 (Friendly Name: 
               300C243E-DC56-44FC-8B13-08C106081624) on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0(Friendly Name: FSE 
               Switch).

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Create' succeeded on nic 
               0D46A76D-3699-491E-A340-9664B3514A45--4F991BA6-51EA-4FFC-9480-A11B16BAD236 (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC 0D46A76D-3699-491E-A340-9664B3514A45--4F991BA6-51EA-4FFC-9480-A11B16BAD236 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Disabled, Previous IPv6: Disabled, Current 
               IPv6: Disabled. Reason: NIC create

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 67
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port 300C243E-DC56-44FC-8B13-08C106081624 (Friendly Name: 300C243E-DC56-44FC-8B13-08C106081624) 
               successfully created on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 292
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for Port 300C243E-DC56-44FC-8B13-08C106081624 (Friendly Name: 
               300C243E-DC56-44FC-8B13-08C106081624) Previous: Disabled, Current: Enabled. Reason: Port create

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC 0D46A76D-3699-491E-A340-9664B3514A45--FC232FD7-4443-4791-A539-DEEF713EC4D4 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Enabled, Previous IPv6: Disabled, Current 
               IPv6: Enabled. Reason: RSC OID

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC 0D46A76D-3699-491E-A340-9664B3514A45--FC232FD7-4443-4791-A539-DEEF713EC4D4 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Disabled, Previous IPv6: Disabled, Current 
               IPv6: Disabled. Reason: NIC connect

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 102
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Networking driver in 0D46A76D-3699-491E-A340-9664B3514A45 is loaded and the protocol version is 
               negotiated to the most recent version (Virtual machine ID 0D46A76D-3699-491E-A340-9664B3514A45).

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 232
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC 0D46A76D-3699-491E-A340-9664B3514A45--FC232FD7-4443-4791-A539-DEEF713EC4D4 (Friendly Name: ) 
               successfully connected to port 7248DB76-1EBB-4120-9AD6-5D90B55F51F3 (Friendly Name: 
               7248DB76-1EBB-4120-9AD6-5D90B55F51F3) on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0(Friendly Name: FSE 
               Switch).

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Create' succeeded on nic 
               0D46A76D-3699-491E-A340-9664B3514A45--FC232FD7-4443-4791-A539-DEEF713EC4D4 (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC 0D46A76D-3699-491E-A340-9664B3514A45--FC232FD7-4443-4791-A539-DEEF713EC4D4 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Disabled, Previous IPv6: Disabled, Current 
               IPv6: Disabled. Reason: NIC create

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 67
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port 7248DB76-1EBB-4120-9AD6-5D90B55F51F3 (Friendly Name: 7248DB76-1EBB-4120-9AD6-5D90B55F51F3) 
               successfully created on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 7:20:05 PM
Id           : 292
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for Port 7248DB76-1EBB-4120-9AD6-5D90B55F51F3 (Friendly Name: 
               7248DB76-1EBB-4120-9AD6-5D90B55F51F3) Previous: Disabled, Current: Enabled. Reason: Port create

TimeCreated  : 11/18/2026 6:44:21 PM
Id           : 37
ProviderName : Microsoft-Windows-Time-Service
Message      : The time provider NtpClient is currently receiving valid time data from time.windows.com,0x9 
               (ntp.m|0x9|0.0.0.0:123->168.61.215.74:123).

TimeCreated  : 11/18/2026 6:23:10 PM
Id           : 71
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Delete complete for port 81DA4E15-4D7C-43CC-9946-6B4DA0DD450F (Friendly Name: 
               81DA4E15-4D7C-43CC-9946-6B4DA0DD450F).

TimeCreated  : 11/18/2026 6:23:10 PM
Id           : 69
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port 81DA4E15-4D7C-43CC-9946-6B4DA0DD450F (Friendly Name: 81DA4E15-4D7C-43CC-9946-6B4DA0DD450F) 
               successfully deleted - switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 6:23:10 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Delete' succeeded on nic 
               D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--FC232FD7-4443-4791-A539-DEEF713EC4D4 (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 6:23:10 PM
Id           : 234
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--FC232FD7-4443-4791-A539-DEEF713EC4D4 successfully 
               disconnected from port .

TimeCreated  : 11/18/2026 6:23:10 PM
Id           : 71
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Delete complete for port C278258F-A6B3-420B-829E-352CD0872755 (Friendly Name: 
               C278258F-A6B3-420B-829E-352CD0872755).

TimeCreated  : 11/18/2026 6:23:10 PM
Id           : 69
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port C278258F-A6B3-420B-829E-352CD0872755 (Friendly Name: C278258F-A6B3-420B-829E-352CD0872755) 
               successfully deleted - switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 6:23:10 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Delete' succeeded on nic 
               D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--4F991BA6-51EA-4FFC-9480-A11B16BAD236 (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 6:23:10 PM
Id           : 234
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--4F991BA6-51EA-4FFC-9480-A11B16BAD236 successfully 
               disconnected from port .

TimeCreated  : 11/18/2026 6:23:10 PM
Id           : 71
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Delete complete for port F2CB320D-683B-4E87-A29E-2DA02C7FA2B2 (Friendly Name: 
               F2CB320D-683B-4E87-A29E-2DA02C7FA2B2).

TimeCreated  : 11/18/2026 6:23:10 PM
Id           : 69
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port F2CB320D-683B-4E87-A29E-2DA02C7FA2B2 (Friendly Name: F2CB320D-683B-4E87-A29E-2DA02C7FA2B2) 
               successfully deleted - switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 6:23:09 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Delete' succeeded on nic 
               D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 6:23:09 PM
Id           : 234
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D successfully 
               disconnected from port .

TimeCreated  : 11/18/2026 6:23:09 PM
Id           : 234
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D successfully 
               disconnected from port .

TimeCreated  : 11/18/2026 6:23:09 PM
Id           : 234
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--FC232FD7-4443-4791-A539-DEEF713EC4D4 successfully 
               disconnected from port .

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Enabled, Previous IPv6: Disabled, Current 
               IPv6: Enabled. Reason: RSC OID

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Disabled, Previous IPv6: Disabled, Current 
               IPv6: Disabled. Reason: NIC connect

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 102
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Networking driver in D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8 is loaded and the protocol version is 
               negotiated to the most recent version (Virtual machine ID D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8).

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 232
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D (Friendly Name: ) 
               successfully connected to port F2CB320D-683B-4E87-A29E-2DA02C7FA2B2 (Friendly Name: 
               F2CB320D-683B-4E87-A29E-2DA02C7FA2B2) on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0(Friendly Name: FSE 
               Switch).

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Create' succeeded on nic 
               D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--45710E6B-3DA3-44A5-82B9-3ADD6B58C33D 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Disabled, Previous IPv6: Disabled, Current 
               IPv6: Disabled. Reason: NIC create

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 67
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port F2CB320D-683B-4E87-A29E-2DA02C7FA2B2 (Friendly Name: F2CB320D-683B-4E87-A29E-2DA02C7FA2B2) 
               successfully created on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 292
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for Port F2CB320D-683B-4E87-A29E-2DA02C7FA2B2 (Friendly Name: 
               F2CB320D-683B-4E87-A29E-2DA02C7FA2B2) Previous: Disabled, Current: Enabled. Reason: Port create

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--4F991BA6-51EA-4FFC-9480-A11B16BAD236 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Enabled, Previous IPv6: Disabled, Current 
               IPv6: Enabled. Reason: RSC OID

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 102
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Networking driver in D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8 is loaded and the protocol version is 
               negotiated to the most recent version (Virtual machine ID D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8).

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 232
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--4F991BA6-51EA-4FFC-9480-A11B16BAD236 (Friendly Name: ) 
               successfully connected to port C278258F-A6B3-420B-829E-352CD0872755 (Friendly Name: 
               C278258F-A6B3-420B-829E-352CD0872755) on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0(Friendly Name: FSE 
               Switch).

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Create' succeeded on nic 
               D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--4F991BA6-51EA-4FFC-9480-A11B16BAD236 (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--4F991BA6-51EA-4FFC-9480-A11B16BAD236 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Disabled, Previous IPv6: Disabled, Current 
               IPv6: Disabled. Reason: NIC create

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 67
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port C278258F-A6B3-420B-829E-352CD0872755 (Friendly Name: C278258F-A6B3-420B-829E-352CD0872755) 
               successfully created on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 292
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for Port C278258F-A6B3-420B-829E-352CD0872755 (Friendly Name: 
               C278258F-A6B3-420B-829E-352CD0872755) Previous: Disabled, Current: Enabled. Reason: Port create

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--FC232FD7-4443-4791-A539-DEEF713EC4D4 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Enabled, Previous IPv6: Disabled, Current 
               IPv6: Enabled. Reason: RSC OID

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--FC232FD7-4443-4791-A539-DEEF713EC4D4 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Disabled, Previous IPv6: Disabled, Current 
               IPv6: Disabled. Reason: NIC connect

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 102
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Networking driver in D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8 is loaded and the protocol version is 
               negotiated to the most recent version (Virtual machine ID D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8).

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 232
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--FC232FD7-4443-4791-A539-DEEF713EC4D4 (Friendly Name: ) 
               successfully connected to port 81DA4E15-4D7C-43CC-9946-6B4DA0DD450F (Friendly Name: 
               81DA4E15-4D7C-43CC-9946-6B4DA0DD450F) on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0(Friendly Name: FSE 
               Switch).

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 233
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : The operation 'Create' succeeded on nic 
               D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--FC232FD7-4443-4791-A539-DEEF713EC4D4 (Friendly Name: ), Instance 
               Id {00000000-0000-0000-0000-000000000000}.

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 291
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for NIC D5F427DF-E7CE-4169-BE71-64A9FD2C0EC8--FC232FD7-4443-4791-A539-DEEF713EC4D4 
               (Friendly Name: ) Previous IPv4: Disabled, Current IPv4: Disabled, Previous IPv6: Disabled, Current 
               IPv6: Disabled. Reason: NIC create

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 67
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : Port 81DA4E15-4D7C-43CC-9946-6B4DA0DD450F (Friendly Name: 81DA4E15-4D7C-43CC-9946-6B4DA0DD450F) 
               successfully created on switch 30BE601B-A2AB-4EDC-9AD5-9D2600CF7CF0 (Friendly Name: FSE Switch).

TimeCreated  : 11/18/2026 6:21:53 PM
Id           : 292
ProviderName : Microsoft-Windows-Hyper-V-VmSwitch
Message      : RSC offload modified for Port 81DA4E15-4D7C-43CC-9946-6B4DA0DD450F (Friendly Name: 
               81DA4E15-4D7C-43CC-9946-6B4DA0DD450F) Previous: Disabled, Current: Enabled. Reason: Port create



```
