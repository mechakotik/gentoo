# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Free TrueType fonts based on Bitstream's Vera fonts with additional letters"
HOMEPAGE="https://sourceforge.net/projects/hunkyfonts/"
SRC_URI="https://downloads.sourceforge.net/hunkyfonts/${P}.tar.bz2"

LICENSE="BitstreamVera public-domain"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~loong ppc ~riscv ~s390 sparc x86"

DOCS="ChangeLog README"
FONT_S="${S}/TTF"
FONT_SUFFIX="ttf"
