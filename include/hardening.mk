#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

PKG_CHECK_FORMAT_SECURITY ?= 1
PKG_SSP ?= 1
PKG_FORTIFY_SOURCE ?= 1
PKG_RELRO ?= 1

ifdef CONFIG_PKG_CHECK_FORMAT_SECURITY
  ifeq ($(strip $(PKG_CHECK_FORMAT_SECURITY)),1)
    TARGET_CFLAGS += -Wformat -Werror=format-security
  endif
endif
ifdef CONFIG_PKG_CC_STACKPROTECTOR_REGULAR
  ifeq ($(strip $(PKG_SSP)),1)
    TARGET_CFLAGS += -fstack-protector
  endif
endif
ifdef CONFIG_PKG_CC_STACKPROTECTOR_STRONG
  ifeq ($(strip $(PKG_SSP)),1)
    TARGET_CFLAGS += -fstack-protector-strong
  endif
endif
ifdef CONFIG_PKG_FORTIFY_SOURCE_1
  ifeq ($(strip $(PKG_FORTIFY_SOURCE)),1)
    TARGET_CFLAGS += -D_FORTIFY_SOURCE=1
  endif
endif
ifdef CONFIG_PKG_FORTIFY_SOURCE_2
  ifeq ($(strip $(PKG_FORTIFY_SOURCE)),1)
    TARGET_CFLAGS += -D_FORTIFY_SOURCE=2
  endif
endif
ifdef CONFIG_PKG_RELRO_PARTIAL
  ifeq ($(strip $(PKG_RELRO)),1)
    TARGET_CFLAGS += -Wl,-z,relro
    TARGET_LDFLAGS += -zrelro
  endif
endif
ifdef CONFIG_PKG_RELRO_FULL
  ifeq ($(strip $(PKG_RELRO)),1)
    TARGET_CFLAGS += -Wl,-z,now -Wl,-z,relro
    TARGET_LDFLAGS += -znow -zrelro
  endif
endif
ifdef CONFIG_PKG_LOOSEN_OPTS
  ifdef CONFIG_GCC_USE_VERSION_6
    TARGET_CFLAGS += -Wno-error=all -Wno-error=deprecated -Wno-error=misleading-indentation -Wno-narrowing
    TARGET_CXXFLAGS += -Wno-error=all -Wno-error=deprecated -Wno-error=misleading-indentation -Wno-narrowing -fpermissive
  endif
  ifdef CONFIG_GCC_USE_VERSION_7
    TARGET_CFLAGS += -Wno-error=all -Wno-error=memset-elt-size -Wno-error=deprecated -Wno-error=format-truncation -Wno-error=pointer-compare -Wno-error=misleading-indentation -Wno-narrowing -Wno-implicit-fallthrough -Wno-error=int-in-bool-context -Wno-error=format-overflow
    TARGET_CXXFLAGS += -Wno-error=all -Wno-error=memset-elt-size -Wno-error=deprecated -Wno-error=format-truncation -Wno-error=pointer-compare -Wno-error=misleading-indentation -Wno-narrowing -Wno-implicit-fallthrough -Wno-error=int-in-bool-context -Wno-error=format-overflow -fpermissive
  endif
endif
