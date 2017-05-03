generated
octetType: anASTOctetTypeNode
	self octetType notNil
		ifTrue: [ self octetType parent: nil ].
	octetType := anASTOctetTypeNode.
	self octetType notNil
		ifTrue: [ self octetType parent: self ]