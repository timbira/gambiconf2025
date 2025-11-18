MODULES = hello_pg

REGRESS = hello_pg
REGRESS_OPTS = --temp-instance=tmp_check

EXTENSION = hello_pg
DATA = hello_pg--1.0.sql

PGXS := $(shell pg_config --pgxs)
include $(PGXS)
