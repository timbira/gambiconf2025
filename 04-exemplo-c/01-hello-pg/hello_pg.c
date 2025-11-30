#include <postgres.h>

#include <fmgr.h>
#include <libpq/auth.h>
#include <parser/analyze.h>
#include <utils/builtins.h>
#include <utils/guc.h>

PG_MODULE_MAGIC;

/* GUC variable  */
static char *greeting_message = NULL;

/* Original Hook */
static ClientAuthentication_hook_type original_client_auth_hook = NULL;
static post_parse_analyze_hook_type original_post_parse_analyze_hook = NULL;

PG_FUNCTION_INFO_V1(hello_pg);

Datum
hello_pg(PG_FUNCTION_ARGS)
{
    char *message = PG_NARGS() > 0 ? text_to_cstring(PG_GETARG_TEXT_PP(0)) : NULL;
    char *output = message ? psprintf("Hello, %s!", message) : greeting_message;

    PG_RETURN_TEXT_P(cstring_to_text(output));
}

static void
hello_pg_client_auth_hook(Port *port, int status)
{
    if (original_client_auth_hook)
        original_client_auth_hook(port, status);

    if (status == STATUS_OK)
        elog(LOG, "%s: %s", __func__, greeting_message);
}

static void
hello_pg_post_parse_analyze_hook(ParseState *pstate, Query *query, JumbleState *jstate)
{
    if (original_post_parse_analyze_hook)
        original_post_parse_analyze_hook(pstate, query, jstate);

    pg_usleep(5000000L);

    elog(NOTICE, "%s: %s", __func__, greeting_message);
}


void
_PG_init(void)
{
    DefineCustomStringVariable(
        "hello_pg.greeting_message",
        "A greeting message for hello_pg function",
        "This message is used by the hello_pg function to greet users.",
        &greeting_message,
        "Hello, World!",
        PGC_USERSET,
        0,
        NULL,
        NULL,
        NULL
    );

    /* Install Hooks */
    original_client_auth_hook = ClientAuthentication_hook;
    ClientAuthentication_hook = hello_pg_client_auth_hook;
    original_post_parse_analyze_hook = post_parse_analyze_hook;
    post_parse_analyze_hook = hello_pg_post_parse_analyze_hook;
}
