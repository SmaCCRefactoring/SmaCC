generated-reduction actions
reduceActionForRegexRule1: nodes
	(nodes at: 3) position: (nodes at: 1) startPosition.
	scannerDefinition addToken: (nodes at: 3) withName: (nodes at: 1) value.
	^ nodes at: 3