/* temperatura--1.0--2.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION temperatura" to load this file. \quit

CREATE FUNCTION celsius_lt(a celsius, b celsius) RETURNS boolean
AS $$ SELECT a.value < b.value; $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION celsius_gt(a celsius, b celsius) RETURNS boolean
AS $$ SELECT a.value > b.value; $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION celsius_le(a celsius, b celsius) RETURNS boolean
AS $$ SELECT a.value <= b.value; $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION celsius_ge(a celsius, b celsius) RETURNS boolean
AS $$ SELECT a.value >= b.value; $$ LANGUAGE sql IMMUTABLE;

CREATE OPERATOR <  (LEFTARG = celsius, RIGHTARG = celsius, PROCEDURE = celsius_lt, COMMUTATOR = '>', NEGATOR = '>=');
CREATE OPERATOR >  (LEFTARG = celsius, RIGHTARG = celsius, PROCEDURE = celsius_gt, COMMUTATOR = '<', NEGATOR = '<=');
CREATE OPERATOR <= (LEFTARG = celsius, RIGHTARG = celsius, PROCEDURE = celsius_le, COMMUTATOR = '>=', NEGATOR = '>');
CREATE OPERATOR >= (LEFTARG = celsius, RIGHTARG = celsius, PROCEDURE = celsius_ge, COMMUTATOR = '<=', NEGATOR = '<');

CREATE FUNCTION fahrenheit_lt(a fahrenheit, b fahrenheit) RETURNS boolean
AS $$ SELECT celsius_lt(celsius(a), celsius(b)); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION fahrenheit_gt(a fahrenheit, b fahrenheit) RETURNS boolean
AS $$ SELECT celsius_gt(celsius(a), celsius(b)); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION fahrenheit_le(a fahrenheit, b fahrenheit) RETURNS boolean
AS $$ SELECT celsius_le(celsius(a), celsius(b)); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION fahrenheit_ge(a fahrenheit, b fahrenheit) RETURNS boolean
AS $$ SELECT celsius_ge(celsius(a), celsius(b)); $$ LANGUAGE sql IMMUTABLE;

CREATE OPERATOR <  (LEFTARG = fahrenheit, RIGHTARG = fahrenheit, PROCEDURE = fahrenheit_lt);
CREATE OPERATOR >  (LEFTARG = fahrenheit, RIGHTARG = fahrenheit, PROCEDURE = fahrenheit_gt);
CREATE OPERATOR <= (LEFTARG = fahrenheit, RIGHTARG = fahrenheit, PROCEDURE = fahrenheit_le);
CREATE OPERATOR >= (LEFTARG = fahrenheit, RIGHTARG = fahrenheit, PROCEDURE = fahrenheit_ge);

CREATE FUNCTION celsius_fahrenheit_lt(a celsius, b fahrenheit) RETURNS boolean
AS $$ SELECT celsius_lt(a, celsius(b)); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION celsius_fahrenheit_gt(a celsius, b fahrenheit) RETURNS boolean
AS $$ SELECT celsius_gt(a, celsius(b)); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION celsius_fahrenheit_le(a celsius, b fahrenheit) RETURNS boolean
AS $$ SELECT celsius_le(a, celsius(b)); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION celsius_fahrenheit_ge(a celsius, b fahrenheit) RETURNS boolean
AS $$ SELECT celsius_ge(a, celsius(b)); $$ LANGUAGE sql IMMUTABLE;

CREATE OPERATOR <  (LEFTARG = celsius, RIGHTARG = fahrenheit, PROCEDURE = celsius_fahrenheit_lt, COMMUTATOR = '>', NEGATOR = '>=');
CREATE OPERATOR >  (LEFTARG = celsius, RIGHTARG = fahrenheit, PROCEDURE = celsius_fahrenheit_gt, COMMUTATOR = '<', NEGATOR = '<=');
CREATE OPERATOR <= (LEFTARG = celsius, RIGHTARG = fahrenheit, PROCEDURE = celsius_fahrenheit_le, COMMUTATOR = '>=', NEGATOR = '>');
CREATE OPERATOR >= (LEFTARG = celsius, RIGHTARG = fahrenheit, PROCEDURE = celsius_fahrenheit_ge, COMMUTATOR = '<=', NEGATOR = '<');

CREATE FUNCTION fahrenheit_celsius_lt(a fahrenheit, b celsius) RETURNS boolean
AS $$ SELECT celsius_lt(celsius(a), b); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION fahrenheit_celsius_gt(a fahrenheit, b celsius) RETURNS boolean
AS $$ SELECT celsius_gt(celsius(a), b); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION fahrenheit_celsius_le(a fahrenheit, b celsius) RETURNS boolean
AS $$ SELECT celsius_le(celsius(a), b); $$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION fahrenheit_celsius_ge(a fahrenheit, b celsius) RETURNS boolean
AS $$ SELECT celsius_ge(celsius(a), b); $$ LANGUAGE sql IMMUTABLE;

CREATE OPERATOR <  (LEFTARG = fahrenheit, RIGHTARG = celsius, PROCEDURE = fahrenheit_celsius_lt, COMMUTATOR = '>', NEGATOR = '>=');
CREATE OPERATOR >  (LEFTARG = fahrenheit, RIGHTARG = celsius, PROCEDURE = fahrenheit_celsius_gt, COMMUTATOR = '<', NEGATOR = '<=');
CREATE OPERATOR <= (LEFTARG = fahrenheit, RIGHTARG = celsius, PROCEDURE = fahrenheit_celsius_le, COMMUTATOR = '>=', NEGATOR = '>');
CREATE OPERATOR >= (LEFTARG = fahrenheit, RIGHTARG = celsius, PROCEDURE = fahrenheit_celsius_ge, COMMUTATOR = '<=', NEGATOR = '<');
