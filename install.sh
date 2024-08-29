#!/usr/bin/env bash
set -e

# Install VTune on Linux from the offline script. See
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler-download.html?operatingsystem=linux&distributions=offline.

if [[ $# -ne 2 ]] ; then
    echo 'incorrect number of parameters; usage: install.sh <script name> <sha384>'
    exit 1
fi
script="$1"
sha384="$2"
url="https://registrationcenter-download.intel.com/akdlm/IRC_NAS/dfae6f23-6c90-4b9f-80e2-fa2a5037fe36/${script}"

# Determine the directory of this script.
action_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Set up the checksum provided at the intel.com site.
echo "${sha384} ${action_dir}/${script}" > $action_dir/CHECKSUM

# Download, check, and install.
if [ ! -f $action_dir/$script ]; then
  (set -x; wget --no-verbose --directory-prefix=$action_dir $url)
fi
(set -x; sha384sum --check $action_dir/CHECKSUM)
(set -x; sh $action_dir/$script -a --silent --eula accept)
