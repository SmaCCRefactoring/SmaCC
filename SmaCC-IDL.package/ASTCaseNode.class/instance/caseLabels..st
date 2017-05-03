generated
caseLabels: anASTCaseLabelsNode
	self caseLabels notNil
		ifTrue: [ self caseLabels parent: nil ].
	caseLabels := anASTCaseLabelsNode.
	self caseLabels notNil
		ifTrue: [ self caseLabels parent: self ]