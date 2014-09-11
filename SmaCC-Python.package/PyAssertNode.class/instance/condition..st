generated
condition: aPyTestTestOptNode
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aPyTestTestOptNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]