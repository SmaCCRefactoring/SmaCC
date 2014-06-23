generated-reduction actions
reduceActionForscenario_outline1: nodes
	| result |
	result := CucScenarioOutlineNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result tags.
	result addVariablesFrom: (nodes at: 4).
	result addVariablesFrom: (nodes at: 5).
	^ result