#!/bin/bash

# Manually specify which directories to process
roots=(0WhzPOxh    6A2KHPqZc9  amqQVZGq    DX92rfG_    Gtb4Hm_Dtl  Js57ohKj    mP9LxJBn    pGBjFrni    RRLQ6Q5y    V04lxsG4    XtjREHQt \
0wPuijKc    6AZHBnE5    ao5nKmJqyF  DXehLyun    gukdr6MNkd  JSwSGVcS    M-QUMdFt    ph8N0n5J    RzBFXa0VXL  _v1ggs4v77  XuJjquBx \
119-vwDY    6BZdUegIIJ  arg9pmLd    D_Z9ka08    gXbXSM2U    JU4EAhCe    mtKGKnBh    PHa9hm6u    s1RGitS5    v4cVLjAg    XWds5wMU \
16d-A4m6    6cVPgZqS    ArugoPl6    DzsaK6qK    h1XTEBisOD  jvGmSlPi    mUdMpzs6    pifuL-Hw2L  S7wFYuhGkU  V9Fim4K7Y2  XXN9prwF \
18iwweY9    6HmAOp06    aT_GONvw    E6tdYAOs    H3ESXInA    jVK492fx    MudNn9NB    pIYCtQ5t    -SbeVjPA    vbXAkDbQ    xxxuKVp7 \
1gd5CaMv    6SkwhjIICS  atmZ8zPG    e7k79SG-    H9itrq1vOS  JWCC6GSx    _MUesyRr    PMy7n4X4vv  sElJa1Np    VeMYBDzY    XYh-gw4S \
)

for dir in "${roots[@]}"; do
  # Ensure directory exists
  [[ -d "$dir" ]] || continue

  if [[ -d "$dir/fss" ]]; then
    echo "Processing $dir..."

    # Find and move files from fss
    find "$dir/fss" -type f -print0 | while IFS= read -r -d '' file; do
      rel_path="${file#"$dir/fss/"}"
      target_dir="$dir/$(dirname "$rel_path")"
      mkdir -p -- "$target_dir"
      mv -- "$file" "$target_dir/"
    done

    # Remove empty fss folders
    find "$dir/fss" -depth -type d -empty -delete
  fi
done
