/*
 *  \author ...
 */

#include "rdy.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    static RdyNode *retrieveFirst()
    {
        RdyNode *node = rdyHead;
        rdyHead = rdyHead->next;
        return node;
    }

    static RdyNode *retrieveHRRN(double curTime)
    {
        RdyNode *best = rdyHead;
        RdyNode *bestPrev = nullptr;

        // RR do primeiro
        double bestRR =
            (curTime - best->queueTime + best->runTime) / best->runTime;

        RdyNode *prev = best;
        RdyNode *p = best->next;

        while (p != nullptr)
        {
            double rr =
                (curTime - p->queueTime + p->runTime) / p->runTime;

            if (rr > bestRR)
            {
                bestRR = rr;
                best = p;
                bestPrev = prev;
            }

            prev = p;
            p = p->next;
        }

        // remover 'best' da lista
        if (bestPrev == nullptr)
            rdyHead = best->next;
        else
            bestPrev->next = best->next;

        return best;
    }

    uint16_t rdyRetrieve(double curTime)
    {
        // Módulo fechado?
        if (rdyHead == RDY_UNDEF_NODE)
            throw Exception(EINVAL, __func__);

        // Lista vazia?
        if (rdyHead == nullptr)
            return 0;

        RdyNode *node = nullptr;

        switch (rdyPolicy)
        {
            case SPN:
            case SRT:
                node = retrieveFirst();
                break;

            case HRRN:
                node = retrieveHRRN(curTime);
                break;

            default:
                throw Exception(EINVAL, __func__);
        }

        uint16_t pid = node->pid;
        delete node;
        return pid;
    }
} // end of namespace group


