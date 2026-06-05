/*  
*  \author ...  
*/ 

#include "swp.h" 
#include "exception.h" 
#include <stdio.h> 
#include <stdint.h>

namespace group 
{  
    void swpUnblock(uint16_t pid) {

        // Procurar o PID na lista         
        SwpNode *curr = swpHead;

        while (curr != nullptr) {             
            if (curr->pid == pid) {                 
                curr->blocked = false;   // desbloqueia                 
                return;             
            }             
            curr = curr->next;         
        }         
            throw Exception(ENOENT, __func__);     
        } 
}