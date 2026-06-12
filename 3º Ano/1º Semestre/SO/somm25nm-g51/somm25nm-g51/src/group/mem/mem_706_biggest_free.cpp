/*
 *  \author ...
 */

#include "mem.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    uint32_t memBiggestFreeBlock()
    {
        if (memBlocks == nullptr) return 0;

        // Como a lista de livres está ordenada por logSize ascendente, o maior bloco deve estar no final da lista.
        
        if (memFreeHead == nullptr) return 0;

        MemNode *curr = memFreeHead;
        while (curr->next != nullptr) {
            curr = curr->next;
        }

        // Retorna o tamanho real 
        return (1U << curr->logSize);
    }
} // end of namespace group

