/*
 *  \author ...
 */

#include "somm25nm.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <vector>
#include "exception.h"

namespace group
{
    void simLoadBatch(FILE *fin, uint32_t maxMemSize)
    {

        char line[256];
        double lastSubmitTime = -1.0;
        std::vector<uint32_t> usedJobIds;

        while (fgets(line, sizeof(line), fin) != nullptr)
        {
            line[strcspn(line, "\n")] = '\0';

            if (line[0] == '\0' || line[0] == '%')
                continue;


            char *token = strtok(line, ";");
            if (!token)
                throw Exception(EINVAL, __func__);

            uint32_t jid;
            if (sscanf(token, "%x", &jid) != 1)
            {
                throw Exception(EINVAL, __func__);
            }

            for (uint32_t id : usedJobIds)
            {
                if (id == jid)
                {
                    throw Exception(EINVAL, __func__);
                }
            }
            usedJobIds.push_back(jid);

            token = strtok(nullptr, ";");
            if (!token)
                throw Exception(EINVAL, __func__);

            double submitTime;
            if (sscanf(token, "%lf", &submitTime) != 1 || submitTime < 0)
            {
                throw Exception(EINVAL, __func__);
            }

            if (submitTime < lastSubmitTime)
            {
                throw Exception(EINVAL, __func__);
            }
            lastSubmitTime = submitTime;

            token = strtok(nullptr, ";");
            if (!token)
                throw Exception(EINVAL, __func__);

            uint32_t memSize;
            if (sscanf(token, "%u", &memSize) != 1 || memSize > maxMemSize)
                throw Exception(EINVAL, __func__);

            token = strtok(nullptr, ";");
            if (!token)
                throw Exception(EINVAL, __func__);

            double bursts[JOB_MAX_BURSTS] = {0};
            uint32_t nbursts = 0;

            char *b = strtok(token, ",");
            while (b)
            {
                if (nbursts >= JOB_MAX_BURSTS)
                {
                    throw Exception(EINVAL, __func__);
                }

                double val;
                if (sscanf(b, "%lf", &val) != 1 || val <= 0)
                {
                    throw Exception(EINVAL, __func__);
                }

                bursts[nbursts++] = val;
                b = strtok(nullptr, ",");
            }

            if (nbursts % 2 == 0)
            {
                throw Exception(EINVAL, __func__);
            }

            jobInsert(jid, submitTime, memSize, bursts);
            feqInsert(submitTime, SUBMIT, jid);
        }
    }
} // end of namespace group