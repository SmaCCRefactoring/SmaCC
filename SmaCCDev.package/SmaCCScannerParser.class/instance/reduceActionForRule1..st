generated-reduction actions
reduceActionForRule1: nodes
	^ (nodes at: 1) states isEmpty
		ifTrue: [ (nodes at: 1) addStates: scannerDefinition nonExcludeStates ]