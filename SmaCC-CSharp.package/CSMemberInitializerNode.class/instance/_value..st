generated
_value: aCSProgramNode
	self _value notNil
		ifTrue: [ self _value parent: nil ].
	_value := aCSProgramNode.
	self _value notNil
		ifTrue: [ self _value parent: self ]