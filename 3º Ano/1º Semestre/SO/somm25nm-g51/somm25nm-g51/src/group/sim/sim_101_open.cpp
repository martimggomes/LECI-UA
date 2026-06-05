/*
 *  \author ...
 */

#include "sim.h"
#include "exception.h"
#include <new>

namespace group
{
    void simOpen(SimParameters *param)
    {
        simTime = 0.0;

        simProcessorCount = param->processorCount;
        simProcessorState = new SimProcessorState[simProcessorCount];

        for (uint32_t i = 0; i < simProcessorCount; i++)
        {
            simProcessorState[i].idle = true;
            simProcessorState[i].next =
                (i + 1 < simProcessorCount) ? (uint16_t)(i + 1) : simProcessorCount;
        }

        simIdleHead = 0;
        simIdleTail = (uint16_t)(simProcessorCount - 1);

        jobOpen();
        pctOpen(param->basePid, param->maxPids);
        feqOpen();
        rdyOpen(param->schedulingPolicy);
        swpOpen(param->swappingPolicy);
        memOpen(param->memInitAddr,
                param->memMinLogSize,
                param->memSizes,
                param->memSizesCount);
    }
}