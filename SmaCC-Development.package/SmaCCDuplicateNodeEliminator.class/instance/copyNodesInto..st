graph
copyNodesInto: aDictionary
	root allStates do: [:each | aDictionary at: each put: each shallowCopy]