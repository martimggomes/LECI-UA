/*
 *  \author ...
 */

#include "mem.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void memFree(uint32_t addr)
    {
        if (memBlocks == nullptr) throw Exception(EINVAL, __func__);

        // 1. Encontrar o nó na lista de ocupados (busca por endereço)
        MemNode *prev = nullptr;
        MemNode *curr = memOccupiedHead;

        while (curr != nullptr && curr->addr != addr) {
            prev = curr;
            curr = curr->next;
        }

        if (curr == nullptr) {
            // Endereço não encontrado na lista de ocupados
            throw Exception(EINVAL, __func__);
        }

        // 2. Remover da lista de ocupados
        if (prev == nullptr) {
            memOccupiedHead = curr->next;
        } else {
            prev->next = curr->next;
        }

        // 3. Resetar o nó
        curr->pid = 0;
        curr->next = nullptr;

        // 4. Inserir na lista de livres 
        MemNode *freePrev = nullptr;
        MemNode *freeCurr = memFreeHead;

        // Procurar ponto de inserção: curr->logSize < freeCurr->logSize, mantendo a ordem crescente de tamanho.
        while (freeCurr != nullptr && freeCurr->logSize <= curr->logSize) {
            freePrev = freeCurr;
            freeCurr = freeCurr->next;
        }

        if (freePrev == nullptr) {
            curr->next = memFreeHead;
            memFreeHead = curr;
        } else {
            curr->next = freeCurr;
            freePrev->next = curr;
        }
    }
} // end of namespace group


