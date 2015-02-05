generated-reduction actions
reduceActionForMatch1: nodes
	^ SmaCCRewriteTreeMatch new
		source: (nodes at: 1);
		yourself