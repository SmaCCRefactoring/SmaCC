generated
interface: aCSTypeNode
	self interface notNil ifTrue: [self interface parent: nil].
	interface := aCSTypeNode.
	self interface notNil ifTrue: [self interface parent: self]