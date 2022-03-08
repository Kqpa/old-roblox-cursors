$robloxDirectory = Join-Path $env:LocalAppData 'Roblox'

$cursorDirectory = '.\content\textures\Cursors\KeyboardMouse'

$cursorNames = @(
	'ArrowCursor.png',
	'ArrowFarCursor.png',
	'IBeamCursor.png'
)

$newCursors = @(	
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowCursor.png', # ArrowCursor.png
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowFarCursor.png', # ArrowFarCursor.png
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/IBeamCursor.png' # IBeamCursor.png
)

# Making sure that we're replacing the correct location

$option = $HOST.UI.PromptForChoice("Is ROBLOX instaleld on '$robloxDirectory'?", "", @('Y','N'), 0)

if ($option -eq '0') {

    Set-Location $robloxDirectory\Versions\
    Get-ChildItem version-* | Set-Location
    Set-Location $cursorDirectory

} else {

    $newRobloxDirectory = Read-Host "Enter the FULL path to the ROBLOX installation (Roblox folder)"

    if ( -not (Test-Path -Path $newRobloxDirectory) -or !$newRobloxDirectory ) {
        
        "Directory does not exist."
        exit
    
    } else {

        Set-Location $newRobloxDirectory\Versions\
        Get-ChildItem version-* | Set-Location
        Set-Location $cursorDirectory

    }

}

# Removing the old cursors

""

foreach ($i in $cursorNames) {
    
    if (Test-Path $i) {
       
        try {
            
            Remove-Item $i
            "[rm]: Removed '$i'"
        
        }
        catch {
            
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
        $ProgressPreference = 'SilentlyContinue'
        Invoke-WebRequest -Uri $newCursors[$i] -OutFile $cursorNames[$i] -ErrorAction Stop
        $ProgressPreference = 'Continue'
        "OK."
    
    } catch {
        
        Write-Warning $_.Exception.Message
    
    }

}

# Summary message

""

if ($option -eq '0') {

    "Finished replacing on '$robloxDirectory\...\Cursors\KeyboardMouse'. Restart ROBLOX if it's already running."

} else {

    "Finished replacing on '$newRobloxDirectory\...\Cursors\KeyboardMouse'. Restart ROBLOX if it's already running."

}