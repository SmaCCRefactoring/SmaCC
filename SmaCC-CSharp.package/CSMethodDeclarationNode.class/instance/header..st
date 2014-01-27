generated
header: aCSMethodHeaderNode
	self header notNil ifTrue: [self header parent: nil].
	header := aCSMethodHeaderNode.
	self header notNil ifTrue: [self header parent: self]