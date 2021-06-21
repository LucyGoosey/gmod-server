# !/bin/bash

# A convenience function, to save us some work
update_server() {
	# Read the app id and the directory into a variable

	APP_ID=$1
	DIR=$2

	# Create the directory ( if it does not exist already )
	if [ ! -d "./$DIR" ]; then
		mkdir -p "./$DIR"
	fi

	# Uh-oh, it looks like we still have no directory. Report an error.
	if [ ! -d "./$DIR" ]; then
		# Describe what went wrong
		echo "ERROR! Cannot create directory ./$DIR!"

		# Exit with status code 1 ( which indicates an error )
		exit 1
	fi

	# Call SteamCMD with the app ID we provided and tell it to install
	steamcmd +login anonymous +force_install_dir "./$DIR" +app_update $APP_ID validate +quit
}

# Now the script actually runs update_server ( which we just declared above ) with the id of the application ( 4020 is Garry's Mod ) and the name of the directory we want the server to be hosted from:

update_server 4020 "server_1"

# Add any additional servers here by repeating the above, but using a different directory name.
update_server 232330 "server_1/content/css"
update_server 232250 "server_1/content/tf2"

# Exit with status code 0 ( which means OK )
exit 0
