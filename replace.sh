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

wget 'https://cdn.discordapp.com/attachments/711225037738213446/950020340359249930/ArrowCursor.png' &&
wget 'https://cdn.discordapp.com/attachments/711225037738213446/950020340891922472/ArrowFarCursor.png' && 
wget 'https://cdn.discordapp.com/attachments/711225037738213446/950061709756887110/IBeamCursor.png'

echo "Finished replacing. Restart ROBLOX if it's already running."
