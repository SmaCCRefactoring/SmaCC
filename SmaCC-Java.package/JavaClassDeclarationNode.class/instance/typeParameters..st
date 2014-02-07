generated
typeParameters: aJavaTypeParametersNode
	self typeParameters notNil ifTrue: [self typeParameters parent: nil].
	typeParameters := aJavaTypeParametersNode.
	self typeParameters notNil ifTrue: [self typeParameters parent: self]