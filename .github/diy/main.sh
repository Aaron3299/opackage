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
#git clone --depth 1 https://github.com/ximiTech/luci-app-msd_lite
#git clone --depth 1 https://github.com/ximiTech/msd_lite
#git clone --depth 1 https://github.com/immortalwrt/luci && mv -n luci/applications/{luci-app-msd_lite,luci-app-transmission} ./ ; rm -rf luci
#git clone --depth 1 https://github.com/immortalwrt/packages && mv -n packages/net/{msd_lite,transmission-web-control,transmission} ./ ; rm -rf packages
git clone --depth 1 https://github.com/kenzok8/openwrt-packages && mv -n openwrt-packages/{smartdns,luci-app-smartdns} ./opackage ; rm -rf openwrt-packages
find . -type f -name "update.sh" -exec rm -f {} \;
exit 0
