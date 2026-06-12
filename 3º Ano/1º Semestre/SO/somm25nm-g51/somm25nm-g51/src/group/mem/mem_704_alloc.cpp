/*
 *  \author ...
 */

#include "mem.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    uint32_t memAlloc(uint32_t pid, uint32_t size)
    {
        if (memBlocks == nullptr) throw Exception(EINVAL, __func__);
        if (pid == 0) throw Exception(EINVAL, __func__);
        if (size == 0) return 0; 

        // 1. Calcular LogSize necessário
        uint16_t reqLogSize = 0;
        while ((1U << reqLogSize) < size) {
            reqLogSize++;
        }

        // 2. Procurar na lista de livres (sorted by logSize)
        MemNode *prev = nullptr;
        MemNode *curr = memFreeHead;
        MemNode *best = nullptr;

        while (curr != nullptr) {
            if (curr->logSize >= reqLogSize) {
                best = curr;
                break; // Encontrámos o candidato
            }
            prev = curr;
            curr = curr->next;
        }

        if (best == nullptr) {
            // Não há memória suficiente
            return 0; // NULL address
        }

        // 3. Remover da lista de livres
        if (prev == nullptr) {
            memFreeHead = best->next;
        } else {
            prev->next = best->next;
        }

        // 4. Configurar o nó
        best->pid = (uint16_t)pid;
        best->next = nullptr;

        // 5. Inserir na lista de ocupados (Sorted by Address)
        MemNode *occPrev = nullptr;
        MemNode *occCurr = memOccupiedHead;

        while (occCurr != nullptr && occCurr->addr < best->addr) {
            occPrev = occCurr;
            occCurr = occCurr->next;
        }

        if (occPrev == nullptr) {
            best->next = memOccupiedHead;
            memOccupiedHead = best;
        } else {
            best->next = occCurr;
            occPrev->next = best;
        }

        return best->addr;
    }
} // end of namespace group


