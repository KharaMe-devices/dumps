#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:bcf178c91b7b1c3b8b542ef093e4fdf188e83b72; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:1153f42704d594d9c25c716546873ba543e9dbb7 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:bcf178c91b7b1c3b8b542ef093e4fdf188e83b72 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
