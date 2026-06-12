/*
 * \author ...
 */

 #include "mem.h"
 #include "exception.h"
 
 #include <stdio.h>
 #include <stdint.h>
 
 namespace group
 {
     void memPrint(FILE *fout, MemPrintMode mode, bool csv)
     {
         if (fout == nullptr) throw Exception(EINVAL, __func__);
         if (memBlocks == nullptr) throw Exception(EINVAL, __func__);
 
         if (csv) {
             fprintf(fout, "addr;size;pid\n");
         } else {
             fprintf(fout, "\nMEM module internal state: ");
             switch (mode) {
                 case MemPrintGlobal:   fprintf(fout, "all blocks (%u):\n", memBlockCount); break;
                 case MemPrintFree:     fprintf(fout, "only free blocks:\n"); break;
                 case MemPrintOccupied: fprintf(fout, "only occupied blocks:\n"); break;
             }
         }
 
         for (uint32_t i = 0; i < memBlockCount; i++) {
             MemNode *node = &memBlocks[i];
             bool isFree = (node->pid == 0);
             bool shouldPrint = false;
 
             if (mode == MemPrintGlobal) shouldPrint = true;
             else if (mode == MemPrintFree && isFree) shouldPrint = true;
             else if (mode == MemPrintOccupied && !isFree) shouldPrint = true;
 
             if (shouldPrint) {
                 uint32_t size = 1 << node->logSize;
                 
                 if (csv) {
                     fprintf(fout, "%u;%u;%u\n", node->addr, size, node->pid);
                 } else {
                     // 1. Imprime a parte comum (Index, Addr, Size)
                     fprintf(fout, "  block[%u]: addr: 0x%08x; size: 0x%x", i, node->addr, size);
                     
                     if (mode == MemPrintFree) {
                         fprintf(fout, "\n");
                     } else {
                         // Nos modos Global e Occupied, imprime o PID
                         fprintf(fout, "; PID: ");
                         if (node->pid == 0) {
                             fprintf(fout, "(none)\n");
                         } else {
                             fprintf(fout, "%u\n", node->pid);
                         }
                     }
                 }
             }
         }
     }
 } // end of namespace group