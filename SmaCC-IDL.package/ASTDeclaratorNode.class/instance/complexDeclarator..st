generated
complexDeclarator: anASTComplexDeclaratorNode
	self complexDeclarator notNil
		ifTrue: [ self complexDeclarator parent: nil ].
	complexDeclarator := anASTComplexDeclaratorNode.
	self complexDeclarator notNil
		ifTrue: [ self complexDeclarator parent: self ]