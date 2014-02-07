generated
nspace: aJavaProgramNode
	self nspace notNil ifTrue: [self nspace parent: nil].
	nspace := aJavaProgramNode.
	self nspace notNil ifTrue: [self nspace parent: self]