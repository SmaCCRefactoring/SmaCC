generated
typeParameters: aCSTypeParameterListNode
	self typeParameters notNil ifTrue: [self typeParameters parent: nil].
	typeParameters := aCSTypeParameterListNode.
	self typeParameters notNil ifTrue: [self typeParameters parent: self]