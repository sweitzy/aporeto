#!/usr/bin/env python3

# problem2: see https://github.com/aporeto-inc/quiz

'''
### Problem2: Python/Go sample:

Implement the following as described below in either go or python:

```bash
uniquify [--help|-h]
uniquify --file=<filename> --output=<output-filename> [—verbose]
This script/program should input a file with the name provided in the args called . This input file can contain millions of lines with duplicates.

The script/program should output a file with name provided in the args called with all duplicate lines removed.

A line is delimited by \n or \r or both
'''

import sys
import getopt

def usage():
    print('uniquify [--help|-h]')
    print('uniquify --input=<filename> --output=<output-filename> [—verbose]')

def main():

    verbose = False
    input = None
    output = None

    def do_verbose(msg):
        nonlocal verbose
        if verbose:
            print(msg)

    try:
        opts, args = getopt.getopt(sys.argv[1:], 'h', ['input=', 'output=', 'help', 'verbose'])
    except getopt.GetoptError as err:
        # print help information and exit:
        print(err)  # will print something like "option -a not recognized"
        usage()
        sys.exit(2)

    # TODO: try argparse instead

    for o, a in opts:
        # TODO: -verbose vs --verbose?
        if o == '--verbose':
            verbose = True
            do_verbose('Turn on verbose.')
        elif o in ('-h', '--help'):
            usage()
            sys.exit()
        elif o == '--input':
            input = a 
            do_verbose('Input ' + a)
        elif o == '--output':
            output = a 
            do_verbose('Output ' + a)
        else:
            assert False, 'unhandled option'

    if len(args) > 0:
        print('Unwanted args', args)
        usage()
        sys.exit(2)

    if input is None:
        print('Missing --input')
        usage()
        sys.exit(2)

    # empty dictionary of lines we have seen so far
    seen = {}
        
    try:
        with open(input) as f:
            for line in f:
                # if line not read already, print line and mark as seen
                if not line in seen:
                    print(line, end='')
                    seen[line] = 1
    except OSError as err:
        print('OS error: {0}'.format(err))        

# I think the above code is clearer (wrapping try around with), instead
# of the code below (make try very very specific around only open).

#    try:
#        f = open(input);
#    except OSError as err:
#        print('OS error: {0}'.format(err))        
#    else:
#        for line in f:
#            # if line not read already, print line and mark as seen
#            if not line in seen:
#                print(line, end='')
#                seen[line] = 1
#        f.close()

if __name__ == '__main__':
    main()
