generated
test: aJavaLambdaExpressionNode
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aJavaLambdaExpressionNode.
	self test notNil
		ifTrue: [ self test parent: self ]