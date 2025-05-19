#!/bin/bash

# Manually specify which directories to process
roots=(2izbwpQR    7jN8q3noP6  BeZLx0uswb  EKW1u8qI    hgaAsEyx    kGBkVb-v    n5Cybri-    ptcOPvyW    s_qTTo6n    VrMnwhl6    YdN-rOSj \
2mDm9-K67v  7M01q3g8uw  -bG4P570    eKx4rktS    _HhiKRagIK  kKUo_nB9K6  N7eK8Ph-    PUGkSJ80    SrA6feLw    VSodl7ur    YfwtEdJm \
2OP1b0yoUV  7O0Ir6NU    bkbhaVNY    EM2muFci    -hk0ih1U    klXtdvkv    Na0QF2YG    Pwnbp9St    SrcagQN8    VSq_t7jP    Y-_IF4hA \
2qcWVEi9    7RLpkFAp    Bl366m1T    EoB4gz82    hM7A-E0Z    KNUbC64Q    nGt78HB-    -PYamwZP    sRKscm_Phy  vT78ph4O    -YIQhPef \
2rySSsJBBq  7yE7a51e    bMuvS7Qz    EoR-uZB74c  hMfM-Jpc    KPB534Xm0k  nJB_sFcW    pyhwSstJB6  _SuVoydb    VVMU7y7cmK  yKy2iXgI \
2SoiVN-O    863y4Ku2HZ  Bn-4s9AS    EROqFKB-ih  hOQOmjB_    KreAUI99    nJdxFVxv    pYUzDR_B_L  s-uWDUDM    vyhtZif09Z  YPTXiOJJ \
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
