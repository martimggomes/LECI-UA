/*
 *  \author
 */

#include "job.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>

namespace group
{

// ================================================================================== //

    void jobInsert(uint32_t jid, double submissionTime, uint32_t memSize, double *burstProfile)
    {

        if (jobHead == JOB_UNDEF_NODE){
            throw Exception(EINVAL,__func__);
        }
            
        JobNode *newNode = new(std::nothrow) JobNode;
        if (newNode == nullptr){
            throw Exception(errno, __func__);
        }

        newNode -> jid = jid;
        newNode ->submissionTime = submissionTime;
        newNode -> finishTime = JOB_UNDEF_TIME;
        newNode -> memSize = memSize;
        newNode -> nextBurstIndex = 0;

        for (int i = 0; i < JOB_MAX_BURSTS; i++){
            newNode -> bursts[i] = burstProfile[i];
        }

        newNode -> next = nullptr;

        if (jobHead == nullptr){
            jobHead = newNode;
            return;
        }

        if (jid < jobHead -> jid) {
            newNode -> next = jobHead;
            jobHead = newNode;
            return;
        }

        JobNode *prev = jobHead;
        JobNode *curr = jobHead -> next;


        while(curr != nullptr && curr -> jid < jid) {
            prev = curr;
            curr = curr -> next;
        }


        prev -> next = newNode;
        newNode -> next = curr;

        
    }

// ================================================================================== //

} // end of namespace group

