generated
test: aJavaExpressionNode
	self test notNil ifTrue: [self test parent: nil].
	test := aJavaExpressionNode.
	self test notNil ifTrue: [self test parent: self]