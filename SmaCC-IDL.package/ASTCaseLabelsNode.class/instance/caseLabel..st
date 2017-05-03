generated
caseLabel: anASTCaseLabelNode
	self caseLabel notNil
		ifTrue: [ self caseLabel parent: nil ].
	caseLabel := anASTCaseLabelNode.
	self caseLabel notNil
		ifTrue: [ self caseLabel parent: self ]