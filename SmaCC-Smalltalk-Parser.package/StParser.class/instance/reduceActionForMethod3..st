generated-reduction actions
reduceActionForMethod3: nodes
	^ (RBMethodNode selector: (nodes at: 1) first contents asSymbol arguments: (nodes at: 1) last body: (nodes at: 2) last)
		yourself