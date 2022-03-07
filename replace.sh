#!/usr/bin/env sh

CURSOR_DIRECTORY=/Applications/Roblox.app/Contents/Resources/Content/Textures/Cursors/KeyboardMouse

CURSOR_NAMES=(
	'ArrowCursor.png'
	'ArrowFarCursor.png'
	'IBeamCursor.png'
)

NEW_CURSORS=(	
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowCursor.png' # ArrowCursor.png
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/ArrowFarCursor.png' # ArrowFarCursor.png
	'https://raw.githubusercontent.com/Kqpa/old-roblox-cursors/master/assets/old/IBeamCursor.png' # IBeamCursor.png
)

# Making sure that we're replacing the correct location

printf "Cursor path is set to '$CURSOR_DIRECTORY'. Is this correct? [y/n]: " && read -r OPTION

if [[ "$OPTION" != "${OPTION#[Yyes]}" || -z "$OPTION" ]]; then
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

printf "\n"

for i in ${CURSOR_NAMES[*]}; do
	if rm $i; then
    	echo "[rm]: Cleaned '$i'"; fi
done

# Downloading the old cursors

printf "\n"

i=0
while [ $i -lt 3 ]; do
	printf "[cURL]: Downloading '${CURSOR_NAMES[i]}'... "
	if curl -s ${NEW_CURSORS[i]} -o ${CURSOR_NAMES[i]}; then
		echo "OK."; fi
	i=`expr $i + 1`
done

# Summary message

printf "\n"

if [[ "$OPTION" != "${OPTION#[Yyes]}" || -z "$OPTION" ]]; then
	echo "Finished replacing on '$CURSOR_DIRECTORY'. Restart ROBLOX if it's already running."
else
	echo "Finished replacing on '$NEW_CURSOR_DIRECTORY'. Restart ROBLOX if it's already running."
fi
