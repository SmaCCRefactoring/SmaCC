generated
_name: aJavaProgramNode
	self _name notNil
		ifTrue: [ self _name parent: nil ].
	_name := aJavaProgramNode.
	self _name notNil
		ifTrue: [ self _name parent: self ]