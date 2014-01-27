generated
signature: aCSProgramNode
	self signature notNil ifTrue: [self signature parent: nil].
	signature := aCSProgramNode.
	self signature notNil ifTrue: [self signature parent: self]