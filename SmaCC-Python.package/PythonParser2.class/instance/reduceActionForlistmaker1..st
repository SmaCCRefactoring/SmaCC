generated-reduction actions
reduceActionForlistmaker1: nodes
	| result |
	result := PyListmakerNode new.
	result test: (nodes at: 1).
	result list_for: (nodes at: 2).
	^ result