/* temperatura--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION temperatura" to load this file. \quit


CREATE TYPE celsius AS (
    value numeric
);

CREATE TYPE fahrenheit AS (
    value numeric
);

CREATE FUNCTION celsius(value numeric) RETURNS celsius
AS $$ SELECT ROW(value)::celsius; $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION fahrenheit(value numeric) RETURNS fahrenheit
AS $$ SELECT ROW(value)::fahrenheit; $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION celsius(value integer) RETURNS celsius
AS $$ SELECT celsius(value::numeric); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION fahrenheit(value integer) RETURNS fahrenheit
AS $$ SELECT fahrenheit(value::numeric); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION celsius(f fahrenheit) RETURNS celsius
AS $$ SELECT ROW( (f.value - 32) * 5 / 9 )::celsius; $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION fahrenheit(c celsius) RETURNS fahrenheit
AS $$ SELECT ROW( (c.value * 9 / 5) + 32 )::fahrenheit; $$ LANGUAGE sql IMMUTABLE;

CREATE CAST (integer AS celsius) WITH FUNCTION celsius(integer) AS IMPLICIT;
CREATE CAST (integer AS fahrenheit) WITH FUNCTION fahrenheit(integer) AS IMPLICIT;

CREATE CAST (fahrenheit AS celsius) WITH FUNCTION celsius(fahrenheit) AS IMPLICIT;
CREATE CAST (celsius AS fahrenheit) WITH FUNCTION fahrenheit(celsius) AS IMPLICIT;

CREATE FUNCTION celsius_eq(a celsius, b celsius) RETURNS boolean
AS $$ SELECT a.value = b.value; $$ LANGUAGE sql IMMUTABLE;

CREATE OPERATOR =  (LEFTARG = celsius, RIGHTARG = celsius, PROCEDURE = celsius_eq, COMMUTATOR = '=', NEGATOR = '<>');

CREATE FUNCTION fahrenheit_eq(a fahrenheit, b fahrenheit) RETURNS boolean
AS $$ SELECT celsius_eq(celsius(a), celsius(b)); $$ LANGUAGE sql IMMUTABLE;

CREATE OPERATOR =  (LEFTARG = fahrenheit, RIGHTARG = fahrenheit, PROCEDURE = fahrenheit_eq);

CREATE FUNCTION celsius_fahrenheit_eq(a celsius, b fahrenheit) RETURNS boolean
AS $$ SELECT celsius_eq(a, celsius(b)); $$ LANGUAGE sql IMMUTABLE;

CREATE OPERATOR =  (LEFTARG = celsius, RIGHTARG = fahrenheit, PROCEDURE = celsius_fahrenheit_eq, COMMUTATOR = '=', NEGATOR = '<>');

CREATE FUNCTION fahrenheit_celsius_eq(a fahrenheit, b celsius) RETURNS boolean
AS $$ SELECT celsius_eq(celsius(a), b); $$ LANGUAGE sql IMMUTABLE;

CREATE OPERATOR =  (LEFTARG = fahrenheit, RIGHTARG = celsius, PROCEDURE = fahrenheit_celsius_eq, COMMUTATOR = '=', NEGATOR = '<>');
