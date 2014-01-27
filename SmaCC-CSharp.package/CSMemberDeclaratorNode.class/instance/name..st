generated
name: aCSSimpleNameNode
	self name notNil ifTrue: [self name parent: nil].
	name := aCSSimpleNameNode.
	self name notNil ifTrue: [self name parent: self]