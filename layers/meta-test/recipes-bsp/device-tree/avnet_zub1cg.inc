# our device tree modifications to zynqmp-generic
MAIN_DTS:avnet_zub1cg = "avnet_zub1cg.dtsi"

# make sure the dtsi is in the device-tree workdir
FILESEXTRAPATHS:prepend:avnet_zub1cg := "${THISDIR}/files:"
SRC_URI:avnet_zub1cg += " \
    file://${MAIN_DTS} \
"

# insert the dtsi into the DTG source tree before the precompiler runs on system-top.dts
do_configure:prepend:avnet_zub1cg () {
    cp ${WORKDIR}/${MAIN_DTS} ${S}/device_tree/data/kernel_dtsi/2022.2/BOARD
}

