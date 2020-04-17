# jitsi-storage-client
Bash scripts for integrating external storage services into Jibri.

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

