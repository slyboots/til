#! /usr/local/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "No title provided";
else
    if [[ ! -d _posts ]]; then
        mkdir _posts;
    fi

    title="$1";
    postdate=$(date +%Y-%m-%d);
    postname=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/\s/-/g');
    postfilename="${postdate}-${postname}.md";

    posttitle=$(echo "$title" | sed 's/.*/\L&/; s/[a-z]*/\u&/g');
    posttemplate="---\nlayout: post\ntitle: \"${posttitle}\"\n---\n\n# {{date}}\n\n__IL:__\n";

    echo -e "${posttemplate}" > "_posts/$postfilename";

    vim "_posts/$postfilename";

fi
