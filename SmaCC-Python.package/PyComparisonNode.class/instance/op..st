generated
op: aPyCompOpNode
	self op notNil
		ifTrue: [ self op parent: nil ].
	op := aPyCompOpNode.
	self op notNil
		ifTrue: [ self op parent: self ]