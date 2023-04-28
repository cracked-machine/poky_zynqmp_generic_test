

```
cd layers/poky/
TEMPLATECONF=../layers/meta-test/conf/templates/zynqmp_generic source oe-init-build-env ../../build
bitbake core-image-minimal
```