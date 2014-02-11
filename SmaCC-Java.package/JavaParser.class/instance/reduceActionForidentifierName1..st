generated-reduction actions
reduceActionForidentifierName1: nodes
	| result |
	result := JavaIdentifierNameNode new.
	result _name: (nodes at: 1).
	^ result