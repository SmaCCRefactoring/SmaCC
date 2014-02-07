generated
reduceActionForidentifierName1: nodes
	| result |
	result := JavaIdentifierNameNode new.
	result name: (nodes at: 1).
	^result