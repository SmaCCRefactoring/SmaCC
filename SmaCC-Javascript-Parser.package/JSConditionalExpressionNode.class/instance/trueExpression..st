generated
trueExpression: aJSExpressionNode
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: nil ].
	trueExpression := aJSExpressionNode.
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: self ]