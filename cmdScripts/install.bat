qemu-img create -f qcow2 debian.qcow2 15G

qemu-system-aarch64 ^
    -M virt -m 3G -cpu cortex-a72 -smp 2 ^
    -bios QEMU_EFI.fd ^
    -drive id=cdrom,media=cdrom,if=none,file=debian-10.4.0-arm64-xfce.iso ^
    -device virtio-scsi-device -device scsi-cd,drive=cdrom ^
    -drive id=hd0,media=disk,if=none,file=debian.qcow2 ^
    -device virtio-scsi-pci -device scsi-hd,drive=hd0 ^
    -nic user,model=virtio-net-pci,hostfwd=tcp::2222-:22,hostfwd=tcp::6900-:5900 ^
    -monitor stdio