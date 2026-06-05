/*
 *  \author ...
 */

#include "rdy.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void rdyPrint(FILE *fout, bool csv)
    {
        // Módulo está fechado?
        if (rdyHead == RDY_UNDEF_NODE)
            throw Exception(EINVAL, __func__);
    
        if (fout == nullptr)
            throw Exception(EINVAL, __func__);
        /* 
           Print Formato CSV
        */
        if (csv)
        {
            fprintf(fout, "pid;queueTime;runTime\n");
    
            for (RdyNode *p = rdyHead; p != nullptr; p = p->next)
            {
                fprintf(fout, "%u;%.1f;%.1f\n",
                        p->pid,
                        p->queueTime,
                        p->runTime);
            }
            return;
        }
        /* 
           Print Normal
        */
        fprintf(fout, "\nRDY module internal state:\n");
    
        if (rdyHead == nullptr)
        {
            fprintf(fout, "  (empty)\n");
            return;
        }
    
        for (RdyNode *p = rdyHead; p != nullptr; p = p->next)
        {
            fprintf(fout,
                "  PID: %u;   queue time: %.1f;   burst time: %.1f\n",
                p->pid,
                p->queueTime,
                p->runTime
            );
        }
    }
} // end of namespace group


