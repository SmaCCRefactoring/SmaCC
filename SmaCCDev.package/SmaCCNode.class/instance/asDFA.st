converting
asDFA
	| new |
	new := (SmaCCNFAtoDFA convertToDFA: self asNFAWithoutEpsilonTransitions)
		startingNodeWithoutUnnecessaryDefaultTransition.
	new removeDuplicateNodes.
	new orderNodes.
	^new