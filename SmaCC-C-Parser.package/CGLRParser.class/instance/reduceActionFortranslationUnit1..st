generated-reduction actions
reduceActionFortranslationUnit1: nodes
	| result |
	result := CGLRTranslationUnitNode new.
	result addNode: (nodes at: 1) to: result declarations.
	^ result