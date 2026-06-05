/*  
* \author  
*/ 

#include "swp.h" 
#include "dbc.h" 
#include "exception.h" 

namespace group { 
    void swpInsert(uint16_t pid, uint32_t size, bool blocked) {     
        // Criar nó novo     
        SwpNode *node = new SwpNode;     
        if (node == nullptr)         
            throw Exception(EINVAL, __func__);

        node->pid = pid;     
        node->size = size;     
        node->blocked = blocked;     
        node->next = nullptr;

        // Inserção na lista vazia     
        if (swpHead == nullptr && swpTail == nullptr)     
        {         
            swpHead = node;         
            swpTail = node;         
            return;     
        }     

        // Inserção no fim (fila FIFO)     
        swpTail -> next = node;     
        swpTail = node; 
    } 
}