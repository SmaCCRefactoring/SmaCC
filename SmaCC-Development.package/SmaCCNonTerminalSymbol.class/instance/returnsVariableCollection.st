testing
returnsVariableCollection
	^ productions anySatisfy: [ :each | each returnsVariableCollection ]