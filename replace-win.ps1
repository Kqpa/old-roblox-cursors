# Downloading stuff
# Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowCursor.png' -OutFile C:\Users\kqpa\Desktop\ArrowCursor.png

$robloxDirectory = Join-Path $env:LocalAppData 'Roblox'

$cursorDirectory = '/Contents/Resources/Content/Textures/Cursors/KeyboardMouse'

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

$option = Read-Host "Is ROBLOX installed on '$robloxDirectory'? [y/n]: "

if ($option -eq 'y' $option -eq 'yes' -or !$option) {
    Join-Path 
}

# Get-ChildItem version-* | Set-Location