generated-reduction actions
reduceActionForRegexRule1: nodes
	| symbol |
	(nodes at: 4) position: (nodes at: 2) startPosition.
	scannerDefinition addToken: (nodes at: 4) withName: (nodes at: 2) value.
	symbol := grammar findSymbolNamed: (nodes at: 2) value ifAbsent: [ nil ].
	symbol notNil
		ifTrue: [ symbol regularExpression: (nodes at: 4) ].
	^ nodes at: 4