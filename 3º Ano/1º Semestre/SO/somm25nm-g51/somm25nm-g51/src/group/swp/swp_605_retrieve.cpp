/*
 *  \author ...
 */

#include "swp.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    uint16_t swpRetrieve(uint32_t sizeAvailable, bool canBeBlocked)
    {
        
        // Se a lista for vazia não retorna nada
        if (swpHead == nullptr)
            return 0;

        SwpNode *prev = nullptr;
        SwpNode *curr = swpHead;

        SwpNode *bestPrev = nullptr;
        SwpNode *bestNode = nullptr;


        // FirstFit
        if (swpPolicy == FirstFit)
        {
            while (curr != nullptr)
            {
                if ((!curr->blocked || canBeBlocked) && curr->size <= sizeAvailable)
                {
                    // Primeiro encontrado é o escolhido
                    bestNode = curr;
                    bestPrev = prev;
                    break;
                }

                prev = curr;
                curr = curr->next;
            }

            if (bestNode == nullptr)
                return 0;
        }

        // FirstBest 
        else if (swpPolicy == FirstBest)
        {
            while (curr != nullptr)
            {
                if ((!curr->blocked || canBeBlocked) && curr->size <= sizeAvailable)
                {
                    // Escolher o menor processo que cabe
                    if (bestNode == nullptr || curr->size < bestNode->size)
                    {
                        bestNode = curr;
                        bestPrev = prev;
                    }
                }

                prev = curr;
                curr = curr->next;
            }

            // Nenhum processo adequado encontrado
            if (bestNode == nullptr)
                return 0;
        }

        // Policy inválida
        else
        {
            throw Exception(EINVAL, "Invalid policy");
        }

        uint16_t pid = bestNode->pid;

        // Caso especial - o nó está no início da lista
        if (bestPrev == nullptr)
        {
            swpHead = bestNode->next;
        }
        else
        {
            bestPrev->next = bestNode->next;
        }

        // Caso especial - o nó era o ultimo elemento
        if (bestNode == swpTail)
        {
            swpTail = bestPrev;
        }

        // Libertar a memória do nó removido
        delete bestNode;
        return pid;
    }
} // end of namespace group