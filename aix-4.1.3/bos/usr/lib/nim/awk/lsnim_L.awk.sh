# @(#)28	1.3  src/bos/usr/lib/nim/awk/lsnim_L.awk.sh, cmdnim, bos411, 9438C411a  9/23/94  09:07:06
#
#   COMPONENT_NAME: CMDNIM
#
#   FUNCTIONS: ./usr/lib/nim/awk/lsnim_L.awk
#
#   ORIGINS: 27
#
#
#   (C) COPYRIGHT International Business Machines Corp. 1993
#   All Rights Reserved
#   Licensed Materials - Property of IBM
#   US Government Users Restricted Rights - Use, duplication or
#   disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#

################################################################################
#
#                             lsnim_L.awk
#
# aligns columns for the type of output produced with the "-L" option of lsnim
###############################################################################

END {
	for (i=1; i <= num; i++)
	if ( match( field[i,1], /^-.*/ ) )
		print field[i,1]
	else
	{	spaces1 = "     "
		for (j=1; j <= (max1 - max[i,1]); j++)
			spaces1 = spaces1 " "
		spaces2 = "     "
		for (j=1; j <= (max2 - max[i,2]); j++)
			spaces2 = spaces2 " "

		line = field[i,1] spaces1 field[i,2] spaces2 field[i,3]

		# limit line to max of 80 chars
		print substr(line,1,80)
	}
}

/^-.*/ {
	field[ ++num, 1 ] = $0
	next
}

# NOTE that resource object names are delimited by "." (eg, ".myspot.").  This
#		was done in order to handle cases where the comments field has more than
#		one newline character in it (which causes >1 lines of comment output)
/^\.[^ 	]+\./ {

	# remove the delimiters around the res name
	gsub( /\./, "", $1 )

	# cache the info
	field[ ++num, 1 ] = $1
	field[ num, 2 ] = $2
	$1 = ""
	$2 = ""
	field[ num, 3 ] = $0

	# determine max char width of first two fields
	max[ num, 1 ] = length( field[num,1] )
	max[ num, 2 ] = length( field[num,2] )

	if ( max[num,1] > max1 )
		max1 = max[num,1]
	if ( max[num,2] > max2 )
		max2 = max[num,2]
}

