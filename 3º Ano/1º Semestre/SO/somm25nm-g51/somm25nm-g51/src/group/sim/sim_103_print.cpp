/*
 *  \author ...
 */

#include "somm25nm.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>
#include <errno.h>

namespace group 
{
    void simPrint(FILE *fout, uint32_t which, bool csv)
    {
        if (simTime == SIM_UNDEF_TIME){
			throw Exception(ENODEV, __func__);
		}
		if (simIdleHead == SIM_UNDEF_INDEX || simIdleTail == SIM_UNDEF_INDEX){
			throw Exception(ENODEV, __func__);
		}
		if (fout == nullptr || fileno(fout) == -1){
			throw Exception(EINVAL, __func__);
		}
		if (!csv)
        {
			fprintf(fout,"\nSIM module internal state:\n");
			for (uint32_t i = 0; i < simProcessorCount; i++){
				if (simProcessorState[i].idle){
					fprintf(fout,"  proc[%u]: (idle)\n",i);
				}
				else{
					fprintf(fout,"  proc[%u]: %u\n",i,simProcessorState[i].pid);
				}
			}
        }
        else{
			for (uint32_t i = 0; i < simProcessorCount; i++){
				if (simProcessorState[i].idle){
					fprintf(fout, "%u,1n",i);
					}
				else{
					fprintf(fout, "%u,0,%u\n",i,simProcessorState[i].pid);
					}
			}
        }
        if (which & SimPrintJob){
            jobPrint(fout, csv);
		}

        if (which & SimPrintPct){
            pctPrint(fout, csv);
		}

        if (which & SimPrintFeq){
            feqPrint(fout, csv);
		}

        if (which & SimPrintRdy){
            rdyPrint(fout, csv);
		}

        if (which & SimPrintSwp){
            swpPrint(fout, csv);
		}

        if (which & SimPrintMemGlobal){
            memPrint(fout, MemPrintGlobal, csv);
		}

        if (which & SimPrintMemFreeOnly){
            memPrint(fout, MemPrintFree, csv);
		}

        if (which & SimPrintMemOccupiedOnly){
            memPrint(fout, MemPrintOccupied, csv);
		}
    }
}
		
		
  // end of namespace group

