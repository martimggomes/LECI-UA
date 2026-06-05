/*
 *  \author ...
 */

#include "somm25nm.h"

namespace group 
{
    void simClose(bool closeSatelliteModules) 
    {
		if (simTime == SIM_UNDEF_TIME){
			printf("Erro, o módulo não está aberto");
			return;
		}
		if (simIdleHead == SIM_UNDEF_INDEX || simIdleTail == SIM_UNDEF_INDEX){
			printf("Erro, o módulo não está aberto");
			return;
		}
        if (closeSatelliteModules == true){
			feqClose();
			jobClose();
			memClose();
			pctClose();
			rdyClose();
			swpClose();
		}
		simTime = SIM_UNDEF_TIME;
		simProcessorCount = 0;
		delete[] simProcessorState;
		simProcessorState = SIM_UNDEF_POINTER;
		simIdleHead = SIM_UNDEF_INDEX;
		simIdleTail = SIM_UNDEF_INDEX;
    }
} // end of namespace group

