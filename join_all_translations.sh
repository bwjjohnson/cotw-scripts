#!/bin/bash
# Joins multiple translation app csv files for a single country together
# into a single file with key,en, and a column for each other language.
# This saves on space and processing needed.

# Usage: join_all_translations.sh [file ...]

# Convert from dos2unix, install from homebrew
dos2unix "$@"

# first ensure the last column has a value, even if empty.
# Do an inplace (no backup) replacement if you see a comma at the end of a line
sed -i '' -e 's/",$/",""/' "$@" 

# Do a join based on the key. It would be nice to remove duplicate en cols.
join -t, "$@"

