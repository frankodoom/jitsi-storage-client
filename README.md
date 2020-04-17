# jitsi-storage-client
Bash scripts for integrating external storage services into Jibri.

### Currently Supports ###
* Dropbox
  * Copy the dropbox_upload_client.sh script to /usr/bin
  * Set the ``UPLOAD_DIR`` in the dropbox_upload_client.sh to poiint to your Temp Directory
  * Setup the ``DROPBOX_Dir`` in the dropbox_upload_client.sh to point to your Dropbox directory, it will be created if it doesnt exist.
  * Configure finalize_recording_script_path in ``/etc/jitsi/jibri/config.json`` to point to  /usr/bin/dropbox_upload_client.sh

#### Coming Soon ####
* Guided configuration by executing dropbox_upload.sh
* Microsoft Azure
* Amazon S3
* Vimeo

