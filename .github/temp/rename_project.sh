#!/usr/bin/env bash
while getopts a:d:n: flag
do
    # shellcheck disable=SC2220
    case "${flag}" in
        a) author=${OPTARG};;
        d) description=${OPTARG};;
        n) name=${OPTARG};;
    esac
done

TitleCaseConverter() {
    sed 's/.*/\L&/; s/[a-z]*/\u&/g' <<<"$1"
}

folder="${name,,}"
folder="${folder//-/_}"

title="${folder//_/ }"
title="$(TitleCaseConverter "$title")"

repo="$author/$name"

# Change backend pyproject.toml
sed -i "s/fastapi/$name/g" backend/pyproject.toml
sed -i "s/A FastAPI template/$description/g" backend/pyproject.toml # Remove description
sed -i "s/rmenai <rami.menai@outlook.com>/$author/g" backend/pyproject.toml # Replace authors

# Change LICENSE
sed -i "s/fastapi/$name/g" LICENSE

# Change SECURITY.md
sed -i "s/rmenai/$author/g" SECURITY.md

# Change .github/pull_request_template.md
sed -i "s|rmenai-blueprints/fastapi|$repo|g" .github/pull_request_template.md

# Change README.md
cp -f .github/temp/README.md README.md # Override file
sed -i "s/{title}/$title/g" README.md
sed -i "s/{description}/$description/g" README.md
sed -i "s|{repo}|$repo|g" README.md # Separator is |
