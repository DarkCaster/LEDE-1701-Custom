# Slightly customized LEDE fork based on official LEDE 17.01 release

_See wnr2200ru branch if you are looking for changes to proper support of NETGEAR WNR2200 Russian and Chinese router revisions_

Customizations and patches applied to vanilla source code at "custom" branch:

## Procd changes

* Changes to "tmpfs on zram" feature - altered options for mkfs.ext4, added some mount options in order to improve performance a bit

## Kernel patches and config changes (only 4.4 branch for now)

Patches applied for all kernels, but kernel-config changes now performed only for ar71xx and x86 builds,
other configs are left intact for now. Use "make kernel_menuconfig" to manually enable features that require config updates (UKSM and BFS for now).

* Added UKSM feature (http://kerneldedup.org/projects/uksm/download).
  It helps when using router as simple server (especially when using debian inside LXC). Highly experimental, USE AT YOUR OWN RISK! May be removed in future.
* Added BFS feature (http://ck.kolivas.org/patches/bfs/). Does not help much for ar71xx boads, so it may be removed someday.
* Kernel config changes to enable proper LXC support, enabled FPU emulator for ar71xx boards to support running debian for mips inside LXC container.
* Default tcp congestion control is set to westwood+ (may be changed back to default someday).
