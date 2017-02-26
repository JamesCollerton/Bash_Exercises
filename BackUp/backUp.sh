# Sources all the files we need. Sets location relative to current
# place.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ../bin/formatting.sh
source ../Configurations/config.sh

# Prints the message when we start.
function printBackUpStartMessage {

	newline

	echo "---------------------------------------"
	echo "Back Up Beginning"
	echo "---------------------------------------"

	newline

}

# Used to compress the folder we want to back up.
function compressLocationFolder {

	backUpDirectoryNoSlash="${backUpDirectory:1:${#backUpDirectory}}"

	tar -cvzf $(date +%Y%m%d-%H%M%S).tar.gz -C / "$backUpDirectoryNoSlash";

}

# Move the folder to the backup location
function moveCompressedFolder {

	# Found in the config.sh file
	backUpLocation="$backUpLocation"

	mv *.tar.gz "$backUpLocation"

}

function printBackUpEndMessage {
	
	newline

	echo "---------------------------------------"
	echo "Back Up Finished"
	echo "---------------------------------------"

	newline

}

# Runs main function for backing up
function backUpMain {

	printBackUpStartMessage
	compressLocationFolder
	moveCompressedFolder
	printBackUpEndMessage

}

# Runs main
backUpMain
