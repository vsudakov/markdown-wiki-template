#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

# set to "true" to remove unused images from the file system:
declare -r TO_REMOVE_FROM_FS='true'

# iterate through all files from ".images" directory apart from this script itself:
while read file; do

    # check if the file is not referenced anywhere within HEAD and the staged changes:
    if ! git grep --cached --quiet --fixed-strings "${file}"; then

        # untrack the unused file from the git repository and stage this change for the commit:
        git rm --cached "${file}"

        if [[ "${TO_REMOVE_FROM_FS}" == 'true' ]]; then
            rm --force "${file}"
        fi

    fi

done <<EOF
$(git ls-files .images/ | grep -v "$(basename "$0")")
EOF
