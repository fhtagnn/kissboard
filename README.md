# kissboard
Hardware and Firmware for the Kissboard keyboard concept by urac/wolf (AdNW user community).

![Kissboard top view](https://github.com/fhtagnn/kissboard/blob/master/schematics/kissboard_top.png "PCB top view")![Kissboard bottom view](https://github.com/fhtagnn/kissboard/blob/master/schematics/kissboard_bottom.png "PCB bottom view")

[![PUQ Layout](https://github.com/fhtagnn/qmk_firmware/blob/kissboard/keyboards/kissboard/keymaps/puq/puq-layout.png "PUQ Layout overview")](http://www.keyboard-layout-editor.com/#/gists/677e3572594a5fb39421fa693f03da17)

Layout explanation
* Middle label: standard tap output
* Bottom Label: double tap output
* Top Label: hold modifier
* Corner labels: Layers

## The idea
The physical key layout is inspired by a 2012 discussion on the german [neo user mailinglist](http://narkive.com/9UhJnT14) about custom keyboards using the [AdNW layout](http://www.adnw.de/). Specifically user urac proposed a minimalistic approach (KISS=keep it stupid simple) simply named [kissboard](https://docs.google.com/document/d/1TQ_BZYoZRW-ZFIaiolPAr9yNul6SBKypeA4ataw5Tz4/edit). Later, AdNW user wolf build a handwired custom board using a modified AdNW variant called PUQ discussed [here](https://groups.google.com/forum/#!topic/adnw/NdMOlERoFa4).

## PCB design
The PCB design was inspired by the [Mitosis Project](https://imgur.com/a/mwTFj) and its [Mitosis hardware](https://github.com/reversebias/mitosis-hardware) created by [reversebias](https://github.com/reversebias). Software implementation is a slightly modified copy of the [Mitosis Firmware](https://github.com/reversebias/mitosis) using [QMK](https://github.com/qmk/qmk_firmware/tree/master/keyboards/mitosis). The original Mitosis design is only available as an altium designer project. I used the freely available [KiCad](http://kicad.org/) and the converter [altium2kicad](https://github.com/thesourcerer8/altium2kicad) to first convert the layout to kicad, then create footprints of all important components and rebuild the design according to the kissboard/wolf switch layout.

## Firmware
The [Kissboard firmware](https://github.com/fhtagnn/mitosis) is a fork of the [Original Mitosis firmware](https://github.com/reversebias/mitosis) modified to reflect the pin connections used in this layout. Also, I use a [QMK Fork](https://github.com/fhtagnn/qmk_firmware) to implement any changes in the layout.

## Build Log
[Incomplete build log](https://imgur.com/a/pN4dOZB "Imgur Album")

# How to build
## Hardware
Source materials using the information in the BOM folder. Wait...build! :D

## Software
QMK can be build via Docker (below windows call) or per QMK instructions

```docker run -e keymap=default -e keyboard=ergodox_ez --rm -v PATHtoQMK:/qmk:rw edasque/qmk_firmware```

Firmware can be build via Docker (below windows call) or using any arm-gcc build environment. Follow instructions in firmware folder.

```docker run -it -v PATHtoFIRMWARE:/work/kissboard/:rw fhtagnn/kissboard_firmware```
