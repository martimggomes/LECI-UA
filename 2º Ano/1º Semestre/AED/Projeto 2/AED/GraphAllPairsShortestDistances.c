//
// Algoritmos e Estruturas de Dados --- 2024/2025
//
// Joaquim Madeira - Dec 2024
//
// GraphAllPairsShortestDistances
//

// Student Name : Martim Peralta Gomes
// Student Number : 119488
// Student Name : Tiago Queirós Rocha
// Student Number : 120515

/*** COMPLETE THE GraphAllPairsShortestDistancesExecute FUNCTION ***/

#include "GraphAllPairsShortestDistances.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "Graph.h"
#include "GraphBellmanFordAlg.h"

struct _GraphAllPairsShortestDistances {
  int** distance;  // The 2D matrix storing the all-pairs shortest distances
                   // It is stored as an array of pointers to 1D rows
                   // Idea: an INDEFINITE distance value is stored as -1
  Graph* graph;
};

// Allocate memory and initialize the distance matrix
// Compute the distances between vertices by running the Bellman-Ford algorithm
GraphAllPairsShortestDistances* GraphAllPairsShortestDistancesExecute(Graph* g) {
  assert(g != NULL);

  // Allocate memory for the distance matrix
  unsigned int numVertices = GraphGetNumVertices(g);
  int** distance = (int**)malloc(numVertices * sizeof(int*));
  for (unsigned int i = 0; i < numVertices; i++) {
    distance[i] = (int*)malloc(numVertices * sizeof(int));
    for (unsigned int j = 0; j < numVertices; j++) {
      if (i == j) {
        distance[i][j] = 0; // Distance to itself is 0
      } else {
        distance[i][j] = -1; // Initialize other distances to -1 (infinity)
      }
    }
  }

  // Run Bellman-Ford for each vertex to compute shortest paths
  for (unsigned int startVertex = 0; startVertex < numVertices; startVertex++) {
    GraphBellmanFordAlg* BF_result = GraphBellmanFordAlgExecute(g, startVertex);

    // Update the distance matrix with the results from Bellman-Ford
    for (unsigned int v = 0; v < numVertices; v++) {
      if (GraphBellmanFordAlgReached(BF_result, v)) {
        distance[startVertex][v] = GraphBellmanFordAlgDistance(BF_result, v);
      }
    }

    // Clean up the Bellman-Ford result
    GraphBellmanFordAlgDestroy(&BF_result);
  }

  // Create and return the GraphAllPairsShortestDistances structure
  GraphAllPairsShortestDistances* result =
      (GraphAllPairsShortestDistances*)malloc(sizeof(struct _GraphAllPairsShortestDistances));
  result->distance = distance;
  result->graph = g;

  return result;
}

void GraphAllPairsShortestDistancesDestroy(GraphAllPairsShortestDistances** p) {
  assert(*p != NULL);

  GraphAllPairsShortestDistances* aux = *p;
  unsigned int numVertices = GraphGetNumVertices(aux->graph);

  // Free each row of the distance matrix
  for (unsigned int i = 0; i < numVertices; i++) {
    free(aux->distance[i]);
  }

  // Free the array of pointers
  free(aux->distance);

  // Free the structure itself
  free(*p);
  *p = NULL;
}

// Getting the result

int GraphGetDistanceVW(const GraphAllPairsShortestDistances* p, unsigned int v,
                       unsigned int w) {
  assert(p != NULL);
  assert(v < GraphGetNumVertices(p->graph));
  assert(w < GraphGetNumVertices(p->graph));

  return p->distance[v][w];
}

// DISPLAYING on the console

void GraphAllPairsShortestDistancesPrint(
    const GraphAllPairsShortestDistances* p) {
  assert(p != NULL);

  unsigned int numVertices = GraphGetNumVertices(p->graph);
  printf("Graph distance matrix - %u vertices\n", numVertices);

  for (unsigned int i = 0; i < numVertices; i++) {
    for (unsigned int j = 0; j < numVertices; j++) {
      int distanceIJ = p->distance[i][j];
      if (distanceIJ == -1) {
        // INFINITY - j was not reached from i
        printf(" INF");
      } else {
        printf(" %3d", distanceIJ);
      }
    }
    printf("\n");
  }
}
