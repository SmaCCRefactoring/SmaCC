generated-reduction actions
reduceActionForImplicitClassSection1: nodes
	| result |
	result := DelphiImplicitClassSectionNode new.
	result addNodes: (nodes at: 1) to: result components.
	^ result