accessing
source
	^ (indices size < 2 and: [ rhs productionSymbol variableDefinitions asArray first isCollection not ])
		ifTrue: [ self codeGenerator defaultNodeReductionSource: self ]
		ifFalse: [ self codeGenerator singleVariableCollectionFor: self ]