private-variables
subclassProductionVariables
	| vars |
	vars := self withAllSubclasses
		collect: [ :sub | sub productionVariables ].
	^ SmaCCSymbol mergeOrderedVariableDefinitions: vars