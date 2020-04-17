# jitsi-storage-client
Bash scripts for saving videos recorded by Jibri to external storage services

### Currently Supports ###
* Dropbox
  * Copy the dropbox_upload_client.sh script to /usr/bin
  * Set the UPLOAD_DIR in the dropbox_upload_client.sh to your Temp Directory
  * Configure Finalize_Upload in jibri config to point to the the script /usr/bin/dropbox_upload_client.sh

#### Coming Soon ####
* Guided configuration by executing dropbox_upload.sh
* Microsoft Azure
* Amazon S3
* Vimeo

