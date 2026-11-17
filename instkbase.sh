#!/bin/bash
if [ ! -d /opt/giai ]; then
	sudo mkdir /opt/giai
	sudo chown $USER:$USER /opt/giai
	sudo chmod 755 /opt/giai
fi
export INSTDIR=`pwd`
. $INSTDIR/initenv.sh
# Install the new knowledge base
tar xfz $INSTDIR/org.msscf.msscf.v2_13.cfkbase-${SNAPSHOT_VERSION}.tgz
if [ -L /opt/giai/org.msscf.msscf.v2_13.cfkbase ]; then
	rm /opt/giai/org.msscf.msscf.v2_13.cfkbase
fi
ln -s ./org.msscf.msscf.v2_13.cfkbase-${SNAPSHOT_VERSION} ./org.msscf.msscf.v2_13.cfkbase
