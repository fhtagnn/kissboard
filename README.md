# kissboard
Hardware and Firmware for the Kissboard keyboard concept by urac/wolf (AdNW user community).

## The idea
The physical key layout is inspired by a 2012 discussion on the german [neo user mailinglist](http://narkive.com/9UhJnT14) about custom keyboards using the [AdNW layout](http://www.adnw.de/). Specifically user urac proposed a minimalistic approach (KISS=keep it stupid simple) simply named [kissboard](https://docs.google.com/document/d/1TQ_BZYoZRW-ZFIaiolPAr9yNul6SBKypeA4ataw5Tz4/edit). Later, AdNW user wolf build a handwired custom board using a modified AdNW variant called PUQ discussed [here](https://groups.google.com/forum/#!topic/adnw/NdMOlERoFa4).

## PCB design
The hardware design was inspired by the [Mitosis hardware](https://github.com/reversebias/mitosis-hardware) by [reversebias](https://github.com/reversebias). Software implementation is a slightly modified copy of the [Mitosis Firmware](https://github.com/reversebias/mitosis) using [QMK](https://github.com/qmk/qmk_firmware/tree/master/keyboards/mitosis). The original Mitosis design is only available as an altium designer project. I used the freely available [KiCad](http://kicad-pcb.org/) and the converter [altium2kicad](https://github.com/thesourcerer8/altium2kicad) to first convert the layout to kicad, then create footprints of all important components and rebuild the design according to the kissboard/wolf switch layout.

## Firmware
The firmware is copied from the [mitosis project](https://github.com/reversebias/mitosis) and modified to reflect the pin connections used in this layout.

