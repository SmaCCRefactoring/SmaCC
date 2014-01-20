generated-reduction actions
reduceActionForTerm2: nodes
	^ grammar
		terminalSymbolNamed: (nodes at: 1) value
		ifAbsent: [ 
			currentToken := nodes at: 1.
			self reportErrorMessage: 'Token not specified' ]