generated
value: aCSProgramNode
	self value notNil ifTrue: [self value parent: nil].
	value := aCSProgramNode.
	self value notNil ifTrue: [self value parent: self]