generated
or: aPyRootNode
	self or notNil
		ifTrue: [ self or parent: nil ].
	or := aPyRootNode.
	self or notNil
		ifTrue: [ self or parent: self ]