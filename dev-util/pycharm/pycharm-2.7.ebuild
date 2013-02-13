EAPI=4
inherit eutils
DESCRIPTION="PyCharm"
HOMEPAGE="www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/pycharm-${PV}.tar.gz"
KEYWORDS="x86 amd64"
DEPEND="virtual/jdk"
RDEPEND="${DEPEND}"
SLOT="0"
src_install() {
	dodir /opt/${PN}
	
	insinto /opt/${PN}
	doins -r *
	fperms a+x /opt/${PN}/bin/pycharm.sh || die "fperms failed"
	dosym /opt/${PN}/bin/pycharm.sh /usr/bin/pycharm

	doicon "bin/pycharm.png"
	make_desktop_entry ${PN} "PyCharm" "/opt/${PN}/bin/pycharm.png"
}
pkg_postinst() {
    elog "Run /usr/bin/pycharm"
}
