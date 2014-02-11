generated-reduction actions
reduceActionForfloating_point_type1: nodes
	| result |
	result := JavaFloatTypeNode new.
	result token: (nodes at: 1).
	^ result