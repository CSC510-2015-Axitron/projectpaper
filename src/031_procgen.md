####Procedural Generation

We employed six different procedural maze generation algorithms in this project, of which each has an equal chance to be chosen when a random maze is given to the user. We refer to the six algorithms as Recursive Backtracking, Coherent Recursive Backtracking, Randomized Prim's Algorithm, Randomized Kruskal's Algorithm, Random Wall Removal, and Random Wall Addition.

Recursive Backtracking and Coherent Recursive Backtracking both make use of backtracking, which is a technique that recursively explores a solution space and backtracks when no further options occur at a given point. These algorithms pick a start point, and pseudo-randomly choose the branching directions at each step of the way. The difference between the two is that the former uses a basic uniform pseudo-random number generator, and the latter chooses its directions according to a coherent direction field produced by a pair of instances of simplex noise: a function that generates smooth randomness over an n-dimensional space.

Randomized Prim's and Randomized Kruskal's are based respectively off of the concepts utilized in Prim's and Kruskal's minimum spanning tree algorithms. Both algorithms start with the maze as separate groups, and pseudo-randomly join groups together until there is only one group left. The difference between the two is that Randomized Kruskal's starts with a full list of walls and iterates through each wall in a randomized order, removing the walls when they join separate groups, and Randomized Prim's only adds the walls to the list once one of their corresponding cells has been visited.

Random Wall Removal and Random Wall Addition both work by starting with all walls in one state, and iteratively changing the state of pseudo-randomly chosen walls until the maze reaches a desired state. Random Wall Removal starts with all walls enabled, and Random Wall Addition starts with all walls removed. While these mazes do guarantee a solution, they do not avoid closed loops, and they do not avoid isolated groups. These algorithms were added as a means of providing additional variation, and their user ratings may differ from those of the other four algorithms.

Because each algorithm starts with its endpoints in the corners, an extra piece of functionality was added that iteratively moves the endpoints single units in the cardinal directions if there exists such a move that increases the length of the shortest path from start to finish. This decision came as a result of the fact that there were frequently more relevant points nearby those chosen in the corners.
