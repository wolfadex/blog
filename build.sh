#!/bin/bash

rm -rf docs

elmstatic build

find docs -type f -name '*.html' | \
    xargs perl -i -p -e 's/<\/title>/<\/title><link rel="icon" href="\/img\/logo.svg" \/>/g;'