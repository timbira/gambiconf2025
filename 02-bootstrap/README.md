# 1. Bootstrap

## 1.1. Como compilar e instalar?
```bash
$ cd hello_pg
$ make 
$ make install
/usr/bin/mkdir -p '/data/fabrizio/home/fabrizio/pgsql/REL_18_STABLE/share/extension'
/usr/bin/mkdir -p '/data/fabrizio/home/fabrizio/pgsql/REL_18_STABLE/share/extension'
/usr/bin/install -c -m 644 .//hello_pg.control '/data/fabrizio/home/fabrizio/pgsql/REL_18_STABLE/share/extension/'
/usr/bin/install -c -m 644 .//hello_pg--1.0.sql  '/data/fabrizio/home/fabrizio/pgsql/REL_18_STABLE/share/extension/'
```

## 1.2. Verificar se a extensão foi realmente instalada
```bash
$ ls -al /data/fabrizio/home/fabrizio/pgsql/REL_18_STABLE/share/extension/hello_pg*
-rw-r--r-- 1 fabrizio fabrizio 136 nov 12 17:12 /data/fabrizio/home/fabrizio/pgsql/REL_18_STABLE/share/extension/hello_pg--1.0.sql
-rw-r--r-- 1 fabrizio fabrizio  87 nov 12 17:12 /data/fabrizio/home/fabrizio/pgsql/REL_18_STABLE/share/extension/hello_pg.control
```

## 1.3. Executar testes de regressão
```bash
$ make installcheck
echo "# +++ regress install-check in  +++" && /data/fabrizio/home/fabrizio/pgsql/REL_18_STABLE/lib/pgxs/src/makefiles/../../src/test/regress/pg_regress --inputdir=./ --bindir='/data/fabrizio/home/fabrizio/pgsql/REL_18_STABLE/bin'    --temp-instance=tmp_check --load-extension=hello_pg --dbname=contrib_regression hello_pg
# +++ regress install-check in  +++
# initializing database system by running initdb
# using temp instance on port 65312 with PID 966362
ok 1         - hello_pg                                    7 ms
1..1
# All 1 tests passed.
```

