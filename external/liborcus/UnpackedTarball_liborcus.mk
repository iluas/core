# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_UnpackedTarball_UnpackedTarball,liborcus))

$(eval $(call gb_UnpackedTarball_set_tarball,liborcus,$(ORCUS_TARBALL)))

$(eval $(call gb_UnpackedTarball_set_patchlevel,liborcus,1))

$(eval $(call gb_UnpackedTarball_update_autoconf_configs,liborcus))

# * external/liborcus/version.patch.0 covered by upstream
#   <https://gitlab.com/orcus/orcus/commit/0dfa88f2adca7887dbe44bdb7025985777c89673> "Remove unused
#   VERSION file":
$(eval $(call gb_UnpackedTarball_add_patches,liborcus,\
	external/liborcus/0001-workaround-a-linking-problem-on-windows.patch \
	external/liborcus/rpath.patch.0 \
	external/liborcus/gcc9.patch.0 \
	external/liborcus/version.patch.0 \
	external/liborcus/0001-Prevent-unsigned-integer-underflow.patch \
))

ifeq ($(OS),WNT)
$(eval $(call gb_UnpackedTarball_add_patches,liborcus,\
	external/liborcus/windows-constants-hack.patch \
))
endif

# vim: set noet sw=4 ts=4:
