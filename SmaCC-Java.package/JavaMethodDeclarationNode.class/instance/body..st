generated
body: aJavaProgramNode
	self body notNil ifTrue: [self body parent: nil].
	body := aJavaProgramNode.
	self body notNil ifTrue: [self body parent: self]