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

$option = $host.ui.PromptForChoice("Is ROBLOX instaleld on '$robloxDirectory'?","", @('Y','N'),0)

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

# Get-ChildItem version-* | Set-Location

# removing the old cursors

foreach ($i in $arrayName) {
    if (Test-Path $i) {
        try {
            Remove-Item $i
            "Removed: $i"
        }
        catch {
            Write-Warning $_.Exception.Message
        }
    }
}

for ($i = 0; $i < 3; $i++) {

    try {
        Invoke-WebRequest -Uri $newCursors[$i] -OutFile $cursorNames[$i] -ErrorAction Stop
    } catch {
        Write-Warning $_.Exception.Message
    }

}

if ($option -eq '0') {



} else {

    "Finished replacing on '$robloxDirectory/.../"

}