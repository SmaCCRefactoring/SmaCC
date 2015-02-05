generated-reduction actions
reduceActionForMatch3: nodes
	^ SmaCCRewriteTypeMatch on: (self lookupClass: (nodes at: 1))