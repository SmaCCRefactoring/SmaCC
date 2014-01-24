generated
reduceActionForAttributesLine1: nodes
	^(grammar classNamed: (nodes at: 2) value asSymbol)
		extraAttributes: ((nodes at: 4) collect: [:each | SmaCCVariableDefinition variableName: each])