#!/usr/bin/env sh

robloxDirectory=/Applications/Roblox.app

cursorDirectory=/Contents/Resources/Content/Textures/Cursors/KeyboardMouse

cursorNames=(
	'ArrowCursor.png'
	'ArrowFarCursor.png'
	'IBeamCursor.png'
)

newCursors=(	
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowCursor.png' # ArrowCursor.png
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowFarCursor.png' # ArrowFarCursor.png
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/IBeamCursor.png' # IBeamCursor.png
)

# Making sure that we're replacing the correct location

printf "Is ROBLOX installed on '$robloxDirectory'? [y/n]: " && read -r option

if [[ "$option" != "${option#[Yyes]}" || -z "$option" ]]; then
	cd $robloxDirectory/$cursorDirectory
else
	printf "Enter the FULL path to the ROBLOX installation (Roblox.app): " && read -r newRobloxDirectory
	if [[ ! -d "$newRobloxDirectory/$cursorDirectory" || -z "$newRobloxDirectory" ]] ;then
		echo "Directory does not exist." && exit
	else
		cd $newRobloxDirectory/$cursorDirectory
	fi
fi

# Removing the old cursors

printf "\n"

for i in ${cursorNames[*]}; do
	if rm $i; then
    	echo "[rm]: Removed '$i'"; fi
done

# Downloading the old cursors

printf "\n"

for i in {0..2}; do
	printf "[cURL]: Downloading '${cursorNames[i]}'... "
	if curl -s ${newCursors[i]} -o ${cursorNames[i]}; then
		echo "OK."; fi
done

# Summary message

printf "\n"

if [[ "$option" != "${option#[Yyes]}" || -z "$option" ]]; then
	echo "Finished replacing on '$robloxDirectory/.../$(basename $(dirname $cursorDirectory))/$(basename $cursorDirectory)'. Restart ROBLOX if it's already running."
else
	echo "Finished replacing on '$newRobloxDirectory/.../$(basename $(dirname $cursorDirectory))/$(basename $cursorDirectory)'. Restart ROBLOX if it's already running."
fi
