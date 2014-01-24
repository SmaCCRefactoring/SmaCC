private
asNFAStartingWith: aSmaCCNode
	| endNode start |
	start := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	minimumMatches timesRepeat: [start := node asNFAStartingWith: start].
	start addEdgeTo: endNode.
	maximumMatches < self class finiteInfinity
		ifTrue:
			[maximumMatches - minimumMatches
				timesRepeat:
					[start := node asNFAStartingWith: start.
					start addEdgeTo: endNode]]
		ifFalse: [(node asNFAStartingWith: start) addEdgeTo: start].
	^endNode