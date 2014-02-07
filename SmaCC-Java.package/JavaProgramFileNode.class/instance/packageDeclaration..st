generated
packageDeclaration: aJavaPackageDeclarationNode
	self packageDeclaration notNil ifTrue: [self packageDeclaration parent: nil].
	packageDeclaration := aJavaPackageDeclarationNode.
	self packageDeclaration notNil ifTrue: [self packageDeclaration parent: self]