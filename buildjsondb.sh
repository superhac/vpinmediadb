#!/bin/bash

data='{}'
baseUrl="https://github.com/superhac/vpinmediadb/raw/refs/heads/main"

# ----------------------------
# MD5 helpers
# ----------------------------
calc_md5() {
  local file="$1"
  [[ "$file" == -* ]] && file="./$file"

  if command -v md5sum >/dev/null 2>&1; then
    md5sum -- "$file" | awk '{print $1}'
  else
    md5 -q "$file"
  fi
}

calc_md5_string() {
  local input="$1"
  if command -v md5sum >/dev/null 2>&1; then
    printf '%s' "$input" | md5sum | awk '{print $1}'
  else
    printf '%s' "$input" | md5 -q
  fi
}

# ----------------------------
# Build resolution block safely
# ----------------------------
build_resolution_block() {
  local dir="$1"
  local id="$2"
  local res="$3"

  local res_path="${dir}${res}"
  local json='{}'

  [[ ! -d "$res_path" ]] && echo "$json" && return

  for file in bg.png dmd.png table.png fss.png table.mp4; do
    if [[ -f "$res_path/$file" ]]; then
      key="${file%.*}"
      [[ "$file" == "table.mp4" ]] && key="table_video"

      md5=$(calc_md5 "$res_path/$file")

      json=$(jq \
        --arg key "$key" \
        --arg url "$baseUrl/$id/$res/$file" \
        --arg md5 "$md5" \
        '. + {($key): $url, ($key + "_md5"): $md5}' <<< "$json")
    fi
  done

  echo "$json"
}

# ----------------------------
# Main loop
# ----------------------------
for dir in */; do
  [[ ! -d "$dir" ]] && continue

  echo "Checking: $dir"
  id="${dir%/}"

  item='{}'

  # 1k and 4k blocks
  for res in 1k 4k; do
    res_json=$(build_resolution_block "$dir" "$id" "$res")
    item=$(jq --arg res "$res" --argjson block "$res_json" \
      '. + {($res): $block}' <<< "$item")
  done

  # Top-level files
  for file in wheel.png cab.png flyer.png realdmd.png realdmd-color.png audio.mp3; do
    if [[ -f "${dir}${file}" ]]; then
      key="${file%.*}"
      [[ "$file" == "realdmd-color.png" ]] && key="realdmd_color"

      md5=$(calc_md5 "${dir}${file}")

      item=$(jq \
        --arg key "$key" \
        --arg url "$baseUrl/$id/$file" \
        --arg md5 "$md5" \
        '. + {($key): $url, ($key + "_md5"): $md5}' <<< "$item")
    fi
  done

  # Version hash
  version=$(calc_md5_string "$item")

  item=$(jq --arg version "$version" '. + {version: $version}' <<< "$item")

  # Insert into main dict
  data=$(jq --arg id "$id" --argjson item "$item" \
    '. + {($id): $item}' <<< "$data")

done

echo "$data" > vpinmdb.json
