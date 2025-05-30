# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Merge a series of JSON documents"
HOMEPAGE="
	https://github.com/avian2/jsonmerge/
	https://pypi.org/project/jsonmerge/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/jsonschema[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest
