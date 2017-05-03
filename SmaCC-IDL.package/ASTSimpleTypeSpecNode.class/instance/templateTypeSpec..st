generated
templateTypeSpec: anASTTemplateTypeSpecNode
	self templateTypeSpec notNil
		ifTrue: [ self templateTypeSpec parent: nil ].
	templateTypeSpec := anASTTemplateTypeSpecNode.
	self templateTypeSpec notNil
		ifTrue: [ self templateTypeSpec parent: self ]