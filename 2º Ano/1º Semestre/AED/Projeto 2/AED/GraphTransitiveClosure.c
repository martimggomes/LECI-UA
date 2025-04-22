//
// Algoritmos e Estruturas de Dados --- 2024/2025
//
// Joaquim Madeira - Dec 2024
//
// GraphTransitiveClosure - Transitive Closure of a directed graph
//

// Student Name : Martim Peralta Gomes
// Student Number : 119488
// Student Name : Tiago Queirós Rocha
// Student Number : 120515

/*** COMPLETE THE GraphComputeTransitiveClosure FUNCTION ***/

#include "GraphTransitiveClosure.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "Graph.h"
#include "GraphBellmanFordAlg.h"
#include "instrumentation.h"


#define NUM_ITERACOES InstrCount[0]
#define NUM_COMPARACOES InstrCount[1]

// Compute the transitive closure of a directed graph
// Return the computed transitive closure as a directed graph
// Use the Bellman-Ford algorithm
Graph* GraphComputeTransitiveClosure(Graph* g) {

    InstrCalibrate();
    InstrReset();


    assert(g != NULL);
    assert(GraphIsDigraph(g)); // Verifica se o grafo é orientado
    assert(GraphIsWeighted(g) == 0); // Verifica se o grafo não é ponderado

    unsigned int numVertices = GraphGetNumVertices(g);
    
    // Step 1: Create a new graph for the transitive closure
    Graph* transitiveClosure = GraphCreate(numVertices, 1, 0); 

    // Step 2: Run Bellman-Ford for each vertex
    for (unsigned int startVertex = 0; startVertex < numVertices; startVertex++) {
        // Execute Bellman-Ford algorithm
        GraphBellmanFordAlg* result = GraphBellmanFordAlgExecute(g, startVertex);

        // Step 3: Add edges to the transitive closure graph
        for (unsigned int v = 0; v < numVertices; v++) {
            if (GraphBellmanFordAlgReached(result, v) && startVertex != v) {
                GraphAddEdge(transitiveClosure, startVertex, v);
            }
        }

        // Clean up the result of the Bellman-Ford algorithm
        GraphBellmanFordAlgDestroy(&result);
    }


    printf("Iterações: %d\n", NUM_ITERACOES);
    printf("Comparações: %d\n", NUM_COMPARACOES);
    InstrPrint();

    return transitiveClosure;
}