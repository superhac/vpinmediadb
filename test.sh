#!/bin/bash

# Manually specify which directories to process
roots=(3pQvVnu2kv  8XBz7E6n    cCV4A6uc    fGz4ZrUb    I_hPHP6Kta  L1hV72Qj    NwLtspOH    QKMDokrC    test.sh     w9KqTRJN    Zo1g9rC6 \
3rp82EhC    91XAmtrDdM  CdZWHtTg    fhehIu6i    iIiz13Wn    L8IoaAQU    O1-qbuxg    qO4BxG9a    T-J-s42u    W9nUt5Ok    ZO-uU3wl \
3UmjYNMXob  9ABPeTuZ    C_hjfS6C    fJqRDp4BzB  ijIciXgF    l8PhYmEL    o9uyN2zm    QocAwukf    _tKtV9Te    wasB0RRz    ZRr0EPnA \
3U_RONDg    9ADgKgQz    cJTNDux9    FkkA7R0w    IJ-RGGO8    LciGhwwD    OaEvSaiW    qoSWmS2e    tT-FJX5A    WC_n7c7q    ZrSKKrc4 \
3wd2iWjz    9cAcDFA8    ckemo8oL    fkWx6OFg    Ik0J3yZx    lg07-fz5    oA-XPy3V    qp3J9TyOkj  ttkui-FK    WCULEr5M    ZuXV_QDM \
3wWmd7Gt    9jmXW_kf    CKoyH1yh    FrfsSwGv    ILvMU6RB    liKT-fsT    OC08D_fq    QPVvqsAo    tuMGDY1n    wDfpPh6g    zvkjy1tK \
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
