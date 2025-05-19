#!/bin/bash

# Manually specify which directories to process
roots=(2v0eTaJ5    8aVmENVL    BQbsQc3p    Ewdd0S2y    hovL5QwV    KrfgLSR6    NjRUdQm9    -q0JBnQD    sv9glhK-    vyWVqHn5QF  y-qPSFTv9m \
2vhzQ1t3    8c_hCqSaR2  bRgTaBG7    EWnMKr2a    HTQaWutn    KSCFPci7    nky-bYGY    q0RmE-GZ    SWT0OKYOwK  vZDUDUii    yXZFMWmA \
2w21KV6ckm  8FRYLJJn    bSZ8yrs5    F1Skyh5h    hTVKuTdx    KulBN23mnk  nlhvszavbA  Q6mN43lD    swvDtOfV    VZTsPQCtxK  YYrA1tjB4i \
2w2fS-yluY  8HG3mEVK    BunvWvh9    F4ma5afn    HUSCRwFAXS  kuQiQhLd    nOG72009    q8GzR2bQ    t2vMdwyv    w0F8K9Uc    YYWjYEbf \
34pZqivK    8L4f2khJ    _bWc8eyo    F6QcJM6t_E  hWhboo3F    kv24rzg7    NOmu0MoJ    qaRU5of7    t3edtc1jQJ  w2p3HOPz    yZbH0Omg \
37w__dnX    8La5MBsFtN  bY3FBoaUx3  F898-Sq-    Hx4NI4Lj    kvN44JGTQD  NqaGRv8k    qdNbj2SA    t4k9fe80kS  w33q-8UP    Z2B22VcP \
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
