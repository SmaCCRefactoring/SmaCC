generated
file: anASTFileInputNode
	self file notNil
		ifTrue: [ self file parent: nil ].
	file := anASTFileInputNode.
	self file notNil
		ifTrue: [ self file parent: self ]