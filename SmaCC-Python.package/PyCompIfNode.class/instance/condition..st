generated
condition: aPyRootNode
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aPyRootNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]