/*
* PCT Test Module (main.cpp)
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
#include "pct.h" 

/* ******************************************** */
static void printUsage(const char *cmd_name)
{
    printf("Sinopsis: %s [OPTIONS]\n"
        "  OPTIONS:\n"
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
        "  -n             --- run without pause (default: no pause)\n"
        "  -h             --- print this help\n", cmd_name);
}

// Funções de pausa
bool noPause() { return true; }
bool termPause()
{
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
    printf("Continue (Y/n)? "); fflush(stdout);
    while (true)
    {
        int res = getchar();
        if (res == '\n') break;
        printf("\n");
        if (res == 'n' or res == 'N') return false;
        if (res == 'y' or res == 'Y') break;
        printf("Bad option! Continue (Y/n)? "); fflush(stdout);
    }
    return true;
}

bool (*pauseSim)(void) = noPause; 

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
    const char *outfile = NULL; (void)outfile; 

    int opt;
    while ((opt = getopt(argc, argv, "i:o:O:P:A:R:nbga:r:h")) != -1)
    {
        switch (opt)
        {
            case 'i': infile = optarg; break;
            case 'o': outfile = optarg; if ((fout = fopen(outfile, "w")) == NULL) return EXIT_FAILURE; break;
            case 'O': soProbeFile(optarg); break;
            case 'P': { uint32_t l, u; sscanf(optarg, "%d%*[,-]%d", &l, &u); soProbeSetIDs(l, u); break; }
            case 'A': { uint32_t l, u; sscanf(optarg, "%d%*[,-]%d", &l, &u); soProbeAddIDs(l, u); break; }
            case 'R': { uint32_t l, u; sscanf(optarg, "%d%*[,-]%d", &l, &u); soProbeRemoveIDs(l, u); break; }
            case 'n': pauseSim = noPause; break;
            case 'b': soBinSetIDs(0, 999); break;
            case 'g': soBinSetIDs(0, 0); break;
            case 'a': { uint32_t l, u; sscanf(optarg, "%d%*[,-]%d", &l, &u); soBinAddIDs(l, u); break; }
            case 'r': { uint32_t l, u; sscanf(optarg, "%d%*[,-]%d", &l, &u); soBinRemoveIDs(l, u); break; }
            case 'h': printUsage(progName); return 0;
            default: return EXIT_FAILURE;
        }
    }

    setvbuf(fout, NULL, _IONBF, 0);

    banner("Starting the PCT module");
    
    pctOpen(100, 5); 

    banner("Printing PCT table (Empty)");
    pctPrint(fout, true); 
    pctPrint(fout, false); 

    if (!pauseSim()) return EXIT_SUCCESS;

    banner("Filling PCT table");
    try {
        uint16_t p1 = pctNew(0x1000); fprintf(fout, "Created PID: %u\n", p1);
        uint16_t p2 = pctNew(0x2000); fprintf(fout, "Created PID: %u\n", p2);
        uint16_t p3 = pctNew(0x3000); fprintf(fout, "Created PID: %u\n", p3);
        uint16_t p4 = pctNew(0x4000); fprintf(fout, "Created PID: %u\n", p4);
        uint16_t p5 = pctNew(0x5000); fprintf(fout, "Created PID: %u\n", p5);
        
    } catch (Exception &e) {
        fprintf(fout, "Exception: %s\n", e.what());
    }

    if (!pauseSim()) return EXIT_SUCCESS;

    banner("Printing PCT table (Full)");
    pctPrint(fout, true);

    banner("Testing Set/Get on PID 101");
    uint16_t testPid = 100; 
    
    PctProcessState newState = READY; 
    pctSet(testPid, PctState, &newState);
    fprintf(fout, "Set PID %u state to READY\n", testPid);

    uint32_t newMemAddr = 0x123400;
    pctSet(testPid, PctMemAddr, &newMemAddr);
    fprintf(fout, "Set PID %u memAddr to 0x123400\n", testPid);

    PctProcessState readState;
    pctGet(testPid, PctState, &readState);
    
    uint32_t readMemAddr;
    pctGet(testPid, PctMemAddr, &readMemAddr);

    uint32_t readJid;
    pctGet(testPid, PctJid, &readJid);

    fprintf(fout, "Verification for PID %u:\n", testPid);
    fprintf(fout, "  State: %d (Expected %d)\n", readState, READY);
    fprintf(fout, "  MemAddr: 0x%x (Expected 0x123400)\n", readMemAddr);
    fprintf(fout, "  JID: 0x%x\n", readJid);

    if (!pauseSim()) return EXIT_SUCCESS;

    banner("Close and end the PCT module");
    pctClose();

    banner("Bye!");
    return EXIT_SUCCESS;
}