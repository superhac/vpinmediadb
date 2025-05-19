#!/bin/bash

# Manually specify which directories to process
roots=(0-GeiE03    5VCFzTKa    aGzQHF72    DNMOB_-C    gjAm6Euf    jJ-U4acSur  mcfh2SWU    P12wTlyY    RGY73iP3    UVJGVYQc    x9i_W1Ql \
0j2uPCod    -5yMpqSy    aHcYb_Nh    DoDyQd5m    gNyJvD-k    jkBmBJkNMB  mdlwEPRQ    P15WeTaO    R_kckysL    uVMHgVjNFE  Xa2MjDlJ \
0jCbA0Ttem  5yWuTRXf    Aifl54Zy    _dOxi60nms  gpFC99WH    jlbVAlAr    MI-3i6rm    _p1dYSBiWd  rKPS_hOdzx  UvueodZg    xmZJ6k9Y \
0JuaX_LC    628qJGb1    aJn6ED7N    dUE459HFU9  gQd6vbi7    Jln7EWLvVx  M_iewYMz    p3HP_P2H    RKSCOXhttJ  uy5U0pKS    xOOLTkXO \
0RdFWzVI    67VTyZYe    akYNyhNO    _DvTQf1O    gQRBUSML    jnhExmiN    MKZNH4Rl    pboaV4ZD    rmRgdvWw    uZVNFOc3    XPpvhsC3 \
0Vqc_lNc    68qla86d    AMCLtAQL    DWM9hcVE    GsTo4kGh    jpyrfVNTmc  MlhBWkgI    pfpSUvBN    RoHgIHwY6l  UzXkoGKR_o  XrQKC4kV~ \
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
