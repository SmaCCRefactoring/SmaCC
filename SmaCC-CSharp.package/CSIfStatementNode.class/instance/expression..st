generated
expression: aCSExpressionNode
	self expression notNil ifTrue: [self expression parent: nil].
	expression := aCSExpressionNode.
	self expression notNil ifTrue: [self expression parent: self]