#!/bin/bash
export args=$*
export restore=`pwd`
. $GIAI_HOME/server.markhome.giai.giaiycf/bin-v2_13/initbuild
cd $GIAI_HOME/server.markhome.giai.giaiycf/bin-v2_13/
ManufactureSecure11.bash
ManufactureDbTest11.bash
ManufactureInterNet11.bash
ManufactureBusModel11.bash
ManufactureFractalGiKb11.bash
cd $restore
