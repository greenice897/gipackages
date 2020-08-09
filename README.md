# gipackages are some openwrt custom packages.
Add "https://github.com/greenice897/gipackages.git" to seed.conf.default.

then run:

./scripts/feeds update -a

./scripts/feeds install -a

Or 

run: "git clone https://github.com/greenice897/gipackages.git openwrt/package/greenice"

ETC..
