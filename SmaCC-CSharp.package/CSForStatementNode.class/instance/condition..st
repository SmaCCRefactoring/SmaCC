generated
condition: aCSExpressionNode
	self condition notNil ifTrue: [self condition parent: nil].
	condition := aCSExpressionNode.
	self condition notNil ifTrue: [self condition parent: self]