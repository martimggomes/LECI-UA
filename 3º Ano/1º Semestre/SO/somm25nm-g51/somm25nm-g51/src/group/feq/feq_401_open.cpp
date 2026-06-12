/*
 *  \author ...
 */

#include "feq.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>

namespace group
{

    // ================================================================================== //

    void feqOpen()
    {
        // Só pode dar para abrir o módulo se estiver fechado
        if (feqHead != FEQ_UNDEF_NODE)
            throw Exception(EINVAL, __func__);

        // inicializa a proxima event queue como vazia
        feqHead = nullptr;
    }

    // ================================================================================== //

} // end of namespace group