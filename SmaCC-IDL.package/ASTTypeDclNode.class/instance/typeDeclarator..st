generated
typeDeclarator: anASTTypeDeclaratorNode
	self typeDeclarator notNil
		ifTrue: [ self typeDeclarator parent: nil ].
	typeDeclarator := anASTTypeDeclaratorNode.
	self typeDeclarator notNil
		ifTrue: [ self typeDeclarator parent: self ]