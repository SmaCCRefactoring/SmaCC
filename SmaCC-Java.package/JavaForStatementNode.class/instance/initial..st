generated
initial: aJavaProgramNode
	self initial notNil ifTrue: [self initial parent: nil].
	initial := aJavaProgramNode.
	self initial notNil ifTrue: [self initial parent: self]