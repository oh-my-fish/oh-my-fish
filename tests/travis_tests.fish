#!/usr/bin/env fish

set -l return_code 0

omf help
omf query PATH
omf install apt

exit $return_code
