generated
right: aCSProgramNode
	self right notNil ifTrue: [self right parent: nil].
	right := aCSProgramNode.
	self right notNil ifTrue: [self right parent: self]