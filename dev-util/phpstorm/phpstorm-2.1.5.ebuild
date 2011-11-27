inherit eutils
DESCRIPTION="PhpStorm"
HOMEPAGE="www.jetbrains.com/phpstorm/"
SRC_URI="http://download.jetbrains.com/webide/PhpStorm-${PV}.tar.gz"
KEYWORDS="x86 amd64"
DEPEND="dev-java/sun-jdk"
RDEPEND="${DEPEND}"
SLOT="0"
EAPI="2"
src_install() {	
	dodir /opt/${PN}
	
	cd PhpStorm*/
	insinto /opt/${PN}
	doins -r *
	#cp -r * "${D}/opt/${PN}/" || die "Install failed"
	
	#dobin /opt/${PN}/bin/PhpStorm.sh || die "Install failed"
	fperms a+x /opt/${PN}/bin/PhpStorm.sh || die "Chmod failed"
	dosym /opt/${PN}/bin/PhpStorm.sh /usr/bin/phpstorm

	doicon "/opt/${PN}}bin/webide.png"
	make_desktop_entry ${PN} "PHP Storm" "/opt/${PN}/bin/webide.png"
}
pkg_postinst() {
    elog "Run /usr/bin/phpstorm"
}
