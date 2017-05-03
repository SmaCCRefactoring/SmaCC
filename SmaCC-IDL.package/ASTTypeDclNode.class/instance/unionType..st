generated
unionType: anASTUnionTypeNode
	self unionType notNil
		ifTrue: [ self unionType parent: nil ].
	unionType := anASTUnionTypeNode.
	self unionType notNil
		ifTrue: [ self unionType parent: self ]