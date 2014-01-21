generated
reduceActionForSuperclassLine1: nodes
	^(nodes at: 4) do: [:each | (grammar classNamed: each) superclass: (grammar classNamed: (nodes at: 2) value asSymbol)]