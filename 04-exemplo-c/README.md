# Compilação (Debian/Ubuntu)

## Pré-requisitos

```bash
$ apt install -y \
    build-essential bison flex zlib1g-dev libreadline-dev libkrb5-dev libicu-dev libssl-dev
```

## Repositório PGDG (PostgreSQL Global Development Group)

```bash
$ apt install -y \
    postgresql-common ca-certificates
$ yes | /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
```

## Instalar headers to PostgreSQL

```bash
$ apt install -y postgresql-server-dev-18
```

## Referências
* https://apt.postgresql.org/
* https://yum.postgresql.org/

