generated
booleanLiteral: anASTBooleanLiteralNode
	self booleanLiteral notNil
		ifTrue: [ self booleanLiteral parent: nil ].
	booleanLiteral := anASTBooleanLiteralNode.
	self booleanLiteral notNil
		ifTrue: [ self booleanLiteral parent: self ]