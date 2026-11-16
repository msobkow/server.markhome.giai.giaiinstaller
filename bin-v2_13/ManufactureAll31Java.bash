#!/bin/bash
export args=$*
export restore=`pwd`
. $GIAI_HOME/server.markhome.giai.giaiycf/bin-v2_13/initbuild
cd $GIAI_HOME/server.markhome.giai.giaiycf/bin-v2_13/
./ManufactureSecure31Java.bash $args
./ManufactureInterNet31Java.bash $args
./ManufactureCore31Java.bash $args
#./ManufactureDbTest31Java.bash $args
./ManufactureBusModel31Java.bash $args
cd $restore
