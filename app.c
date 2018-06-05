#include <stdlib.h>
#include <mruby.h>
#include <mruby/irep.h>
#include "generated_bytecode.c"

int
main(void)
{
    mrb_state *mrb = mrb_open();
    if (!mrb) exit(1);
    mrb_load_irep(mrb, generated_mrb_bytecode);
    mrb_close(mrb);
    return 0;
}
