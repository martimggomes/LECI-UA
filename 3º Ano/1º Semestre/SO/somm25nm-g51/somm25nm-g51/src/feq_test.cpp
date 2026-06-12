/*
 * FEQ Test Module (main.cpp)
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

#include "somm25nm.h"
#include "feq.h"

/* ******************************************** */
/* print help message */
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
           "  -n             --- run without pause (default: pause)\n"
           "  -h             --- print this help\n",
           cmd_name);
}
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

    printf("Continue (Y/n)? ");
    fflush(stdout);
    while (true)
    {
        int res = getchar();
        if (res == '\n')
            break;
        printf("\n");
        if (res == 'n' or res == 'N')
            return false;
        if (res == 'y' or res == 'Y')
            break;
        printf("Bad option! Continue (Y/n)? ");
        fflush(stdout);
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

    /* by default, send probing to stdout */
    FILE *fout = stdout;
    soProbeOpen(stdout, 0, 0);

    /* default values for command line options */
    const char *infile = NULL;
    const char *outfile = NULL;

    /* process command line options */
    int opt;
    while ((opt = getopt(argc, argv, "i:o:O:P:A:R:nbga:r:h")) != -1)
    {
        switch (opt)
        {
        case 'i':
            infile = optarg;
            break;

        case 'o': // set output file
            outfile = optarg;
            if ((fout = fopen(outfile, "w")) == NULL)
            {
                fprintf(stderr, "%s: cannot open file \"%s\"\n", progName, optarg);
                return EXIT_FAILURE;
            }
            break;

        case 'O': /* set probing file */
            soProbeFile(optarg);
            break;

        case 'P': /* set ID range to probing system */
        {
            uint32_t lower, upper, cnt = 0;
            if ((sscanf(optarg, "%u%*[,-]%u %n", &lower, &upper, &cnt) != 2) || cnt != strlen(optarg))
            {
                fprintf(stderr, "%s: Bad argument to '-p' option.\n", progName);
                printUsage(progName);
                return EXIT_FAILURE;
            }
            soProbeSetIDs(lower, upper);
            break;
        }

        case 'A': /* add IDs to probe conf */
        {
            uint32_t lower, upper, cnt = 0;
            if ((sscanf(optarg, "%u%*[,-]%u %n", &lower, &upper, &cnt) != 2) || cnt != strlen(optarg))
            {
                fprintf(stderr, "%s: Bad argument to '-A' option.\n", basename(argv[0]));
                printUsage(basename(argv[0]));
                return EXIT_FAILURE;
            }
            soProbeAddIDs(lower, upper);
            break;
        }

        case 'R': /* remove IDs from probe conf */
        {
            uint32_t lower, upper, cnt = 0;
            if ((sscanf(optarg, "%u-%u %n", &lower, &upper, &cnt) != 2) || cnt != strlen(optarg))
            {
                fprintf(stderr, "%s: Bad argument to '-R' option.\n", basename(argv[0]));
                printUsage(basename(argv[0]));
                return EXIT_FAILURE;
            }
            soProbeRemoveIDs(lower, upper);
            break;
        }

        case 'n': // set no pause mode
        {
            pauseSim = noPause;
            break;
        }
        case 'b': // set binary mode
            soBinSetIDs(0, 999);
            break;

        case 'g': // set binary mode
            soBinSetIDs(0, 0);
            break;

        case 'a': /* add IDs to probe conf */
        {
            uint32_t lower, upper, cnt = 0;
            if ((sscanf(optarg, "%u%*[,-]%u %n", &lower, &upper, &cnt) != 2) || cnt != strlen(optarg))
            {
                fprintf(stderr, "%s: Bad argument to '-A' option.\n", basename(argv[0]));
                printUsage(basename(argv[0]));
                return EXIT_FAILURE;
            }
            soBinAddIDs(lower, upper);
            break;
        }

        case 'r': /* remove IDs from probe conf */
        {
            uint32_t lower, upper, cnt = 0;
            if ((sscanf(optarg, "%u-%u %n", &lower, &upper, &cnt) != 2) || cnt != strlen(optarg))
            {
                fprintf(stderr, "%s: Bad argument to '-R' option.\n", basename(argv[0]));
                printUsage(basename(argv[0]));
                return EXIT_FAILURE;
            }
            soBinRemoveIDs(lower, upper);
            break;
        }

        case 'h':
            printUsage(progName);
            return 0;

        default:
            fprintf(stderr, "%s: Wrong option (\"-%c\".\n", progName, opt);
            printUsage(progName);
            return EXIT_FAILURE;
        }
    }

    (void)infile;
    /* set fout stream as no buffered */
    setvbuf(fout, NULL, _IONBF, 0);

    // FEQ -> TESTS

    // Abertura do modulo FEQ
    banner("Abrir FEQ");
    feqOpen();

    banner("FEQ vazia (normal):");
    feqPrint(fout);

    banner("FEQ vazia (CSV):");
    feqPrint(fout, true);

    // Retrieve vazio

    // Tentativa de retrieve numa FEQ vazia com blocking=false -> Deve lançar exceção
    banner("Retrieve em FEQ vazia (blocking=false) → exceção");
    try
    {
        double t;
        FeqEventType tp;
        uint32_t x;
        feqRetrieve(&t, &tp, &x, false);
        fprintf(fout, "ERRO: devia dar exceção!\n");
    }
    catch (...)
    {
        fprintf(fout, "ERRO: devia dar exceção!\n");
    }

    // Tentativa de retrieve numa FEQ vazia com blocking=true -> Deve devolver false sem exceção
    banner("Retrieve em FEQ vazia (blocking=true) → false");
    {
        double t;
        FeqEventType tp;
        uint32_t x;
        bool ok = feqRetrieve(&t, &tp, &x, true);
        fprintf(fout, "Resultado: %s\n", ok ? "true" : "false");
    }

    // Inserir eventos com tempos distintos

    banner("Inserir 3 eventos com tempos distintos");
    feqInsert(10.0, SUBMIT, 0xAAAA);
    feqInsert(5.0, EXIT, 0xBBBB);
    feqInsert(20.0, ADMIT, 0xCCCC);
    feqPrint(fout);

    // Inserir eventos com o mesmo tempo (15.0)
    banner("Eventos com o mesmo tempo (15.0) com prioridades distintas");
    feqInsert(15.0, WAIT_EVENT, 0x01);
    feqInsert(15.0, DISPATCH, 0x02);
    feqInsert(15.0, SUBMIT, 0x03);
    feqInsert(15.0, TIMEOUT, 0x04);
    feqInsert(15.0, PREEMPT, 0x05);
    feqInsert(15.0, EXIT, 0x06);
    feqInsert(15.0, EVENT_OCCURS, 0x07);
    feqPrint(fout);

    // SUBMITs com o mesmo tempo devem manter a ordem de inserçao
    banner("Estabilidade: ordem de SUBMIT em tempo=30.0 deve ser preservada");
    feqInsert(30.0, SUBMIT, 0x10);
    feqInsert(30.0, SUBMIT, 0x11);
    feqInsert(30.0, SUBMIT, 0x12);
    feqInsert(30.0, SUBMIT, 0x13);
    feqPrint(fout);

    // Inserir valores extremos de tempo
    banner("Inserções com valores extremos");
    feqInsert(0.0, DISPATCH, 0);
    feqInsert(9999999.9, ACTIVATE, 0xFFFFFFFF);
    feqPrint(fout);

    // Remove todos os eventos da FEQ de forma sequencial
    banner("Remover todos os eventos");
    while (true)
    {
        double t;
        FeqEventType tp;
        uint32_t x;
        if (!feqRetrieve(&t, &tp, &x, true))
            break;
        fprintf(fout, "retirei: %.1f type=%d xid=0x%x\n", t, tp, x);
    }

    banner("FEQ final (vazia):");
    feqPrint(fout);

#if 1
    // Inserir 200 eventos aleatórios
    banner("Stress test: 200 inserts aleatórios");
    for (int i = 0; i < 200; i++)
    {
        double t = rand() % 100;
        FeqEventType tp = (FeqEventType)(rand() % 11);
        uint32_t id = rand() & 0xFFFF;
        feqInsert(t, tp, id);
    }
    feqPrint(fout);

    banner("Esvaziar FEQ após stress test");
    while (true)
    {
        double t;
        FeqEventType tp;
        uint32_t x;
        if (!feqRetrieve(&t, &tp, &x, true))
            break;
    }
#endif

    banner("Fechar FEQ");
    feqClose();

    banner("FIM DOS TESTES FEQ");

    return 0;
}
