algorithm
removeEpsilonEdgesFrom: aSmaCCNode
	^nodeMap at: aSmaCCNode ifAbsent: [self createNodeWithoutEpsilonEdges: aSmaCCNode]