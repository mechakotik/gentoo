# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3_11 python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Python Data Validation for Humans"
HOMEPAGE="
	https://github.com/python-validators/validators/
	https://pypi.org/project/validators/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# requires eth-hash
	tests/crypto_addresses/test_eth_address.py
)
