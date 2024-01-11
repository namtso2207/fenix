PKG_NAME="u-boot-mainline"
PKG_VERSION="v2021.04"
PKG_SOURCE_DIR="u-boot-${PKG_VERSION#v}"
PKG_SOURCE_NAME="u-boot-${PKG_VERSION#v}.tar.gz"
PKG_SITE="https://github.com/u-boot/u-boot"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_SHA256="c51a62092c7c18c249febe31457f3c811d2d3296a9186d241ad23a2fb0a794f2"
PKG_SHORTDESC="u-boot: Universal Bootloader project"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_NEED_BUILD="YES"

make_target() {

	export PATH=$UBOOT_COMPILER_PATH:$PATH
	make distclean
	if [ "$VENDOR" == "Rockchip" ]; then
		cp -r $PKGS_DIR/$PKG_NAME/atf/$NAMTSO_BOARD/* $BUILD/$PKG_NAME-$PKG_VERSION
	fi
	make ${UBOOT_DEFCONFIG}
	make -j${NR_JOBS} CROSS_COMPILE="${CCACHE} ${UBOOT_COMPILER}"
	if [ "$VENDOR" == "Rockchip" ]; then
		make CROSS_COMPILE="${CCACHE} ${UBOOT_COMPILER}" u-boot.itb
	fi
}

post_make_target() {
	if [ "$VENDOR" == "Rockchip" ]; then
		if [[ $(type -t uboot_custom_postprocess) == function ]]; then
			:
		fi
	fi
}

makeinstall_target() {
	mkdir -p $BUILD_IMAGES/$PKG_NAME/$NAMTSO_BOARD
	rm -rf $BUILD_IMAGES/$PKG_NAME/$NAMTSO_BOARD/*

	cd $BUILD/$PKG_NAME-$PKG_VERSION

	if [ "$VENDOR" == "Rockchip" ]; then
		:
	fi
}
