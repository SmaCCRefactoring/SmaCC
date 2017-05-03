generated
argument: aDelphiProgramNode
	self argument notNil
		ifTrue: [ self argument parent: nil ].
	argument := aDelphiProgramNode.
	self argument notNil
		ifTrue: [ self argument parent: self ]