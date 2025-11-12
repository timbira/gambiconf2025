# [GambiConf 2025](https://gambiconf.dev/)

## Introdução

* O que é uma extensão
  * Exemplos de extensões existentes
    * contrib, pg\_stat\_statements
    * postgis, etc
    * onde encontra
* [Pontos de extensibilidade do Postgres](https://www.postgresql.org/docs/current/extend.html)
* Tipos de Extensões
  * sem binário, apenas .sql
  * com binário e .sql
  * com binário e sem .sql

## [Bootstrap inicial](https://www.postgresql.org/docs/current/extend-extensions.html)

* Control File
* Make File
* Scripts SQL
* Testes de Regressão
* Instalação

## Exemplos

* [Exemplo SQL](https://www.postgresql.org/docs/current/extend-extensions.html#EXTEND-EXTENSIONS-EXAMPLE)
* [Exemplo C](https://github.com/michaelpq/pg_plugins)
* GUCs da extensão
* Atualização e versionamento

## Distribuição

* PGXN \- [https://pgxn.org/](https://pgxn.org/)
* Pgsty
  * [https://pigsty.io/about/extensibility/](https://pigsty.io/about/extensibility/)
  * [https://pgext.cloud/](https://pgext.cloud/)
  * [https://pigsty.io/ext/](https://pigsty.io/ext/)
* Trusted untrusted
* AWS permite extensções SQL

## Referências

* [https://www.pgedge.com/blog/introduction-to-postgres-extension-development](https://www.pgedge.com/blog/introduction-to-postgres-extension-development)
* [https://www.pgedge.com/blog/returning-multiple-rows-with-postgres-extensions](https://www.pgedge.com/blog/returning-multiple-rows-with-postgres-extensions)
