generated
test: aPyRootNode
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aPyRootNode.
	self test notNil
		ifTrue: [ self test parent: self ]