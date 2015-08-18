generated
_value: aJavaProgramNode
	self _value notNil
		ifTrue: [ self _value parent: nil ].
	_value := aJavaProgramNode.
	self _value notNil
		ifTrue: [ self _value parent: self ]