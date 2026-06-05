/*
 *  \author ...
 */

#include "feq.h"

#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{

    // ================================================================================== //

    bool feqRetrieve(double *time, FeqEventType *type, uint32_t *xid, bool blocking)
    {

        // O módulo já tem de estar aberto
        if (feqHead == FEQ_UNDEF_NODE)
            throw Exception(EINVAL, __func__);

        // Se a lista for vazia
        if (feqHead == nullptr)
        {
            // se estiver em modo não blocking deve dar exceção
            if (!blocking)
                throw Exception(EINVAL, "ERRO: devia dar exceção!");
            return false;
        }

        FeqNode *node = feqHead;

        // copia os dados do evento
        *time = node->time;
        *type = node->type;
        *xid = node->xid;

        feqHead = node->next;
        delete node;

        // evento foi removido com sucesso
        return true;
    }

    // ================================================================================== //

} // end of namespace group