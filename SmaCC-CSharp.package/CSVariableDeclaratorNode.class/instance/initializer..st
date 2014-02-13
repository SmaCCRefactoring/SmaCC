generated
initializer: aCSProgramNode
	self initializer notNil
		ifTrue: [ self initializer parent: nil ].
	initializer := aCSProgramNode.
	self initializer notNil
		ifTrue: [ self initializer parent: self ]