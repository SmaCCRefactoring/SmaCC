generated
reduceActionForRegexTerm7: nodes
	^(scannerDefinition tokenNamed: (nodes at: 1) value ifAbsentPut: [self generateImplicitToken: (nodes at: 1)]) copy