generated
charType: anASTCharTypeNode
	self charType notNil
		ifTrue: [ self charType parent: nil ].
	charType := anASTCharTypeNode.
	self charType notNil
		ifTrue: [ self charType parent: self ]