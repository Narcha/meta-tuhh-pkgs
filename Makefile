pkgs = $(shell find -type f -name PKGBUILD -printf "%h\n")
srcinfos = $(pkgs:=/.SRCINFO)

%/.SRCINFO: %/PKGBUILD
	cd $(@D) && makepkg --printsrcinfo > .SRCINFO

all: $(srcinfos)

.PHONY: clean
clean:
	rm $(srcinfos)
