# append poky recipe

## rebuild steps:
# 1. bitbake  init-ifupdown -c cleanall
# 2. bitbake core-image-minimal

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_install:append () {
	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
}