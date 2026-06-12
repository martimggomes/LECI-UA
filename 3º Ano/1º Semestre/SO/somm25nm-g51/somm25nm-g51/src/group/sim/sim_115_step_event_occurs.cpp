/*
 *  \author ...
 */

 #include "somm25nm.h"

 namespace group
 {
     void simStepEventOccurs(uint16_t pid)
     {
         PctProcessState st;
         pctGet(pid, PctState, &st);
 
         if (st == BLOCKED) 
         {
             st = READY;
             pctSet(pid, PctState, &st);
 
             uint32_t jid;
             pctGet(pid, PctJid, &jid);
             double cpuDur = 0.0;
             jobGet(jid, JobNextBurstDuration, &cpuDur);
             rdyInsert(pid, simTime, cpuDur);
 
             simStepDispatch();
         } 
         else if (st == S_BLOCKED) 
         {
             st = S_READY;
             pctSet(pid, PctState, &st);
             swpUnblock(pid); 
             
             feqInsert(simTime, ACTIVATE, 0);
         }
     }
 }