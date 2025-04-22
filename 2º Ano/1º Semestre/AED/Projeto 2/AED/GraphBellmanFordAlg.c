//
// Algoritmos e Estruturas de Dados --- 2024/2025
//
// Joaquim Madeira - Dec 2024
//
// GraphBellmanFord - Bellman-Ford Algorithm
//

// Student Name : Martim Peralta Gomes
// Student Number : 119488
// Student Name : Tiago Queirós Rocha
// Student Number : 120515

/*** COMPLETE THE GraphBellmanFordAlgExecute FUNCTION ***/

#include "GraphBellmanFordAlg.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "Graph.h"
#include "IntegersStack.h"
#include "instrumentation.h"

#define NUM_ITERACOES InstrCount[0]
#define NUM_COMPARACOES InstrCount[1]

struct _GraphBellmanFordAlg {
  unsigned int* marked;  // To mark vertices when reached for the first time
  int* distance;  // The number of edges on the path from the start vertex
                  // distance[i]=-1, if no path found from the start vertex to i
  int* predecessor;  // The predecessor vertex in the shortest path
                     // predecessor[i]=-1, if no predecessor exists
  Graph* graph;
  unsigned int startVertex;  // The root of the shortest-paths tree
};

GraphBellmanFordAlg* GraphBellmanFordAlgExecute(Graph* g, unsigned int startVertex) {
  InstrCalibrate(); 
  InstrReset();     

  assert(g != NULL); // Check if the graph is not null
  assert(startVertex < GraphGetNumVertices(g)); // Check if the start vertex is valid
  assert(GraphIsWeighted(g) == 0); // Check if the graph is unweighted

  GraphBellmanFordAlg* result =
      (GraphBellmanFordAlg*)malloc(sizeof(struct _GraphBellmanFordAlg)); // Allocate memory for the algorithm structure
  assert(result != NULL); 

  // Initialize graph and start vertex for shortest paths
  result->graph = g;
  result->startVertex = startVertex;

  unsigned int numVertices = GraphGetNumVertices(g); // Get the number of vertices in the graph

  // Allocate and initialize arrays
  result->marked = (unsigned int*)calloc(numVertices, sizeof(unsigned int)); // Array to mark reached vertices
  result->distance = (int*)malloc(numVertices * sizeof(int));
  result->predecessor = (int*)malloc(numVertices * sizeof(int)); 

  for (unsigned int i = 0; i < numVertices; i++) {
    result->distance[i] = -1;  // Initialize distances with -1 (infinity)
    result->predecessor[i] = -1; 
  }

  // Distance to the start vertex is 0
  result->distance[startVertex] = 0;
  result->marked[startVertex] = 1; // Mark the start vertex as reached

  // Bellman-Ford algorithm
  for (unsigned int i = 0; i < numVertices - 1; i++) {
    NUM_ITERACOES++; // Increment the number of iterations
    for (unsigned int v = 0; v < numVertices; v++) {
      if (result->marked[v]) { 
        unsigned int* adjacents = GraphGetAdjacentsTo(g, v); // Get vertices adjacent to v
        for (unsigned int j = 1; j <= adjacents[0]; j++) {
          NUM_COMPARACOES++; // Increment the number of comparisons
          unsigned int w = adjacents[j];
          int newDistance = result->distance[v] + 1; // Assuming all edges have weight 1
          if (result->distance[w] == -1 || newDistance < result->distance[w]) {
            result->distance[w] = newDistance; // Update the distance to w
            result->predecessor[w] = v; 
            result->marked[w] = 1; // Mark w as reached
          }
        }
        free(adjacents); // Free memory of adjacents
      }
    }
  }

  printf("Iterations: %d\n", NUM_ITERACOES);
  printf("Comparisons: %d\n", NUM_COMPARACOES); 
  InstrPrint(); 

  return result; // Return the result of the algorithm
}

void GraphBellmanFordAlgDestroy(GraphBellmanFordAlg** p) {
  assert(*p != NULL);

  GraphBellmanFordAlg* aux = *p;

  free(aux->marked);
  free(aux->predecessor);
  free(aux->distance);

  free(*p);
  *p = NULL;
}

// Getting the paths information

int GraphBellmanFordAlgReached(const GraphBellmanFordAlg* p, unsigned int v) {
  assert(p != NULL);
  assert(v < GraphGetNumVertices(p->graph));

  return p->marked[v];
}

int GraphBellmanFordAlgDistance(const GraphBellmanFordAlg* p, unsigned int v) {
  assert(p != NULL);
  assert(v < GraphGetNumVertices(p->graph));

  return p->distance[v];
}
Stack* GraphBellmanFordAlgPathTo(const GraphBellmanFordAlg* p, unsigned int v) {
  assert(p != NULL);
  assert(v < GraphGetNumVertices(p->graph));

  Stack* s = StackCreate(GraphGetNumVertices(p->graph));

  if (p->marked[v] == 0) {
    return s;
  }

  // Store the path
  for (unsigned int current = v; current != p->startVertex;
       current = p->predecessor[current]) {
    StackPush(s, current);
  }

  StackPush(s, p->startVertex);

  return s;
}

// DISPLAYING on the console

void GraphBellmanFordAlgShowPath(const GraphBellmanFordAlg* p, unsigned int v) {
  assert(p != NULL);
  assert(v < GraphGetNumVertices(p->graph));

  Stack* s = GraphBellmanFordAlgPathTo(p, v);

  while (StackIsEmpty(s) == 0) {
    printf("%d ", StackPop(s));
  }

  StackDestroy(&s);
}

// Display the Shortest-Paths Tree in DOT format
void GraphBellmanFordAlgDisplayDOT(const GraphBellmanFordAlg* p) {
  assert(p != NULL);

  Graph* original_graph = p->graph;
  unsigned int num_vertices = GraphGetNumVertices(original_graph);

  // The paths tree is a digraph, with no edge weights
  Graph* paths_tree = GraphCreate(num_vertices, 1, 0);

  // Use the predecessors array to add the tree edges
  for (unsigned int w = 0; w < num_vertices; w++) {
    // Vertex w has a predecessor vertex v?
    int v = p->predecessor[w];
    if (v != -1) {
      GraphAddEdge(paths_tree, (unsigned int)v, w);
    }
  }

  // Display the tree in the DOT format
  GraphDisplayDOT(paths_tree);

  // Housekeeping
  GraphDestroy(&paths_tree);
}
