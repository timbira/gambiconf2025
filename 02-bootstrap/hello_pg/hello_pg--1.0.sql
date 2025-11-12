CREATE FUNCTION hello_pg(name text DEFAULT 'World')
RETURNS text
AS $$
    SELECT 'Hello, ' || name || '!';
$$ LANGUAGE sql IMMUTABLE;

