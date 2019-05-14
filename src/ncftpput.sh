#!/bin/bash

ncftpput -z -R -v -u "$user" -p "$passwd" "$host_nas" "$to_remote_path" "$from_local_path"
