edges
addEdgeTo: aSmaCCNode onCharacters: characterCollection
	transitions
		add: (SmaCCCharacterEdge to: aSmaCCNode on: characterCollection)