generated
suite: aPySuiteNode
	self suite notNil
		ifTrue: [ self suite parent: nil ].
	suite := aPySuiteNode.
	self suite notNil
		ifTrue: [ self suite parent: self ]