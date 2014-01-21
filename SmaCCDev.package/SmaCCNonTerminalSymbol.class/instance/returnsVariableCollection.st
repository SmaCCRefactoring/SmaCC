public
returnsVariableCollection
	^productions anySatisfy: [:each | each returnsVariableCollection]