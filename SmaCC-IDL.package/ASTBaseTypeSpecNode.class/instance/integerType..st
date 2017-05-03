generated
integerType: anASTIntegerTypeNode
	self integerType notNil
		ifTrue: [ self integerType parent: nil ].
	integerType := anASTIntegerTypeNode.
	self integerType notNil
		ifTrue: [ self integerType parent: self ]