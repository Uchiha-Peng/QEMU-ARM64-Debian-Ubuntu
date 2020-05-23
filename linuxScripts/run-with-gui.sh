qemu-system-aarch64 \
    -M virt -m 3G -cpu cortex-a72 -smp 2 \
    -bios QEMU_EFI.fd \
    -drive id=hd0,media=disk,if=none,file=debian.qcow2 \
    -device virtio-scsi-pci -device scsi-hd,drive=hd0 \
    -nic user,model=virtio-net-pci,hostfwd=tcp::2222-:22,hostfwd=tcp::6900-:5900 \
    -device virtio-gpu-pci