generated-reduction actions
reduceActionForfallthrough_statement1: nodes
	| result |
	result := SwiftFallThroughStatementNode new.
	result fallthroughToken: (nodes at: 1).
	^ result