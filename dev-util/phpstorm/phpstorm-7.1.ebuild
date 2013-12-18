EAPI="4"
inherit eutils
DESCRIPTION="PhpStorm"
HOMEPAGE="www.jetbrains.com/phpstorm/"
SRC_URI="http://download.jetbrains.com/webide/PhpStorm-${PV}.tar.gz"
KEYWORDS="x86 amd64"
DEPEND="virtual/jdk"
RDEPEND="${DEPEND}"
SLOT="0"
S=${WORKDIR}

src_install() {
	dodir /opt/${PN}

	cd PhpStorm*/
	insinto /opt/${PN}
	doins -r *

	fperms a+x /opt/${PN}/bin/phpstorm.sh || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "Chmod failed"
	dosym /opt/${PN}/bin/phpstorm.sh /usr/bin/phpstorm


	mv "bin/webide.png" "bin/${PN}.png"
	doicon "bin/${PN}.png"
	make_desktop_entry ${PN} "PHP Storm" "${PN}"
}
pkg_postinst() {
    elog "Run /usr/bin/phpstorm"
}
