generated
rightExpression: aJavaProgramNode
	self rightExpression notNil ifTrue: [self rightExpression parent: nil].
	rightExpression := aJavaProgramNode.
	self rightExpression notNil ifTrue: [self rightExpression parent: self]