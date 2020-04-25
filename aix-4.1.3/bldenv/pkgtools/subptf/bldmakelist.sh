#! /bin/ksh
# @(#)55	1.22  src/bldenv/pkgtools/subptf/bldmakelist.sh, pkgtools, bos412, GOLDA411a 1/14/94 16:03:18
#
# COMPONENT_NAME: (BLDTOOLS) BAI Build Tools 
#
# FUNCTIONS: bldmakelist
#
# ORIGINS: 27
#
# (C) COPYRIGHT International Business Machines Corp. 1991, 1992
# All Rights Reserved
# Licensed Materials - Property of IBM
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#

. bldloginit
. bldkshconst  # define constants
. bldinitfunc

#
# NAME: bldmakelist
#
# FUNCTION: Return the make dependency list
#
#	Comments/separators are removed from the make output file.
#       Each path name is normalized.
#       Any duplicate entries are removed.
#
# INPUT: release (parameter) - the current CMVC level release
#	 lmmakelist (file) - the dependency output file from v3bld/make
#        BLDLMALL (environment) - if set, always regenerate makelist from
#		the beginning (do not use previous makelist)
#
# OUTPUT: the new make dependency list is written to stdout
#
# SIDE EFFECTS: 1) a lmmakelist.all file is maintained across runs 
#	        2) lmmakelist.* file names are change to lmmakelist.*.done
#		   after they are processed
#
# EXECUTION ENVIRONMENT: The build process environment
#
# NOTES: Logging with -x represents a fatal error; for fatal errors, log
#    will "exit".
#
#    The main reason for the complexity of this command is for performance.
#    To process a full make list could take 30 minutes; if only a small
#    part of the make data is new, time can be saved by only reprocessing
#    as little as possible.  This works pretty well but makes the command
#    much more complicated and requires intermediate files to be maintained
#    between runs.
#
# FORMATS/DATA STRUCTURES:
#    lmmake output file format (input):
#		<target path> <dependency path> [NEW]
#		<target path> <dependency path> [NEW]
#			       . . .
#    stdout format:
#		<normalized target path> <normalized dependency path> [NEW]
#		<normalized target path> <normalized dependency path> [NEW]
#			                . . .
# RETURNS: 0 (successful) or non-zero (failure)

######  S E T U P  ###### 
lvar="+l -c$0"  # init log parms
[[ $# = 2 ]] || log $lvar -x "illegal syntax"
typeset release=$1  # command line parameter
typeset previousmakelist=$2  # command line parameter
rc=$UNSET
logarg="-e"

trap 'rm -f $NEWLIST $GREPFILE $MAKELIST $UNIQUEDATA; trap - EXIT; exit $rc' \
	EXIT HUP INT QUIT TERM

NEWLIST=$(bldtmppath)/newlist$$; readonly NEWLIST
GREPFILE=$(bldtmppath)/greplist$$; readonly GREPFILE
MAKELIST=$(bldtmppath)/makelist$$; readonly MAKELIST
UNIQUEDATA=$(bldtmppath)/uniqdata$$; readonly UNIQUEDATA

get_filename_definitions

###### P R O C E S S   M A K E   O U T P U T   F I L E S  ######
makedatafile=$(bldreleasepath $release)/lmmakelist
libdepdatafile=$(bldreleasepath $release)/libdeplist

[[ -r $libdepdatafile ]] || log $lvar -x "unable to read $libdepdatafile"

[[ ! -f ${GREPLIST} ]] && \
   log +l -x "Cannot find/open GREPLIST file: ${GREPLIST}"

touch $NEWLIST  # make sure file exists for later

## combine all the unprocessed lmmakelist files generated by v3bld/make
for list in ${makedatafile}.*
do
        if [[ $list = *.[0-9] || $list = *.[0-9][0-9] ]]
	then
		cat $list >> $NEWLIST || 
			log $lvar -x "unable to combine lmmakelists"
	fi
done

if [[ -s ${makedatafile}.all ]]  ## if bldmakelist has been previously ran
then
	## if there is not already a processed makelist OR the new unprocessed
	## data has a lot of data in it OR the amount of data is not too large
	## then regenerate the makelist from scratch; otherwise, since the
	## new data is relatively small compared to the existing data, do not
	## regenerate all data from scratch.
	## (Even though the data sizes are based on the two big releases, bos 
        ##  and gos, they are somewhat arbitrarily choosen.)
	if [[ ( ! -s $previousmakelist ) || 
 	      $(du -a $NEWLIST | cut -f1) -gt 2500 ||
 	      $(du -a ${makedatafile}.all | cut -f1) -lt 8000 ||
	      -n "$BLDLMALL" ]]
	then
		cat ${makedatafile}.all >> $NEWLIST || 
			log $lvar -x "unable to combine lmmakelists"
	else 
		NORESTART=1
	fi
fi

## error if there is no data to process
[[ ( ! -s $NEWLIST ) && ( ! -s ${makedatafile}.all ) && -z "$NORESTART" ]] &&
	log $lvar -x "no lmmakelist data was found"

## add the separately generated library data to the list
cat $libdepdatafile >> $NEWLIST || log $lvar -x "unable to concat lib data"

## remove some make list lines which are known to not be used
[[ $(egrep -f $GREPLIST -v $NEWLIST > $GREPFILE) -le 1 ]] || 
	log $lvar -x "unable to egrep"

rm $NEWLIST  ## clean up intermediate to save space

## remove duplicate lines
blddepunique $GREPFILE > $UNIQUEDATA || 
	log $lvar -x "unable to remove duplicates"

rm $GREPFILE  ## clean up intermediate to save space

## normalize the make list (target/dependency data)
bldnormalize $UNIQUEDATA > $MAKELIST || 
	{ [[ $? -ne 1 ]] && logarg="-x";
	  log $lvar $logarg "unable to normalize paths"; }

## turn off traps in critical section -- helps make command repeatable;
## this is needed because the command is sometimes prematurely terminated
trap "" HUP INT QUIT TERM

## change the names of the lmmakelist to mark them as "processed"
for list in ${makedatafile}.*
do
        if [[ $list = *.[0-9] || $list = *.[0-9][0-9] ]]
	then
		mv $list $list.$$.done || 
		log $lvar -x "unable to mark lmmakelist"
	fi
done

if [[ -n "$NORESTART" ]]
then    ## add new normalized data to previous makelist data 
	cat $MAKELIST >> $previousmakelist || 
		log $lvar -x "unable to concat makelist"
	rm $MAKELIST  ## clean up intermediate to save space
	cat $UNIQUEDATA >> ${makedatafile}.all || 
		log $lvar -x "unable to cat unique data"
else    ## move the intermediate data file to the permanate file names
	if [[ -s ${makedatafile}.all ]] ; then
		mv ${makedatafile}.all ${makedatafile}.all.$$.done  ||
		    log $lvar -x "unable to move intermediate makedatafile"
        fi
	mv $MAKELIST $previousmakelist || 
		log $lvar -x "unable to cat makelist"
	mv $UNIQUEDATA ${makedatafile}.all ||
		    log $lvar -x "unable to move uniquedata"
fi

trap 'rm -f $NEWLIST $GREPFILE $MAKELIST $UNIQUEDATA; trap - EXIT; exit $rc' \
	EXIT HUP INT QUIT TERM  ## turn traps back on

[[ $rc = $UNSET ]] && rc=$SUCCESS
exit
