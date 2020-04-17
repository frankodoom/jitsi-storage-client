#!/bin/bash
#Dropbox Uploader 0.9 Frank A Odoom #place this file in /usr/bin
#no checks are in place for this version upload might fail
#if there are nulls this script will fail

#Change directory to temp folder
TEMP_DIR=/srv/recordings
#The directory dropbox should save your file. This will be created
#if it doesnt exist
DROPBOX_DIR=/NotForgotten/Videos

function dropboxupload() {

#switch to your temp directory
 cd TEMP_DIR

# Select the recently modified Directory this is usually the last 
#recorded file by ffmpeg
VIDEO_DIR=$(ls -td -- */ | head -n 1) 
echo $VIDEO_DIR

UPLOAD_DIR=$TEMP_DIR/$VIDEO_DIR
cd $UPLOAD_DIR

#get the mp4 file
video=$(ls *.mp4)
echo $video

#you can rename the file in this step


# get the token from meta.json
json=($(jq -r '.upload_credentials' metadata.json))
tokenn=${json[4]}

#for some reason jq -r doesnt work for me so below is to remove the "" from the tokesn
token=$(echo $tokenn "$opt" | tr -d '"')
echo $token

#Upload #file
curl -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer $token" \
    --header "Dropbox-API-Arg: {\"path\": \"${DROPBOX_DIR}/${video}\"}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary @$video
}

#calling the function
dropboxupload
