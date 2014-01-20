edges
addEdgeTo: aSmaCCNode onStates: symbolCollection 
	transitions add: (SmaCCStateEdge to: aSmaCCNode on: symbolCollection)