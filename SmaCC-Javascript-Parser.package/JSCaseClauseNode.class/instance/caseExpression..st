generated
caseExpression: aJSExpressionNode
	self caseExpression notNil
		ifTrue: [ self caseExpression parent: nil ].
	caseExpression := aJSExpressionNode.
	self caseExpression notNil
		ifTrue: [ self caseExpression parent: self ]