# !/bin/bash

# --- Options ---
# Add any additional servers here by using a different directory name.

MSGS=( "Updating Gmod..." "Updating CS:S..." "Updating TF2..." )
APP_IDS=( 4020 232330 232250 )
DIRS=( "server_1" "server_1/content/css" "server_1/content/tf2" )

# --- Code ---

# A convenience function, to save us some work

update_server() {
	# Set our default return value to zero (meaning success)
	ANSWER=0

	# Read the app id and the directory into variables
	APP_ID=$1
	DIR=`realpath "$2" 2>/dev/null || echo "$2"` # resolve to absolute path

	# Create the directory ( if it does not exist already )
	if [ ! -d "$DIR" ]; then
		mkdir -p "$DIR"
		ANSWER=$?

		if [[ 0 -ne $ANSWER ]]; then
			# Uh-oh, it looks like we still have no directory.
			# Report an error.
			echo "ERROR! Cannot create directory \"$DIR\"!"
		fi
	fi

	if [[ 0 -eq $ANSWER ]]; then
		# Call SteamCMD with the app ID we provided and tell it to install
		steamcmd +login anonymous +force_install_dir "$DIR" +app_update $APP_ID validate +quit
		ANSWER=$?
	fi

	return $ANSWER
}

# Sanity check:  MSGS, APP_IDS, and DIRS should all be the same length.

if [[ ${#MSGS[@]} -eq ${#APP_IDS[@]} && ${#MSGS[@]} -eq ${#DIRS[@]} ]]; then
	FAILURE=0
	LEN=${#MSGS[@]}
else
	echo "ERROR! The length of the hardcoded data arrays differ."
	FAILURE=1
	LEN=-1 # not zero as the wrong message would be echoed below
fi

# Now the script actually runs update_server ( which we just declared above )
# with the id of the application ( 4020 is Garry's Mod ) and the name of the
# directory we want the server to be hosted from:

for (( i = 0; 0 == $FAILURE && i < $LEN; i++ )) {
	echo "${MSGS[$i]}"
	update_server "${APP_IDS[$i]}" "${DIRS[$i]}"
	FAILURE=$?
	echo
}

# Let user know whether we were successful.

if [[ 0 -eq $FAILURE ]]; then
	echo "Everything is OK."
else
	if [[ $i -ne $LEN ]]; then
		echo "Terminated early owing to one or more errors!"
	else
		echo "One or more errors were encountered during execution!"
	fi
fi

exit $FAILURE
