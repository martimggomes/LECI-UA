/*
 *  \author ...
 */

#include "swp.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void swpOpen(SwpSwappingPolicy policy)
    {
        // Inicializar a lista ligada como vazia
        swpHead = nullptr;
        swpTail = nullptr;

        swpPolicy = policy;
    }
} // end of namespace group