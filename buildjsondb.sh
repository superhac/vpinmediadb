#!/bin/bash

data='{}'
baseUrl="https://github.com/superhac/vpinmediadb/raw/refs/heads/main"

for dir in */; do
  if [[ -d "$dir" ]]; then
    echo "Checking: $dir"
    dir_name="${dir%/}"  # remove trailing slash
    id="${dir%/}"

    one_k_dir="${dir}1k"
    four_k_dir="${dir}4k"
    wheel_file="${dir}wheel.png"

    j1kdata='"1k": {'
    if [[ -d "$one_k_dir" ]]; then
      [[ -f "$one_k_dir/bg.png" ]] && j1kdata+="\"bg\": \"$baseUrl/$id/1k/bg.png\","
      [[ -f "$one_k_dir/dmd.png" ]] && j1kdata+="\"dmd\": \"$baseUrl/$id/1k/dmd.png\","
      [[ -f "$one_k_dir/table.png" ]] && j1kdata+="\"table\": \"$baseUrl/$id/1k/table.png\","
      [[ -f "$one_k_dir/fss.png" ]] && j1kdata+="\"fss\": \"$baseUrl/$id/1k/fss.png\","
    fi
    j1kdata=$(sed 's/,$//' <<< "$j1kdata")
    j1kdata+='}'

    j4kdata='"4k": {'
    if [[ -d "$four_k_dir" ]]; then
      [[ -f "$four_k_dir/bg.png" ]] && j4kdata+="\"bg\": \"$baseUrl/$id/4k/bg.png\","
      [[ -f "$four_k_dir/dmd.png" ]] && j4kdata+="\"dmd\": \"$baseUrl/$id/4k/dmd.png\","
      [[ -f "$four_k_dir/table.png" ]] && j4kdata+="\"table\": \"$baseUrl/$id/4k/table.png\","
      [[ -f "$four_k_dir/fss.png" ]] && j4kdata+="\"fss\": \"$baseUrl/$id/4k/fss.png\","
    fi
    j4kdata=$(sed 's/,$//' <<< "$j4kdata")
    j4kdata+='}'

    wheel=""
    [[ -f "$wheel_file" ]] && wheel="\"wheel\": \"$baseUrl/$id/wheel.png\""

    # Construct object
    item_contents="$j1kdata, $j4kdata"
    [[ -n "$wheel" ]] && item_contents+=", $wheel"

    new_item="{ $item_contents }"

    # Insert into dict with key "$id"
    data=$(jq --arg id "$id" --argjson item "$new_item" '. + {($id): $item}' <<< "$data")
  fi
done

echo "$data" > vpinmdb.json
