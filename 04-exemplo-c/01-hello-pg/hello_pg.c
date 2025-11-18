#include <postgres.h>

#include <fmgr.h>
#include <utils/builtins.h>

PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(hello_pg);

Datum
hello_pg(PG_FUNCTION_ARGS)
{
    char *message = text_to_cstring(PG_GETARG_TEXT_PP(0));
    char *output = psprintf("Hello, %s!", message);

    PG_RETURN_TEXT_P(cstring_to_text(output));
}
