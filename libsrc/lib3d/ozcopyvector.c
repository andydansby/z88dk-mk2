/*
lib3d.c

Standard Wizard 3d and 4d math functions

Copyrightę 2002, Mark Hamilton

*/

#include "lib3d.h"
#include "string.h"

ozcopyvector(Vector_t *dest, Vector_t *src)
{
    memcpy(dest,src,sizeof(Vector_t));
}
