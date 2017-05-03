generated
structType: anASTStructTypeNode
	self structType notNil
		ifTrue: [ self structType parent: nil ].
	structType := anASTStructTypeNode.
	self structType notNil
		ifTrue: [ self structType parent: self ]