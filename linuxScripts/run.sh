qemu-system-aarch64 \
    -M virt -m 3G -cpu cortex-a72 -smp 2 \
    -drive file=flash0.img,format=raw,if=pflash \
    -drive file=flash1.img,format=raw,if=pflash \
    -drive id=hd0,media=disk,if=none,file=debian.qcow2 \
    -device virtio-scsi-pci -device scsi-hd,drive=hd0 \
    -nic user,model=virtio-net-pci,hostfwd=tcp::2222-:22,hostfwd=tcp::6900-:5900 \
    -nographic