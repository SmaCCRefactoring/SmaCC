generated
_value: aJSExpressionNode
	self _value notNil
		ifTrue: [ self _value parent: nil ].
	_value := aJSExpressionNode.
	self _value notNil
		ifTrue: [ self _value parent: self ]