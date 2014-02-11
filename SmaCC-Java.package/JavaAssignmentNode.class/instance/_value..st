generated
_value: aJavaExpressionNode
	self _value notNil
		ifTrue: [ self _value parent: nil ].
	_value := aJavaExpressionNode.
	self _value notNil
		ifTrue: [ self _value parent: self ]