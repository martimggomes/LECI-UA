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
     void pctDelete(uint16_t pid)
     {
         if (pctTable == PCT_UNDEF_TABLE) {
             throw Exception(EINVAL, __func__);
         }
 
         if (pid < pctPidBase || pid >= pctPidBase + pctPidCount) {
             throw Exception(EINVAL, __func__);
         }
 
         uint16_t idx = pid - pctPidBase;
 
         if (pctTable[idx] == nullptr) {
             throw Exception(EINVAL, __func__);
         }
 
         delete pctTable[idx];
         pctTable[idx] = nullptr;
     }
 }  