EXTENSION = hello_pg
DATA = hello_pg--1.0.sql
REGRESS = hello_pg
REGRESS_OPTS = --temp-instance=tmp_check --load-extension=$(EXTENSION)

PGXS := $(shell pg_config --pgxs)
include $(PGXS)

