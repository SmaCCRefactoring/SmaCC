generated-reduction actions
reduceActionForRule3: nodes
	^ (nodes at: 1) states isEmpty
		ifTrue: [ (nodes at: 1) addStates: scannerDefinition nonExcludeStates ]