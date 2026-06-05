/*
   \author ...
 */

 #include "somm25nm.h"
 #include <cmath> 
 
 namespace group
 {
     void simStepDispatch()
     {

         if (simIdleHead == simProcessorCount) return; 
         
         uint16_t pid = rdyRetrieve(simTime);
         if (pid == 0) return; 
 
         uint16_t cid = simIdleHead;
         simIdleHead = simProcessorState[cid].next;
         
         if (simIdleHead == simProcessorCount) {
             simIdleTail = simProcessorCount; 
         }
 
         simProcessorState[cid].idle = false;
         simProcessorState[cid].pid = pid;

         PctProcessState st = RUNNING;
         pctSet(pid, PctState, &st);
 
         uint32_t jid;
         pctGet(pid, PctJid, &jid);
         
         double duration = 0.0;
         jobGet(jid, JobNextBurstDuration, &duration);

         if (duration < 0) {
             feqInsert(simTime + std::abs(duration), EXIT, cid);
         } else {
             feqInsert(simTime + duration, WAIT_EVENT, cid);
         }
     }
 }