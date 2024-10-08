# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Interactive adduser script from Slackware"
HOMEPAGE="http://www.interlude.org.uk/unix/slackware/"
S="${WORKDIR}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"

RDEPEND="sys-apps/shadow"

src_install() {
	dosbin "${FILESDIR}"/${PV}/superadduser
	doman "${FILESDIR}"/superadduser.8
}
