
SUPPORTED_TCS = $(notdir $(wildcard toolchains/syno-*))
SUPPORTED_ARCHS = $(notdir $(subst -,/,$(SUPPORTED_TCS)))
SUPPORTED_SPKS = $(patsubst spk/%/Makefile,%,$(wildcard spk/*/Makefile))


all: $(SUPPORTED_SPKS)

clean: $(addsuffix -clean,$(SUPPORTED_SPKS)) 
clean: native-clean

dist-clean: clean
dist-clena: toolchain-clean

native-clean:
	@for native in $(dir $(wildcard native/*/Makefile)) ; \
	do \
	    (cd $${native} && $(MAKE) clean) ; \
	done

toolchain-clean:
	@for tc in $(dir $(wildcard toolchains/*/Makefile)) ; \
	do \
	    (cd $${tc} && $(MAKE) clean) ; \
	done

cross-clean:
	@for cross in $(dir $(wildcard cross/*/Makefile)) ; \
	do \
	    (cd $${cross} && $(MAKE) clean) ; \
	done

spk-clean:
	@for spk in $(dir $(wildcard spk/*/Makefile)) ; \
	do \
	    (cd $${spk} && $(MAKE) clean) ; \
	done

%: spk/%/Makefile
	cd $(dir $^) && env $(MAKE)

%-clean: spk/%/Makefile
	cd $(dir $^) && env $(MAKE) clean

prepare: downloads
	@for tc in $(dir $(wildcard toolchains/*/Makefile)) ; \
	do \
	    (cd $${tc} && $(MAKE)) ; \
	done

downloads:
	@for dl in $(dir $(wildcard cross/*/Makefile)) ; \
	do \
	    (cd $${dl} && $(MAKE) download) ; \
	done

natives:
	@for n in $(dir $(wildcard native/*/Makefile)) ; \
	do \
	    (cd $${n} && $(MAKE)) ; \
	done

.PHONY: toolchains kernel-modules
toolchains: $(addprefix toolchain-,$(SUPPORTED_ARCHS))
kernel-modules: $(addprefix kernel-,$(SUPPORTED_ARCHS))

toolchain-%:
	-@cd toolchains/syno-$*/ && MAKEFLAGS= $(MAKE)

kernel-%:
	-@cd kernel/syno-$*/ && MAKEFLAGS= $(MAKE)

setup: local.mk dsm43

local.mk:
	@echo "Creating local configuration \"local.mk\"..."
	@echo "PUBLISH_METHOD=REPO" > $@
	@echo "PUBLISH_REPO_URL=https://packages.synocommunity.com/" >> $@
	@echo "PUBLISH_REPO_KEY=" >> $@
	@echo "PUBLISH_FTP_URL=ftp://synocommunity.com/upload_spk" >> $@
	@echo "PUBLISH_FTP_USER=" >> $@
	@echo "PUBLISH_FTP_PASSWORD=" >> $@

dsm42:
	@echo "Using toolchains for DSM 4.2"
	@rm -f toolchains
	@ln -sf toolchains-4.2 toolchains
	@echo "Setting up kernels for DSM 4.2"
	@rm -f kernel
	@ln -sf kernel-4.2 kernel

dsm43:
	@echo "Setting up toolchains for DSM 4.3"
	@rm -f toolchains
	@ln -sf toolchains-4.3 toolchains
	@echo "Setting up kernels for DSM 4.3"
	@rm -f kernel
	@ln -sf kernel-4.3 kernel
