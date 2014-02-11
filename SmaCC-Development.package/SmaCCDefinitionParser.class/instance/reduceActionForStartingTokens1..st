generated-reduction actions
reduceActionForStartingTokens1: nodes
	^ grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: (nodes at: 1) value)