/*
 *  \author ...
 */

#include "mem.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void memClose() 
    {
        // Só tentamos apagar se o ponteiro for válido e diferente de UNDEF
        if (memBlocks != nullptr && memBlocks != MEM_UNDEF_NODE) {
            delete[] memBlocks;
        }

        // Resetar para o estado UNDEF (Módulo fechado)
        memBlocks = MEM_UNDEF_NODE;
        memFreeHead = MEM_UNDEF_NODE;
        memOccupiedHead = MEM_UNDEF_NODE;
        
        memBlockCount = 0;
        memMinLogSize = 0;
    }
} // end of namespace group


