-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hello_pg" to load this file. \quit

CREATE FUNCTION hello_pg(name text DEFAULT 'World')
RETURNS text
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT PARALLEL SAFE;
