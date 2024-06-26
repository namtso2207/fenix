PKG_NAME="mali-debs"
PKG_VERSION="2d7632a812c30775cf6b0e0f9b0b252eb9d30533"
PKG_SHA256="1dd4d89f20839319aeebd8ad11ed4d4583e5aa238006a95544ed7eba6f981697"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_VERSION}*"
PKG_SITE="$GITHUB_URL/numbqq/${PKG_NAME}"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SHORTDESC="Mali Libraries"
PKG_SOURCE_NAME="${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_NEED_BUILD="NO"


make_target() {
	:
}

makeinstall_target() {
	mkdir -p $BUILD_DEBS/$VERSION/$NAMTSO_BOARD/mali-debs
	# Remove old debs
	rm -rf $BUILD_DEBS/$VERSION/$NAMTSO_BOARD/mali-debs/*
	[ -d ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/${NAMTSO_BOARD} ] && cp -r ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/${NAMTSO_BOARD}/* $BUILD_DEBS/$VERSION/$NAMTSO_BOARD/mali-debs || true
}
