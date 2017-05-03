generated
anyType: anASTAnyTypeNode
	self anyType notNil
		ifTrue: [ self anyType parent: nil ].
	anyType := anASTAnyTypeNode.
	self anyType notNil
		ifTrue: [ self anyType parent: self ]