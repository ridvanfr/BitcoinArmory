package=mpfr
$(package)_version=3.1.2
$(package)_download_path=http://www.$(package).org/$(package)-current
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=176043ec07f55cd02e91ee3219db141d87807b322179388413a9523292d2ee85
$(package)_dependencies=gmp
$(package)_cc=$($($(1)_type)_CC)
$(package)_cxx=$($($(1)_type)_CXX)
$(package)_ar=$($($(1)_type)_AR)
$(package)_nm=$($($(1)_type)_NM)
$(package)_ranlib=$($($(1)_type)_RANLIB)

define $(package)_config_cmds
  $($(package)_autoconf) --with-gmp=$($(package)_prefix)
endef

define $(package)_build_cmds
  $(MAKE) && \
  $(MAKE) check
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef
