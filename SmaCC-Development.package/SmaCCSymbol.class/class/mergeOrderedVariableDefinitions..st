variables
mergeOrderedVariableDefinitions: newVariableDefinitions
	| result |
	result := OrderedCollection new.
	newVariableDefinitions
		do: [ :collection | self mergeVariableDefinitions: collection into: result ].
	^ result