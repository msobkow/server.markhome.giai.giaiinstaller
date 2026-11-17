#!/bin/bash
if [ ! -d /opt/giai ]; then
	sudo mkdir /opt/giai
	sudo chown $USER:$USER /opt/giai
	sudo chmod 755 /opt/giai
fi
export INSTDIR=`pwd`
. $INSTDIR/initenv.sh
. $INSTDIR/instmodels.sh
. $INSTDIR/instkbase.sh
# Install the bin directory
if [ -d /opt/giai/${RELEASE_VERSION} ]; then
	echo "Removing old installation at /opt/giai/${RELEASE_VERSION} ..."
	rm -Rf /opt/giai/${RELEASE_VERSION}
fi
mkdir /opt/giai/${RELEASE_VERSION}
cp -R $INSTDIR/bin-v2_13 /opt/giai/${RELEASE_VERSION}/
cp -R $INSTDIR/website-v2_13 /opt/giai/${RELEASE_VERSION}/
if [ -L /opt/giai/org.msscf.msscf.v2_13 ]; then
	rm /opt/giai/org.msscf.msscf.v2_13
fi
ln -s ./${RELEASE_VERSION} ./org.msscf.msscf.v2_13
if [ ! -f $HOME/.msscfrc ]; then
	cp $INSTDIR/home.msscfrc $HOME/.msscfrc
	echo "1,\$s:rootgendir=.*$:rootgendir=/home/$USER/msscf-output:" >ex.cmd
	echo ":w" >>ex.cmd
	echo ":q" >>ex.cmd
	ex $HOME/.msscfrc <ex.cmd
	rm ex.cmd
	echo "export MSSCFHOME=/opt/giai" >>$HOME/.profile
	echo "export MSSCF_HOME=/opt/giai" >>$HOME/.profile
	echo "export PATH=\"\$MSSCF_HOME/org.msscf.msscf.v2_13/bin-v2_13/:\$PATH\"" >>$HOME/.profile
fi
