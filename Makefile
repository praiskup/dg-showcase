TEMPLATE    = Dockerfile.template

DOCKERFILES = Dockerfile.fedora-26-x86_64 \
              Dockerfile.centos-7-x86_64

all: $(DOCKERFILES)

DG_ARGS = --container docker --template $(TEMPLATE) --spec spec-default.yaml --spec spec-$(VERSION).yaml

VERSION = 9.6

Dockerfile.fedora-26-x86_64: $(TEMPLATE)
	$(DG) $(DG_ARGS) --distro fedora-26-x86_64.yaml > $@

Dockerfile.centos-7-x86_64: $(TEMPLATE)
	$(DG) $(DG_ARGS) --distro centos-7-x86_64.yaml --spec spec-centos.yaml > $@
