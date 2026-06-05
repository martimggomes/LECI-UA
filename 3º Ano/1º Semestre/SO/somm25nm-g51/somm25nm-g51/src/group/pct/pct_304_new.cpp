/*
 * \author 
 */

 #include "pct.h"
 #include "exception.h"
 #include <stdio.h>
 #include <stdint.h>
 #include <errno.h> 
 
 namespace group
 {
     uint16_t pctNew(uint32_t jid)
     {
         if (pctTable == PCT_UNDEF_TABLE) {
             throw Exception(EINVAL, __func__);
         }

         // Conta quantos slots estão ocupados
         int activeCount = 0;
         for (uint16_t i = 0; i < pctPidCount; i++) {
             if (pctTable[i] != nullptr) activeCount++;
         }
 
         if (activeCount >= pctPidCount) {
              throw Exception(EAGAIN, __func__); 
         }
 
         int nextIdx = ((int)pctLastPid + 1 - pctPidBase) % pctPidCount;
         
         // Ajuste defensivo para módulo negativo
         if (nextIdx < 0) nextIdx += pctPidCount;
 
         uint16_t idx = (uint16_t)nextIdx;
         bool found = false;
 
         // Procura slot livre
         for (uint16_t i = 0; i < pctPidCount; i++) {
             if (pctTable[idx] == nullptr) {
                 found = true;
                 break;
             }
             idx = (idx + 1) % pctPidCount;
         }
 
         if (!found) {
             // Se por acaso a contagem falhar mas não houver espaço real
             throw Exception(EAGAIN, __func__);
         }
 
         PctNode *newNode = new(std::nothrow) PctNode;
         if (newNode == nullptr) {
             throw Exception(ENOMEM, __func__);
         }
 
         newNode->jid = jid;
         newNode->memAddr = PCT_UNDEF_ADDRESS;
         newNode->state = NEW;
 
         pctTable[idx] = newNode;
         
         // Atualizar LastPid
         pctLastPid = pctPidBase + idx;
 
         return pctLastPid;
     }
 }