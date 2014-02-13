generated
booleanExpression: aCSExpressionNode
	self booleanExpression notNil
		ifTrue: [ self booleanExpression parent: nil ].
	booleanExpression := aCSExpressionNode.
	self booleanExpression notNil
		ifTrue: [ self booleanExpression parent: self ]