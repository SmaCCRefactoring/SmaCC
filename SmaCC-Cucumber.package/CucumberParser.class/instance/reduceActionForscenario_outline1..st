generated-reduction actions
reduceActionForscenario_outline1: nodes
	| result |
	result := CucScenarioOutlineNode new.
	result addTokens: ((nodes at: 2) at: 1) to: result tags.
	result addVariablesFrom: (nodes at: 4).
	result addVariablesFrom: (nodes at: 7).
	result addVariablesFrom: (nodes at: 8).
	^ result