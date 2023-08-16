# AVB linux kernel module

Original AVB driver for BBB from https://github.com/NiklasWan/linux/tree/dev_avb_5.4-rt .
Documentation in https://niklaswan.github.io/GSoC-Overview/avb-alsa/ .

Redesigned for [Out-of-tree compilation](https://docs.kernel.org/kbuild/modules.html).

## Compilation

For compilation on the native system just run ``make``.

Providing a specific kernel version (will be used to access `/lib/modules/$KVERSION`)
``make KVERSION=5.10.0-23-amd64``
