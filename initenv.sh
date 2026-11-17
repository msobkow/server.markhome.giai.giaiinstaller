#!/bin/bash
if [ ! -d /opt/giai ]; then
	sudo mkdir /opt/giai
	sudo chown $USER:$USER /opt/giai
	sudo chmod 755 /opt/giai
fi
export INSTDIR=`pwd`
cd /opt/giai
export RELEASE_VERSION="2.13.42-alpha17-202611170000"
export SNAPSHOT_VERSION="2.13.42-alpha17-202611170000"
