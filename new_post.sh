#! /usr/local/bin/bash

if [[ ! "$#" -gt 1 ]]; then
    echo "No title provided";
else
    if [[ ! -d _posts ]]; then
        mkdir _posts;
    fi
    # get title for post
    title="$1";

    # use date provided for post otherwise default to current date
    currentdate=$(date +%Y-%m-%d);
    postdate="${2:-$currentdate}";

    postname=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/\s/-/g');
    postfilename="${postdate}-${postname}.md";

    posttitle=$(echo "$title" | sed 's/.*/\L&/; s/[a-z]*/\u&/g');
    posttemplate="---\nlayout: post\ntitle: \"${posttitle}\"\nthings:\n\t-\n---\n\n";

    echo -e "${posttemplate}" > "_posts/$postfilename";

    vim "_posts/$postfilename";

fi
