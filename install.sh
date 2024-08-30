#!/usr/bin/env bash
set -e

# Install VTune on Linux from the offline script. See
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler-download.html?operatingsystem=linux&distributions=offline.

if [[ $# -ne 2 ]] ; then
    echo 'incorrect number of parameters; usage: install.sh <url> <sha384>'
    exit 1
fi
url="$1"
sha384="$2"
script=$(basename $url)

# Determine the directory of this script.
action_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Set up the checksum provided at the intel.com site.
echo "${sha384} ${action_dir}/${script}" > $action_dir/CHECKSUM

# From here on out, we'll want to log each command for troubleshooting.
set -x

# Download, check, and install.
wget --no-verbose --directory-prefix=$action_dir $url
sha384sum --check $action_dir/CHECKSUM
sh $action_dir/$script -a --silent --eula accept
