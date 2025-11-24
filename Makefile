obj-m += panel-innolux-afj101-ba2131.o

KERN_BUILD_DIR = /lib/modules/$(shell uname -r)/build
PANEL_DIR := /lib/modules/$(shell uname -r)/kernel/drivers/gpu/drm/panel/
PWD := $(shell pwd)

all:
	$(MAKE) -C $(KERN_BUILD_DIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERN_BUILD_DIR) M=$(PWD) clean

install: all
	sudo cp panel-innolux-afj101-ba2131.ko $(PANEL_DIR)
	sudo depmod -a
	@echo "Panel module installed to $(PANEL_DIR)"

enable: install
	echo "panel-innolux-afj101-ba2131" | sudo tee -a /etc/modules
	@echo "Module added to /etc/modules for autoload"