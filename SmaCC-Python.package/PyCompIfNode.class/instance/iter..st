generated
iter: aPyRootNode
	self iter notNil
		ifTrue: [ self iter parent: nil ].
	iter := aPyRootNode.
	self iter notNil
		ifTrue: [ self iter parent: self ]