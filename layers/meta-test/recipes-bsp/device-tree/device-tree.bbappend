CUSTOM_DTSI_FILE = "zynqmp-custom.dtsi"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://${CUSTOM_DTSI_FILE}"

# patch DTG with our custom overlay so it can be selected using YAML_DT_BOARD_FLAGS and MACHINEOVERRIDES in the machine conf
do_configure:prepend () {
    cp ${WORKDIR}/${CUSTOM_DTSI_FILE} ${S}/device_tree/data/kernel_dtsi/2022.2/BOARD
}
