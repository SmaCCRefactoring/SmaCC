generated
condition: aJSExpressionNode
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aJSExpressionNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]