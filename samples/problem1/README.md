### Problem1: Bash Shell Script sample:

Implement a script which has the following usage format:

```bash
./bash_example [--help|-h]
./bash_example --create-file=<filename> [--no-prompt] [--verbose]
```
  This script should create a file with the name provided in the args with <filename>. This file should contain all 50 states with one state per line. This should be done in following scenarios:
  * File <filename> does not exist or --no-prompt option is used
  * In case the file exists, this script should prompt the user:
  ```bash
    “File exists. Overwrite (y/n) ?”
  ```
    The script should process user input and either overwrite file or not.
    If the user input is not valid, i.e. neither ‘y’ nor ’n’, the script should just prompt the user again with the same prompt until a valid input is provided.

    If the --verbose option is set, the following messages should be printed in appropriate portions of code.

    ```bash
File removed
File created
File already exists
```
**Return Codes:**
 * In case of bad command line args, the help showing usage should be printed and returned with error (non zero code).
 * In all successful case return code should be 0

