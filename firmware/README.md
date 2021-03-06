# kissboard Keyboard Firmware
Firmware for Nordic MCUs used in the kissboard Keyboard that is a derivative of the [Mitosis concept](https://github.com/reversebias/mitosis) originally developed by [reversebias](https://github.com/reversebias)

This folder contains sources buildable with the Nordic SDK. To ease building under Windows a Dockerfile is included in the root directory of this repository. It already includes all the steps below including the modification of the SDK file. Usage is very simple if docker is installed. Open a console (Powershell) and type

```docker
docker run -it -v C:\PATH\kissboard\firmware:/work/kissboard/:rw fhtagnn/kissboard_firmware
```

PATH should point to your local copy of the repository. Then 

```
cd kissboard/kissboard-keyboard-basic/custom/armgcc/
make
```

to build the firmware for one of the halves (check config.h). The receiver firmware can be build accordingly.

## Install dependencies

Tested on Ubuntu 16.04.2, but should be able to find alternatives on all distros. 

```
sudo apt install openocd gcc-arm-none-eabi
```

## Download Nordic SDK

Nordic does not allow redistribution of their SDK or components, so download and extract from their site:

https://www.nordicsemi.com/eng/nordic/Products/nRF5-SDK/nRF5-SDK-v12-zip/54291

Firmware written and tested with version 11

```
unzip nRF5_SDK_11.0.0_89a8197.zip  -d nRF5_SDK_11
cd nRF5_SDK_11
```

## Toolchain set-up

A cofiguration file that came with the SDK needs to be changed. Assuming you installed gcc-arm with apt, the compiler root path needs to be changed in /components/toolchain/gcc/Makefile.posix, the line:
```
GNU_INSTALL_ROOT := /usr/local/gcc-arm-none-eabi-4_9-2015q1
```
Replaced with:
```
GNU_INSTALL_ROOT := /usr/
```

## Clone repository
Inside nRF5_SDK_11/
```
git clone https://github.com/fhtagnn/kissboard
```

## Install udev rules
```
sudo cp kissboard/firmware/49-stlinkv2.rules /etc/udev/rules.d/
```
Plug in, or replug in the programmer after this.

## OpenOCD server
The programming header on the side of the keyboard, from top to bottom:
```
SWCLK
SWDIO
GND
3.3V
```
It's best to remove the battery during long sessions of debugging, as charging non-rechargeable lithium batteries isn't recommended.

Launch a debugging session with:
```
openocd -f kissboard/firmware/nrf-stlinkv2.cfg
```
Should give you an output ending in:
```
Info : nrf51.cpu: hardware has 4 breakpoints, 2 watchpoints
```
Otherwise you likely have a loose or wrong wire.


## Manual programming
From the factory, these chips need to be erased:
```
echo reset halt | telnet localhost 4444
echo nrf51 mass_erase | telnet localhost 4444
```
From there, the precompiled binaries can be loaded:
```
echo reset halt | telnet localhost 4444
echo flash write_image `readlink -f precompiled-basic-left.hex` | telnet localhost 4444
echo reset | telnet localhost 4444
```

## Automatic make and programming scripts
To use the automatic build scripts:
```
cd kissboard/firmware/kissboard-keyboard-basic
./program.sh
```
An openocd session should be running in another terminal, as this script sends commands to it.



















