#!/bin/bash -i
set -o history

unset DEPS MISSING_DEPS
DEPS=(pandoc lynx)

usage() {
    echo "Markdown preview script."
    echo "First and only argument needs to be a Markdown file."
    echo -e "\nUsage:\n$0 README.md"
}

deps_check() {
    for DEP in "${DEPS[@]}"; do
        hash "$DEP" 2>/dev/null || { MISSING_DEPS+=($DEP); }
    done
}

deps_report() {
    echo "Missing dependencies:"
    for DEP in "${MISSING_DEPS[@]}"; do
        printf "\t$DEP\n"
    done
    exit 1
}

deps_check
[[ "${#MISSING_DEPS}" -ne 0 ]] && deps_report

# only takes 1 arg
if [[ "$#" -ne 1 ]]; then
    usage; exit 1
fi

# not a file
if [[ ! -f "$1" ]]; then
    usage; exit 1
fi

# not a markdown file
if [[ ! "${1: -3}" == ".md" ]]; then
    usage; exit 1
fi

pandoc "$1" | lynx -stdin
