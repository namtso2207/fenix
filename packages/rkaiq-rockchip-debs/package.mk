PKG_NAME="rkaiq-rockchip-debs"
PKG_VERSION="e14e41dccf8f411e3b1f1e4528431b99f9015950"
PKG_SHA256="4140a97b1f1bd159782a7f32f2c61c4b80671ec5b714ef0cd9e792bc418261d7"
PKG_SOURCE_DIR="rkaiq-rockchip-debs-${PKG_VERSION}*"
PKG_SITE="$GITHUB_URL/numbqq/rkaiq-rockchip-debs"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SHORTDESC="rkaiq-rockchip-debs"
PKG_SOURCE_NAME="rkaiq-rockchip-debs-${PKG_VERSION}.tar.gz"
PKG_NEED_BUILD="NO"


make_target() {
	:
}

makeinstall_target() {
	mkdir -p $BUILD_DEBS/$VERSION/$NAMTSO_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/rkaiq-rockchip-debs
	# Remove old debs
	rm -rf $BUILD_DEBS/$VERSION/$NAMTSO_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/rkaiq-rockchip-debs/*
	cp ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/${NAMTSO_BOARD}/*.deb $BUILD_DEBS/$VERSION/$NAMTSO_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/rkaiq-rockchip-debs
}
