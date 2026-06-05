/*
 *  \author ...
 */

#include "feq.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{

    // ================================================================================== //

    void feqPrint(FILE *fout, bool csv)
    {
        // Se nao esta em modo csv esta em modo normal, logo aqui imprime o cabeçalho do modulo
        if (!csv)
            fprintf(fout, "\nFEQ module internal state:\n");

        // se a lista estiver vazia
        if (feqHead == nullptr)
        {
            // normal -> imprime vazia
            if (!csv)
                fprintf(fout, "  (empty)\n");
            // csv -> imprime so cabeçalho
            else
                fprintf(fout, "time;event;jid;pid;cid\n");
            return;
        }

        // se for CSV e se a lista nao tiver vazia tem de dar para imprimir header
        if (csv)
            fprintf(fout, "time;event;jid;pid;cid\n");

        // Percorre a lista pela ordem
        FeqNode *curr = feqHead;
        while (curr != nullptr)
        {

            const char *typeStr = "UNKNOWN";
            if (curr->type == SUBMIT)
                typeStr = "SUBMIT";
            else if (curr->type == ADMIT)
                typeStr = "ADMIT";
            else if (curr->type == DISPATCH)
                typeStr = "DISPATCH";
            else if (curr->type == TIMEOUT)
                typeStr = "TIMEOUT";
            else if (curr->type == PREEMPT)
                typeStr = "PREEMPT";
            else if (curr->type == WAIT_EVENT)
                typeStr = "WAIT_EVENT";
            else if (curr->type == EVENT_OCCURS)
                typeStr = "EVENT_OCCURS";
            else if (curr->type == SUSPEND)
                typeStr = "SUSPEND";
            else if (curr->type == ACTIVATE)
                typeStr = "ACTIVATE";
            else if (curr->type == EXIT)
                typeStr = "EXIT";
            else if (curr->type == DELETE)
                typeStr = "DELETE";

            if (csv)
            {
                // So um desses campos do csv vai ser preenchido
                const char *jid = "";
                const char *pid = "";
                const char *cid = "";

                char buff[32];

                if (curr->type == SUBMIT)
                {
                    sprintf(buff, "0x%08x", curr->xid);
                    jid = buff;
                }
                // Eventos que tem a ver com aPID
                else if (curr->type == ADMIT ||
                         curr->type == EVENT_OCCURS ||
                         curr->type == SUSPEND ||
                         curr->type == DELETE)
                {
                    sprintf(buff, "%u", curr->xid);
                    pid = buff;
                }
                // Eventos que tem a ver com a CID
                else if (curr->type == TIMEOUT ||
                         curr->type == PREEMPT ||
                         curr->type == WAIT_EVENT ||
                         curr->type == EXIT)
                {
                    sprintf(buff, "%u", curr->xid);
                    cid = buff;
                }

                fprintf(fout, "%.1f;%s;%s;%s;%s\n",
                        curr->time, typeStr, jid, pid, cid);
            }

            else // modo sem ser csv(modo normal)
            {
                fprintf(fout, "Time: %.1f\n", curr->time);
                fprintf(fout, "  type: %s\n", typeStr);

                if (curr->type == SUBMIT)
                {
                    fprintf(fout, "  JID: 0x%08x\n", curr->xid);
                }
                // Eventos que tem a ver com a PID
                else if (curr->type == ADMIT ||
                         curr->type == EVENT_OCCURS ||
                         curr->type == SUSPEND ||
                         curr->type == DELETE)
                {
                    fprintf(fout, "  PID: %u\n", curr->xid);
                }
                // Eventos que tem a ver com aCID
                else if (curr->type == TIMEOUT ||
                         curr->type == PREEMPT ||
                         curr->type == WAIT_EVENT ||
                         curr->type == EXIT)
                {
                    fprintf(fout, "  CID: %u\n", curr->xid);
                }
            }

            // ir para o prox no
            curr = curr->next;
        }
    }

    // ================================================================================== //

} // end of namespace group