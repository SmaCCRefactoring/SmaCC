generated
module: anASTModuleNode
	self module notNil
		ifTrue: [ self module parent: nil ].
	module := anASTModuleNode.
	self module notNil
		ifTrue: [ self module parent: self ]