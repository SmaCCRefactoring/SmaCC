generated-reduction actions
reduceActionForProductionRule1: nodes
	| symbol |
	symbol := grammar nonTerminalSymbolNamed:
		(nodes at: 1) value.
	(nodes at: 4) do: [ :each | symbol addProduction: each ].
	self createDefaultClassesForSymbol:
		(nodes at: 1) value.
	^ symbol