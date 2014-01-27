generated
removeDeclaration: aCSRemoveAccessorDeclarationNode
	self removeDeclaration notNil ifTrue: [self removeDeclaration parent: nil].
	removeDeclaration := aCSRemoveAccessorDeclarationNode.
	self removeDeclaration notNil ifTrue: [self removeDeclaration parent: self]