/*
 *  \author ...
 */

#include "rdy.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void rdyOpen(RdySchedulingPolicy policy)
    {
        // Já está aberto?
        if (rdyHead != RDY_UNDEF_NODE)
        throw Exception(EINVAL, __func__);

        // Política inválida?
        if (policy != SPN && policy != HRRN && policy != SRT)
        throw Exception(EINVAL, __func__);

        // Inicializar estrutura interna
        rdyPolicy = policy;
        rdyHead = nullptr;          // fila vazia
    }
} // end of namespace group

