/*
* \author 
*/

#include "pct.h"
#include "exception.h"
#include <stdio.h>
#include <stdint.h>

namespace group 
{
    static const char* stateToString(PctProcessState state) {
        switch(state) {
            case NEW: return "NEW";
            case RUNNING: return "RUNNING";
            case BLOCKED: return "BLOCKED";
            case READY: return "READY";
            case S_BLOCKED: return "SUSPENDED_BLOCKED";
            case S_READY: return "SUSPENDED_READY";
            case ENDED: return "ENDED";
            default: return "UNKNOWN";
        }
    }

    void pctPrint(FILE *fout, bool csv)
    {
        if (fout == nullptr) throw Exception(EINVAL, __func__);
        if (pctTable == PCT_UNDEF_TABLE) throw Exception(EINVAL, __func__);

        if (csv) {
            fprintf(fout, "pid;jid;memAddr;state\n");
        } else {
            fprintf(fout, "\nPCT module internal state:\n");
        }

        bool empty = true;
        for (uint16_t i = 0; i < pctPidCount; i++) {
            if (pctTable[i] != nullptr) {
                empty = false;
                uint16_t pid = pctPidBase + i;
                PctNode *node = pctTable[i];

                if (csv) {
                    fprintf(fout, "%05u;%08x;", pid, node->jid);
                    
                    if (node->memAddr == PCT_UNDEF_ADDRESS) 
                        fprintf(fout, "UNDEF;");
                    else 
                        fprintf(fout, "%#x;", node->memAddr);
                        
                    fprintf(fout, "%s\n", stateToString(node->state));
                } else {
                    fprintf(fout, " PID: %u\n", pid);
                    fprintf(fout, "   Job ID: 0x%08x\n", node->jid);
                    
                    fprintf(fout, "   Memory address: ");
                    if (node->memAddr == PCT_UNDEF_ADDRESS) 
                        fprintf(fout, "UNDEF\n");
                    else 
                        fprintf(fout, "%#x\n", node->memAddr);
                        
                    fprintf(fout, "   State: %s\n", stateToString(node->state));
                }
            }
        }

        if (!csv && empty) {
            fprintf(fout, "  (empty)\n");
        }
    }
}