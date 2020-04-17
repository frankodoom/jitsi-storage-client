#!/bin/bash

#Dropbox Uploader 0.9 Frank A Odoom
#place this file in /usr/bin
#no checks are in place for this version upload might fail
#if there are nulls this script will fail

#Change directory to temp folder

function dropboxupload() {

	cd /srv/recordings
	#exec bash

# Select the recently modified Directory
DIR=$(ls -td -- */ | head -n 1) 
echo $DIR

UPLOAD_DIR=/srv/recordings/$DIR
cd $UPLOAD_DIR
#exec bash

#get the mp4 file
video=$(ls *.mp4)
echo $video

# get the token from meta.json
json=($(jq -r '.upload_credentials' metadata.json))
tokenn=${json[4]}

#for some reason jq -r doesnt work for me so below is to remove the "" from the tokesn
token=$(echo $tokenn "$opt" | tr -d '"')
echo $token

#Upload #file
curl -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer $token" \
    --header "Dropbox-API-Arg: {\"path\": \"/NotForgotten/Videos/${video}\"}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary @$video
}

#calling the function
dropboxupload
