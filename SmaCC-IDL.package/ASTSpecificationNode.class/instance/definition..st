generated
definition: anASTDefinitionNode
	self definition notNil
		ifTrue: [ self definition parent: nil ].
	definition := anASTDefinitionNode.
	self definition notNil
		ifTrue: [ self definition parent: self ]