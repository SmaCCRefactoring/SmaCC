generated-reduction actions
reduceActionForMatch2: nodes
	^ SmaCCRewriteTreeMatch new
		source: (nodes at: 2);
		startingState: (nodes at: 1) value;
		yourself