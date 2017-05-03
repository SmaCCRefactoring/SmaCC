generated
typeSpec: anASTTypeSpecNode
	self typeSpec notNil
		ifTrue: [ self typeSpec parent: nil ].
	typeSpec := anASTTypeSpecNode.
	self typeSpec notNil
		ifTrue: [ self typeSpec parent: self ]