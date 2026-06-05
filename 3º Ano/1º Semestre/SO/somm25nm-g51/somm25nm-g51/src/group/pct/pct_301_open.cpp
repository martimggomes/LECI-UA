/*
 *  \author ...
 */

#include "pct.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>
#include <new>

namespace group 
{
    void pctOpen(uint16_t base, uint16_t cnt)
    {
        if (pctTable != PCT_UNDEF_TABLE) {
            pctClose(); 
        }

        if (cnt == 0) return;

        pctTable = new(std::nothrow) PctNode*[cnt];
        if (pctTable == nullptr) {
            throw Exception(ENOMEM, __func__);
        }

        for (uint16_t i = 0; i < cnt; i++) {
            pctTable[i] = nullptr;
        }

        pctPidBase = base;
        pctPidCount = cnt;
        
        pctLastPid = base + cnt - 1;
        
    }
}
