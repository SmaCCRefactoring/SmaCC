generated-reduction actions
reduceActionForPropertyWriter1: nodes
	| result |
	result := DelphiPropertyWriterNode new.
	result writeToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result