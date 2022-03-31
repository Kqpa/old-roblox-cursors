$robloxDirectory = Join-Path $env:LocalAppData 'Roblox'

$cursorDirectory = '.\content\textures\Cursors\KeyboardMouse'

$cursorNames = @(
	'ArrowCursor.png',
	'ArrowFarCursor.png',
	'IBeamCursor.png'
)

$oldCursors = @(	
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowCursor.png', # ArrowCursor.png
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowFarCursor.png', # ArrowFarCursor.png
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/IBeamCursor.png' # IBeamCursor.png
)

# Making sure that we're replacing the correct location

if (Test-Path -Path $robloxDirectory) {

    Write-Output "Roblox installation found on '$robloxDirectory'."

    Set-Location $robloxDirectory\Versions\
    Get-ChildItem version-* | Set-Location
    Set-Location $cursorDirectory

} else {

    Write-Output "Roblox installation could not be found on '$robloxDirectory'."

    $newRobloxDirectory = Read-Host "Enter the FULL path to the ROBLOX installation (Roblox folder)"

    $newRobloxDirectory = $newRobloxDirectory.Trim()

    if ( -not (Test-Path -Path $newRobloxDirectory) -or !$newRobloxDirectory ) {
        
        Write-Output "Directory does not exist."
        exit
    
    } else {

        Set-Location $newRobloxDirectory\Versions\
        Get-ChildItem version-* | Set-Location
        Set-Location $cursorDirectory

    }

}

# Removing the new cursors

""

foreach ($i in $cursorNames) {
    
    if (Test-Path $i) {
       
        try {
            
            Remove-Item $i
            Write-Output "[rm]: Removed '$i'"
        
        } catch {
            
            Write-Warning $_.Exception.Message
        
        }
    
    }

}

# Downloading the old cursors

""

for ($i = 0; $i -lt 3; $i++) {

    try {
        
        $printInfo = $cursorNames[$i]
        Write-Host -NoNewline "[Invoke-WebRequest]: Downloading '$printInfo'... "
        Invoke-WebRequest -Uri $oldCursors[$i] -OutFile $cursorNames[$i] -ErrorAction Stop
        Write-Output "OK."
    
    } catch {
        
        Write-Warning $_.Exception.Message
    
    }

}

# Summary message

""

Set-Location $HOME

Write-Output "Finished replacing. Restart ROBLOX if it's already running."
