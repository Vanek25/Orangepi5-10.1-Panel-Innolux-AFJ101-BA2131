
# 🖥️ Orange Pi 5 - 10.1" Panel-Innolux-AFJ101-BA2131 800x1280 Display Support

This repository contains device tree files, drivers, and documentation to enable support for 10.1-inch MIPI DSI displays on Orange Pi 5 single-board computers.

You could use the official Orange Pi 5 version 1.1.8 Ubuntu edition and follow the official documentation, but it lacks support for the Panthor GPU, which became a crucial reason for me to abandon this system image.
The choice fell on Armbian.


## 📋 Supported Hardware

- **Board Models:** Orange Pi 5
- **Display Type:** 10.1-inch MIPI DSI
- **Native Resolution:** 800x1280 pixels
- **Interface:** 2-lane MIPI DSI
- **Touch Support:** Capacitive touchscreen (if supported by display module)


## 📝 Tested Operating Systems

- ✅ **Armbian_25.8.2_Orangepi5_noble_vendor_6.1.115_gnome_desktop**

### Armbian archive .img link 
https://k-space.ee.armbian.com/archive/orangepi5/archive/Armbian_25.8.2_Orangepi5_noble_vendor_6.1.115_gnome_desktop.img.xz


### Armbian board website 
https://www.armbian.com/orangepi-5/


# Installation
### All file operations are performed directly on the device itself and in repository dir!

## 1. Flash the System Image
Write the following Armbian image to your storage device (SD/NVMe):
```
Armbian_25.8.2_Orangepi5_noble_vendor_6.1.115_gnome_desktop.img.xz
```

## 2. Build and Install the Display Driver Module
### 2.1 Build the driver module:
```
make
```
### 2.2 Install the driver module:
```
make install
```
### 2.3 Enable automatic loading of the module:
```
make enable
```

## 3. Build and Install the Device Tree Overlay
### 3.1 Compile the rockchip-rk3588-panel-innolux.dts file into a .dtbo overlay and place it in the overlays directory:
```
sudo dtc -@ -O dtb -o /boot/dtb/rockchip/overlay/rockchip-rk3588-panel-innolux.dtbo rockchip-rk3588-panel-innolux.dts
```
## 4. Enable the Overlay in Armbian Configuration
### 4.1 Edit the Armbian environment file:
```
sudo nano /boot/armbianEnv.txt 
```
### 4.2 Find the line:
```
overlays=panthor-gpu
```
### 4.3 Modify it to include the new overlay:
```
overlays=panthor-gpu panel-innolux
```
Save and exit: Ctrl + O, Ctrl + X

## 5. Reboot the System
