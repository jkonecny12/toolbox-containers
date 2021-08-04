# Base controlling tool to build my containers for Toolbox application.
#
# Copyright (C) 2021  Jiri Konecny <DragonLich'at'psmail.xyz>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FEDORA_VERSION ?= 34

.PHONY: base
base:
	podman build --build-arg="fedora_version=$(FEDORA_VERSION)" -t base:$(FEDORA_VERSION) base/

.PHONY: emacs
emacs:
	podman build -t emacs:$(FEDORA_VERSION) emacs/
