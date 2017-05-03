generated
arrayDeclarator: anASTArrayDeclaratorNode
	self arrayDeclarator notNil
		ifTrue: [ self arrayDeclarator parent: nil ].
	arrayDeclarator := anASTArrayDeclaratorNode.
	self arrayDeclarator notNil
		ifTrue: [ self arrayDeclarator parent: self ]