/*
 *  \author ...
 */

#include "feq.h"

#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{

    // ================================================================================== //

    void feqClose()
    {
        // O módulo só pode ser fechado se já estiver aberto
        if (feqHead == FEQ_UNDEF_NODE)
            throw Exception(EINVAL, __func__);

        // Liberta a lista toda ligada se ela existir
        while (feqHead != nullptr)
        {
            FeqNode *next = feqHead->next;
            delete feqHead;
            feqHead = next;
        }

        // oloca o módulo como closed
        feqHead = FEQ_UNDEF_NODE;
    }

    // ================================================================================== //

} // end of namespace group