generated
export: anASTExportNode
	self export notNil
		ifTrue: [ self export parent: nil ].
	export := anASTExportNode.
	self export notNil
		ifTrue: [ self export parent: self ]