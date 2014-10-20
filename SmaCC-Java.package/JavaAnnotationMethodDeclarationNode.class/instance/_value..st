generated
_value: aJavaLambdaExpressionNode
	self _value notNil
		ifTrue: [ self _value parent: nil ].
	_value := aJavaLambdaExpressionNode.
	self _value notNil
		ifTrue: [ self _value parent: self ]