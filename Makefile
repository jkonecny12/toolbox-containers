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

FEDORA_VERSION ?= $(shell awk -F '=' '/VERSION_ID/{print $$2}' /etc/os-release)
CBASE ?= "base"
CNAME ?= $(CBASE)
ARGS =

.PHONY: base
base:
	podman build $(ARGS) --pull=true --build-arg="fedora_version=$(FEDORA_VERSION)" -t base:$(FEDORA_VERSION) base/

.PHONY: emacs
emacs:
	podman build $(ARGS) --build-arg=fedora_version=$(FEDORA_VERSION) -t emacs:$(FEDORA_VERSION) emacs/

.PHONY: rhinstaller-devel
rhinstaller-devel:
	podman build $(ARGS) --build-arg=fedora_version=$(FEDORA_VERSION) -t rhinstaller-devel:$(FEDORA_VERSION) rhinstaller-devel/

.PHONY: packager
packager:
	podman build $(ARGS) --build-arg=fedora_version=$(FEDORA_VERSION) -t packager:$(FEDORA_VERSION) packager/

.PHONY: torrents
torrents:
	podman build $(ARGS) --build-arg=fedora_version=$(FEDORA_VERSION) -t torrents:$(FEDORA_VERSION) torrents/

.PHONY: create
create:
	toolbox create -i localhost/$(CBASE):$(FEDORA_VERSION) $(CNAME)

.PHONY: refresh
refresh:
	toolbox rm -f $(CNAME)
	$(MAKE) create
