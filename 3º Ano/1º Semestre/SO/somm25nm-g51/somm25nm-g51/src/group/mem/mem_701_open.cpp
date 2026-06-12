/*
 *  \author ...
 */

#include "mem.h"
#include "exception.h"
#include <new>

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void memOpen(uint32_t initAddr, uint32_t minLogSize, uint32_t *sizes, uint32_t cnt)
    {
        if (memBlocks != MEM_UNDEF_NODE) {
            memClose();
        }

        // 1. Contar blocos
        memBlockCount = 0;
        for (uint32_t i = 0; i < cnt; i++) {
            memBlockCount += sizes[i];
        }

        if (memBlockCount == 0) return;

        // 2. Alocar memória
        memBlocks = new (std::nothrow) MemNode[memBlockCount];
        if (memBlocks == nullptr) {
            throw Exception(ENOMEM, __func__);
        }

        memMinLogSize = (uint16_t)minLogSize;
        
        // Quando o módulo está ABERTO, as listas vazias são NULL (não UNDEF)
        memFreeHead = nullptr; 
        memOccupiedHead = nullptr;

        // 3. Inicializar nós
        uint32_t currentAddr = initAddr;
        uint32_t nodeIndex = 0;
        MemNode *tailFree = nullptr;

        for (uint32_t i = 0; i < cnt; i++) {
            uint32_t numBlocks = sizes[i];
            uint32_t blockSize = 1 << (minLogSize + i); 
            
            for (uint32_t k = 0; k < numBlocks; k++) {
                MemNode *node = &memBlocks[nodeIndex++];
                
                node->addr = currentAddr;
                node->logSize = (uint16_t)(minLogSize + i);
                node->pid = 0; 
                node->next = nullptr;

                // Construção da lista de livres (ordenada por tamanho devido à ordem do loop)
                if (memFreeHead == nullptr) {
                    memFreeHead = node;
                } else {
                    tailFree->next = node;
                }
                tailFree = node;

                currentAddr += blockSize;
            }
        }
    }
} // end of namespace group

