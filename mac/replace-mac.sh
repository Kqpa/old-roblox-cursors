#!/usr/bin/env sh

robloxDirectory=/Applications/Roblox.app

cursorDirectory=/Contents/Resources/Content/Textures/Cursors/KeyboardMouse

cursorNames=(
	'ArrowCursor.png'
	'ArrowFarCursor.png'
	'IBeamCursor.png'
)

oldCursors=(
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowCursor.png' # ArrowCursor.png
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowFarCursor.png' # ArrowFarCursor.png
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/IBeamCursor.png' # IBeamCursor.png
)

# Making sure that we're replacing the correct location

if [ -d "$robloxDirectory" ]; then
	
	echo "Roblox installation found on '$robloxDirectory'."
	cd $robloxDirectory/$cursorDirectory

else

	echo "Roblox installation could not be found on '$robloxDirectory'."

	printf "Enter the FULL path to the ROBLOX installation (Roblox.app): " && read -r newRobloxDirectory

	newRobloxDirectory=`echo $newRobloxDirectory` # 'Trims' the string

	if [[ ! -d "$newRobloxDirectory" || -z "$newRobloxDirectory" ]] ;then
		echo "Directory does not exist." && exit
	else
		cd $newRobloxDirectory/$cursorDirectory
	fi

fi

# Removing the new cursors

printf "\n"

for i in ${cursorNames[*]}; do
	
	if rm $i; then
		echo "[rm]: Removed '$i'"; fi

done

# Downloading the old cursors

printf "\n"

for i in {0..2}; do
	
	printf "[cURL]: Downloading '${cursorNames[i]}'... "
	
	if curl -s ${oldCursors[i]} -o ${cursorNames[i]}; then
		echo "OK."; fi

done

# Summary message

printf "\n"

echo "Finished replacing. Restart ROBLOX if it's already running."
