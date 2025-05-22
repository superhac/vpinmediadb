data='[]'
#baseUrl="https://raw.githubusercontent.com/${{ github.repository }}/refs/heads/main/"

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
      if [[ -f "$one_k_dir/bg.png" ]]; then
        j1kdata+="\"bg\": \"$baseUrl/$id/1k/bg.png\","
      fi
      if [[ -f "$one_k_dir/dmd.png" ]]; then
         j1kdata+="\"dmd\": \"$baseUrl/$id/1k/dmd.png\","
      fi
      if [[ -f "$one_k_dir/table.png" ]]; then
         j1kdata+="\"table\": \"$baseUrl/$id/1k/table.png\","
      fi
      if [[ -f "$one_k_dir/fss.png" ]]; then
         j1kdata+="\"fss\": \"$baseUrl/$id/1k/fss.png\","
      fi

    fi
    j1kdata=$(sed 's/,$//' <<< "$j1kdata")
    j1kdata+='}'

    j4kdata='"4k": {'

    if [[ -d "$four_k_dir" ]]; then
      if [[ -f "$four_k_dir/bg.png" ]]; then
        j4kdata+="\"bg\": \"$baseUrl/$id/4k/bg.png\","
      fi
      if [[ -f "$four_k_dir/dmd.png" ]]; then
         j4kdata+="\"dmd\": \"$baseUrl/$id/4k/dmd.png\","
      fi
      if [[ -f "$four_k_dir/table.png" ]]; then
         j4kdata+="\"table\": \"$baseUrl/$id/4k/table.png\","
      fi
      if [[ -f "$four_k_dir/fss.png" ]]; then
         j4kdata+="\"fss\": \"$baseUrl/$id/4k/fss.png\","
      fi
    fi

    j4kdata=$(sed 's/,$//' <<< "$j4kdata")
    j4kdata+='}'

    # clear wheel
    wheel=""
    
    if [[ -f "$wheel_file" ]]; then
      wheel="\"wheel\": \"$baseUrl/$id/wheel.png\" "
    fi

  

    if [ -z "$wheel" ]; then
      new_item="{\"id\": \"$id\", $j1kdata, $j4kdata}"
      #echo $new_item
    else
      new_item="{\"id\": \"$id\", $j1kdata, $j4kdata, $wheel}"
      #echo $new_item
    fi
    
    data=$(jq --argjson new "$new_item" '. + [$new]' <<< "$data")

  fi
done

echo "$data" > vpinmdb.json
