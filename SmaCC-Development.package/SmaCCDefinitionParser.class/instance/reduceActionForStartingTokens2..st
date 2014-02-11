generated-reduction actions
reduceActionForStartingTokens2: nodes
	^ grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: (nodes at: 2) value)