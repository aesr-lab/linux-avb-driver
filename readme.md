# AVB linux kernel module

Original AVB driver for BBB from https://github.com/NiklasWan/linux/tree/dev_avb_5.4-rt .
Documentation in https://niklaswan.github.io/GSoC-Overview/avb-alsa/ .

Redesigned for [Out-of-tree compilation](https://docs.kernel.org/kbuild/modules.html).

A word of warning: **At this point the module is in an experimental alpha stage!**
It will most probably not work as expected, especially it cannot be used in any production environment.

## Prerequisites

A build infrastructure and kernel headers are needed:
`sudo apt install build-essential linux-headers`

The module should (at least) work with kernel versions 5.0 to 6.1.

## Building

For compilation on the native system just run `make`.
Then install with ``sudo make install``.

Providing a specific kernel version (will be used to access `/lib/modules/$KVERSION`)
`make KVERSION=5.10.0-23-amd64`

## Installation

Once installed, the module can be loaded with
`sudo modprobe snd-avb`.

if an ethernet interface other than eth0 should be used, it can be specified on the command line:
`sudo modprobe snd-avb avb_ifname=enp7s0`

Removing the module is performed with
`sudo modprobe -r snd-avb`.

If this is not possible (`"modprobe: FATAL: Module snd_avb is in use"`), removal can be forced with
`sudo rmmod -f snd-avb`.

The kernel log with debug messages can be watched live with `sudo dmesg -w`.
