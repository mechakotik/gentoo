# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="MoarVM"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/${MY_PN}/${MY_PN}.git"
	inherit git-r3
	S="${WORKDIR}/${P}"
else
	SRC_URI="http://moarvm.org/releases/${MY_PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${PV}"
fi

DESCRIPTION="A 6model-based VM for NQP and Raku"
HOMEPAGE="http://moarvm.org"
LICENSE="Artistic-2"
SLOT="0"

IUSE="asan clang debug doc +jit optimize static-libs ubsan"

RDEPEND="dev-libs/libatomic_ops
	>=dev-libs/libuv-1.26:=
	dev-libs/libffi:=
	dev-libs/mimalloc"
DEPEND="${RDEPEND}
	clang? ( llvm-core/clang )
	dev-lang/perl"

DOCS=( CREDITS README.md )

# Tests are conducted via nqp
RESTRICT=test

src_configure() {
	MAKEOPTS+=" NOISY=1"
	use doc && DOCS+=( docs/* )
	local prefix="${EPREFIX}/usr"
	local libdir="${EPREFIX}/usr/$(get_libdir)"
	einfo "--prefix '${prefix}'"
	einfo "--libdir '${libdir}'"
	local myconfigargs=(
		"--prefix" "${prefix}"
		"--has-libuv"
		"--has-libatomic_ops"
		"--has-libffi"
		"--has-mimalloc"
		"--libdir" "${libdir}"
		"--compiler" "$(usex clang clang gcc)"
		"$(usex asan        --asan)"
		"$(usex debug       --debug            --no-debug)"
		"$(usex optimize    --optimize=        --no-optimize)"
		"$(usex static-libs --static)"
		"$(usex ubsan       --ubsan)"
	)

	perl Configure.pl "${myconfigargs[@]}" moarshared || die
}
