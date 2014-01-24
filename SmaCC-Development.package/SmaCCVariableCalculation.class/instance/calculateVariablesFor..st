initialize
calculateVariablesFor: aSmaCCRHS
	currentRHS := aSmaCCRHS.
	self calculateNewVariables.
	self hasVariableChanges
		ifTrue:
			[self assignVariables.
			self recalculateDependents]