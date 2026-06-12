/*
 *  \Guilherme Goulart
 */

#include "job.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>

namespace group
{

static void printBurstsCSV(FILE *fout, const JobNode *curr)
{
    bool first = true;
    for (uint32_t i = 0; i < JOB_MAX_BURSTS; i++)
    {
        double b = curr->bursts[i];

        if (b < 0) break;         
        if (b == 0.0) continue;    

        if (!first) fprintf(fout, ",");
        fprintf(fout, "%.1f", b);  
        first = false;
    }
}

static void printBurstsNormal(FILE *fout, const JobNode *curr)
{
    bool first = true;
    for (uint32_t i = 0; i < JOB_MAX_BURSTS; i++)
    {
        double b = curr->bursts[i];

        if (b < 0) break;
        if (b == 0.0) continue;

        if (!first) fprintf(fout, ", ");
        fprintf(fout, "%.1f", b);
        first = false;
    }
}

void jobPrint(FILE *fout, bool csv)
{
    if (fout == nullptr)
        throw Exception(EINVAL, __func__);

    JobNode *curr = jobHead;

    if (csv)
    {
        fprintf(fout,
            "jid;submissionTime;finishTime;memSize;nextBurstIndex;profile\n");

        if (curr == JOB_UNDEF_NODE)
        {
            // Lista vazia: imprime apenas cabeçalho
            return;
        }

        while (curr != nullptr)
        {
            fprintf(fout, "%08x;", curr->jid);
            fprintf(fout, "%.1f;", curr->submissionTime);

            if (curr->finishTime == JOB_UNDEF_TIME)
                fprintf(fout, "UNDEF;");
            else
                fprintf(fout, "%.1f;", curr->finishTime);

            fprintf(fout, "0x%x;", curr->memSize);
            fprintf(fout, "%u;", curr->nextBurstIndex);

            printBurstsCSV(fout, curr);

            fprintf(fout, "\n");
            curr = curr->next;
        }
    }
    else
    {
        fprintf(fout, "\nJOB module internal state:\n");

        if (curr == nullptr)
        {
            fprintf(fout, "  (empty)\n");
            return;
        }

        while (curr != nullptr)
        {
            fprintf(fout, "JOB: 0x%08x\n", curr->jid);
            fprintf(fout, "  Submission time: %.1f\n", curr->submissionTime);

            fprintf(fout, "  Finish time: ");
            if (curr->finishTime == JOB_UNDEF_TIME)
                fprintf(fout, "UNDEF\n");
            else
                fprintf(fout, "%.1f\n", curr->finishTime);

            fprintf(fout, "  Memory size: %u/0x%x\n",
                curr->memSize, curr->memSize);

            fprintf(fout, "  Next burst index: %u\n", curr->nextBurstIndex);

            fprintf(fout, "  Burst profile: ");
            printBurstsNormal(fout, curr);
            fprintf(fout, "\n");

            curr = curr->next;
        }
    }
}

} // end of namespace group
