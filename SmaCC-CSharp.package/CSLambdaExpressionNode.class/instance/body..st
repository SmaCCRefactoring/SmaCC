generated
body: aCSProgramNode
	self body notNil ifTrue: [self body parent: nil].
	body := aCSProgramNode.
	self body notNil ifTrue: [self body parent: self]