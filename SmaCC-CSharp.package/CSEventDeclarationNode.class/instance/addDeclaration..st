generated
addDeclaration: aCSAddAccessorDeclarationNode
	self addDeclaration notNil ifTrue: [self addDeclaration parent: nil].
	addDeclaration := aCSAddAccessorDeclarationNode.
	self addDeclaration notNil ifTrue: [self addDeclaration parent: self]