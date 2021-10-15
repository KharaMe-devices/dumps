#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:4579f974287080e2f4f598a6375b64d0c52f806c; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:01de1cc58604eb595862c4f99aa44f56a86ecb00 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:4579f974287080e2f4f598a6375b64d0c52f806c && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
