/*
 *  \author ...
 */

#include "somm25nm.h"

namespace group
{
    void simStepWaitEvent(uint16_t cid)
    {
        simProcessorState[cid].idle = true;
        simProcessorState[cid].next = simIdleHead;
        simIdleHead = cid;

        uint16_t pid = simProcessorState[cid].pid;

        PctProcessState state = BLOCKED;
        pctSet(pid, PctState, &state);

        double ioTime;
        uint32_t jid;
        pctGet(pid, PctJid, &jid);
        jobGet(jid, JobNextBurstDuration, &ioTime);

        feqInsert(simTime + ioTime, EVENT_OCCURS, pid);

        if (simIdleHead != simProcessorCount)
            feqInsert(simTime, DISPATCH, 0);
    }
}
