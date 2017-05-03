generated
definitions: anASTDefinitionsNode
	self definitions notNil
		ifTrue: [ self definitions parent: nil ].
	definitions := anASTDefinitionsNode.
	self definitions notNil
		ifTrue: [ self definitions parent: self ]