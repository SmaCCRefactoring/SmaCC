generated
sequenceType: anASTSequenceTypeNode
	self sequenceType notNil
		ifTrue: [ self sequenceType parent: nil ].
	sequenceType := anASTSequenceTypeNode.
	self sequenceType notNil
		ifTrue: [ self sequenceType parent: self ]