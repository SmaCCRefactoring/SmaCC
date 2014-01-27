generated
reduceActionForMatch4: nodes
	^(SmaCCRewriteTypeMatch on: (self lookupClass: (nodes at: 1)))
		code: (nodes at: 2);
		yourself