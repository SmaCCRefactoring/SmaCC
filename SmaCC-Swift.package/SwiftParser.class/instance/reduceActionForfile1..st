generated-reduction actions
reduceActionForfile1: nodes
	| result |
	result := SwiftFileNode new.
	result addNodes: (nodes at: 1) to: result statements.
	^ result