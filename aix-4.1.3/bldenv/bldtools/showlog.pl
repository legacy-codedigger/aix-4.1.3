#! /usr/bin/perl
# @(#)87	1.10  src/bldenv/bldtools/showlog.pl, bldprocess, bos412, GOLDA411a 1/17/92 14:56:51
#
# FUNCTIONS: showlog
#	     usage
#	     process_option
#	     process_opt_arg
#	     current_values
#	     help
#	     handler
#	     read_log_file
#	     line_count
#	     page_prompt
#	     trunc_line
#	     backwards
#	     initialize
#	     get_cmd_line_options
#	     print_verbose_ary
#	     print_verbose
#	     comp_params
#	     search_pattern
#	     
#
# ORIGINS: 27
#
# IBM CONFIDENTIAL -- (IBM Confidential Restricted when
# combined with the aggregated modules for this product)
#                  SOURCE MATERIALS
# (C) COPYRIGHT International Business Machines Corp. 1991
# All Rights Reserved
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# NAME: showlog
# 
# FUNCTION: Displays the log files created by 'log' command in a paged format.
#	    The output is displayed according to the various parameters
#	    chosen on the command line or on the prompt during output paging.
#
# INPUT: Options and optional arguments. See man pages for more details.
#	 The log file generated by 'log(bldlog)' command.
#
# OUTPUT: The default output is to the terminal, But can redirected with the
#	  regular unix syntax.
#
# EXECUTION ENVIRONMENT: Build process environment.
#
# FORMATS/DATA STRUCTURES
#  Output format
#
#  Verbose mode
#  (<line_num>) <date> context=<context>|<sub1>|<sub2> <level>
#  "log message"
#   STDERR "standard error message"
#
#  Non verbose mode
#  "log message"
#   STDERR "standard error message"
#
 
$SIG{'INT'} = 'handler';	# Interrupt handler
push(@INC,split(/:/,$ENV{"PATH"}));          # Including path 

local($line);
&initialize;		# Initialize the global values (command line options)

# checks to see whether stdout has redirected
if (-t STDOUT){
	$tty = 1;
}
else{
	$tty = 0;
}

&get_cmd_line_options;           # parse command line
&process_growing_file
	if ($tail);
&read_log_file;			# read the log file into an array and call
				# process_file


###############################################################################

sub process_file{

	$lines = -1;
	$total_lines = -1;
	
	while (1) {
		$EOF = 0;
	
		for ($cur_line_no .. $#log_ary){   # process the array
	
			$total_lines++;
			$EOF = 1 if $_ == $#log_ary;
	
			if ($log_ary[$_] =~ /^\%.*/){    
	
						#The line is not a STDERR msg
				if ($search_flag){
						# searching for a pattern 
	
					&search_pattern($log_ary[$_]);
				}
				else{
	
				# comparing the options with the array elements
	
					&comp_params($log_ary[$_]);
				}
				if ($process){
	
					# The line is true with the comparision 
					# or search
	
					$i = 1; $Indent = "";
	
					# Now indent the line with respect 
					# to the level
	
					for($i=1;$i < $log_lvl;$i++){
	
						$Indent .= $indent;
					}
					if ($verbose){
	
						# More descriptive output
	
						&print_verbose;
						$line =  "$Indent\"$log_cmd";
						$line .= "$log_err$log_msg\"\n";
						&trunc_line(*line); 
						print "$line";
					}
					else{
						$line =  "$Indent$log_cmd";
						$line .=  "$log_err$log_msg\n";
						&trunc_line(*line);
						print "$line";
					}
				}
			}
			else{
	
				# It is a standard error line
	
				if ($stderr){
	
					if ($search_flag){
	
						if (index($log_ary[$_],$search) 
								>= 0){
							$line = 
							"STDERR: $log_ary[$_]";
							&trunc_line(*line);
							print "$line";
							$search_flag = 0;
							$next_search_line = 
									$_ + 1;
						}
					}
					else{
						$line = "STDERR: $log_ary[$_]";
						&trunc_line(*line);
						print "$line";
					}
				}
			}
			if ($tty){
	
				# if the output has not been redirected,prompt
	
				next unless ($lines >= $page_size || $EOF ||
				 (($verbose) && ($lines + 1 >= $page_size)
				&& ($stderr) && ($log_ary[$_ + 1] =~ /^\%.*/)));
	
				if (($rtrn_val = &page_prompt) == 3){ 
					# next page
	
					$cur_line_no = $_ + 1;
				}
				elsif ($rtrn_val == 1){    # current page
	
					$cur_line_no = $_ - $total_lines;
				}
				elsif ($rtrn_val == 4){
					$cur_line_no = 0;
					return 0;
				}
				$total_lines = -1;
				last;
			}
		}		# end of for loop
	
		return 0 if ! $tty;  # break from the while loop 
				 # if output is not to tty
	
	}			# end of while loop
}

###############################################################################


#
# NAME: process_growing_file
#

sub process_growing_file{
	local($fileposition);
	$log_file = shift(ARGV);
	open log_file || die " Could not open the file $log_file";
	for (;;){
		while (<log_file>){
			if (/^\%.*/){    

				#The line is not a STDERR msg
				if ($search_flag){
						# searching for a pattern 

					&search_pattern($_);
				}
				else{

				# comparing the options with the line elements

					&comp_params($_);
				}
				if ($process){

				# The line is true with the comparision 
				# or search

					$i = 1; $Indent = "";

					# Now indent the line with respect 
					# to the level

					for($i=1;$i < $log_lvl;$i++){

						$Indent .= $indent;
					}
					if ($verbose){

						# More descriptive output

						&print_verbose;
						$line =  "$Indent\"$log_cmd";
						$line .= "$log_err$log_msg\"\n";
						&trunc_line(*line); 
						print "$line";
					}
					else{
						$line =  "$Indent$log_cmd";
						$line .=  "$log_err$log_msg\n";
						&trunc_line(*line);
						print "$line";
					}
				}
			}
			else{

				# It is a standard error line

				if ($stderr){

					if ($search_flag){

						if (index($_,$search) >= 0){
							$line = "STDERR: $_";
							&trunc_line(*line);
							print "$line";
						}
					}
					else{
						$line = "STDERR: $_";
						&trunc_line(*line);
						print "$line";
					}
				}
			}
			$fileposition = tell(log_file);
		}
	#sleep 10;
	seek(log_file,$fileposition,0);
	}
}

#
# NAME: usage
#
# FUNCTION: Prints out the valid options on the tty if invalid options are used
#
# INPUT: none
#
# OUTPUT: Prints the command line options to the terminal
#
# NOTES: Exits from the program after printing the output.
#

sub usage{
	local($Usage);
	$Usage = "usage: $0 [-p <page size>] [-i <line inc>] [-l <level> ]";
	$Usage .= " [-I <indent>]\n[-s </pattern/>] [-c <command>]";
	$Usage .= "[-C <context>] [-1 <subcontext1>]\n[-2 <subcontext2>]";
	$Usage .= "[-L <cur line no>] [-TtSV] [log_files ...]\n";
	die "$Usage";
}

#
# NAME: process_option
#
# FUNCTION: Processes the command line option
#
# INPUT: ARGV (global special perl variable)
#	 $1 (Special perl local variables)
#
# OUTPUT: ARGV (global special perl variable)
#

sub process_option{
	local($rest);
	unshift(ARGV,"-$rest") if(($rest = $1) ne '');
}
	
#
# NAME: process_opt_arg
#
# FUNCTION: Processes the command line optional argument
#
# INPUT: ARGV (global special perl variable)
#	 $1 $2 (Special perl local variables)
#	 $_ (special local perl variable)
#
# OUTPUT: ARGV (global special perl variable)
#	  $_ (special local perl variable)
#

sub process_opt_arg{
	local($option) = $1;
	$_[0] = ( $2 ? $2 : shift(@ARGV));
	die "$0: $option requires a value\n" if $_[0] =~ /^-|^$/;
}

#
# NAME: current_values
#
# FUNCTION: prints the values of the current options
#
# INPUT: level,page_size,cur_line_no,log_file,context,subcontext1
#	 subcontext2,command,search,verbose,stderr (global variables)
#
# OUTPUT: none
#


sub current_values{
	local($temp) = $command;
	$temp =~ s/: $//;
	print "current level = $level\n";
	print "current page size = $page_size\n";
	print "current line = $cur_line_no\n";
	print "current log file = $log_file\n";
	print "current context = $context\n";
	print "current sub context1 = $subcontext1\n";
	print "current sub context2 = $subcontext2\n";
	print "current command = $temp\n";
	print "current search pattern = $search\n";
	print "verbose = on\n" if $verbose;
	print "stderr = on\n" if $stderr;
	print "truncate = on\n" if $truncate;
}

#
# NAME: help
#
# FUNCTION: Prints a restricted form of help in setting values to the various
#	    options at the paged prompt.
#
# INPUT: none
#
# OUTPUT: none
#

sub help{
	print "page_size = <number>\n";
	print "level = <number>\n";
	print "current_line = <number>\n";
	print "search = <pattern>\n";
	print "context = <string>\n";
	print "subcontext1 = <string>\n";
	print "subcontext2 = <string>\n";
	print "command = <string>\n";
	print "verbose = on/off\n";
	print "stderr = on/off\n";
	print "truncate = on/off\n";
	print "indent = <\"indentation\">\n";
}

#
# NAME: handler
#
# FUNCTION: Traps interrupts and quits from the program
#
# INPUT: none
#
# OUTPUT: none
#

sub handler{
	local($sig) = @_;
	die "\nCaught a SIG$sig -- quitting\n";
}

#
# NAME: read_log_file
#
# FUNCTION: Opens the log file and reads into an array. It also reverses this 
#	    array and reads it into an another array thereby getting a reversed
#	    log file into an array.
#
# INPUT: log_ary,rev_log_ary (global arrays)
#	 log_file (global variable)
#
# OUTPUT: log_ary,rev_log_ary (global arrays)
#

sub read_log_file{
	local($i);
	while ($log_file = $ARGV[0]){
		shift(ARGV);
		if (open log_file){ 
			if (-z log_file){
				warn "The log file $log_file is empty";
				next;
			}
			@log_ary = <log_file>;
			@rev_log_ary = reverse @log_ary;
			print "$log_file\n";
			for ($i = 1; $i < length($log_file); $i++) {
				print "-";
			}
			print "-\n";
			sleep 1;
			&process_file;
		}
		else{
			   warn " Could not open the file $log_file";
			   next;
		}
	}
}

#
# NAME: line_count
#
# FUNCTION: Counts the number of 80 charector lines in a string element of an 
#	    array and increments the global variable 'lines' by the count
#
# INPUT: lines (global variable)
#	 A string element of the global arrays
#
# OUTPUT: lines (global variable)
#

sub line_count{
	local($line) = @_;
	local($len);
	
	$len = length($line);
	$lines = $lines + int($len/80);
	$lines++ if (($len%80) > 0);
}

#
# NAME: page_prompt
#
# FUNCTION: Prompts the user to change the values of options,to continue to the
#	    next page,to go backwards by a page or to quit
#
# INPUT: EOF,cur_line_no,reverse_line_no,total_lines,page_size,level,context
#	 subcontext1,subcontext2,command,log_file,search,indent,search_flag,
#	 verbose,stderr,truncate. (global variables)
#	 log_ary,rev_log_ary (global arrays)
#	 STDIN (key board)
#
# OUTPUT: EOF,cur_line_no,reverse_line_no,total_lines,page_size,level,context
#	  subcontext1,subcontext2,command,log_file,search,indent,search_flag,
#	  verbose,stderr,truncate. (global variables)
#
# RETURNS: 
#	1 (for current page)
#	2 (for first page)
#	3 (next page)
#	4 (next log file)

sub page_prompt{
	local($answer,$key,$value,$rc);

	$lines = -1;		# reinitializing lines to -1

	if ($EOF){
		print "(EOF):";
	}
	else{
		print ":";
	}
	$answer = <STDIN>;		# get keyboard input
	$answer =~ s/ *= */=/g;    # Taking out white spaces around '='

	chop $answer;
	exit if $answer =~ /^q|^quit/;

	if (index($answer,'=') < 0){
		if ($answer eq "?"){
			&current_values;
			$rc = &page_prompt;
			return $rc;
		}
		elsif ($answer =~ /h|help/){
			&help;
			$rc = &page_prompt;
			return $rc;
		}
		elsif ($answer =~ /\d/){     # if a number, go to that line

			if (($answer < 0) || ($answer > $#log_ary)){
				print "Invalid number\n";
				$rc = &page_prompt;
			}
			else{
				$cur_line_no = $answer;
				$rc = 2;
			}
			return $rc;
		}
		elsif ($answer =~ /^n$/){
			if ($search =~ ""){
				print "No search pattern found\n";
				$rc = &page_prompt;
				return $rc;
			}
			else{
				$search_flag = 1;
				$cur_line_no = $next_search_line;
				return 2;
			}
		}
		elsif ($answer =~ /^$/){   # if CR 
			return 4 if $EOF;
			return 3;
		}
		elsif ($answer =~ /^\$$/){ # go to last page
			$EOF = 1;
			$reverse_line_no = 0;
			$total_lines = -1;
			$_ = &backwards;
			$rc = &page_prompt;
			return $rc;
		}
		elsif ($answer =~ /^-$/){  # one page back
			$EOF = 0;
			$reverse_line_no = $#rev_log_ary -($_ - $total_lines)+1;
			$total_lines = -1;
			return 2 if ($reverse_line_no >= $#rev_log_ary);
			$_ = &backwards;
			$rc = &page_prompt;
			return $rc;
		}
		elsif ($answer =~ /^e|^E/){
			return 4;
		}
		else{
			print "$answer is not valid\n";
			$rc = &page_prompt;
			return $rc;
		}
	}
	else{	# now resetting search_flag to 0 for any option not search
		# and setting the values

		($key,$value) = split(/=/,$answer);
		if ($key =~ "page_size"){
			$page_size = $value;
			return 4 if $EOF;
			return 3;
		}
		elsif ($key =~ "level"){
			$level = $value;
			$search_flag = 0;
			return 1;
		}
		elsif ($key =~ "context"){
			$context = $value;
			$search_flag = 0;
			return 1;
		}
		elsif ($key =~ "subcontext1"){
			$subcontext1 = $value;
			$search_flag = 0;
			return 1;
		}
		elsif ($key =~ "subcontext2"){
			$subcontext2 = $value;
			$search_flag = 0;
			return 1;
		}
		elsif ($key =~ "command"){
			$command = $value;
			$command .= ": ";
			$search_flag = 0;
			return 1;
		}
		elsif ($key =~ "indent"){
			$indent = substr($value,1,(length($value) -2));
			return 1;
		}
		elsif ($key =~ "search"){
			$search = $value;
			$search_flag = 1;
			return 2;
		}
		elsif ($key =~ "verbose"){
			if ($value =~ "on"){
				$verbose = 1;
			}
			else{
				$verbose = 0;
			}
			return 1;
		}
		elsif ($key =~ "stderr"){
			if ($value =~ "off"){
				$stderr = 0;
			}
			else{
				$stderr = 1;
			}
			return 1;
		}
		elsif ($key =~ "truncate"){
			if ($value =~ "off"){
				$truncate = 0;
			}
			else{
				$truncate = 1;
			}
			return 1;
		}
		else{
			print "$answer is not valid\n";
			$rc = &page_prompt;
			return $rc;
		}
	}
}

#
# NAME: trunc_line
#
# FUNCTION: Truncates a line to 80 charectors if the truncate flag is on and
#	    calls the function line_count.
#
# INPUT: line ( pointer reference to a string element in global arrays)
#
# OUTPUT: line ( pointer reference to a string element in global arrays)
#
# SIDE EFFECTS: Increments the global variable 'lines'
#

sub trunc_line{
	local(*line) = @_;
	if (($truncate) && (length($line) > 79)){
		$line = substr($line,0,78);
		$line .= "\n";
	}
	&line_count($line)
		if (! $tail);
}

#
# NAME: backwards
#
# FUNCTION: Displays the previous page when a '-' is keyed at the page prompt
#
#	    The approach is to traverse the reversed array from the point from
#	    which the total number of lines(elements of the array) to the end
#	    of the array is equal to the total number of lines traversed in the
#	    regular array. These remaining lines are processed and printed to a
#	    local array of size of 24, This local array is then printed in
#	    reverse order to get the previous page.
#
# INPUT: lines,total_lines,indent,page_size,cur_line_no,reverse_line_no,
#	 process,stderr,search_flag,log_cmd,log_err,log_msg,search (global)
#	 rev_log_ary (global array)
#
# OUTPUT:lines,total_lines,cur_line_no (global variables)
#
# 
# SIDE EFFECTS: Changes the the global value of cur_line_no to the first line
#		after the previous page is displayed.
#
# RETURNS: The current line number in the log file (current index in log_ary)
#

sub backwards{
	local($line,@ary,$ary_line); # ary contains 24 processed lines from
				    # rev_log_ary and is printed backwards
	$total_lines = -1;          # reinitialize both lines and total_lines
	$lines = -1;
	$ary_line = -1;

	for ($reverse_line_no..$#rev_log_ary){

		$total_lines++;

		if ($rev_log_ary[$_] =~ /^\%.*/){
			if ($search_flag){
				&search_pattern($rev_log_ary[$_]);
			}
			else{
				&comp_params($rev_log_ary[$_]);
			}
			if ($process){

				$i = 1; $Indent = "";
				for($i=1;$i < $log_lvl;$i++){
					$Indent .= $indent;
				}
				$ary_line++;
				if ($verbose){
					$line =  "$Indent\"$log_cmd";
					$line .=  "$log_err$log_msg\"\n";
					&trunc_line(*line);
					$ary[$ary_line] = $line;
					&print_verbose_ary(*ary,*ary_line);
				}
				else{
					$line =  "$Indent$log_cmd";
					$line .=  "$log_err$log_msg\n";
					&trunc_line(*line);
					$ary[$ary_line] = $line;
				}
			}
		}
		else{
			if ($stderr){
				if ($search_flag){
					if (index($log_ary[$_],$search) >= 0){
						$ary_line++;
						$line = "STDERR:";
						$line .= " $rev_log_ary[$_]";
						&trunc_line(*line);
						$ary[$ary_line] = $line;
					}
				}
				else{
					$ary_line++;
					$line = "STDERR: $rev_log_ary[$_]";
					&trunc_line(*line);
					$ary[$ary_line] = $line;
				}
			}
		}
		last if ($lines >= $page_size);
	}
	print reverse @ary;
	$lines = -1;
	$cur_line_no = ($#rev_log_ary - $reverse_line_no) + 1;
	return ($cur_line_no - 1);
}

#
# NAME: initialize
#
# FUNCTION: initializes the option on the command line to default values
#
# INPUT: log_file,level,line_inc,cur_line_no,pattern,page_size,command,
#	 context,subcontext1,subcontext2,indent,stderr,truncate (global vars)
#
# OUTPUT: log_file,level,line_inc,cur_line_no,pattern,page_size,command,
#	 context,subcontext1,subcontext2,indent,stderr,truncate (global vars)
#

sub initialize{
	$log_file = "/tmp/LOG"; 
	$level = 5;
	$line_inc = 1;
	$cur_line_no = 0;
	$pattern = "";
	$page_size = 23;
	$command = "undefined";
	$context = "undefined";
	$subcontext1 = "undefined";
	$subcontext2 = "undefined";
	$indent = "   ";
	$stderr = 1;
	$truncate = 1;
}

# NAME: get_cmd_line_options
#
# FUNCTION: gets the command line options and their arguments
#
# INPUT: log_file,level,line_inc,cur_line_no,pattern,page_size,command,
#	 context,subcontext1,subcontext2,indent,stderr,truncate (global vars)
#
# OUTPUT: log_file,level,line_inc,cur_line_no,pattern,page_size,command,
#	 context,subcontext1,subcontext2,indent,stderr,truncate (global vars)
#
 
sub get_cmd_line_options{
	while ($ARGV[0] =~ /^-/){
		$_ = shift(@ARGV);
		if (/^-(p)(.*)/){
			&process_opt_arg($page_size);
		}
		elsif (/^-(i)(.*)/){
			&process_opt_arg($line_inc);
		}
		elsif (/^-(l)(.*)/){
			&process_opt_arg($level);
		}
		elsif (/^-(L)(.*)/){
			&process_opt_arg($cur_line_no);
		}
		elsif (/^-(s)(.*)/){
			&process_opt_arg($search);
			$search_flag = 1;
		}
		elsif (/^-(C)(.*)/){
			&process_opt_arg($context);
		}
		elsif (/^-(1)(.*)/){
			&process_opt_arg($subcontext1);
		}
		elsif (/^-(2)(.*)/){
			&process_opt_arg($subcontext2);
		}
		elsif (/^-(c)(.*)/){
			&process_opt_arg($command);
		}
		elsif (/^-S(.*)/){
			&process_option;
			$stderr = 0;
		}
		elsif (/^-t(.*)/){
			&process_option;
			$truncate = 0;
		}
		elsif (/^-V(.*)/){
			&process_option;
			$verbose = 1;
		}
		elsif (/^-T(.*)/){
			&process_option;
			$tail = 1;
		}
		elsif (/^-N(.*)/){
			&process_option;
			$line_num = 1;
		}
		elsif (/^-(I)(.*)/){
			$indent = ( $2 ? $2 : shift(@ARGV));
			if ($indent =~ /^-|[^\s]/){
				die "$0: $1 requires a value\n";
			}
		}
		else {
			print "Unrecognized option: $_\n";
			&usage;
		}
	}
}

#
# NAME: print_verbose_ary
#
# FUNCTION: prints the options and values in a local referenced array
#
# INPUT: ary_line (pointer to the local array subscript from routine backwards)
#	 ary (Indirect reference to the local array from the routine backwards)
#	 rev_log_ary (global array)
#	 log_cmd,log_lvl,log_ctx,log_sctx1,log_sctx2,log_dt (global variables)
#
# OUTPUT: ary_line (pointer to the local array subscript from routine backwards)
#	 ary (Indirect reference to the local array from the routine backwards)
#	 log_cmd,log_lvl,log_ctx,log_sctx1,log_sctx2,log_dt (global variables)
#

sub print_verbose_ary{
	local(*ary,*ary_line) = @_;
	local($line_num,$line);
	$log_ctx = "" if $log_ctx =~ Undefined;
	$log_sctx1 = "" if $log_sctx1 =~ Undefined;
	$log_sctx2 = "" if $log_sctx2 =~ Undefined;
	$ary_line++;
	$line_num = $#rev_log_ary - $_;
	$line = $Indent;
	$line .= "($line_num) $log_dt context=$log_ctx|";
	$line .= "$log_sctx1|$log_sctx2 $log_lvl\n";
	&trunc_line(*line);
	$ary[$ary_line] = $line;
}

#
# NAME: print_verbose
#
# FUNCTION: prints the options and values to the terminal
#
# INPUT: log_cmd,log_lvl,log_ctx,log_sctx1,log_sctx2,log_dt (global variables)
#
# OUTPUT: log_cmd,log_lvl,log_ctx,log_sctx1,log_sctx2,log_dt (global variables)
#

sub print_verbose{
	local($line);
	$log_ctx = "" if $log_ctx =~ Undefined;
	$log_sctx1 = "" if $log_sctx1 =~ Undefined;
	$log_sctx2 = "" if $log_sctx2 =~ Undefined;
	$line = "$Indent";
	if ($tail){
	$line .= "$log_dt context=$log_ctx|";
	}
	else{
		$line .= "($_) $log_dt context=$log_ctx|";
	}
	$line .= "$log_sctx1|$log_sctx2 $log_lvl\n";
	&trunc_line(*line);
	print "$line";
}

#
# NAME: comp_params
#
# FUNCTION: Compares the various optional values with a string from the array
#	    and if true, sets the process flag to true
#
# INPUT: line ( reference by value to an string element in a global array)
# 	 log_err,log_cmd,log_msg,log_lvl,log_ctx,log_sctx1,log_sctx2,log_dt
#	 level,context,subcontext1,subcontext2,command,process (global vars)
#
# OUTPUT: log_err,log_cmd,log_msg,log_lvl,log_ctx,log_sctx1,log_sctx2,log_dt
#	  level,context,subcontext1,subcontext2,command,process (global vars)
#

sub comp_params{
	local($line) = @_;
	local($dummy);

# dummy is used so that the rest of the variables do not get offset by one
# field behind as each non stderr line in the log file starts with a '%' and
# the perl split syntax picks anything upto the first '%' as the first field

	($dummy,$log_err, $log_cmd, $log_msg, $log_lvl, $log_ctx, $log_sctx1,
	$log_sctx2,$log_dt) = split(/\%/,$line);

	if (($level >= $log_lvl) && (($context eq "undefined") ||
	($context eq $log_ctx)) && (($command eq "undefined") ||
	($command eq $log_cmd)) && (($subcontext1 eq "undefined") ||
	($subcontext1 eq $log_sctx1)) && (($subcontext2 eq "undefined") ||
	($subcontext2 eq $log_sctx2))){
		$process = 1;
	}
	else{
		$process = 0;
	}
}

#
# NAME: search_pattern
#
# FUNCTION: Searches for the set pattern with the string from the array
#	    and if true, sets the process flag to true
#
# INPUT: line ( reference by value to an string element in a global array)
# 	 log_err,log_cmd,log_msg,log_lvl,log_ctx,log_sctx1,log_sctx2,log_dt
#	 search (global variables)
#
# OUTPUT: log_err,log_cmd,log_msg,log_lvl,log_ctx,log_sctx1,log_sctx2,log_dt
#	  search (global variables)
#

sub search_pattern{
	local($line) = @_;
	local($dummy);
	if (index($line,$search) >= 0){
		($dummy,$log_err, $log_cmd, $log_msg, $log_lvl, $log_ctx,
		 $log_sctx1, $log_sctx2,$log_dt) = split(/\%/,$line);
		$process = 1;
		$search_flag = 0;
		$next_search_line = $_ + 1;
	}
	else{
		$process = 0;
	}
}

