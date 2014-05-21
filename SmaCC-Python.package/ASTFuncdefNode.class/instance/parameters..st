generated
parameters: anASTVarArgListNode
	self parameters notNil
		ifTrue: [ self parameters parent: nil ].
	parameters := anASTVarArgListNode.
	self parameters notNil
		ifTrue: [ self parameters parent: self ]