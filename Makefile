TEMPLATE    = Dockerfile.template

DOCKERFILES = Dockerfile.fedora-26-x86_64 \
              Dockerfile.centos-7-x86_64

all: $(DOCKERFILES)

$(DOCKERFILES): distro=$(subst Dockerfile.,,$@).yaml
$(DOCKERFILES): $(TEMPLATE)
	dg --container docker --template $(TEMPLATE) --distro $(distro) > $@
