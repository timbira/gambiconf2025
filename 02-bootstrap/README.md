# 1. [Bootstrap inicial](https://www.postgresql.org/docs/current/extend-extensions.html)

Aqui encontramos o exemplo de uma extensão chamada `hello_pg`, que representa o mínimo necessário para criação de uma extensão. É puramente SQL e contém uma única função também chamada `hello_pg` para fins didáticos.

```bash
tree
.
├── expected
│   └── hello_pg.out
├── hello_pg--1.0.sql
├── hello_pg.control
├── Makefile
└── sql
    └── hello_pg.sql

2 directories, 5 files
```

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

