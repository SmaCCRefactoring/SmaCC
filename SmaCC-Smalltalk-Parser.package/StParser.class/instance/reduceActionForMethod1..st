generated-reduction actions
reduceActionForMethod1: nodes
	^ (RBMethodNode selector: (nodes at: 1) value asSymbol arguments: #() body: (nodes at: 2) last) yourself