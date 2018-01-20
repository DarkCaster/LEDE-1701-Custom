# Slightly customized LEDE fork based on official LEDE 17.01 release

Customizations and patches applied to vanilla source code at "custom" branch:

## NETGEAR WNR2200 board support

  * Added build profile for 16MiB-flash board version, suitable for Russian and (maybe) Chinese router revisions.

### _WARNING!_

_Do not try to flash 16MiB firmware to 8MiB board version - it will damage WiFi calibration data stored in ART system partition, and will cause permanent malfunction in WiFi function._
_See more info [here](https://wiki.openwrt.org/doc/howto/generic.backup)._

_You should create ART-partition backup ONLY from stock NETGEAR firmware._
_See more info [here](https://wiki.openwrt.org/toh/netgear/telnet.console)._
_Creating ART-partition backup with 8MiB OpenWRT(LEDE) firmware flashed on 16MiB board will result in broken backup because of incorrect flash-memory mapping stored in firmware._

## Procd changes

  * Changes to "tmpfs on zram" feature - altered options for mkfs.ext4, added some mount options in order to improve performance a bit

## Kernel patches and config changes (only 4.4 branch for now)

Patches applied for all kernels, but kernel-config changes now performed only for ar71xx and x86 builds,
other configs are left intact for now. Use "make kernel_menuconfig" to manually enable features that require config updates (UKSM and BFS for now).

  * Added [UKSM feature](http://kerneldedup.org/projects/uksm/download).
  It helps when using router as server, especially when running another OS (debian for mips, for example) inside LXC container.

  * Added [BFS feature](http://ck.kolivas.org/patches/bfs). Does not help much for ar71xx boads, so it may be removed in future.

  * Kernel config changes to enable proper LXC support, enabled FPU emulator for ar71xx boards to support running debian for mips inside LXC container.

  * Default tcp congestion control is set to westwood+ (may be changed back to default someday).
