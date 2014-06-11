generated-reduction actions
reduceActionForscenario1: nodes
	| result |
	result := CucScenarioNode new.
	result addTokens: ((nodes at: 2) at: 1) to: result tags.
	result addVariablesFrom: (nodes at: 4).
	result addVariablesFrom: (nodes at: 7).
	^ result