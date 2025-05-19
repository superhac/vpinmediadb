#!/bin/bash

# Manually specify which directories to process
roots=(3X8yksSj    9KP78OzC    cm91AnGV    FRtFUPXpLv  IlZh5lUD    LJRH3fKk    oeE2OvEi    QPXHSssh    tV1GotAP    we5hKN8Y    ZxOdqKhi \
3y4iGBXr    9Paf7-CL    cmKJ5FS0    fss         _ImE1ptF    LKHoVA2C    OFlFlRLB    qQNywC8u    tzosvH4G    weHeB3SI    zZgQsK0m \
43ma3WQK    9Uv1Jljw    cnmPRV8d    FTxECos3    ImqfuWt4    lkSumsrF    og6Q_0IQ    qrLAyz0vLm  U2w88neD    wfWt9vwv    Zzvpb-uQ \
4IwkdORvo_  9vwGpiEb    CptTUpen    FUJaoyR0    inQBnjxk    LMK5EL-k    OgtWKSmg    QRX8qru1    U3s7AsZP    WiQqfEXRyE \
4Rkn0Owa    9W6UxaqY    CT-i1xk7    fXaQ33KC    -IQc03vLYC  lqnH4vzu    OHcji-5r    QUpU0r4n    u4jQeU5v    wisBSsn3Tc \
4TmYoWjO    9xdGOmiAgI  CUdkOxqh68  FxvSafVN    IqpOx3UCdj  LSq2khUCTL  oic4w_1ws7  QVRXwWbB    -U4tpnWh    wM2zN7_C~ \
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
