#!/bin/bash
function git_clone() {
  git clone --depth 1 $1 $2 || true
 }
function git_sparse_clone() {
  branch="$1" rurl="$2" localdir="$3" && shift 3
  git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
  cd $localdir
  git sparse-checkout init --cone
  git sparse-checkout set $@
  mv -n $@ ../
  cd ..
  rm -rf $localdir
  }
function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}
#git clone --depth 1 https://github.com/kenzo78/my-packages && mvdir my-packages
#git clone --depth 1 https://github.com/kiddin9/luci-app-dnsfilter
#git clone --depth 1 https://github.com/kiddin9/aria2
#git clone --depth 1 https://github.com/kiddin9/luci-app-baidupcs-web
#git clone --depth 1 https://github.com/kiddin9/qBittorrent-Enhanced-Edition
#git clone --depth 1 https://github.com/kiddin9/autoshare && mvdir autoshare
#git clone --depth 1 https://github.com/kiddin9/openwrt-openvpn && mvdir openwrt-openvpn
#git clone --depth 1 https://github.com/kiddin9/luci-app-xlnetacc
#git clone --depth 1 https://github.com/kiddin9/luci-app-wizard
git clone --depth 1 https://github.com/kenzok78/luci-app-adguardhome
git clone --depth 1 https://github.com/ZeaKyX/luci-app-speedtest-web
git clone --depth 1 https://github.com/ZeaKyX/speedtest-web
#git clone --depth 1 https://github.com/muink/luci-app-homeproxy
git clone --depth 1 https://github.com/ximiTech/luci-app-msd_lite
#git clone --depth 1 https://github.com/sbwml/luci-app-qbittorrent openwrt-qb && mv -n openwrt-qb/* ./ ; rm -rf openwrt-qb
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 passwall2 && mv -n passwall2/luci-app-passwall2 ./;rm -rf passwall2
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall passwall1 && mv -n passwall1/luci-app-passwall  ./; rm -rf passwall1
git clone --depth 1 https://github.com/immortalwrt/packages && mv -n packages/net/{vsftpd,transmission} ./ ; rm -rf packages
git clone --depth 1 https://github.com/immortalwrt/luci && mv -n luci/applications/{luci-app-vlmcsd,luci-app-transmission} ./ ; rm -rf luci
#git_sparse_clone master "https://github.com/immortalwrt/packages" "immpack" net/sub-web net/dnsproxy net/haproxy net/cdnspeedtest net/subconverter net/ngrokc net/oscam net/njitclient net/scutclient net/udp2raw \
#admin/btop libs/wxbase libs/rapidjson libs/libcron libs/quickjspp libs/toml11 libs/libtorrent-rasterbar \
#libs/libdouble-conversion libs/qt6base libs/cxxopts libs/jpcre2 libs/alac \
#utils/cpulimit devel/gn

#git_sparse_clone master "https://github.com/immortalwrt/immortalwrt" "immortal" package/network/utils/nftables \
#package/network/utils/fullconenat package/network/utils/fullconenat-nft \
#package/utils/mhz package/libs/libnftnl package/firmware/wireless-regdb

#sed -i '65,73d' adguardhome/Makefile
sed -i 's/PKG_SOURCE_DATE:=2/PKG_SOURCE_DATE:=3/' transmission-web-control/Makefile
find . -type f -name "update.sh" -exec rm -f {} \;
rm -rf adguardhome/patches
exit 0
