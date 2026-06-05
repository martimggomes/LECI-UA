/*
 *  \author ...
 */

#include "pct.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void pctGet(uint16_t pid, PctField field, void *value)
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
                *(uint32_t *)value = node->jid;
                break;
            case PctMemAddr:
                *(uint32_t *)value = node->memAddr;
                break;
            case PctState:
                *(PctProcessState *)value = node->state;
                break;
            default:
                throw Exception(EINVAL, __func__);
        }
    }
}