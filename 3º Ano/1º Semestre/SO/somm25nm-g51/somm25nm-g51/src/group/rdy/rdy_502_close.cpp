/*
 *  \author ...
 */

#include "rdy.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void rdyClose()
    {
        // Módulo já está fechado?
        if (rdyHead == RDY_UNDEF_NODE)
            throw Exception(EINVAL, __func__);

        // Libertar toda a lista
        while (rdyHead != nullptr)
        {
            RdyNode *next = rdyHead->next;
            delete rdyHead;             // Liberta memoria 
            rdyHead = next;
        }

        // Fechar 
        rdyHead = RDY_UNDEF_NODE;
        rdyPolicy = RDY_UNDEF_POLICY;
    }
} // end of namespace group


