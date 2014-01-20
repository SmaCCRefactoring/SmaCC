generated-reduction actions
reduceActionForProductionRule1: nodes
	| symbol |
	symbol := grammar nonTerminalSymbolNamed: (nodes at: 1) value.
	(nodes at: 3) do: [ :each | symbol addProduction: each ].
	^ symbol