PKG_NAME="rkaiq-rockchip-debs"
PKG_VERSION="69a9744e93d199ad18eb875889153869f2c039e7"
PKG_SHA256="10c0de3072a817cc3773849b34e8cb6fc7b28ad00202e318c8ab41565682cd8a"
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
