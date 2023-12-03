# TivaWare-CMSIS-Pack
CMSIS Packs for TivaWare Peripherals, Graphics and Host Tools libraries.

The TivaWare-CMSIS-Pack project provides the files to generate an [Open-CMSIS-Pack](https://www.open-cmsis-pack.org/)-compatible pack for the popular [Tiva :tm: C
Series Platform of Microcontrollers](https://www.ti.com/lit/wp/spmy010/spmy010.pdf?ts=1701579173957&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FTM4C123GH6PM) by [Texas Instruments](https://www.ti.com)

## Description

With TivaWare-CMSIS-Pack, it is possible to create pack from the [TivaWare for C Series Software Development Kit](https://www.ti.com/tool/SW-TM4C)

The packs are targeted at TM4C ARM Cortex-M MCUs. The following components are available:
* Peripheral Driver Library.
* Graphics Library.
* Host Tools.
* USB Library.
* Sensor Library.
    
## Instructions
 
To generate the packs, the scripts in this repo rely on [Bash library for gen-pack scripts](https://github.com/Open-CMSIS-Pack/gen-pack).

1. See the above link and install the prerequisites to run this library.
2. SW-TM4C:
    * Download the following:
        * [SW-TM4C-2.2.0.295.exe](https://www.ti.com/tool/SW-TM4C)
    * TODO: other steps to setup tools for installing pack in local cache.
3. Clone the current repo.
4. Open a bash shell cd to the installation folder of the SW-TM4C-2.2.0.295 libraries.
5. Call the pack generation script `./gen_pack.sh`
    * The script downloads sources from appropriate repositories, creates the output folder and files, performs various checks against the xml schema and file list, and finally, creates the `.pack` archive.
    * Subsequent runs can be called without the downloading repositories using `--no-preproces` switch.
    * The `.pack` archive is available in the output folder: tivaware/output/TI.CMSIS-TivaWare.x.y.z.pack.
    
## Installation

Packs can also be installed from the available releases.

The packs are installed using [cpackget](https://github.com/Open-CMSIS-Pack/cpackget). Use one of the two following methods to installed the selected packs:

1. Download the packs from the available releases, then call:
   `cpackget add <path_to_downloaded_pack/TI.CMSIS-TivaWare.x.y.z.pack>`
2. Specify the path of the released pack when calling `cpackget`:
   `cpackget https://github.com/smartinou/TivaWare-CMSIS-Pack/releases/download/v0.1.0/TI.CMSIS-TivaWare.x.y.z.pack`

## Testing
TODO
