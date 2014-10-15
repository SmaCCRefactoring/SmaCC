generated-reduction actions
reduceActionForscenario1: nodes
	| result |
	result := CucScenarioNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result tags.
	^ result