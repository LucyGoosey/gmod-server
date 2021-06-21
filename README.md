# Lucy's Gmod Server

A few utility scripts for setting up and running my gmod server.

Also contains the config files.

## Installing/Updating Gmod

Clone the repo into the directory you want the server to be in.

Run `./update_gmod.sh` to install gmod into `./server_1`. This will also download the required CS:S and TF2 content.

The `./update_gmod.sh` script will also update gmod, cs:s, and tf2.

You will then need to update `./server_1/garrysmod/cfg/mount.cfg` to point to the absolute location of the css and tf2 content. This content can be found in `./server_1/content/`, so only the `/path/to/` needs to be changed to locate your chosen directory.

Finally you need to add a `secrets.cfg` file in the `./server_1/garrysmod/cfg/` directory. This file must take the format:

```
hostname "{Server Name}"
sv_password "{Server Password}"
rcon_password "{Admin Password}"
```

Replacing `{Server Name}` with your chosen server name, as visible in the public server listings.

An optional `{Server Password}` with a password for the server, if you wish to make it private. If you don't want a password you can delete this line from the file.

And `{Admin Password}` is the password used to gain access to the admin controls within the server.

## Running TTT

After installing the gmod server, run `./ttt.sh`.

## Running Prophunt

After installing the gmod server, run `./prophunt.sh`.

## Running in the background

If you want the server to run in the background, add an `&` to the command. e.g. `./ttt.sh &`.

## Stopping the server

To stop the server, run `./stop-server.sh`.

## Changing the Workshop Collection

To change the Steam Workshop collection that is loaded with the server you must alter the `./ttt.sh` or `./prophunt.sh` file.

Both files have a parameter `+host_workshop_collection` followed by the ID of the collection to be loaded.

This ID can be changed to the ID of the collection you wish to load.

### Finding a Workshop Collection ID

Navigate to the Steam Workshop Collection and copy the URL. It will look like `https://steamcommunity.com/sharedfiles/filedetails/?id=1861356164`. The number at the end, in this case `1861356164` is the collection ID.
