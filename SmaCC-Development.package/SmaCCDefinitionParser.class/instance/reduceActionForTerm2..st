generated-reduction actions
reduceActionForTerm2: nodes
	^ grammar
		findSymbolNamed: (nodes at: 1) value
		ifAbsentAdd: [ | node symbol |
			symbol := grammar newTerminalSymbolNamed:
				(nodes at: 1) value.
			(scannerDefinition includesTokenNamed:
				(nodes at: 1) value)
				ifTrue: [ symbol
						regularExpression:
							(scannerDefinition tokenNamed:
								(nodes at: 1) value) ]
				ifFalse: [ node := self generateImplicitToken: (nodes at: 1).
					node notNil
						ifTrue: [ node addStates: scannerDefinition nonExcludeStates.
							symbol regularExpression: node ] ].
			symbol ]