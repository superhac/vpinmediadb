#!/bin/bash

# Manually specify which directories to process
roots=(4uBKmXik    9yq0aV2s    cUrUo1Y7dL  __fy1P9r    iucHeoQX    ltrFOhE0    oImbzGjd    -QXdrtsH    Ua8rVDhy    WMwkA7_p \
513wiTiu    9Z7eDRTt    cxLyF__T    G3ZMZ1xP    I-x9UDIa    lU4NSKWp    OiRcNWYu    QyCuESgu    UDU_G7ps    W_p2sxKM \
5289glkm    9zPDy2S2    CyKQ_G0B    G4BlaSXN    Iy9S5EqW    luHBfbwV    ojcmHOaZ    r3oBRyBq    UgwBnCbn    WpIwJrxkGU \
54aA6p1F    9zZxf3YK    d4FUrVlu    g4Cff3egdT  IyGpzUVN    lVlGWK9A    OlDR_xwk    R5b9h7ZsjZ  uhKq8GXx    Ws7aL7yM \
54GsPTry    A0113ktq    D6pSfkMH    _G572G2eBW  J7fNLt2j_R  LX-K2F9k    OMbYnBpl    r5DTwPZy    uiEUziXx    wTM04VLg \
5CCIdqR8    A6Rr9e12    D7db6H4M    G8o1Kyxq    J8jTknf2    LYD7vXqU    on3VViv5    r7QXacMQ    ujyIbSeh    Ww0njXJP \
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
