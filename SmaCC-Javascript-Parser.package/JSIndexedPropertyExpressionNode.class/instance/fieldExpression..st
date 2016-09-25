generated
fieldExpression: aJSExpressionNode
	self fieldExpression notNil
		ifTrue: [ self fieldExpression parent: nil ].
	fieldExpression := aJSExpressionNode.
	self fieldExpression notNil
		ifTrue: [ self fieldExpression parent: self ]