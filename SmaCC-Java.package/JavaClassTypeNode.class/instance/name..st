generated
name: aJavaProgramNode
	self name notNil ifTrue: [self name parent: nil].
	name := aJavaProgramNode.
	self name notNil ifTrue: [self name parent: self]