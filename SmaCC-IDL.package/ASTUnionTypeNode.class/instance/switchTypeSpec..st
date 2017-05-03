generated
switchTypeSpec: anASTSwitchTypeSpecNode
	self switchTypeSpec notNil
		ifTrue: [ self switchTypeSpec parent: nil ].
	switchTypeSpec := anASTSwitchTypeSpecNode.
	self switchTypeSpec notNil
		ifTrue: [ self switchTypeSpec parent: self ]