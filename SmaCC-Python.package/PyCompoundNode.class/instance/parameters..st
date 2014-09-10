generated
parameters: aPyVarArgListNode
	self parameters notNil
		ifTrue: [ self parameters parent: nil ].
	parameters := aPyVarArgListNode.
	self parameters notNil
		ifTrue: [ self parameters parent: self ]