/*
 
\author ...*/

#include "pct.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group 
{
    void pctClose()
    {
        if (pctTable != PCT_UNDEF_TABLE)
        {
            for (uint16_t i = 0; i < pctPidCount; i++) {
                if (pctTable[i] != nullptr) {
                    delete pctTable[i];
                    pctTable[i] = nullptr;
                }
            }

            delete[] pctTable;
            pctTable = PCT_UNDEF_TABLE;
        }

        pctPidBase = 0;
        pctPidCount = 0;
        pctLastPid = 0;
    }
}

