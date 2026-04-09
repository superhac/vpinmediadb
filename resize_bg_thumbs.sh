#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$WORKDIR"

OUTDIR="bg_thumbs"
BATCH_SIZE=200
PAUSE_AFTER_BATCH=1
NO_PAUSE=0

usage() {
  cat <<EOF
Usage: $(basename "$0") [options]

Options:
  -h, --help        Show this help message
  -n, --no-pause    Do not pause between batches
  -b, --batch N     Set batch size (default: 200)
  -y, --yes         Same as --no-pause

This script copies each <VPSID>/1k/bg.png into bg_thumbs/<VPSID>.png
and resizes it to 500x281. It pauses after each batch of images.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    -n|--no-pause|-y|--yes)
      NO_PAUSE=1
      shift
      ;;
    -b|--batch)
      if [[ $# -lt 2 ]]; then
        echo "Error: --batch requires a value." >&2
        exit 1
      fi
      BATCH_SIZE="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ "$NO_PAUSE" -eq 1 ]]; then
  PAUSE_AFTER_BATCH=0
fi

if ! command -v convert >/dev/null 2>&1; then
  if command -v magick >/dev/null 2>&1; then
    CONVERT_CMD=(magick convert)
  else
    echo "Error: ImageMagick convert or magick is required." >&2
    exit 1
  fi
else
  CONVERT_CMD=(convert)
fi

mkdir -p "$OUTDIR"

mapfile -t dirs < <(find . -maxdepth 1 -mindepth 1 -type d ! -name "bg_thumbs" ! -name ".git" | sort)

total=${#dirs[@]}
if [[ "$total" -eq 0 ]]; then
  echo "No VPSID directories found."
  exit 0
fi

printf "Found %s directories. Processing %s images in batches of %s.\n" "$total" "$total" "$BATCH_SIZE"

count=0
batch=1

for dirpath in "${dirs[@]}"; do
  dir="${dirpath#./}"
  src="$dir/1k/bg.png"
  dest="$OUTDIR/$dir.png"

  if [[ ! -f "$src" ]]; then
    printf "Skipping missing file: %s\n" "$src"
    continue
  fi

  printf "[%s/%s] %s -> %s\n" "$((count + 1))" "$total" "$src" "$dest"
  "${CONVERT_CMD[@]}" "$src" -resize 500x281! "$dest"

  count=$((count + 1))

  if [[ "$PAUSE_AFTER_BATCH" -eq 1 && $((count % BATCH_SIZE)) -eq 0 && "$count" -lt "$total" ]]; then
    echo
    if [[ -t 0 ]]; then
      read -r -p "Batch $batch complete ($count/$total). Press Enter to continue or Ctrl-C to abort..."
    else
      echo "Batch $batch complete ($count/$total). Running non-interactively, continuing automatically."
    fi
    echo
    batch=$((batch + 1))
  fi

done

echo "Done. Resized $count images into $OUTDIR/."
