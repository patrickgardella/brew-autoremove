# brew-autoremove
A script to remove Homebrew packages which are not used by other packages.

## Prerequisite
This script needs bash v4. By default MacOS has v3 in /usr/bin. If you get an error: `declare: -A: invalid option`, you need to install brew's version of bash: `brew install bash`, and rerun the command.

Based on the script written by [Connor Worley](https://medium.com/@connorbworley/cleaning-up-unused-homebrew-packages-147e32724646), but in Bash rather than Fish.
