#!/bin/bash
export SaveDir=`pwd`
export cmdargs=$*
cd $GIAI_HOME/server.markhome.giai.giaiycf/bin-v2_13/
if [ "$LOG4J2_CONF" != "" ]; then
	export JAVA_LOG4J="-Dlog4j.configurationFile=$LOG4J2_CONF"
else
	export JAVA_LOG4J=""
fi
if [ "$MCF_RULE_JAR" != "" ]; then
	if [ -f "$MCF_RULE_JAR" ]; then
		export ruleargs=" -cp $MCF_RULE_JAR "
#	else
#		echo "ERROR: MCF_RULE_JAR could not be found at $MCF_RULE_JAR"
#		export ruleargs=""
	fi
else
	export ruleargs=""
fi
"$JAVA" $JAVA_LOG4J -ea -Xms1023M $ruleargs -jar ./org.msscf.msscf.v2_13.CFCli-2.13.42-alpha19-202611210000-spring-boot.jar $cmdargs
cd $SaveDir
