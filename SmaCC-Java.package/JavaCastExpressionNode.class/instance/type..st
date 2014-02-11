generated
type: aJavaProgramNode
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]