#Dropbox Uploader 1.0 Frank A Odoom
#no checks are in place for this version upload might fail
#if there are nulls this script will fail

#Change directory to temp folder
cd /srv/recordings
exec bash

# Select the recently modified Directory
DIR=$(ls -td -- */ | head -n 1) 
echo $DIR

UPLOAD_DIR=/srv/recordings/$DIR
cd $UPLOAD_DIR
exec bash

#get the mp4 file
video=$(ls *.mp4)
echo $video

# get the token from meta.json
json=($(jq -r '.upload_credentials' metadata.json))
token=${json[4]}
echo $token


#Upload #file
curl -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer ${token}" \
    --header "Dropbox-API-Arg: {\"path\": \"/NotForgotten/Videos/${video}\"}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary @$video