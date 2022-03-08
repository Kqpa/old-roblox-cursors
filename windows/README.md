<div align="center">

# **Old ROBLOX Cursors — Windows**

[<ins>**Restore**</ins>](/CURSORS.md) the old ROBLOX cursors on **Windows**. This is **not** for macOS. For macOS, see [this](/mac/).

## Usage

</div>

**#1**: Press the <kbd>Windows</kbd> key, then search for `PowerShell` and hit enter.

**#2**: Copy & paste the command below to the PowerShell window and hit enter:

<div align="center">

```powershell
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/windows/windows/replace-win.ps1' -OutFile $HOME\replace-win.ps1; cd $HOME; .\replace-win.ps1; cd $HOME; Remove-Item .\replace-win.ps1
```

</div>

**#3**: You'll get prompted with a question asking if the directory is accurate. If you haven't touched the ROBLOX installation location, hit <kbd>y</kbd>. If you did change the location, hit <kbd>n</kbd> & enter the new path manually.

#

<div align="center">

### Everytime ROBLOX updates, these changes will be <ins>**overwritten**</ins>. Run the command again to bring the old cursors back.

</div>