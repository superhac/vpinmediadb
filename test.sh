#!/bin/bash

# Manually specify which directories to process
roots=(3CvHz8Fa    8lQ7CE3S    bzDWLumS    f9NtgKVh5c  h_ybvlm_VJ  _kvNlmSu    nQzXPTZz    qF9KP_Utsd  T6wvXEr2Ys  W3WukBcz    Z3YtSbZm \
3D6BOJo5    8ND2ag4u    bzVsEPQy    faayV02G    HZQ_ZOBS    k_w8Y3slND  nrzNYtRn    qfbl4Ee0    t9PIF9Dbby  w4hQA3ow    z9BMLCAY \
3fs1jYEg    8r34pIO8    C14QMndG    FDc21ZJEP9  i47o-Nvr    KWr7oeIX5n  Nsm3W_Um    QGU2JjnNzL  ta8-Js_-    W50eAKB_    ZDHIUb-iHE \
3LNcE1yH    8uhquNv2    c32o40R9    FfjzhB3z    I7mX65rZ    kYmyO8H4    ntPRAsXy    qioD1PKa    TbVtKubK    w5CFwu42    ZedkDwP1 \
3p3vul2I    8UJwyT9X    c36A48pe    fFQCNbNK    iaC_sSXn    kzDRMEOE    NU0YXld6    QIpFaSOa    Tc_1PRrM    W8KNgel5    ZHAM74SK \
3pfPL4cb    8V_gfrDnQt  c_93QxEShm  FG1MavGs    igyYYU09    l08huPSJ    nVa6weV6    QJbviO_eed  -TerOryN    W9BhmQ-h1D  ZknYnQZt \
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
