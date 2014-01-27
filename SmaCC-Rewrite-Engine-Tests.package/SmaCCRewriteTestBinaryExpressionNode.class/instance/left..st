generated
left: aSmaCCRewriteTestExpressionNode
	self left notNil ifTrue: [self left parent: nil].
	left := aSmaCCRewriteTestExpressionNode.
	self left notNil ifTrue: [self left parent: self]