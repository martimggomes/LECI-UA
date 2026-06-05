/*
 *  \author ...
 */

#include "somm25nm.h"
#include "exception.h"

namespace group
{
    void simStepExit(uint16_t cid)
    {
        require(cid < simProcessorCount, "Processor ID fora de intervalo");

        uint16_t pid = simProcessorState[cid].pid;

        simProcessorState[cid].idle = true;
        simProcessorState[cid].next = simIdleHead;
        simIdleHead = cid;
        if (simIdleTail == SIM_UNDEF_INDEX)
            simIdleTail = cid;

        uint32_t addr;
        pctGet(pid, PctMemAddr, &addr);

        memFree(addr);

        PctProcessState st = ENDED;
        pctSet(pid, PctState, &st);

        pctDelete(pid);

        simStepActivate();

        if (simIdleHead != SIM_UNDEF_INDEX)
            simStepDispatch();
    }
}
