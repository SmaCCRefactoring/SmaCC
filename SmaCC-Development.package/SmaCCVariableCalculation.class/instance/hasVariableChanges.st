private
hasVariableChanges
	^ newVariables
		anySatisfy: [ :each | (currentRHS variableDefinitions includes: each) not ]