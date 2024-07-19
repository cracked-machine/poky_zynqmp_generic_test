include avnet_zub1cg.inc

# "custom_dts" bsp - patch Xilinx DTG with our custom board overlay so it can be selected using 
# YAML_DT_BOARD_FLAGS and MACHINEOVERRIDES in the machine conf. e.g. layers/meta-test/conf/machine/custom_dts.conf


BOARD_OVERLAY_DTSI:custom_dts = "board_overlay.dtsi"
MODIFY_BOOTARGS_DTSI:custom_dts = "modify_bootargs.dtsi"

FILESEXTRAPATHS:prepend:custom_dts := "${THISDIR}/files:"

SRC_URI:custom_dts += " \
    file://${BOARD_OVERLAY_DTSI} \
    file://${MODIFY_BOOTARGS_DTSI} \
"
do_configure:prepend:custom_dts () {
    cp ${WORKDIR}/${BOARD_OVERLAY_DTSI} ${S}/device_tree/data/kernel_dtsi/2022.2/BOARD
}
do_configure:append:custom_dts () {
    cp ${WORKDIR}/${MODIFY_BOOTARGS_DTSI} ${B}/device-tree/${MODIFY_BOOTARGS_DTSI}
    echo "/include/ \"${MODIFY_BOOTARGS_DTSI}\"" >> "${B}/device-tree/system-top.dts"
}
