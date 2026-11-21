#!/bin/bash
if [ ! -d /opt/giai ]; then
	sudo mkdir /opt/giai
	sudo chown $USER:$USER /opt/giai
	sudo chmod 755 /opt/giai
fi
export INSTDIR=`pwd`
cd /opt/giai
export SNAPSHOT_VERSION="2.13.42-alpha19-202611210000"
#	Install the new models
tar xfz $INSTDIR/org.msscf.msscf.v2_13.cfmodel-${SNAPSHOT_VERSION}.tgz
if [ -L /opt/giai/org.msscf.msscf.v2_13.cfmodel ]; then
	rm /opt/giai/org.msscf.msscf.v2_13.cfmodel
fi
ln -s ./org.msscf.msscf.v2_13.cfmodel-${SNAPSHOT_VERSION} ./org.msscf.msscf.v2_13.cfmodel
