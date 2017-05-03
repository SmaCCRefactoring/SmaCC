generated
floatingPtType: anASTFloatingPtTypeNode
	self floatingPtType notNil
		ifTrue: [ self floatingPtType parent: nil ].
	floatingPtType := anASTFloatingPtTypeNode.
	self floatingPtType notNil
		ifTrue: [ self floatingPtType parent: self ]