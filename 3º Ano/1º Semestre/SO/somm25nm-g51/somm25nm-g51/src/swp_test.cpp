/*
 *  Test program for SWP module
 *
 */

#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <libgen.h>
#include <termios.h>

#include "somm25nm.h"

/* ******************************************** */
/* print help message */
static void printUsage(const char *cmd_name)
{
    printf("Sinopsis: %s [OPTIONS]\n"
           "  OPTIONS:\n"
           "  -o outfile     --- set log file (default: stdout)\n"
           "  -O outfile     --- set probing file (default: stdout)\n"
           "  -P num-num     --- set probe ID range (default: 0-0)\n"
           "  -A num-num     --- add range of IDs to probe configuration\n"
           "  -R num-num     --- remove range of IDs from probe configuration\n"
           "  -b             --- set binary mode (bins 100–799)\n"
           "  -g             --- set group mode (bins 0–0, default)\n"
           "  -a num-num     --- add range to bin selection\n"
           "  -r num-num     --- remove range from bin selection\n"
           "  -n             --- run without pause\n"
           "  -h             --- print this help\n", cmd_name);
}

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
        if (res == 'n' || res == 'N') return false;
        if (res == 'y' || res == 'Y') break;
        printf("Bad option! Continue (Y/n)? "); fflush(stdout);
    }
    return true;
}

bool (*pauseSim)(void) = termPause;

void banner(const char *msg)
{
    fprintf(stdout, "\n\e[33;1m%s\e[0m\n\n", msg);
}


/* MAIN */
int main(int argc, char *argv[])
{
    const char *progName = basename(argv[0]);

    FILE *fout = stdout;
    soProbeOpen(stdout, 0, 0);

    const char *outfile = NULL;

    int opt;
    while ((opt = getopt(argc, argv, "o:O:P:A:R:nbga:r:h")) != -1)
    {
        switch (opt)
        {
            case 'o':
                outfile = optarg;
                if ((fout = fopen(outfile, "w")) == NULL)
                {
                    fprintf(stderr, "%s: error opening \"%s\".\n", progName, optarg);
                    return EXIT_FAILURE;
                }
                break;

            case 'O':
                soProbeFile(optarg);
                break;

            case 'P':
            {
                uint32_t lo, hi, cnt = 0;
                if ((sscanf(optarg, "%d%*[,-]%d %n", &lo, &hi, &cnt) != 2)
                    || cnt != strlen(optarg))
                {
                    fprintf(stderr, "%s: bad '-P' argument.\n", progName);
                    return EXIT_FAILURE;
                }
                soProbeSetIDs(lo, hi);
                break;
            }

            case 'A':
            {
                uint32_t lo, hi, cnt = 0;
                if ((sscanf(optarg, "%d%*[,-]%d %n", &lo, &hi, &cnt) != 2)
                    || cnt != strlen(optarg))
                {
                    fprintf(stderr, "%s: bad '-A' argument.\n", progName);
                    return EXIT_FAILURE;
                }
                soProbeAddIDs(lo, hi);
                break;
            }

            case 'R':
            {
                uint32_t lo, hi, cnt = 0;
                if ((sscanf(optarg, "%d-%d %n", &lo, &hi, &cnt) != 2)
                    || cnt != strlen(optarg))
                {
                    fprintf(stderr, "%s: bad '-R' argument.\n", progName);
                    return EXIT_FAILURE;
                }
                soProbeRemoveIDs(lo, hi);
                break;
            }

            case 'b':
                soBinSetIDs(100, 799);
                break;

            case 'g':
                soBinSetIDs(0, 0);
                break;

            case 'a':
            {
                uint32_t lo, hi, cnt = 0;
                if ((sscanf(optarg, "%d%*[,-]%d %n", &lo, &hi, &cnt) != 2)
                    || cnt != strlen(optarg))
                {
                    fprintf(stderr, "%s: bad '-a' argument.\n", progName);
                    return EXIT_FAILURE;
                }
                soBinAddIDs(lo, hi);
                break;
            }

            case 'r':
            {
                uint32_t lo, hi, cnt = 0;
                if ((sscanf(optarg, "%d-%d %n", &lo, &hi, &cnt) != 2)
                    || cnt != strlen(optarg))
                {
                    fprintf(stderr, "%s: bad '-r' argument.\n", progName);
                    return EXIT_FAILURE;
                }
                soBinRemoveIDs(lo, hi);
                break;
            }

            case 'n':
                pauseSim = noPause;
                break;

            case 'h':
                printUsage(progName);
                return 0;

            default:
                fprintf(stderr, "%s: invalid option '-%c'.\n", progName, opt);
                return EXIT_FAILURE;
        }
    }

    setvbuf(fout, NULL, _IONBF, 0);

    /* BEGIN TEST */

    banner("Starting the SWP module");
    swpOpen(FirstFit);

    /* Print empty queue */
    banner("Printing SWP queue in CSV mode (empty)");
    swpPrint(stdout, true);
    banner("Printing SWP queue in normal mode (empty)");
    swpPrint(stdout);

    /* Insert test processes */
    banner("Filling SWP queue");
    swpInsert(10, 5000, false);
    swpInsert(20, 2000, true);
    swpInsert(30, 7000, false);
    swpInsert(40, 1500, true);

    banner("Printing SWP queue in CSV mode");
    swpPrint(stdout, true);
    banner("Printing SWP queue in normal mode");
    swpPrint(stdout);

    /* Test unblock */
    banner("Unblocking PID 20");
    swpUnblock(20);
    swpPrint(stdout);

    /* Test retrieve (FirstFit) */
    banner("Retrieving with sizeAvailable=3000");
    uint16_t pid = swpRetrieve(3000, false);
    fprintf(fout, "Retrieved: %u\n", pid);
    swpPrint(stdout);

    /* Switch policy */
    banner("Switching to FirstBest");
    swpClose();
    swpOpen(FirstBest);

    /* Reinsert processes */
    swpInsert(10, 5000, false);
    swpInsert(20, 2000, true);
    swpInsert(30, 7000, false);
    swpInsert(40, 1500, true);

    banner("Printing SWP queue (FirstBest)");
    swpPrint(stdout);

    banner("Retrieving best fit with sizeAvailable=3500");
    pid = swpRetrieve(3500, true);
    fprintf(fout, "Retrieved: %u\n", pid);
    swpPrint(stdout);

    /* Close */
    banner("Closing SWP module");
    swpClose();

    banner("Bye!");
    return 0;
}
