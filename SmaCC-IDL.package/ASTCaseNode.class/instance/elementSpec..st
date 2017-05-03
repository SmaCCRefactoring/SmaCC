generated
elementSpec: anASTElementSpecNode
	self elementSpec notNil
		ifTrue: [ self elementSpec parent: nil ].
	elementSpec := anASTElementSpecNode.
	self elementSpec notNil
		ifTrue: [ self elementSpec parent: self ]