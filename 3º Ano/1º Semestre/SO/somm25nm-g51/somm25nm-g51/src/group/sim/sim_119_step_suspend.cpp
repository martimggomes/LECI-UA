/*
 *  \author ...
 */

#include "somm25nm.h"

namespace group
{
    void simStepSuspend(uint16_t pid)
    {
        PctProcessState state;
        pctGet(pid, PctState, &state);

        bool blocked;

        if (state == READY)
        {
            state = S_READY;
            blocked = false;
        }
        else if (state == BLOCKED)
        {
            state = S_BLOCKED;
            blocked = true;
        }
        else
        {
            throw Exception(EPERM, __func__);
        }
        pctSet(pid, PctState, &state);

        uint32_t memAddr;
        pctGet(pid, PctMemAddr, &memAddr);
        memFree(memAddr);

        memAddr = PCT_UNDEF_ADDRESS;
        pctSet(pid, PctMemAddr, &memAddr);

        uint32_t jid;
        pctGet(pid, PctJid, &jid);

        uint32_t memSize;
        jobGet(jid, JobMemSize, &memSize);

        swpInsert(pid, memSize, blocked);
    }
} // end of namespace group
