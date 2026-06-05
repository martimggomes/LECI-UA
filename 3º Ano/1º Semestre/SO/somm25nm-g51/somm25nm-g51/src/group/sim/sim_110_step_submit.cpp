/*
 *  \author
 */

#include "somm25nm.h"

namespace group
{
    void simStepSubmit(uint32_t jid)
    {
        uint32_t memSize = 0;
        double burstProfile[JOB_MAX_BURSTS] = {0.0};

        jobGet(jid, JobMemSize, &memSize);
        jobGet(jid, JobNextBurstDuration, burstProfile);

        jobInsert(jid, simTime, memSize, burstProfile);

        feqInsert(simTime, ADMIT, jid);
    }
} // end of namespace group
