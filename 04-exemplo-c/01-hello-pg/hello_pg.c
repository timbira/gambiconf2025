#include <postgres.h>

#include <fmgr.h>
#include <utils/builtins.h>
#include <utils/guc.h>

PG_MODULE_MAGIC;

static char *greating_message = NULL;

PG_FUNCTION_INFO_V1(hello_pg);

Datum
hello_pg(PG_FUNCTION_ARGS)
{
    char *message = PG_NARGS() > 0 ? text_to_cstring(PG_GETARG_TEXT_PP(0)) : NULL;
    char *output = message ? psprintf("Hello, %s!", message) : greating_message;

    PG_RETURN_TEXT_P(cstring_to_text(output));
}

void
_PG_init(void)
{
    DefineCustomStringVariable(
        "hello_pg.greeting_message",
        "A greeting message for hello_pg function",
        "This message is used by the hello_pg function to greet users.",
        &greating_message,
        "Hello, World!",
        PGC_USERSET,
        0,
        NULL,
        NULL,
        NULL
    );
}
