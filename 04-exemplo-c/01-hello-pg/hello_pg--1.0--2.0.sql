-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hello_pg" to load this file. \quit

DROP FUNCTION hello_pg(name text);

CREATE FUNCTION hello_pg()
RETURNS text
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT PARALLEL SAFE;

CREATE FUNCTION hello_pg(name text)
RETURNS text
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT PARALLEL SAFE;
