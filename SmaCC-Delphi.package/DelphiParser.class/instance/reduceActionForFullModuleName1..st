generated-reduction actions
reduceActionForFullModuleName1: nodes
	| result |
	result := DelphiModuleNameNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result