generated
name: aCSTypeNode
	self name notNil ifTrue: [self name parent: nil].
	name := aCSTypeNode.
	self name notNil ifTrue: [self name parent: self]