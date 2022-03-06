#!/usr/bin/env sh

CURSOR_DIRECTORY=/Applications/Roblox.app/Contents/Resources/Content/Textures/Cursors/KeyboardMouse

# Making sure that we're replacing the correct location

printf "Cursor path is set to '$CURSOR_DIRECTORY'. Is this correct? [y/n]: " && read -r option

if [ "$option" != "${option#[Yyes]}" ]; then
	echo "Continuing..."
	cd $CURSOR_DIRECTORY
else
	printf "Enter the FULL path of the cursor location: " && read -r NEW_CURSOR_DIRECTORY
	
	if [[ ! -d "$NEW_CURSOR_DIRECTORY" || -z "$NEW_CURSOR_DIRECTORY" ]] ;then 
		echo "Directory does not exist." && exit
	else
		cd $NEW_CURSOR_DIRECTORY
	fi
fi

# Removing the old cursors

rm ArrowCursor.png ArrowFarCursor.png IBeamCursor.png

# Downloading the old cursors

wget 'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowCursor.png' &&
wget 'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowFarCursor.png' && 
wget 'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/IBeamCursor.png'

echo "Finished replacing. Restart ROBLOX if it's already running."
