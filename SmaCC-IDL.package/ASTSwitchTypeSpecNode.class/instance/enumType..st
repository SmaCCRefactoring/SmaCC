generated
enumType: anASTEnumTypeNode
	self enumType notNil
		ifTrue: [ self enumType parent: nil ].
	enumType := anASTEnumTypeNode.
	self enumType notNil
		ifTrue: [ self enumType parent: self ]