generated
stringType: anASTStringTypeNode
	self stringType notNil
		ifTrue: [ self stringType parent: nil ].
	stringType := anASTStringTypeNode.
	self stringType notNil
		ifTrue: [ self stringType parent: self ]