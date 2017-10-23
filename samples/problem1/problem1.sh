#!/bin/bash

# problem1: see https://github.com/aporeto-inc/quiz

# getopts is SO old
#   http://wiki.bash-hackers.org/howto/getopts_tutorial#usage() {

# Unfortunately Mac getopts/getopt does not appear to have long arguments, so start with short ones.
#    echo "Usge: $0 [--help|h]"
#    echo "Usge: $0 --create-file=<filename> [--no-prompt] [--verbose]"
#}
usage() {
    echo "Usge: $0 [-h]"
    echo "Usge: $0 -f=<filename> [-n] [-v]"
}

do_verbose() {
    if [ $verbose -eq 1 ]; then
	echo $1
    fi
}

prompt=1
verbose=0

while getopts "hf:nv" opt; do
    echo ARG $OPTARG IND $OPTIND ERR $OPTERR
    case $opt in
	h)
	    usage
	    exit 0
	    ;;
	f)
	    fname=$OPTARG
	    ;;
	n)
	    prompt=0
	    ;;
	v)
	    verbose=1
	    echo Turn on verbose.
	    ;;
	\?)
	    echo "Invalid option: -$OPTARG" >&2
	    usage
	    exit 1
	    ;;
    esac
done

echo $((OPTIND-1))
shift $((OPTIND-1))

# TODO: this is not right for "", "" "", etc.
if [ ! -z "$@" ]; then
    echo Unwanted extra parameters $@.
    usage
    exit 1
fi

# Thanks https://stackoverflow.com/questions/3005963/how-can-i-have-a-newline-in-a-string-in-sh
states="Alabama
Alaska
Arizona
Arkansas
California
Colorado
Connecticut
Delaware
Florida
Georgia
Hawaii
Idaho
Illinois
Indiana
Iowa
Kansas
Kentucky
Louisiana
Maine
Maryland
Massachusetts
Michigan
Minnesota
Mississippi
Missouri
Montana
Nebraska
Nevada
New Hampshire
New Jersey
New Mexico
New York
North Carolina
North Dakota
Ohio
Oklahoma
Oregon
Pennsylvania
Rhode Island
South Carolina
South Dakota
Tennessee
Texas
Utah
Vermont
Virginia
Washington
West Virginia
Wisconsin
Wyoming"

do_verbose "Check for missing parameters."
if [ -z "$fname" ]; then
    echo 'No filename specified'
    usage
    exit 1
fi

do_verbose "Check for file overwrite." 
while [ -f "$fname" -a $prompt -eq 1 ]; do
    echo -n 'File exists. Overwrite (y/n)? '
    read answer

    if [ "$answer" = "y" ]; then
	break
    fi
    if [ "$answer" = "n" ]; then
	exit 1
    fi
done

do_verbose "Remove old file silently."
rm -f $fname
# TODO: error check rm and printf?

do_verbose "Create new file."
printf '%s\n' "$states" > $fname

exit 0