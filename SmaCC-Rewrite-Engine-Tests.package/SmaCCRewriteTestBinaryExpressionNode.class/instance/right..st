generated
right: aSmaCCRewriteTestExpressionNode
	self right notNil ifTrue: [self right parent: nil].
	right := aSmaCCRewriteTestExpressionNode.
	self right notNil ifTrue: [self right parent: self]