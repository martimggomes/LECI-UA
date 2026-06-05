/*
 * Main function for SOMM25NM Simulation
 * Adapted from SOMM24 structure
 *
 * \author Artur Pereira - 2024
 * \author (Adapted for SOMM25NM)
 */

 #include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <libgen.h>
 #include <termios.h>
 #include <regex.h>
 
 #include <string>
 #include <iostream>
 #include <map>
 
 #include "somm25nm.h" // Alterado para o header correto
 
 /* ******************************************** */
 /* print help message */
 static void printUsage(const char *cmd_name)
 {
     printf("Sinopsis: %s [OPTIONS]\n"
            "  OPTIONS:\n"
            "  -i infile      --- job input file (default: none)\n"
            "  -o outfile     --- print output file (default: stdout)\n"
            "  -O outfile     --- probbing file (default: stdout)\n"
            "  -P num-num     --- probe ID range (default: 0-0)\n"
            "  -A num[-num]   --- add ID or range of IDs to probe configuration\n"
            "  -R num[-num]   --- remove ID or range of IDs from probe configuration\n"
            "  -b             --- set bin selection map to 100-699\n"
            "  -g             --- set bin selection map to 0-0 (default)\n"
            "  -a num[-num]   --- add ID or range of IDs to bin selection map\n"
            "  -r num[-num]   --- remove ID or range of IDs from bin selection map\n"
            "  -n             --- run without pause (default: pause)\n"
            "  -h             --- print this help\n", cmd_name
     );
 }
 
 /* ******************************************** */
 /*
  * pause simulation
  */
 bool noPause()
{
   return true;
}
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

bool (*pauseSim)(void) = termPause;
void banner(const char *msg)
{
    fprintf(stdout, "\n\e[33;1m%s\e[0m\n\n", msg);
}
 
 /* ******************************************** */
 /* The main function */
 int main(int argc, char *argv[])
 {
     const char *progName = basename(argv[0]); 
     FILE *fin = nullptr;
 
     /* by default, send probing to stdout */
    FILE *fout = stdout;
     /* by default, send probing to stdout */
     soProbeOpen(stdout, 0, 0);
 
     /* default values for command line options */
    const char *infile = NULL;
    const char *outfile = NULL;
 
     /* process command line options */
     int opt;
     while ((opt = getopt(argc, argv, "i:o:O:P:A:R:nbga:r:hS")) != -1)
     {
         switch (opt)
         {
             case 'i':
{
    infile = optarg;
    fin = fopen(infile, "r");
    if (fin == nullptr)
    {
        fprintf(stderr, "%s: cannot open input file \"%s\"\n", progName, infile);
        return EXIT_FAILURE;
    }
    break;
}
             case 'o':          // set output file
            {
                outfile = optarg;
                if ((fout = fopen(outfile, "w")) == NULL)
                {
                    fprintf(stderr, "%s: Bad argument (\"%s\"): fail opening file.\n", progName, optarg);
                    return EXIT_FAILURE;
                }
                break;
            }
             case 'O':          /* set probbing file */
            {
                soProbeFile(optarg);
                break;
            }
             case 'P':          /* set ID range to probing system */
            {
                uint32_t lower, upper;
                uint32_t cnt = 0;
                if ( (sscanf(optarg, "%d%*[,-]%d %n", &lower, &upper, &cnt) != 2) 
                        or (cnt != strlen(optarg)) )
                {
                    fprintf(stderr, "%s: Bad argument to '-p' option.\n", progName);
                    printUsage(progName);
                    return EXIT_FAILURE;
                }
                soProbeSetIDs(lower, upper);
                break;
            }
             case 'A':          /* add IDs to probe conf */
            {
                uint32_t lower, upper;
                uint32_t cnt = 0;
                if ( (sscanf(optarg, "%d%*[,-]%d %n", &lower, &upper, &cnt) != 2) 
                        or (cnt != strlen(optarg)) )
                {
                    fprintf(stderr, "%s: Bad argument to '-A' option.\n", basename(argv[0]));
                    printUsage(basename(argv[0]));
                    return EXIT_FAILURE;
                }
                soProbeAddIDs(lower, upper);
                break;
            }
             case 'R':          /* remove IDs from probe conf */
            {
                uint32_t lower, upper;
                uint32_t cnt = 0;
                if ( (sscanf(optarg, "%d-%d %n", &lower, &upper, &cnt) != 2) 
                        or (cnt != strlen(optarg)) )
                {
                    fprintf(stderr, "%s: Bad argument to '-R' option.\n", basename(argv[0]));
                    printUsage(basename(argv[0]));
                    return EXIT_FAILURE;
                }
                soProbeRemoveIDs(lower, upper);
                break;
            }
            case 'n':    // set no pause mode
            {
                pauseSim = noPause;
                break;
            }
             case 'b':  // set binary mode
             {
                 soBinSetIDs(0, 999);
                 break;
             }
             case 'g':  // set binary mode
             {
                 soBinSetIDs(0, 0);
                 break;
             }
             case 'a':          /* add IDs to probe conf */
            {
                uint32_t lower, upper;
                uint32_t cnt = 0;
                if ( (sscanf(optarg, "%d%*[,-]%d %n", &lower, &upper, &cnt) != 2) 
                        or (cnt != strlen(optarg)) )
                {
                    fprintf(stderr, "%s: Bad argument to '-A' option.\n", basename(argv[0]));
                    printUsage(basename(argv[0]));
                    return EXIT_FAILURE;
                }
                soBinAddIDs(lower, upper);
                break;
            }
             case 'r':          /* remove IDs from probe conf */
            {
                uint32_t lower, upper;
                uint32_t cnt = 0;
                if ( (sscanf(optarg, "%d-%d %n", &lower, &upper, &cnt) != 2) 
                        or (cnt != strlen(optarg)) )
                {
                    fprintf(stderr, "%s: Bad argument to '-R' option.\n", basename(argv[0]));
                    printUsage(basename(argv[0]));
                    return EXIT_FAILURE;
                }
                soBinRemoveIDs(lower, upper);
                break;
            }
             case 'h':
             {
                 printUsage(progName);
                 return 0;
             }
             default:
             {
                 fprintf(stderr, "%s: Wrong option (\"-%c\".\n", progName, opt);
                 printUsage(progName);
                 return EXIT_FAILURE;
             }
         }
     }
 
    /* set fout stream as no buffered */
    setvbuf(fout, NULL, _IONBF, 0);
     
    /* init simulation */
    fprintf(stdout, "\n\e[34;1mStarting simulation\e[0m\n");

    

    
    SimParameters params;
    uint32_t memSizes[] = {0x4, 0x4, 0x2}; 
    params.processorCount = 2;
    params.basePid = 1;
    params.maxPids = 100;
    params.swappingPolicy = FirstFit; 
    params.schedulingPolicy = SPN;
    params.memInitAddr = 1024;
    params.memMinLogSize = 10; // 1024
    params.memSizesCount = 3;
    params.memSizes = memSizes;

    
    simOpen(&params);

    if (fin != nullptr) 
    {
        simLoadBatch(fin, 0xFFFFFFFF);
        fclose(fin);
    }
    else 
    {
        const char* tempFile = "auto_job.txt";
        FILE *ftemp = fopen(tempFile, "w");
        if (ftemp) {
            fprintf(ftemp, "00000001;0;1024;10,5,10\n"); 
            fprintf(ftemp, "00000002;2;2048;5\n");
            fclose(ftemp);
            
            FILE *fload = fopen(tempFile, "r");
            if (fload) {
                simLoadBatch(fload, 0xFFFFFFFF);
                fclose(fload);
            }
            remove(tempFile);
        }
    }

    do {
        fprintf(fout, "\n//////////////////////////////////////////////////////////////\n\n");
        simPrint(fout, SimPrintAll); 
        fprintf(fout, "\n//////////////////////////////////////////////////////////////\n\n");
        pauseSim();
    } while (simStep()); 
    
    fprintf(stdout, "\n\e[34;1mEnding simulation\e[0m\n");

   
    simClose(true); 

    if (fout != stdout) fclose(fout);

    return EXIT_SUCCESS;
    }