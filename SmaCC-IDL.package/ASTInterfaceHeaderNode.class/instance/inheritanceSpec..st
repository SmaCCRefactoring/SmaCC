generated
inheritanceSpec: anASTInheritanceSpecNode
	self inheritanceSpec notNil
		ifTrue: [ self inheritanceSpec parent: nil ].
	inheritanceSpec := anASTInheritanceSpecNode.
	self inheritanceSpec notNil
		ifTrue: [ self inheritanceSpec parent: self ]