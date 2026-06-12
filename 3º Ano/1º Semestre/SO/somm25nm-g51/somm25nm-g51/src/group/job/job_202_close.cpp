/*
 
Author: Martim Peralta Gomes, 119488
*/

#include "job.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

namespace group
{

// ================================================================================== //

    void jobClose()
    {

        if (jobHead != JOB_UNDEF_NODE)
        {
            JobNode *curr = jobHead;
            while (curr != NULL)
            {
                JobNode *next = curr->next;
                free(curr);
                curr = next;
            }
        }

        jobHead = JOB_UNDEF_NODE;
    }

// ================================================================================== //

} // end of namespace group