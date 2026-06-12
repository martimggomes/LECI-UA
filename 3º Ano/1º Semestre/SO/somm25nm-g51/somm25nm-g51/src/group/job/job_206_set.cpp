/*
 *  \author Gabriel Lameira Marta 120155
 */

#include "job.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>

namespace group
{
    void jobSet(uint32_t jid, JobField field, void *value)
    {
        if(field != JobFinishTime && field != JobNextBurstIndex){
			throw Exception(EACCES, __func__);
		}
		
		if (jobHead == JOB_UNDEF_NODE) {
            throw Exception(ENOSYS, __func__);
        }
        
        JobNode *current = jobHead;
        while (current != nullptr) {
            if (current->jid == jid){
				break;
			}
            current = current->next;
        }
        
        if (current == nullptr) {
            throw Exception(ENOENT, __func__);
        }
			
		if(field == JobFinishTime){
			current->finishTime = *(double *) value;
			
		}
		else if(field == JobNextBurstIndex){
			current->nextBurstIndex = *(uint32_t *)value;
		} 
    }

} // end of namespace somm25nm
