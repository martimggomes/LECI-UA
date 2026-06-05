/*
 * MEM Test Module 
 *
 * \author Artur Pereira - 2025
 */

 #include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <libgen.h>
 #include <termios.h>
 
 #include <string>
 #include <iostream>
 #include <map>
 
 #include "somm25nm.h"
 #include "mem.h"       
 #include "exception.h" 
 
 /* ******************************************** */
 static void printUsage(const char *cmd_name)
 {
     printf("Sinopsis: %s [OPTIONS]\n"
            "  OPTIONS:\n"
            "  -r testID      --- set test ID (e.g., 701, 704)\n"
            "  -i infile      --- set input file (default: stdin)\n"
            "  -o outfile     --- set log file (default: stdout)\n"
            "  -O outfile     --- set probbing file (default: stdout)\n"
            "  -P num-num     --- set probe ID range (default: 0-0)\n"
            "  -A num-num     --- add range of IDs to probe configuration\n"
            "  -R num-num     --- remove range of IDs from probe configuration\n"
            "  -b             --- set bin selection map to 100-799\n"
            "  -g             --- set bin selection map to 0-0 (default)\n"
            "  -a num-num     --- add range of IDs to bin selection map\n"
            "  -r num-num     --- remove range of IDs from bin selection map\n"
            "  -n             --- run without pause (default: pause)\n"
            "  -h             --- print this help\n", cmd_name);
 }
 
 bool noPause() { return true; }
 
 bool termPause()
 {
     printf("Continue (Y/n)? "); fflush(stdout);
     
     if (!isatty(STDOUT_FILENO)) {
         printf("\n");
         return true; 
     }
 
     // Configuração do terminal para leitura sem Enter
     static bool firstTime = true;
     static struct termios prev, cur;
     if (firstTime)
     {
         firstTime = false;
         tcgetattr(STDIN_FILENO, &prev);
         cur = prev;
         cur.c_lflag &= (~ICANON);
         tcsetattr(STDIN_FILENO, TCSANOW, &cur);
     }
 
     while (true)
     {
         int res = getchar();
         if (res == EOF) return false; 
         if (res == '\n') break;
         if (res == 'y' || res == 'Y') { printf("\n"); break; }
         if (res == 'n' || res == 'N') { printf("\n"); return false; }
         return false; 
     }
     return true;
 }
 
 bool (*pauseSim)(void) = termPause;
 
 void banner(const char *msg)
 {
     fprintf(stdout, "\n\e[33;1m%s\e[0m\n\n", msg);
 }
 
 int main(int argc, char *argv[])
 {
     const char *progName = basename(argv[0]); 
 
     FILE *fout = stdout;
     soProbeOpen(stdout, 0, 0);
 
     const char *infile = NULL; (void)infile; 
     const char *outfile = NULL;
 
     int opt;
     while ((opt = getopt(argc, argv, "r:i:o:O:P:A:R:nbga:h")) != -1)
     {
         switch (opt)
         {
             case 'r': 
             {
                 uint32_t lower, upper;
                 uint32_t cnt = 0;
                 if (sscanf(optarg, "%d%*[,-]%d %n", &lower, &upper, &cnt) >= 1) {
                     soBinRemoveIDs(lower, upper); 
                 }
                 break;
             }
             case 'i': infile = optarg; break;
             case 'o':
                 outfile = optarg;
                 if ((fout = fopen(outfile, "w")) == NULL) return EXIT_FAILURE;
                 break;
             case 'O': soProbeFile(optarg); break;
             case 'P': { uint32_t l, u; sscanf(optarg, "%d%*[,-]%d", &l, &u); soProbeSetIDs(l, u); break; }
             case 'A': { uint32_t l, u; sscanf(optarg, "%d%*[,-]%d", &l, &u); soProbeAddIDs(l, u); break; }
             case 'R': { uint32_t l, u; sscanf(optarg, "%d%*[,-]%d", &l, &u); soProbeRemoveIDs(l, u); break; }
             case 'n': pauseSim = noPause; break;
             case 'b': soBinSetIDs(0, 999); break;
             case 'g': soBinSetIDs(0, 0); break;
             case 'a': { uint32_t l, u; sscanf(optarg, "%d%*[,-]%d", &l, &u); soBinAddIDs(l, u); break; }
             case 'h': printUsage(progName); return 0;
             default: return EXIT_FAILURE;
         }
     }
 
     setvbuf(fout, NULL, _IONBF, 0);
 
     if (!isatty(STDOUT_FILENO)) pauseSim = noPause;

     try {
         uint32_t sizes[] = {2, 2, 1}; 
         uint32_t minLogSize = 6;
         uint32_t initAddr = 0x1000;
         uint32_t cnt = 3;
 
         // 1. OPEN
         banner("1. Opening MEM Module");
         memOpen(initAddr, minLogSize, sizes, cnt);
         memPrint(fout, MemPrintGlobal); 
 
         if (!pauseSim()) { memClose(); return 0; }
 
         // 2. ALLOC
         banner("2. Allocating Memory");
         uint32_t addr1 = memAlloc(101, 50); 
         fprintf(fout, "Allocated PID 101 (50 bytes) at: %u\n", addr1);
         uint32_t addr2 = memAlloc(102, 200); 
         fprintf(fout, "Allocated PID 102 (200 bytes) at: %u\n", addr2);
         uint32_t addr3 = memAlloc(103, 120); 
         fprintf(fout, "Allocated PID 103 (120 bytes) at: %u\n", addr3);
 
         memPrint(fout, MemPrintOccupied);
         
         if (!pauseSim()) { memClose(); return 0; }
 
         // 3. BIGGEST FREE
         banner("3. Checking Biggest Free Block");
         uint32_t biggest = memBiggestFreeBlock();
         fprintf(fout, "Biggest free block size: %u bytes\n", biggest);
 
         if (!pauseSim()) { memClose(); return 0; }
 
         // 4. FREE
         banner("4. Freeing Memory");
         fprintf(fout, "Freeing addr %u (PID 102)...\n", addr2);
         memFree(addr2);
         
         memPrint(fout, MemPrintFree);
         
         if (!pauseSim()) { memClose(); return 0; }
 
         // 5. RE-ALLOC
         banner("5. Allocating Large Block Again");
         uint32_t addr4 = memAlloc(104, 250);
         fprintf(fout, "Allocated PID 104 (250 bytes) at: %u\n", addr4);
         memPrint(fout, MemPrintGlobal);
 
         // 6. CLOSE
         banner("6. Closing MEM Module");
         memClose();
         fprintf(fout, "Closed successfully.\n");
 
     } catch (Exception &e) {
         fprintf(fout, "EXCEPTION: %s\n", e.what());
         return 1;
     }
 
     return EXIT_SUCCESS;
 }