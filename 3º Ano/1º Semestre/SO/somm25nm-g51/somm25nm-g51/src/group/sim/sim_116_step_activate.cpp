/*
 *  \author ...
 */

 #include "somm25nm.h"

 namespace group
 {
     void simStepActivate()
     {
         uint32_t maxFree = memBiggestFreeBlock();
 
         uint16_t pid = swpRetrieve(maxFree, false);
 
         if (pid != 0) 
         {
             uint32_t jid;
             pctGet(pid, PctJid, &jid);
             uint32_t memSize;
             jobGet(jid, JobMemSize, &memSize);
             
             uint32_t addr = memAlloc(pid, memSize);
             
             pctSet(pid, PctMemAddr, &addr);
             PctProcessState st = READY;
             pctSet(pid, PctState, &st);
 
             double dur = 0.0;
             jobGet(jid, JobNextBurstDuration, &dur);
             rdyInsert(pid, simTime, dur);
 
             simStepDispatch();
         }
     }
 }