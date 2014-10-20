generated
constant: aJavaLambdaExpressionNode
	self constant notNil
		ifTrue: [ self constant parent: nil ].
	constant := aJavaLambdaExpressionNode.
	self constant notNil
		ifTrue: [ self constant parent: self ]