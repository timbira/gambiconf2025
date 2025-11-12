EXTENSION = temperatura
DATA = temperatura--1.0.sql

REGRESS = temperatura
REGRESS_OPTS = --temp-instance=tmp_check --load-extension=$(EXTENSION)
PGXS := $(shell pg_config --pgxs)
include $(PGXS)
