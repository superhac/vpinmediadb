#!/bin/bash

# Manually specify which directories to process
roots=(025ojqP4    5E063Ieu    a8L40CbIyS  DCyesFPl    GbFFStl0    jCico0Uk    M3O5JepS    ON5FmcPI    README.md   uoti2kZZ    WX9RToIR \
09UuYqGpuM  5lbYdmFV    A8tw0sgD    DEp2LBTL    gBqmn_cw    JcJtmz2q    M7FYR1GJ    OQ1VlYZ3    reWxddChj2  uOxcrYHe    WxQNGpTK \
0Ah_KBEH    5RaindsR7o  AAlUTuiM    DGfiHlXP    GdeXiKED    JEdkJ8f_    m876M5lC    oQwWzztd    RExBoops    UQ6dnKLa    wyXvARV1 \
0cWhfxKX    5RKcbqT2    ADqWSy1p    dhgyex0l    gevaj3sH    jeV03l4H3j  MBiAY_Tg    oswLU1El    RfFdm22ut3  UrLUrItP    wzw7CUUw \
0EV7UN88    5RybGX4Q    Ae2-SG1h    Dk2DbfIK    GGhNwUOqdl  JiztUaCF    _mbRxgJP    OuKHyFyE    RG8TZrvsgz  UsLxAHL3    X3Hcurxj \
0G1Sjgq2Qn  5ucOcBHm    aFC3atNn    Dl0GyuuP    GIAiwQnX    jjFeJ3bFcO  MBZPVX6p    OzCAwJE9    Rg-pW0Ks    utPtyR_5    x3xeg4Xt \
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
