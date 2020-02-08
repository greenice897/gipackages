#
# Copyright (C) 2016-2018 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=default-settings
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/default-settings
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=LuCI support for default-settings
  PKGARCH:=all
#  DEPENDS:=+@LUCI_LANG_zh-cn +nginx +php7 +php7-fpm +php7-mod-curl +php7-mod-gd +php7-mod-iconv +php7-mod-json +php7-mod-mbstring +php7-mod-opcache +php7-mod-session +php7-mod-zip
#  DEPENDS:=+@LUCI_LANG_zh-cn lxc kmod-ikconfig lxc-attach lxc-auto lxc-autostart lxc-cgroup lxc-checkconfig lxc-common lxc-config lxc-configs lxc-console lxc-copy lxc-create lxc-destroy lxc-device lxc-execute lxc-freeze lxc-hooks lxc-info lxc-init lxc-ls lxc-lua lxc-monitor lxc-monitord lxc-snapshot lxc-start lxc-stop lxc-templates lxc-top lxc-unfreeze lxc-unprivileged lxc-unshare lxc-user-nic lxc-usernsexec lxc-wait liblxc luci-app-lxc rpcd-mod-lxc htop debootstrap bash lscpu gnupg fuse-utils kmod-fuse kmod-veth kmod-macvlan kmod-tulip
  DEPENDS:=+@LUCI_LANG_zh-cn
endef

define Package/default-settings/description
	This is router default settings Support Packages.
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/i18n/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/default-settings/install
#	$(INSTALL_DIR) $(1)/etc/nginx
#	$(INSTALL_BIN) ./files/phprpm.conf $(1)/etc/nginx/phprpm.conf
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(INSTALL_BIN) ./files/z-default-settings $(1)/etc/uci-defaults/99-default-settings
endef

$(eval $(call BuildPackage,default-settings))
