
# if KERNELRELEASE is defined, we've been invoked from the
# kernel build system and can use its language.
ifneq (${KERNELRELEASE},)

snd-avb-objs := avb_util.o msrp.o avdecc.o avtp.o avb.o
obj-$(CONFIG_SND_AVB) += snd-avb.o

else
# out-of-tree compilation

KVERSION := $(shell uname -r)

KTREE := /lib/modules/$(KVERSION)

all:
	make -C $(KTREE)/build M=$(PWD) modules

clean:
	make -C $(KTREE)/build M=$(PWD) clean

endif
