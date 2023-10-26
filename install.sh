#!/usr/bin/env bash
set -e

# Install VTune on Linux from the offline script. See
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler-download.html?operatingsystem=linux&distributions=offline.

script="l_oneapi_vtune_p_2023.2.0.49485_offline.sh"
url="https://registrationcenter-download.intel.com/akdlm/IRC_NAS/dfae6f23-6c90-4b9f-80e2-fa2a5037fe36/${script}"
sha384="43431383783e8a204f67f5f6719f74becb8e3c97862661b20b56c2c5d87c529d103a1493779565b4bbb3f372092c1b6b"

# Determine the directory of this script.
action_dir="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))"

# Set up the checksum provided at the intel.com site.
echo "${sha384} ${action_dir}/${script}" > $action_dir/CHECKSUM

# From here on out, we'll want to log each command for troubleshooting.
set -x

# Download, check, and install.
wget --no-verbose --directory-prefix=$action_dir $url
sha384sum --check $action_dir/CHECKSUM
sh $action_dir/l_oneapi_vtune_p_2023.2.0.49485_offline.sh -a --silent --eula accept
