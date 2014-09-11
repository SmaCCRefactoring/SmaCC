generated
suite: aPyRootNode
	self suite notNil
		ifTrue: [ self suite parent: nil ].
	suite := aPyRootNode.
	self suite notNil
		ifTrue: [ self suite parent: self ]