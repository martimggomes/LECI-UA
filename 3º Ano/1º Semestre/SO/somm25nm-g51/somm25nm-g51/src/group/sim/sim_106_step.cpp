/*
 *  \author ...
 */

#include "somm25nm.h"

namespace group
{
    bool simStep(bool blocking)
    {
        double time;
        FeqEventType type;
        uint32_t xid;

        if (!feqRetrieve(&time, &type, &xid, blocking))
        {
            return false;
        }
        simTime = time;

        switch (type)
        {
            case SUBMIT:
                simStepSubmit(xid);
                break;

            case ADMIT:
                simStepAdmit((uint16_t)xid);
                break;

            case DISPATCH:
                simStepDispatch();
                break;

            case WAIT_EVENT:
                simStepWaitEvent((uint16_t)xid);
                break;

            case EVENT_OCCURS:
                simStepEventOccurs((uint16_t)xid);
                break;

            case EXIT:
                simStepExit((uint16_t)xid);
                break;

            case ACTIVATE:
                simStepActivate();
                break;

            case DELETE:
                simStepDelete((uint16_t)xid);
                break;

            case SUSPEND:
                simStepSuspend((uint16_t)xid);
                break;

            case PREEMPT:
                simStepPreempt((uint16_t)xid);
                break;

            case TIMEOUT:
                break;
        }

        return true;
    }
} // end of namespace group
