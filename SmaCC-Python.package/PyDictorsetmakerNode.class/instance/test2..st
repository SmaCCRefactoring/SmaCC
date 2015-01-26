generated
test2: aPyRootNode
	self test2 notNil
		ifTrue: [ self test2 parent: nil ].
	test2 := aPyRootNode.
	self test2 notNil
		ifTrue: [ self test2 parent: self ]