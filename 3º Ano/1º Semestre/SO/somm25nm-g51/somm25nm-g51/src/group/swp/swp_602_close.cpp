/*
 *  \author ...
 */

#include "swp.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void swpClose()
    {
        // Libertar todos os nos da lista
        SwpNode *curr = swpHead;

        // Condição de paragem é o fim da lista (curr = nullptr)
        while (curr != nullptr)
        {
            SwpNode *next = curr->next;
            delete curr;
            curr = next;
        }

        // Colocar o modulo no estado fechado
        swpHead = SWP_UNDEF_NODE;
        swpTail = SWP_UNDEF_NODE;
        swpPolicy = SWP_UNDEF_POLICY;
    }
} // end of namespace group