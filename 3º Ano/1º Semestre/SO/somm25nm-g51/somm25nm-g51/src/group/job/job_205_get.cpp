/*
 *  Fernando De Almeida FERREIRA, nmec 119758
 */

#include "job.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>

namespace group
{
    void jobGet(uint32_t jid, JobField field, void *value)
    {
        JobNode *node;
        
        if (jobHead == JOB_UNDEF_NODE){
            throw Exception( EINVAL,__func__ ); //EINVAL 
        } // se -> JOB queue is closed

        node = jobHead;

        while(node!= NULL && node->jid < jid){
            node = node->next; //avança para o proximo node enquanto nao estiver a apontar para NULL e enquanto o jobId for menor que o jid passado como parametro
        }

        if (node == NULL || node->jid != jid){
            throw Exception(ENOENT, __func__);
        }


        //agr field q e passado como par pode ser:
        // - JobSubmissionTime, ///< submition time                                     double submissionTime; 
        // - JobFinishTime, ///< finish time                                            double finishTime; 
        // - JobMemSize, ///< memory size                                               uint32_t memSize; 
        // - JobNextBurstIndex, ///< index of the next (CPU or IO) burst                uint32_t nextBurstIndex; 
        // - JobNextBurstDuration ///< duration of the next (CPU or IO) burst           

        if (field == JobSubmissionTime){
            double *v = (double*) value;
            *v = node->submissionTime;
            return;
        }


        if (field == JobFinishTime){
            double *v = (double*) value;
            *v = node->finishTime;
            return;
        }

        if (field == JobMemSize){
            uint32_t *v = (uint32_t*) value;
            *v = node->memSize;
            return;
        }

        if (field == JobNextBurstIndex){
            uint32_t *v = (uint32_t*) value;
            *v = node->nextBurstIndex;
            return;
        }


        if (field == JobNextBurstDuration){
            //a negative value, whose absolute value represents the duration of the last CPU-burst.
            uint32_t indice = node->nextBurstIndex;
            uint32_t index_Burst = node->nextBurstIndex;

            double duracao = 0;

            if (index_Burst < JOB_MAX_BURSTS){//( Maximum number of bursts in a job profile)
                duracao = node->bursts[index_Burst];

                int ultimo = -1;
                for(int i = 0; i < JOB_MAX_BURSTS; i++){
                    if(node->bursts[i] != 0){
                        ultimo = i;
                    }
                }

                if (indice == (uint32_t)ultimo){
                    duracao = -duracao;
                }
            } 

            double *v = (double*) value;
            *v = duracao;
            return;


        /* replace with your code */
        //throw Exception(ENOSYS, __func__);
    }
    throw Exception(EINVAL, __func__);

    }
} // end of namespace somm25nm


/**
 * \brief Get the value of a job data field
 * \details
 *  - The \c value pointer is a generic pointer and must be casted depending on the data \c field accessed.
 *  - In case of JobNextBurstDuration, the value returned may be:<br>
 *    -- a positive value, representing the duration of an IO-burst or a CPU-burst, 
 *       except for the last one;<br>
 *    -- a negative value, whose absolute value represents the duration of the last CPU-burst;<br>
 *    -- 0, indicating there is no burst at the given index.
 *
 * \param [in] jid ID of the job 
 * \param [in] field The field whose value is requested
 * \param [out] value Pointer to the recipient where the requested value is to be stored
 *  */