generated
expression: aJavaLambdaExpressionNode
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaLambdaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]