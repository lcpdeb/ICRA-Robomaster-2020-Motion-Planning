#include "test_class.h"
#include "test.h"

int show_answer(BOX box)
{
    return box.cddd(box.x, box.y);
}

int BOX::cddd(int c, int d)
{
    return adddd(c, d);
}