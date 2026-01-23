#!/bin/bash

data='{}'
baseUrl="https://github.com/superhac/vpinmediadb/raw/refs/heads/main"

# Compute MD5 hash in a portable way (md5sum on GNU, md5 -q on macOS)
calc_md5() {
  local file="$1"
  # Handle paths that start with '-' so hash tools don't treat them as options
  [[ "$file" == -* ]] && file="./$file"

  if command -v md5sum >/dev/null 2>&1; then
    md5sum -- "$file" | awk '{print $1}'
  else
    md5 -q "$file"
  fi
}

# MD5 for an arbitrary string (used to create a version hash)
calc_md5_string() {
  local data="$1"
  if command -v md5sum >/dev/null 2>&1; then
    printf '%s' "$data" | md5sum | awk '{print $1}'
  else
    printf '%s' "$data" | md5 -q
  fi
}

for dir in */; do
  if [[ -d "$dir" ]]; then
    echo "Checking: $dir"
    dir_name="${dir%/}"  # remove trailing slash
    id="${dir%/}"

    one_k_dir="${dir}1k"
    four_k_dir="${dir}4k"
    wheel_file="${dir}wheel.png"
    cab_file="${dir}cab.png"
    realdmd_file="${dir}realdmd.png"
    realdmd_color_file="${dir}realdmd-color.png"

    j1kdata='"1k": {'
    if [[ -d "$one_k_dir" ]]; then
      if [[ -f "$one_k_dir/bg.png" ]]; then
        bg_md5=$(calc_md5 "$one_k_dir/bg.png")
        j1kdata+="\"bg\": \"$baseUrl/$id/1k/bg.png\",\"bg_md5\": \"$bg_md5\"," 
      fi
      if [[ -f "$one_k_dir/dmd.png" ]]; then
        dmd_md5=$(calc_md5 "$one_k_dir/dmd.png")
        j1kdata+="\"dmd\": \"$baseUrl/$id/1k/dmd.png\",\"dmd_md5\": \"$dmd_md5\"," 
      fi
      if [[ -f "$one_k_dir/table.png" ]]; then
        table_md5=$(calc_md5 "$one_k_dir/table.png")
        j1kdata+="\"table\": \"$baseUrl/$id/1k/table.png\",\"table_md5\": \"$table_md5\"," 
      fi
      if [[ -f "$one_k_dir/fss.png" ]]; then
        fss_md5=$(calc_md5 "$one_k_dir/fss.png")
        j1kdata+="\"fss\": \"$baseUrl/$id/1k/fss.png\",\"fss_md5\": \"$fss_md5\"," 
      fi
    fi
    j1kdata=$(sed 's/,$//' <<< "$j1kdata")
    j1kdata+='}'

    j4kdata='"4k": {'
    if [[ -d "$four_k_dir" ]]; then
      if [[ -f "$four_k_dir/bg.png" ]]; then
        bg_md5=$(calc_md5 "$four_k_dir/bg.png")
        j4kdata+="\"bg\": \"$baseUrl/$id/4k/bg.png\",\"bg_md5\": \"$bg_md5\"," 
      fi
      if [[ -f "$four_k_dir/dmd.png" ]]; then
        dmd_md5=$(calc_md5 "$four_k_dir/dmd.png")
        j4kdata+="\"dmd\": \"$baseUrl/$id/4k/dmd.png\",\"dmd_md5\": \"$dmd_md5\"," 
      fi
      if [[ -f "$four_k_dir/table.png" ]]; then
        table_md5=$(calc_md5 "$four_k_dir/table.png")
        j4kdata+="\"table\": \"$baseUrl/$id/4k/table.png\",\"table_md5\": \"$table_md5\"," 
      fi
      if [[ -f "$four_k_dir/fss.png" ]]; then
        fss_md5=$(calc_md5 "$four_k_dir/fss.png")
        j4kdata+="\"fss\": \"$baseUrl/$id/4k/fss.png\",\"fss_md5\": \"$fss_md5\"," 
      fi
    fi
    j4kdata=$(sed 's/,$//' <<< "$j4kdata")
    j4kdata+='}'

    wheel=""
    if [[ -f "$wheel_file" ]]; then
      wheel_md5=$(calc_md5 "$wheel_file")
      wheel="\"wheel\": \"$baseUrl/$id/wheel.png\", \"wheel_md5\": \"$wheel_md5\""
    fi

    cab=""
    if [[ -f "$cab_file" ]]; then
      cab_md5=$(calc_md5 "$cab_file")
      cab="\"cab\": \"$baseUrl/$id/cab.png\", \"cab_md5\": \"$cab_md5\""
    fi

    realdmd=""
    if [[ -f "$realdmd_file" ]]; then
      realdmd_md5=$(calc_md5 "$realdmd_file")
      realdmd="\"realdmd\": \"$baseUrl/$id/realdmd.png\", \"realdmd_md5\": \"$realdmd_md5\""
    fi

    realdmd_color=""
    if [[ -f "$realdmd_color_file" ]]; then
      realdmd_color_md5=$(calc_md5 "$realdmd_color_file")
      realdmd_color="\"realdmd_color\": \"$baseUrl/$id/realdmd-color.png\", \"realdmd_color_md5\": \"$realdmd_color_md5\""
    fi

    # Construct object
    item_contents="$j1kdata, $j4kdata"
    [[ -n "$wheel" ]] && item_contents+=", $wheel"
    [[ -n "$cab" ]] && item_contents+=", $cab"
    [[ -n "$realdmd" ]] && item_contents+=", $realdmd"
    [[ -n "$realdmd_color" ]] && item_contents+=", $realdmd_color"

    # Version derived from the serialized item contents
    version=$(calc_md5_string "$item_contents")
    item_contents+=", \"version\": \"$version\""

    new_item="{ $item_contents }"

    # Insert into dict with key "$id"
    data=$(jq --arg id "$id" --argjson item "$new_item" '. + {($id): $item}' <<< "$data")
  fi
done

echo "$data" > vpinmdb.json
