CREATE EXTENSION hello_pg;

\pset null '(null)'
SELECT hello_pg(NULL);
SELECT hello_pg();
SELECT hello_pg('GambiConf');
SELECT hello_pg('Postgres');

SHOW hello_pg.greeting_message;
SET hello_pg.greeting_message = 'Building Postgres extensions at GambiConf 2025';
SELECT hello_pg();
SELECT hello_pg('World');

\set ON_ERROR_STOP 0
SELECT hello_pg(123);
SELECT hello_pg('GambiConf', 'Extra Arg');
\set ON_ERROR_STOP 1

SET client_min_messages TO WARNING;
SHOW hello_pg.greeting_message;
SELECT 1; -- não deve emitir a mensagem definida

