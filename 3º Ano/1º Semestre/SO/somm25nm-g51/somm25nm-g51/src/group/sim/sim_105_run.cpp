/*
 *  \author
 */

#include "somm25nm.h"

namespace group
{
    void simRun(uint32_t cnt, bool blocking)
    {
        if (cnt == 0)
        {
            while (simStep(blocking));
        }
        else
        {
            for (uint32_t i = 0; i < cnt; i++)
            {
                if (!simStep(blocking))
                    break;
            }
        }
    }
} // end of namespace group
