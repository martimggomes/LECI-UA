/*
 *  \author ...
 */

#include "pct.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void pctSet(uint16_t pid, PctField field, void *value)
    {
        if (pctTable == PCT_UNDEF_TABLE) throw Exception(EINVAL, __func__);
        if (value == nullptr) throw Exception(EINVAL, __func__);

        if (pid < pctPidBase || pid >= pctPidBase + pctPidCount) {
            throw Exception(EINVAL, __func__);
        }

        uint16_t idx = pid - pctPidBase;

        if (pctTable[idx] == nullptr) {
            throw Exception(ENOENT, __func__);
        }

        PctNode *node = pctTable[idx];

        switch (field) {
            case PctJid:
                node->jid = *(uint32_t *)value;
                break;
            case PctMemAddr:
                node->memAddr = *(uint32_t *)value;
                break;
            case PctState:
                node->state = *(PctProcessState *)value;
                break;
            default:
                throw Exception(EINVAL, __func__);
        }
    }
}