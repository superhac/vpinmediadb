#!/bin/bash

# Manually specify which directories to process
roots=(1IlVLynt    6uMLaic7    AtQZt7BR    EAufDz35    ha01U_Xi    jYKVMff2QW  mWXjww7y    pmYQ11-U    sfiWmEeN    vfXW5ICv    Y4N_tSEW \
-1uD97KYfI  70PfsUOl    AV8W-O2R    EC_7xF96    HB-50MQb    jZ9BEzitrV  my2RZ_v_    pQsqGpS1    sgXURrcx    vjVKOoTG    y6CSOGtIec \
27OdyImH    7-5X-Ixe    aWiinbr2    eGwKwPtQ    HBj7RE1v    K5rqbKEn    mzDAU-cMHs  -pqWL-Cv    _sH_iZxRdK  V-mtUQP0Rr  y6Uil3oaXW \
2dSK9HR4    76Q4a8MN    b31KZ92B    EhrfCpTZ    HD5MvCln    kcXn5YD9    n0QJLWPB    P_rCgU-U    sHyAt2jR    VMXOaXeb    yaOUA-FISD \
2HPDN_tT    7eRiA3gK    b3ADIOaj    EjsYroU0    HdjsHX37b6  Kdq669dP9G  n0ZY_Wow    pSDlPTfE    SlqKeeJ1    -VnzDCQs    yBYQPa0A \
2HTZbOMS    7fSqIbWL    B5zXPPzO    eKpfZo80    hEdiWO-k    KfDv1cCO    n30L--ex    P_SjStAqsa  sMBqx5fp    vqlwV0bd    yDI6t4PC \
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
