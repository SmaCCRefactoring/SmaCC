generated
slice: aPySliceopNode
	self slice notNil
		ifTrue: [ self slice parent: nil ].
	slice := aPySliceopNode.
	self slice notNil
		ifTrue: [ self slice parent: self ]