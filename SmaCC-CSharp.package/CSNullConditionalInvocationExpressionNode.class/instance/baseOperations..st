generated
baseOperations: aCSExpressionNode
	self baseOperations notNil
		ifTrue: [ self baseOperations parent: nil ].
	baseOperations := aCSExpressionNode.
	self baseOperations notNil
		ifTrue: [ self baseOperations parent: self ]