# AVB linux kernel module

Original AVB driver for BBB from https://github.com/NiklasWan/linux/tree/dev_avb_5.4-rt .
Documentation in https://niklaswan.github.io/GSoC-Overview/avb-alsa/ .

Redesigned for [Out-of-tree compilation](https://docs.kernel.org/kbuild/modules.html).

A word of warning: **At this point the module is in an experimental alpha stage!**
It will most probably not work as expected, especially it cannot be used in any production environment.

## Prerequisites

A build infrastructure and kernel headers are needed:
``sudo apt install build-essential linux-headers``

The module should work with kernel versions <= 6.1.

## Building

For compilation on the native system just run ``make``.
Then install with ``sudo make install``.

Providing a specific kernel version (will be used to access `/lib/modules/$KVERSION`)
``make KVERSION=5.10.0-23-amd64``

## Installation

Once installed, the module can be loaded with
``sudo modprobe snd-avb``.

