/*
 *  \author ...
 */

#include "somm25nm.h"

namespace group
{
    void simStepDelete(uint16_t pid)
    {  
        PctProcessState state;
        pctGet(pid, PctState, &state);
  
        if (state != ENDED)
        {
            throw Exception(EPERM, __func__);
        }

        uint32_t memAddr;
        pctGet(pid, PctMemAddr, &memAddr);

        if (memAddr != PCT_UNDEF_ADDRESS)
        {
            throw Exception(EPERM, __func__);
        }

        pctDelete(pid);
    }
} // end of namespace group

