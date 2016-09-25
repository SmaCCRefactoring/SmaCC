generated
value: aJavaProgramNode
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJavaProgramNode.
	self value notNil
		ifTrue: [ self value parent: self ]