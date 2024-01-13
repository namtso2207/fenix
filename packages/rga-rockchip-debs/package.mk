PKG_NAME="rga-rockchip-debs"
PKG_VERSION="19b91fe688b9c1f6300757b2dffc04b5d8ef1ca8"
PKG_SHA256="ec2a8b38e636b76748910be633523fe257bb85ddaa960a023fe9b96c234e831c"
PKG_SOURCE_DIR="rga-rockchip-debs-${PKG_VERSION}*"
PKG_SITE="$GITHUB_URL/numbqq/rga-rockchip-debs"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_ARCH="arm64 armhf"
PKG_LICENSE="GPL"
PKG_SHORTDESC="Rockchip RGA deb packages"
PKG_SOURCE_NAME="rga-rockchip-debs-${PKG_VERSION}.tar.gz"
PKG_NEED_BUILD="NO"

make_target() {
	:
}

makeinstall_target() {
	mkdir -p $BUILD_DEBS/$VERSION/$NAMTSO_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/rga-rockchip-debs
	# Remove old debs
	rm -rf $BUILD_DEBS/$VERSION/$NAMTSO_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/rga-rockchip-debs/*
	[ -d ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/${NAMTSO_BOARD} ] && cp -r ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/${NAMTSO_BOARD}/* $BUILD_DEBS/$VERSION/$NAMTSO_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/rga-rockchip-debs || true
}

