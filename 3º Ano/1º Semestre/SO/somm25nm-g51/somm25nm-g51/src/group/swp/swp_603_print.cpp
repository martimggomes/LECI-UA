/*
 *  \author ...
 */

#include "swp.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void swpPrint(FILE *fout, bool csv)
    {
        SwpNode *curr = swpHead;

        if (csv)
        {
            // Cabeçalho
            if (fprintf(fout, "pid;size;blocked\n") < 0)
                throw Exception(EIO, "fprintf failed");

            while (curr != nullptr)
            {
                if (fprintf(fout, "%hu;%u;%s\n",
                            curr->pid,
                            curr->size,
                            curr->blocked ? "yes" : "no") < 0)
                {
                    throw Exception(EIO, "fprintf failed");
                }
                curr = curr->next;
            }

            return;
        }

        // Modo normal
        if (fprintf(fout, "\nSWP module internal state:\n") < 0)
            throw Exception(EIO, "fprintf failed");

        if (curr == nullptr)
        {
            if (fprintf(fout, "  (empty)\n") < 0)
                throw Exception(EIO, "fprintf failed");
            return;
        }

        while (curr != nullptr)
        {
            if (fprintf(fout,
                        "  PID: %hu;  size: %u/0x%x;  state: %s\n",
                        curr->pid,
                        curr->size,
                        curr->size,
                        curr->blocked ? "SUSPENDED_BLOCKED"
                                    : "SUSPENDED_READY") < 0)
            {
                throw Exception(EIO, "fprintf failed");
            }

            curr = curr->next;
        }
    }
} // end of namespace group


