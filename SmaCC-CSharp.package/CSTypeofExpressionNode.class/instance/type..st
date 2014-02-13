generated
type: aCSProgramNode
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]