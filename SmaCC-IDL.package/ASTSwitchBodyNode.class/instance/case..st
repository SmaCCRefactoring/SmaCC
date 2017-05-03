generated
case: anASTCaseNode
	self case notNil
		ifTrue: [ self case parent: nil ].
	case := anASTCaseNode.
	self case notNil
		ifTrue: [ self case parent: self ]