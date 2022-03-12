<div align="center">

# **Windows**

</div>

**1**: Press the <kbd>Windows</kbd> key, then search for `PowerShell` and hit enter.

**2**: Copy & paste the command below to the PowerShell window and hit enter:

```powershell
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/windows/replace-win.ps1' `
-OutFile $HOME\replace-win.ps1; cd $HOME; .\replace-win.ps1; cd $HOME; Remove-Item .\replace-win.ps1
```

#

<div align="center">

### Everytime ROBLOX updates, these changes will be <ins>**overwritten**</ins>. Run the command again to bring the old cursors back.

</div>