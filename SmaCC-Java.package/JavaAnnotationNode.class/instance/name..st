generated
name: aJavaNameNode
	self name notNil ifTrue: [self name parent: nil].
	name := aJavaNameNode.
	self name notNil ifTrue: [self name parent: self]