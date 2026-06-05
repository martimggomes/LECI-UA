/*
 *  \author ...
 */

#include "somm25nm.h"

namespace group
{
    void simStepAdmit(uint16_t pid)
    {
        uint32_t jid;
        pctGet(pid, PctJid, &jid);

        uint32_t memSize;
        jobGet(jid, JobMemSize, &memSize);

        uint32_t memAddr = memAlloc(pid, memSize);

        if (memAddr != 0)
        {
            double runTime;
            jobGet(jid, JobNextBurstDuration, &runTime);
            rdyInsert(pid, simTime, runTime);

            uint16_t newState = 1;
            pctSet(pid, PctState, &newState);

            pctSet(pid, PctMemAddr, &memAddr);

            if (simIdleHead != simProcessorCount)
                feqInsert(simTime, DISPATCH, 0);
        }
        else
        {
            swpInsert(pid, memSize, false);

            uint16_t newState = 2;
            pctSet(pid, PctState, &newState);
        }
    }
}
