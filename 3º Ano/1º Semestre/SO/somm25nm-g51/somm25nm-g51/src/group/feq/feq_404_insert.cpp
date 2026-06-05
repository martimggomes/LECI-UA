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
    static int eventPriority(FeqEventType t)
    {
        // DISPATCH tem de aparecer sempre quando e o mesmo instante de tempo
        if (t == DISPATCH)
            return 0;

        // grupo intermedio dos eventos prioritarios
        if (t == WAIT_EVENT ||
            t == EXIT ||
            t == TIMEOUT ||
            t == PREEMPT)
            return 1;

        // os outros eventos
        return 2;
    }

    void feqInsert(double time, FeqEventType type, uint32_t xid)
    {
        // tem de estar aberto o modulo
        if (feqHead == FEQ_UNDEF_NODE)
            throw Exception(EINVAL, __func__);

        FeqNode *node = new FeqNode{time, type, xid, nullptr};

        if (feqHead == nullptr)
        {
            feqHead = node;
            return;
        }

        auto comesBefore = [&](FeqNode *a, FeqNode *b)
        {
            // aqui esta a comparar so pelo tempo
            if (a->time < b->time)
                return true;
            if (a->time > b->time)
                return false;

            // caso o tempo seja igual, tem de se comparar prioridades
            int pa = eventPriority(a->type);
            int pb = eventPriority(b->type);

            if (pa < pb)
                return true;
            if (pa > pb)
                return false;

            // se a prioridade e o tempo forem os mesmos, vai manter a ordem pelo qual foram inseridos
            return false;
        };

        // verificar se o no novo q é criado deve ir para o inicio
        if (comesBefore(node, feqHead))
        {
            node->next = feqHead;
            feqHead = node;
            return;
        }

        FeqNode *curr = feqHead;
        while (curr->next != nullptr)
        {
            if (comesBefore(node, curr->next))
            {
                node->next = curr->next;
                curr->next = node;
                return;
            }
            curr = curr->next;
        }

        // se n encontra posicao antes vai inserir no final
        curr->next = node;
    }

    // ================================================================================== //

} // end of namespace group
