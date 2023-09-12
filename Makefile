
# if KERNELRELEASE is defined, we've been invoked from the
# kernel build system and can use its language.
ifneq (${KERNELRELEASE},)

snd-avb-objs := avb_util.o msrp.o avdecc.o avtp.o avb.o
obj-$(CONFIG_SND_AVB) += snd-avb.o

else
# out-of-tree compilation

# define variables if not already set
KVERSION ?= $(shell uname -r)
KTREE ?= /lib/modules/$(KVERSION)/build
MODINSTALL ?= /lib/modules/$(KVERSION)/extra

all:
	make -C $(KTREE) M=$(PWD) modules

clean:
	make -C $(KTREE) M=$(PWD) clean

install:
	mkdir -p $(MODINSTALL)
	cp snd-avb.ko $(MODINSTALL)
	depmod -a

endif
