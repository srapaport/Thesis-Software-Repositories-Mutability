#!/usr/bin/env zsh
# Copy all PDFs (recursive, case-insensitive extension) from Zotero storage into $1.

emulate -L zsh
setopt err_exit no_unset pipefail

readonly ZOTERO_STORAGE="/Users/raps/Zotero/storage"

if [[ $# -lt 1 || -z ${1:-} ]]; then
  print -u2 "usage: ${0:t} <destination-directory>"
  exit 1
fi

typeset -r dest=${1:a}
if [[ ! -d $ZOTERO_STORAGE ]]; then
  print -u2 "error: source directory not found: $ZOTERO_STORAGE"
  exit 1
fi

mkdir -p -- "$dest"

integer count=0
while IFS= read -r -d '' f; do
  cp -- "$f" "$dest/"
  (( ++count ))
done < <(find "$ZOTERO_STORAGE" -type f \( -iname '*.pdf' \) -print0)

print "copied $count PDF(s) to $dest"
