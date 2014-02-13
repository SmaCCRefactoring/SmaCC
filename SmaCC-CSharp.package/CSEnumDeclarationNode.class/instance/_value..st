generated
_value: aCSExpressionNode
	self _value notNil
		ifTrue: [ self _value parent: nil ].
	_value := aCSExpressionNode.
	self _value notNil
		ifTrue: [ self _value parent: self ]