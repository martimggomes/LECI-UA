/*
 *  \author ...
 */

#include "rdy.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    // Inserção ordenada na lista (crescente em runTime)
    static void insertSorted(RdyNode *node)
    {
        // Inserir no início
        if (rdyHead == nullptr || node->runTime < rdyHead->runTime)
        {
            node->next = rdyHead;
            rdyHead = node;
            return;
        }

        // Encontrar posição
        RdyNode *prev = rdyHead;
        while (prev->next != nullptr && prev->next->runTime <= node->runTime)
            prev = prev->next;

        node->next = prev->next;
        prev->next = node;
    }

    void rdyInsert(uint16_t pid, double curTime, double runTime)
    {
        // Módulo fechado?
        if (rdyHead == RDY_UNDEF_NODE)
            throw Exception(EINVAL, __func__);

        // PID inválido?
        if (pid == 0)
            throw Exception(EINVAL, __func__);

        // Alocar novo nó
        RdyNode *node = new (std::nothrow) RdyNode;
        if (node == nullptr)
            throw Exception(errno, __func__);

        node->pid = pid;
        node->queueTime = curTime;
        node->runTime = runTime;
        node->next = nullptr;

        insertSorted(node);
    }
} // end of namespace group


